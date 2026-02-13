# remote-control (rc)

Instant terminal, screen sharing, and Cursor Remote SSH access to Tailscale machines.

## Stack

- **Runtime:** Bun
- **UI:** Ink (React for CLIs) + React 18
- **Language:** TypeScript (strict, ES2022)
- **Linting:** Biome
- **Testing:** `bun test` (57 tests across 6 files)

## Architecture

CLI app built with Ink. Key components:

- `index.tsx` — entry point, app shell
- `machines.tsx` — machine picker UI (Tailscale peers)
- `authenticate.tsx` — SSH/VNC credential prompts
- `directory.tsx` — Cursor mode directory picker
- `header.tsx` / `input.tsx` — shared UI components
- `ssh.ts` — SSH key generation, `ssh-copy-id`, connection logic
- `settings.ts` — credential persistence (`~/.rc/settings.json`)
- `*-controller.ts` — state reducers (pure functions, well-tested)

## Conventions

- Pure state reducers in `*-controller.ts`, tested in `*-controller.test.ts`
- React components handle rendering only, delegate state to controllers
- All tests use `bun test` (Bun's built-in test runner)
- `bin/rc` is the installed entry point (auto-updates from git on each run)

## Commands

```bash
bun test              # run tests
bun run lint          # biome lint
bun run check         # biome check --write
bunx tsc --noEmit     # typecheck
bun run src/index.tsx # run locally
```

## Git

- Co-author on all commits: `Co-authored-by: Bryce Bjork <brycedbjork@gmail.com>`
