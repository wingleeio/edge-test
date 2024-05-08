use std::error::Error;

use edgedb_protocol::model::{Datetime, Uuid};
use edgedb_tokio::Queryable;

#[derive(Debug, Queryable)]
struct User {
    pub id: Uuid,
    pub name: String,
}

#[derive(Debug, Queryable)]
struct Post {
    pub id: Uuid,
    pub created_at: Datetime,
    pub updated_at: Option<Datetime>,
    pub title: String,
    pub body: String,
    pub author: User,
}

#[derive(Debug, Queryable)]
struct PaginatedPosts {
    posts: Vec<Post>,
    has_more: bool,
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn Error>> {
    let conn = edgedb_tokio::create_client().await?;
    let query = r#"
        with
            cursor := <optional uuid>$0 ?? <uuid>"00000000-0000-0000-0000-000000000000",
            take  := <optional int64>$1 ?? <int64>10,
            last_created_at := (select Post { created_at } filter .id = cursor).created_at ?? datetime_of_statement(),
            posts := (
                select Post 
                filter .created_at < last_created_at
                order by .created_at desc
                limit take
            ),
            remaining := count(
                (select Post filter .id > cursor)
            ),
            has_more := remaining > count(posts)
        select {
            posts := posts {
                id,
                created_at,
                updated_at,
                title,
                body,
                author: {
                    id,
                    name
                }
            },
            has_more := has_more
        }  
    "#;
    let args = (None::<Uuid>, None::<i64>);
    let val: PaginatedPosts = conn.query_required_single(query, &(args)).await?;

    println!("{:?}", val);
    Ok(())
}
