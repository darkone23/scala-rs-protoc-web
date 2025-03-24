use config::{Config, ConfigError};
use poem::{handler, listener::TcpListener, post, web::Json, Route, Server};
use serde::Deserialize;
use tokio::time::{sleep, Duration};
use tracing::{debug, error, info};

#[derive(Debug, Deserialize)]
struct CreateSomething {
    name: String,
}

#[handler]
async fn hello(req: Json<CreateSomething>) -> Json<serde_json::Value> {
    sleep(Duration::from_secs(1)).await;
    // use the json! macro to write out a response
    Json(serde_json::json! ({
        "code": 0,
        "message": req.name,
    }))
}

#[derive(Debug, Deserialize)]
struct AppConfig {
    java_static_fn: String,
    debug: bool,
}

fn load_config() -> Result<AppConfig, ConfigError> {
    Config::builder()
        // .add_source(config::File::with_name("config/default"))
        .add_source(config::Environment::with_prefix("J4RSPROTO").separator("_"))
        .build()?
        .try_deserialize()
}

#[tokio::main]
async fn main() -> Result<(), std::io::Error> {
    if std::env::var_os("RUST_LOG").is_none() {
        std::env::set_var("RUST_LOG", "poem=debug");
    }

    tracing_subscriber::fmt::init();

    let config = load_config().unwrap_or_else(|err| {
        error!("Failed to load config: {}", err);
        // AppConfig {
        //     java_static_fn: String::from("beep-beep"),
        //     debug: true,
        // }
        std::process::exit(1);
    });

    if config.debug {
        debug!("DEBUG: enabled");
    }

    info!("Setting up JAVA_STATIC_FN: {}", config.java_static_fn);

    let app = Route::new().at("/hello", post(hello));

    Server::new(TcpListener::bind("0.0.0.0:3000"))
        .run(app)
        .await
}
