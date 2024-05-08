module default {
    abstract type Node {
        required created_at: datetime {
            default := datetime_current();
            readonly := true;
        }
        updated_at: datetime {
            default := datetime_current();
            rewrite insert using (datetime_of_statement());
            rewrite update using (datetime_of_statement());
        }
    }

    type User extending Node  {
        required name: str;
        posts := .<author[is Post];
    }

    type Post extending Node {
        required title: str;
        required body: str;
        required author: User;
    }
};