---
name: lucide-icons
description: Use Lucide React icons correctly. Reference file contains all 1,671 valid icon names — always verify against it before using an icon.
---

# Lucide Icons

## Installation

```bash
bun add lucide-react
```

## Usage

```tsx
import { ArrowRight, Check, Loader2 } from "lucide-react";

// Basic usage
<ArrowRight />

// With props
<ArrowRight size={16} strokeWidth={1.5} className="text-muted-foreground" />
```

## Import Convention

- Import names are **PascalCase** versions of the kebab-case icon name
- `arrow-right` → `ArrowRight`, `circle-check` → `CircleCheck`
- Always import individual icons (tree-shakeable), never use a wildcard import

## Icon Name Reference

**Before using any icon, verify it exists** in `references/icon-names.txt` (1,671 icons, kebab-case).

To find icons by keyword, search the reference file:

```bash
grep "arrow" references/icon-names.txt
grep "chart" references/icon-names.txt
```

## Common Icons

| Purpose | Icon |
|---------|------|
| Close/dismiss | `x` |
| Menu | `menu` |
| Search | `search` |
| Settings | `settings` |
| User | `user` |
| Loading | `loader-2` (add `animate-spin`) |
| Check/success | `check`, `circle-check` |
| Error | `circle-x`, `triangle-alert` |
| Info | `info` |
| Add | `plus` |
| Delete | `trash-2` |
| Edit | `pencil` |
| Copy | `copy` |
| External link | `external-link` |
| Chevrons | `chevron-up`, `chevron-down`, `chevron-left`, `chevron-right` |
| Arrows | `arrow-up`, `arrow-down`, `arrow-left`, `arrow-right` |
| Sort | `arrow-up-down` |
| Filter | `filter` |
| Calendar | `calendar` |
| Mail | `mail` |
| Home | `house` |

## With shadcn/ui

Lucide is the default icon library for shadcn/ui. Icons work directly in Button, DropdownMenu, etc:

```tsx
import { Plus } from "lucide-react";
import { Button } from "@/components/ui/button";

<Button>
  <Plus /> New Item
</Button>
```

shadcn/ui Button automatically sizes icons — no need to pass `size` prop.

## Rules

1. **Never guess icon names** — always check `references/icon-names.txt`
2. **Never use dynamic imports for icons** — breaks tree-shaking
3. **Prefer semantic icons** — `circle-check` over `check` for status indicators
4. **Keep consistent sizing** — use the same `size` prop across a component
