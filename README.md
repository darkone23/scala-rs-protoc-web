
# Rust-Java Protobuf Bridge (PoC)

This is a proof-of-concept hybrid project
using rust for web and embedded jvm for logic
defined using protobuf based RPC contracts

General flow is that rust handles web responses and java manages business logic

This might be useful when existing java logic is integral but rust performance is preferrered

  note: it would probably be nice to use something like capn proto instead of protobuf
    because of the zero-copy patterns .. further research !

## Project Structure

```
project-root/ ├── rust-backend-example/ # Rust async API server (poem-web)
              └── scala-embedded-example/ # JVM logic runner (protobuf contract handler)
```


---

## 🚀 Getting Started

### 1. Prerequisites

- recommended to use [devenv.sh](https://devenv.sh) and [nix](https://nixos.org)

---

### 2. Compile Protobuf Definitions

From the project root:

```bash
# Generate Rust structs using prost
cd rust-backend-example
protoc --proto_path=../proto --rust_out=src ../proto/custom.proto

# Generate Java classes
cd ../scala-embedded-example
protoc --proto_path=../proto --java_out=src/main/java ../proto/custom.proto


