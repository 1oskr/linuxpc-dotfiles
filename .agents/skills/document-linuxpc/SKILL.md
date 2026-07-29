---
name: document-linuxpc
description: Use this skill to update LinuxPC documentation only, keeping project context, inventories, contracts, roadmap, and indexes consistent with verified repository and system state while avoiding undocumented assumptions and configuration changes.
---

# Document LinuxPC

Use this skill when the task is to update LinuxPC documentation and nothing else. It keeps canonical docs synchronized with verified state, while avoiding speculative or duplicated documentation.

## Start Conditions

Activate this skill when the request is about:

- updating LinuxPC docs after a verified change;
- reconciling roadmap, inventory, contract, or index documents;
- documenting current behavior, limits, or recovery procedures;
- cleaning stale documentation based on checked evidence.

Do not use this skill to change configuration, install packages, or redesign repository structure.

## Canonical Read Order

Read before editing documentation.

1. `LINUXPC_INSTRUCTIONS.md` if it exists.
2. `AGENTS.md`
3. `docs/PROJECT_CONTEXT.md`
4. `docs/README.md`
5. `docs/15-matriz-fuente-de-verdad.md`
6. `docs/16-limites-configuracion.md`
7. The canonical docs for the affected topic only.
8. The repository files or checked system evidence being documented.

## Required Workflow

1. Confirm which document is canonical for the target topic.
2. Verify the underlying state before writing:
   repository files,
   commands,
   system output,
   or prior validated changes.
3. Mark each relevant statement mentally as one of:
   implemented,
   tested,
   pending,
   or planned.
4. Update existing canonical docs before creating or expanding adjacent text.
5. Link to source-of-truth documents instead of duplicating their content.
6. Call out evidence gaps when the state cannot be verified directly.

## Working Rules

- Modify documentation only.
- Document checked reality, not intended future state, unless clearly marked as planned.
- Keep language precise and consistent with existing LinuxPC docs.
- Avoid parallel sources of truth for the same subject.
- If repository and system state disagree, state that explicitly in the docs or in the task result.

## Safety Boundaries

- Do not use `sudo`.
- Do not commit, push, merge, rebase, or rewrite history.
- Do not run destructive or high-risk actions without explicit authorization.

## Overlap Boundaries

- Do not implement system or dotfile changes. Use a specialized execution skill.
- Do not assess recovery readiness; use `recovery-auditor`.
- Do not prioritize roadmap work. Use `linuxpc-planner`.
- Do not perform pre-commit review. Use `review-linuxpc`.
- Do not redesign repository architecture. Use `dotfiles-architect`.

## Definition of Done

Before finishing, confirm:

- only documentation was changed;
- every new claim is backed by checked evidence;
- canonical docs remain consistent with each other;
- implemented, tested, pending, and planned states are not conflated;
- duplication was minimized through links to canonical sources.
