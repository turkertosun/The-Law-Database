# Webserver
This folder contains the source code for the backend (web server) which will respond to HTTP requests,
validate credentials with the auth server, and make database queries. The server is written
in [Rust](https://www.rust-lang.org/) and uses a framework called [Rocket](https://rocket.rs/)
to define endpoints.

## Building
To build the server, first install Rust using [rustup](https://www.rust-lang.org/tools/install).

After Rust is installed, the server can be built and executed with the command:
```
cargo run
```
