---
name: linuxpc-planner
description: Use this skill to choose the next highest-impact LinuxPC work item by inspecting roadmap, project context, Git state, dependencies, blockers, and bounded execution units without modifying files or system state.
---

# LinuxPC Planner

Use this skill to plan LinuxPC work before implementation. It inspects documented priorities and current repository state, then recommends the next bounded unit of work and the most appropriate specialized skill for execution.

## Start Conditions

Activate this skill when the request is about:

- choosing what to do next in LinuxPC;
- prioritizing between multiple roadmap items;
- splitting a large project into smaller verifiable units;
- identifying blockers, prerequisites, or sequencing;
- deciding which specialized LinuxPC skill should execute each unit.

Do not use this skill to implement, document, redesign, or diagnose deeply. Hand execution off to a narrower skill once the next unit is clear.

## Canonical Read Order

Read before making recommendations.

1. `LINUXPC_INSTRUCTIONS.md` if it exists.
2. `AGENTS.md`
3. `docs/PROJECT_CONTEXT.md`
4. `docs/09-roadmap.md`
5. `docs/15-matriz-fuente-de-verdad.md`
6. `docs/16-limites-configuracion.md`
7. `git status --short --branch`
8. Relevant target-area docs only if needed to validate assumptions.

## Required Workflow

1. Inspect roadmap, current repository state, and active local changes.
2. Identify candidate work items with concrete value, not vague themes.
3. Separate each candidate into:
   `Priority`, `Justification`, `Dependencies`, `Blockers`, `Suggested skill`, `Next action`.
4. Prefer the next unit that is:
   high impact,
   low ambiguity,
   bounded,
   and verifiable without broad refactors.
5. If the work is too large, break it into ordered sub-units with explicit stopping points.
6. State what evidence is still missing before execution starts.

## Working Rules

- Do not modify files, repository history, or system state.
- Base recommendations on checked repository state and current docs, not memory.
- Distinguish documented priority from inferred urgency.
- Call out when the roadmap and live repository appear out of sync.
- Prefer reversible units that can be validated independently.

## Safety Boundaries

- Do not use `sudo`.
- Do not commit, push, merge, rebase, or rewrite history.
- Do not run destructive or high-risk actions without explicit authorization.

## Overlap Boundaries

- Do not perform implementation. Use `hyprland-designer`, `document-linuxpc`, or another specialized skill for execution.
- Do not perform deep diagnosis. Use `arch-diagnose` for system problems.
- Do not perform repository architecture review. Use `dotfiles-architect` for structural analysis.
- Do not perform pre-commit review. Use `review-linuxpc` for local-change review.

## Definition of Done

Before finishing, confirm:

- the next recommended unit of work is explicit and bounded;
- its priority and rationale are stated clearly;
- dependencies and blockers are identified;
- the recommended execution skill is named;
- no files or system state were modified.
