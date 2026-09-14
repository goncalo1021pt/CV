#import "../template/theme.typ": *

#section("PROJECTS")

#entry(
  [Quest Board #text(size: 8pt, fill: dim)[· #link("https://dnd.fontao.net")[dnd.fontao.net]]],
  "Go · PostgreSQL · React · OpenAPI · Docker",
  "2026",
  [
    - Designed, shipped and operate a production web app on my own server: a React SPA in a single Go binary
    - Contract-first API — one OpenAPI spec generates the Go server interface and the typed TS client
    - OAuth2, local accounts and TOTP 2FA; CI-gated merges, staging and production deploy pipelines
  ]
)

#entry(
  "Homelab Observability",
  "Prometheus · Grafana · Docker Compose",
  "2026",
  [
    - Metrics for Quest Board, its host and every container in the homelab, on 30-day retention
    - Dashboards and alert rules provisioned as code — a new service ships already monitored
    - Grafana published through Cloudflare Access; Prometheus and exporters never publicly exposed
  ]
)

#entry(
  "Dune Engine",
  "C++ · 45k lines · Systems Architecture",
  "2026 · in progress",
  [
    - Turn-based board-game engine: phase state machine, event bus, and adapters for TTY and scripted play
  ]
)

#entry(
  "42 Lisboa Projects",
  "C · Go · x86-64 Assembly · Rust",
  "2023 - 2026",
  [
    - #text(weight: "semibold")[Networking] — ping and traceroute rebuilt on raw sockets: handcrafted ICMP, TTL control, RTT timing
    - #text(weight: "semibold")[Systems] — a thread-safe malloc over mmap; a POSIX shell driving fork/exec, pipes, redirections and job signals from an AST; a C standard library and x86-64 assembly primitives from scratch
    - #text(weight: "semibold")[Security] — an ARP-spoofing MITM inspector and a TOTP generator in Go, a Tor hidden service, binary reverse engineering, and an educational ransomware simulation in Rust
  ]
)
