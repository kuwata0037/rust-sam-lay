use lambda_http::{
    handler,
    lambda_runtime::{self, Context, Error},
    IntoResponse, Request, RequestExt, Response,
};

#[tokio::main]
async fn main() -> Result<(), Error> {
    lambda_runtime::run(handler(func)).await?;
    Ok(())
}

async fn func(event: Request, _: Context) -> Result<impl IntoResponse, Error> {
    Ok(match event.query_string_parameters().get("project_name") {
        Some(project_name) => format!("Hello, {}!", project_name).into_response(),
        _ => Response::builder()
            .status(400)
            .body("Empty project name".into())
            .expect("failed to render response"),
    })
}
