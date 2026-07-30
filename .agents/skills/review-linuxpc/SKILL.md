---
name: review-linuxpc
description: Use this skill to review LinuxPC local changes before commit by checking Git status, diffs, whitespace issues, relevant validations, regressions, documentation gaps, and commit readiness without editing files unless explicitly authorized.
---

# Review LinuxPC

Use this skill for pre-commit review of LinuxPC changes. It focuses on defects, regressions, missing documentation, and readiness to commit based on the actual local diff.

## Start Conditions

Activate this skill when the request is about:

- reviewing local LinuxPC changes before commit;
- checking whether current work is ready to commit;
- finding regressions, inconsistencies, or missing follow-up work in local unstaged, staged, or otherwise uncommitted changes;
- auditing whether documentation was updated when behavior changed.

Do not use this skill to plan the next project or to implement fixes unless explicit authorization is given after the review.

## Canonical Read Order

Read before reviewing.

1. `LINUXPC_INSTRUCTIONS.md` if it exists.
2. `AGENTS.md`
3. `docs/PROJECT_CONTEXT.md`
4. `docs/15-matriz-fuente-de-verdad.md`
5. `docs/16-limites-configuracion.md`
6. `git status --short --branch`
7. `git diff --check`
8. `git diff --stat` and `git diff`
9. Relevant docs and files touched by the diff.

## Required Workflow

1. Inspect `git status`, `git diff --check`, and the current diff before making claims.
2. Review each changed unit for:
   correctness,
   regression risk,
   reproducibility impact,
   missing docs,
   and machine-specific leakage.
3. Run only the narrow validations justified by the changed area.
4. Report findings ordered by severity:
   `High`, `Medium`, `Low`.
5. State `Ready to commit: yes/no` with a short justification.
6. If there are no findings, still mention residual risks or unverified areas.

## Working Rules

- Do not modify files unless the user explicitly authorizes fixes after the review.
- Use evidence from the diff and validation results, not speculation.
- Treat undocumented behavior changes as review findings.
- Prefer concrete file references and actionable remediation.
- Call out failing or missing verification clearly.

## Safety Boundaries

- Do not use `sudo`.
- Do not commit, push, merge, rebase, or rewrite history.
- Do not run destructive or high-risk actions without explicit authorization.

## Overlap Boundaries

- Do not choose roadmap priorities. Use `linuxpc-planner`.
- Do not rewrite documentation as part of review. Use `document-linuxpc` after findings are accepted.
- Do not do broad architectural redesign. Use `dotfiles-architect`.
- Do not do root-cause diagnosis of system incidents beyond what the current diff implies. Use `arch-diagnose`.

## Definition of Done

Before finishing, confirm:

- the review covered actual local changes;
- findings are classified by severity;
- concrete checks were run when appropriate;
- commit readiness is stated explicitly;
- no files were modified without authorization.
