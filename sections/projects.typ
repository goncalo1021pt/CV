#import "../template/theme.typ": *

#section("PROJECTS")

#entry(
  [Quest Board #text(size: 8pt, fill: dim)[· #link("https://dnd.fontao.net")[dnd.fontao.net]]],
  "Go · PostgreSQL · React · OpenAPI · MCP · Prometheus",
  "2026",
  [
    - Designed, shipped and operate a production web app on my own server: a React SPA in a single Go binary
    - Contract-first API — one OpenAPI spec of 200+ operations generates the Go server and the typed TS client; scoped API tokens, rate limits and signed webhooks
    - Read-only MCP server for AI assistants: tools filtered per request by the token's scopes, every answer through the UI's permission checks
    - OAuth2, local accounts and TOTP 2FA; CI runs Go and frontend tests, a Playwright end-to-end suite and a codegen drift check before staging and production deploys
    - Prometheus and Grafana for the app, its host and every container, with dashboards and alerts as code
  ]
)

#entry(
  "Systems Projects",
  "C · C++ · Go · x86-64 Assembly · Rust",
  "2023 - 2026",
  [
    - #text(weight: "semibold")[Networking] — ping and traceroute rebuilt on raw sockets: handcrafted ICMP, TTL control, RTT timing
    - #text(weight: "semibold")[Systems] — a thread-safe malloc over mmap; a POSIX shell driving fork/exec, pipes, redirections and job signals from an AST; a C standard library and x86-64 assembly primitives from scratch
    - #text(weight: "semibold")[C++] — Dune board-game engine (45k lines, in progress): phase state machine and event bus
    - #text(weight: "semibold")[Security] — an ARP-spoofing MITM inspector and a TOTP generator in Go, a Tor hidden service, binary reverse engineering, and an educational ransomware simulation in Rust
  ]
)
