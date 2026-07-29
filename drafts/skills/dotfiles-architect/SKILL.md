---
name: dotfiles-architect
description: Use this skill to review LinuxPC dotfiles architecture, repository structure, source-of-truth boundaries, reproducibility, duplication, hidden dependencies, and machine coupling before any approved structural change is implemented.
---

# Dotfiles Architect

Use this skill for structural analysis of the LinuxPC repository and dotfiles model before making broad changes. It should clarify boundaries, sources of truth, and portability risks before any architecture-level modification is attempted.

## Start Conditions

Activate this skill when the request is about:

- repository structure or configuration boundaries;
- source-of-truth conflicts between docs, live state, and dotfiles;
- duplication, hidden dependencies, or machine-specific coupling;
- portability, reproducibility, or maintainability of LinuxPC dotfiles;
- proposing a cleaner architecture before implementation.

Do not use this skill for small feature edits or routine documentation updates.

## Canonical Read Order

Read before proposing architecture changes.

1. `LINUXPC_INSTRUCTIONS.md` if it exists.
2. `AGENTS.md`
3. `docs/PROJECT_CONTEXT.md`
4. `docs/15-matriz-fuente-de-verdad.md`
5. `docs/16-limites-configuracion.md`
6. `docs/17-inventario-arch.md`
7. `docs/18-inventario-configuracion-sistema.md`
8. `docs/19-contrato-reconstruccion-arch.md`
9. `docs/07-dotfiles-git.md`
10. Relevant repository directories and `git status`.

## Required Workflow

1. Map the target structure and its current source-of-truth boundaries.
2. Identify concrete issues:
   duplication,
   drift,
   hidden state,
   machine coupling,
   unclear ownership,
   or rebuild gaps.
3. Propose architecture before editing files.
4. Present recommendations as bounded work units, not broad refactors.
5. Prefer simpler structure and clearer ownership over new abstraction layers.
6. State migration risks and validation requirements for any approved follow-up.

## Working Rules

- Analyze first; do not refactor broadly without an approved unit.
- Distinguish current architecture from desired architecture explicitly.
- Prefer portability and reproducibility over convenience tied to one machine.
- Reuse existing conventions when they already define a valid boundary.
- Call out files or behaviors that remain outside versioned control.

## Safety Boundaries

- Do not use `sudo`.
- Do not commit, push, merge, rebase, or rewrite history.
- Do not run destructive or high-risk actions without explicit authorization.

## Overlap Boundaries

- Do not execute roadmap prioritization. Use `linuxpc-planner`.
- Do not perform pre-commit review. Use `review-linuxpc`.
- Do not do documentation-only maintenance. Use `document-linuxpc`.
- Do not do runtime root-cause diagnosis of a live Arch issue. Use `arch-diagnose`.

## Definition of Done

Before finishing, confirm:

- the relevant repository boundaries were inspected;
- architectural problems are concrete and evidence-based;
- proposed changes are broken into bounded work units;
- hidden dependencies and machine coupling were evaluated;
- no broad refactor was performed without explicit approval.
