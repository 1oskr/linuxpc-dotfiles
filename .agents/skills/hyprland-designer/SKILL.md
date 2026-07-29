---
name: hyprland-designer
description: Use this skill to make one verified LinuxPC desktop improvement in Hyprland, Waybar, Rofi, Kitty, wallpapers, or adjacent visual UX while preserving performance, existing style, machine-aware constraints, and official compatibility guidance.
---

# Hyprland Designer

Use this skill for one bounded Hyprland UX or visual improvement at a time. It should inspect the current implementation first, preserve the existing LinuxPC design language, and validate compatibility before declaring success.

## Start Conditions

Activate this skill when the request is about:

- Hyprland behavior or layout;
- Waybar, Rofi, Kitty, or wallpaper presentation;
- visual consistency or ergonomic improvements in the desktop session;
- refining one concrete desktop interaction or styling issue.

Do not use this skill for broad repo cleanup, generic Arch diagnosis, or unrelated documentation-only tasks.

## Canonical Read Order

Read before proposing changes.

1. `LINUXPC_INSTRUCTIONS.md` if it exists.
2. `AGENTS.md`
3. `docs/PROJECT_CONTEXT.md`
4. `docs/05-arch-linux.md`
5. `docs/16-limites-configuracion.md`
6. Relevant Hyprland and desktop config files in the repository.
7. Relevant machine-specific or generated boundaries if present.
8. Official Hyprland documentation for the exact feature when compatibility is uncertain.

## Required Workflow

1. Inspect the current desktop configuration before proposing a replacement.
2. Define one target improvement with a concrete visible or functional outcome.
3. Check compatibility with the installed or documented LinuxPC Hyprland setup.
4. Prefer minimal edits that preserve performance, readability, and existing style.
5. Evaluate whether the change is global or machine-specific before applying it.
6. Verify with the narrowest meaningful check:
   config validation,
   targeted reload,
   or observable behavior confirmation.

## Working Rules

- Work on one verifiable improvement per unit.
- Reuse existing visual patterns, variables, and structure where possible.
- Avoid effects or complexity that reduce clarity or session responsiveness.
- Treat machine-specific display, input, GPU, and monitor differences as first-class constraints.
- Update documentation only if the behavior or operating procedure materially changed.

## Safety Boundaries

- Do not use `sudo`.
- Do not commit, push, merge, rebase, or rewrite history.
- Do not run destructive or high-risk actions without explicit authorization.

## Overlap Boundaries

- Do not do broad troubleshooting of broken sessions. Use `arch-diagnose`.
- Do not do roadmap prioritization. Use `linuxpc-planner`.
- Do not do documentation-only work. Use `document-linuxpc`.
- Do not do repository architecture redesign. Use `dotfiles-architect`.

## Definition of Done

Before finishing, confirm:

- one bounded Hyprland or desktop improvement was targeted;
- the current implementation was inspected first;
- compatibility and machine impact were evaluated;
- the result was verified with a concrete check;
- changes remained minimal and reversible.
