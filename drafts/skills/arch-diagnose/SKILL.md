---
name: arch-diagnose
description: Use this skill to diagnose LinuxPC Arch Linux problems by inspecting live state, logs, services, packages, session details, and configuration first, then separating symptoms, facts, hypotheses, tests, and likely cause before proposing fixes.
---

# Arch Diagnose

Use this skill for diagnosis-first work on LinuxPC Arch Linux problems. It should build evidence from the live system and repository before proposing or implementing corrections.

## Start Conditions

Activate this skill when the request is about:

- a LinuxPC Arch Linux malfunction or instability;
- service, boot, login, session, package, or hardware symptoms;
- reproducing and narrowing a suspected system problem;
- distinguishing root cause from secondary symptoms.

Do not use this skill to make aesthetic desktop improvements or to review a local diff before commit.

## Canonical Read Order

Read before concluding anything.

1. `LINUXPC_INSTRUCTIONS.md` if it exists.
2. `AGENTS.md`
3. `docs/PROJECT_CONTEXT.md`
4. `docs/05-arch-linux.md`
5. `docs/15-matriz-fuente-de-verdad.md`
6. `docs/18-inventario-configuracion-sistema.md`
7. Relevant repository configs for the failing component.
8. Live commands, logs, and service state for the exact symptom.

## Required Workflow

1. Start from the reported symptom and define the failure boundary.
2. Inspect current state before changing anything:
   logs,
   services,
   packages,
   sessions,
   devices,
   and relevant config.
3. Report findings under these headings:
   `Symptoms`,
   `Facts`,
   `Hypotheses`,
   `Tests`,
   `Likely cause`.
4. Prefer non-destructive checks that can falsify a hypothesis quickly.
5. Do not recommend a fix until the evidence narrows the cause sufficiently.
6. If implementation is later approved, hand off or continue as a separate bounded unit.

## Working Rules

- Treat unchecked assumptions as hypotheses only.
- Preserve logs and state visibility; do not hide the problem behind broad cleanup.
- Prefer read-only inspection and reversible probes.
- Distinguish repository-backed config from live drift.
- State clearly when evidence is insufficient for a confident cause.

## Safety Boundaries

- Do not use `sudo`.
- Do not commit, push, merge, rebase, or rewrite history.
- Do not run destructive or high-risk actions without explicit authorization.

## Overlap Boundaries

- Do not apply fixes by default; diagnosis comes first.
- Do not audit backups, boot recovery coverage, or restore procedures broadly. Use `recovery-auditor`.
- Do not review local diffs for commit readiness. Use `review-linuxpc`.
- Do not redesign dotfiles architecture. Use `dotfiles-architect`.

## Definition of Done

Before finishing, confirm:

- symptoms and failure scope were stated clearly;
- live state was inspected before recommendations;
- facts, hypotheses, tests, and likely cause were separated;
- only non-destructive checks were used unless explicitly authorized otherwise;
- remaining uncertainty was stated plainly.
