#import "../template/theme.typ": *

#section("PROJECTS")

#entry(
  "ft_ping & ft_traceroute",
  "C · Raw Sockets · ICMP · Network Internals",
  "2025",
  [
    - Reimplemented ping and traceroute using raw sockets and handcrafted ICMP packets
    - Implemented TTL control, checksum computation, and round-trip timing without libc abstractions
  ]
)

#entry(
  "ft_transcendence",
  "Django · WebSockets · PostgreSQL · Docker",
  "2025",
  [
    - Developed real-time multiplayer platform using WebSockets and Django backend
    - Implemented OAuth2 authentication, JWT, and containerised deployment
  ]
)

// #entry(
//   "Minishell (Unix Shell Implementation)",
//   "C · Process Management · Parsing",
//   "2024",
//   [
//     - Built POSIX-style shell supporting pipes, redirections, and environment handling
//     - Designed tokenizer and AST-based execution pipeline managing fork/exec workflows
//   ]
// )