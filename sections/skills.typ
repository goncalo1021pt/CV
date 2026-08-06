#import "../template/theme.typ": *

#section("SKILLS")

#let skill(label, items) = (
  text(font: sans, weight: "semibold", size: 9pt, fill: ink)[#label],
  text(size: 9.5pt)[#items],
)

#grid(
  columns: (auto, 1fr),
  column-gutter: 0.7em,
  row-gutter: sp.row,

  ..skill("Languages",     [C, C++, Go, Python, Rust, JavaScript/TypeScript, x86-64 Assembly, Bash, SQL]),
  ..skill("Systems",       [Embedded Linux, Linux internals, syscalls, signals, process and memory management]),
  ..skill("Networking",    [Raw sockets, TCP/IP, ICMP, protocol implementation, packet analysis (Wireshark, tcpdump)]),
  ..skill("Backend",       [Go (chi, sqlc, pgx), PostgreSQL, REST and OpenAPI, Django, WebSockets, OAuth2/JWT/TOTP]),
  ..skill("Infrastructure",[Docker, Kubernetes (K3s), Prometheus, Grafana, GitHub Actions CI/CD, NGINX]),
  ..skill("Tooling",       [Git, GDB, Valgrind, Make, contract-driven code generation]),
)
