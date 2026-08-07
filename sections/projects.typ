#import "../template/theme.typ": *

#section("PROJECTS")

#entry(
  "ft_ping & ft_traceroute",
  "C · Raw Sockets · ICMP · Network Internals",
  "2025",
  [
    - Reimplemented ping and traceroute using raw sockets and handcrafted ICMP packets
    - Implemented TTL control, checksum computation and round-trip timing without libc abstractions
  ]
)

#entry(
  "malloc",
  "C · Memory Management · mmap · pthreads",
  "2025",
  [
    - Thread-safe drop-in replacement for malloc, free, realloc and calloc, built over mmap
    - Pre-allocated TINY/SMALL/LARGE zones, mutex-guarded metadata, allocation-map debug tooling
  ]
)

#entry(
  "Minishell",
  "C · Process Management · Signals · Parsing",
  "2024",
  [
    - Built a POSIX-style shell with pipes, redirections, built-ins, environment handling and job signals
    - Designed a tokeniser and AST-based execution pipeline driving fork/exec workflows
  ]
)

#entry(
  "dune",
  "C++ · Systems Architecture · State Machines",
  "2026",
  [
    - Designing a 45k-line C++ engine for a complex turn-based board game
    - Phase state machine and event bus, with interaction adapters for TTY, scripted and recorded play
  ]
)

#entry(
  [Quest Board #text(size: 8pt, fill: dim)[· #link("https://dnd.fontao.net")[dnd.fontao.net]]],
  "Go · PostgreSQL · React · OpenAPI · Docker",
  "2026",
  [
    - Designed, shipped and operate a production web app: a React SPA compiled into a single Go binary
    - Contract-first API — one OpenAPI spec generates the Go server interface and the typed TS client
    - OAuth2, local accounts and TOTP 2FA; CI-gated merges, staging and production deploy pipelines
  ]
)

#entry(
  "Homelab Observability",
  "Prometheus · Grafana · Docker Compose",
  "2026",
  [
    - Monitoring stack for the above: application, host and per-container metrics, 30-day retention
    - Alert rules provisioned as code; Grafana behind Cloudflare Access, Prometheus never public
  ]
)
