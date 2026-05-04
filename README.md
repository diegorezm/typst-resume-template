# typst-resume-template

A modular resume template built with [Typst](https://typst.app/). Write your personal information once and reuse it across multiple role-specific resumes — each with its own summary, skills, and experiences.

## Features

- **Single source of truth** for personal info (name, email, phone, links, etc.)
- **Multiple resumes** with completely independent content
- **Icons** via Font Awesome (email, phone, location, LinkedIn, GitHub, website)
- **Makefile** that compiles all resumes to `output/` with one command
- Everything written in **pt-BR** (easy to adapt to any language)

## Requirements

- [Typst](https://typst.app/) CLI installed (`typst` available in your PATH)
- Font Awesome fonts (Free and Brands `.otf` files) — see [typst-fontawesome](https://github.com/duskmoon314/typst-fontawesome) for setup instructions
- `make` (pre-installed on Linux/macOS; on Windows use WSL or [GNU Make for Windows](https://gnuwin32.sourceforge.net/packages/make.htm))

## Project Structure

```text
.
├── shared/
│   ├── perfil.yaml        ← Your personal info (name, email, links)
│   ├── helpers.typ        ← Icon helpers and contact row
│   └── tema.typ           ← Page settings, fonts, colors, headings
├── resumes/
│   ├── geral.yaml         ← Example: general resume
│   ├── marketing.yaml     ← Example: marketing-focused resume
│   └── design.yaml        ← Example: design-focused resume
├── templates/
│   └── resume.typ         ← Main template (used by all resumes)
├── Makefile               ← Compiles everything to output/
└── output/                ← Generated PDFs land here (git-ignored)
```

## Getting Started

1. **Edit your personal info** in `shared/perfil.yaml`.
2. **Edit or create resume files** in `resumes/`. Each `.yaml` file becomes one PDF.
3. **Run `make`** to compile all resumes:

```bash
make
```

All PDFs will be created inside `output/`.

### Compile a single resume

```bash
make output/geral.pdf
```

### Clean generated files

```bash
make clean
```

## Customizing

### Adding a new resume

1. Create a new file in `resumes/`, e.g. `resumes/vendas.yaml`.
2. Fill in the fields following the structure of any existing example.
3. Run `make` — the new PDF will appear in `output/` automatically.

### Changing the layout

All visual decisions (fonts, colors, margins, heading styles) live in `shared/tema.typ`. You only need to edit one file to change the look across all resumes.

### Changing the contact icons

Icon helpers are defined in `shared/helpers.typ`. If you don't use GitHub or LinkedIn, you can remove or swap those fields there.

## Resume YAML Fields

Each file in `resumes/` supports the following fields:

| Campo | Descrição |
|---|---|
| `cargo_alvo` | Job title shown under your name |
| `resumo` | Short professional summary paragraph |
| `habilidades` | List of skills shown as a single line |
| `experiencias` | List of work experiences (see example) |
| `projetos` | List of projects (optional) |
| `formacao` | List of education entries (optional) |

## License

MIT — free to use, modify, and share.
