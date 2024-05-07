use std::error::Error;

use edgedb_protocol::model::Uuid;
use edgedb_tokio::Queryable;

#[derive(Debug, Queryable)]
struct User {
    pub id: Uuid,
    pub name: String,
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn Error>> {
    let conn = edgedb_tokio::create_client().await?;
    let query = "select User { id, name } filter .id = <uuid>$0";
    let uuid = Uuid::parse_str("be361432-0c36-11ef-ac75-ef983b659f7d")?;
    let val: User = conn.query_required_single(query, &((uuid,))).await?;
    println!("{} : {}", val.id, val.name);
    Ok(())
}
