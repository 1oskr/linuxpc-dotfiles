---
name: recovery-auditor
description: Use this skill to audit LinuxPC recovery readiness across Snapper, Btrfs, backups, restore procedures, GRUB, and recovery documentation with read-only inspection first, explicit high-risk boundaries, and clear separation between existing backups and verified restorability.
---

# Recovery Auditor

Use this skill to assess LinuxPC recovery posture without making high-risk changes. It audits whether recovery mechanisms exist, are documented, and appear restorable based on verified evidence.

## Start Conditions

Activate this skill when the request is about:

- auditing Snapper, Btrfs, backups, GRUB, EFI, or recovery procedures;
- checking whether rollback or restoration is really possible;
- validating recovery documentation against actual system or repository state;
- identifying gaps in backup coverage or restore testing.

Do not use this skill to repair bootloaders, repartition disks, or perform restores unless explicitly authorized.

## Canonical Read Order

Read before auditing.

1. `LINUXPC_INSTRUCTIONS.md` if it exists.
2. `AGENTS.md`
3. `docs/PROJECT_CONTEXT.md`
4. `docs/08-recuperacion.md`
5. `docs/10-snapshots-snapper.md`
6. `docs/11-mapa-datos-recuperacion.md`
7. `docs/12-copia-independiente.md`
8. `docs/13-prueba-restauracion.md`
9. `docs/14-rollback-permanente.md`
10. `docs/03-grub.md` and `docs/02-particiones.md` when boot or storage scope matters.

## Required Workflow

1. Define the recovery surface being audited:
   snapshots,
   filesystem,
   boot,
   off-device backup,
   or procedure.
2. Inspect with read-only commands first.
3. Separate results into:
   `Coverage`,
   `Restore path`,
   `Evidence`,
   `Gaps`,
   `Risk level`.
4. Distinguish clearly between:
   backup exists,
   restore path documented,
   restore path tested,
   restore path recently verified.
5. Treat disks, partitions, EFI, GRUB, and Btrfs mutation as high-risk and out of scope without explicit authorization.
6. Recommend the smallest next audit or test that improves confidence safely.

## Working Rules

- Prefer read-only inspection and documentation cross-checking.
- Never equate snapshot presence with full recovery readiness.
- Call out single points of failure and untested assumptions.
- Preserve a strict difference between repository truth and live recovery assets.
- Escalate any operation that could alter boot, storage, or snapshots.

## Safety Boundaries

- Do not use `sudo`.
- Do not commit, push, merge, rebase, or rewrite history.
- Do not run destructive or high-risk actions without explicit authorization.

## Overlap Boundaries

- Do not do general Arch incident diagnosis. Use `arch-diagnose`.
- Do not execute documentation-only updates; use `document-linuxpc`.
- Do not refactor repository structure. Use `dotfiles-architect`.
- Do not choose overall roadmap priority. Use `linuxpc-planner`.

## Definition of Done

Before finishing, confirm:

- the audited recovery surface is explicit;
- evidence was gathered with read-only inspection first;
- existing backup and verified restorability were not conflated;
- high-risk operations were avoided unless explicitly authorized;
- gaps and safest next checks were stated clearly.
