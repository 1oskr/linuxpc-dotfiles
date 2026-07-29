---
name: maintain-linuxpc
description: Use this skill to maintain, diagnose, document, or improve LinuxPC when working on Arch Linux, Hyprland, dotfiles, reproducibility, installed tools, or repository-backed system configuration.
---

# Maintain LinuxPC

Use this skill for maintenance work on LinuxPC: configuring Hyprland behavior, diagnosing Arch problems, installing and documenting tools, reviewing reproducibility, and updating repository-backed system configuration.

## Start Conditions

Activate this skill when the request is about LinuxPC and includes tasks such as:

- configuring functions in Hyprland;
- diagnosing Arch Linux or session problems;
- installing, auditing, or documenting tools used by LinuxPC;
- checking reproducibility, recovery, or source-of-truth gaps;
- updating LinuxPC configuration or its supporting documentation.

## Canonical Read Order

Read the repository before proposing changes.

1. `LINUXPC_INSTRUCTIONS.md` if it exists.
2. `AGENTS.md`
3. `docs/PROJECT_CONTEXT.md`
4. The most relevant canonical docs for the target area, usually chosen from:
   `docs/15-matriz-fuente-de-verdad.md`,
   `docs/16-limites-configuracion.md`,
   `docs/17-inventario-arch.md`,
   `docs/18-inventario-configuracion-sistema.md`,
   `docs/19-contrato-reconstruccion-arch.md`,
   `docs/05-arch-linux.md`,
   `docs/07-dotfiles-git.md`,
   `docs/09-roadmap.md`.

Do not restate long project rules already covered elsewhere. Use those documents as authority and stay concise.

## Required Workflow

1. Confirm the target unit of work.
   One unit means one bounded, testable problem or change.
2. Inspect real state before editing.
   Check the relevant files, symlinks, commands, services, package state, session state, logs, and `git status`.
3. Separate the findings explicitly:
   `Checked state` for facts you verified.
   `Hypothesis` for suspected causes not yet proved.
   `Proposal` for the minimal next change.
   `Pending` for items still unverified or blocked.
4. Prefer the smallest reversible change consistent with the documented design.
5. Verify the result with the narrowest meaningful check.
6. Evaluate whether documentation, rollback notes, or reproducibility records also need updates.

## Working Rules

- Reuse existing repository structure, configs, scripts, and conventions before creating new ones.
- Keep changes minimal, maintainable, and easy to review.
- Do not mix unrelated refactors into the same unit of work.
- If documentation is incomplete or conflicts with the real system, call that out before relying on it.
- If a requested action could be destructive or system-wide, stop and request explicit authorization.

## Safety Boundaries

- Do not use `sudo`.
- Do not commit, push, merge, rebase, or rewrite history.
- Do not run destructive commands or broad cleanup without explicit authorization.
- Do not present assumptions as facts when the system state has not been checked.

## Definition of Done

Before finishing, confirm:

- the requested unit was changed or diagnosed;
- the result was verified with a concrete check;
- any documentation impact was evaluated;
- reversibility and reproducibility were considered;
- remaining risks, gaps, or pending checks were stated clearly.
