module default {
    type User {
        required name: str;
        posts := .<author[is Post];
    }

    type Post {
        required title: str;
        required body: str;
        required author: User;
    }
};