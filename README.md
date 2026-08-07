# dottyp

One Typst library for the mathematical notation I write across papers, theses, summaries and slides,
replacing the `math.typ` copies that had drifted apart in each project.

## Use

A document vendors the library as a submodule and points Typst at it:

```bash
git submodule add https://github.com/luiswirth/dottyp lib/dottyp
export TYPST_PACKAGE_PATH=$PWD/lib/dottyp/pkg
```

```typst
#import "@local/dottyp:0.1.0": *
```

The repo is its own package root:
`pkg/local/dottyp/0.1.0` is a symlink back to the top level,
which is the directory shape Typst's local package namespace expects.

Vendoring is what makes a document build anywhere,
on a machine that has never seen this repo and in CI,
and what pins each document to the commit of the library it was written against.
The `build.sh` of a document exports the variable itself,
so nothing is expected of the environment.
Picking up a change to the library is `git -C lib/dottyp pull` and a commit in the document.
Publishing to Typst Universe would replace the submodule and the variable, not the imports.

No name is defined twice across the modules,
so the glob import is unambiguous and a name means one thing wherever it is read.
A document that would rather qualify can import a module by name instead:

```typst
#import "@local/dottyp:0.1.0": exterior
$exterior.codif omega$
```

## Modules

Two halves.
`src/math/` is the notation a document writes, `src/layout/` is the shape it is written in.

| module | what it carries |
| --- | --- |
| `notation` | vectors, matrices, tensors, conjugation, transposition, restriction |
| `style` | document-level math styling and numbering |
| `algebra` | linear maps, traces, determinants, inner products, tensor and direct sums |
| `analysis` | intervals, derivatives, norms, suprema, asymptotics |
| `spaces` | Lebesgue, Sobolev and continuity spaces, distributions, duals |
| `vector-calculus` | grad, div, curl, rot, Laplacian, d'Alembertian |
| `exterior` | exterior algebra and calculus, Hodge star, musical isomorphisms, pullbacks |
| `fem` | meshes, cells, forms, finite element spaces, interpolation |
| `feec` | simplices, polynomial spaces, Whitney forms, cochains, de Rham |
| `probability` | measures, distributions, Gaussian processes, stochastic calculus |
| `quantum` | Dirac notation, and the marks of the Keldysh Green's functions |
| `aliases` | single-letter shorthands, opt-in |
| `theme` | the colors a document is drawn in, as `light-theme` and `dark-theme` |
| `template` | `document-style`, the page and text a document is set on |
| `sections` | `section-style` and its preface/body/appendix/postface presets, plus `notes-style` |
| `blocks` | titled panels, framed blocks, circled text, rules, called-out equations |
| `theorems` | theorem environments on `@preview/ctheorems`, the one external dependency |

`aliases` is never re-exported by the glob:
importing it puts 77 single letters in scope,
which is fine in a document that wants them and a disaster in one that does not.

```typst
#import "@local/dottyp:0.1.0": aliases
#import aliases: *
```

A document turns on the layout it wants, and a thesis switches style between its parts:

```typst
#show: document-style
#show: thmrules

#show: preface-style
= Acknowledgments

#show: body-style
= Introduction
```

`document-style` takes the theme, so the dark variant is the same code with different colors:

```typst
#show: document-style.with(colors: dark-theme)
#show: notes-style
```

Every box reads its colors from the theme rather than naming `white` or `black`,
which is what lets one set of definitions serve both.
`math-style` alone is available for a document that wants the notation without the layout.

## Conventions

Vectors are bold italic, matrices upright bold.
Intervals follow Bourbaki, so the open interval is `oo(a, b)` and prints as `]a, b[`.
Unary operators such as the Hodge star and the musical isomorphisms
are declared with `math.class` so they bind to their argument rather than taking operator spacing.
Symbols are taken from `sym`, and only functions from `math`.

## Templates

`templates/` holds one starting point per kind of document,
each a repo of its own once copied out by `templates/new.sh`,
which vendors the library and makes the first commit:

    ./templates/new.sh paper ~/dev/some-paper

There is `thesis` for long work split into chapters, a preface, an appendix and a bibliography,
`book` for a document that gathers chapters and nothing else,
`paper` for a single-file document with a title block,
`notes` for a single file on the dark theme.
All four keep the library at arm's length behind `src/setup.typ`,
which is the one file that imports it and the one place a document says how it departs from it.
The theme is a named variable there, so light and dark are one word apart in any of them.

Each carries a `build.sh` and a `watch.sh` writing to `out/`,
and the GitHub workflow that deploys the compiled PDF to Pages
through [typst-deploy](https://github.com/luiswirth/typst-deploy),
which is told where the vendored library sits and needs nothing else.
The document is published under the name of its repository.

Deploying takes a remote with Pages enabled, which `new.sh` creates
once it is told how the repository is to be visible:

    ./templates/new.sh paper ~/dev/some-paper --private

Read that flag as covering the sources alone.
A Pages site is public whatever its repository is,
so `--private` publishes the PDF and hides what it was built from.

## Test

`test/showcase.typ` exercises every exported name of the math half,
`test/layout.typ` the four thesis parts, the boxes and the theorem environments,
`test/notes.typ` the same layout on the dark theme.
The showcase checks its sheets against the modules,
so an export that is not shown, and a name shown that no longer exists, both fail the compile.
What that cannot check is how a definition renders,
so this is how a change is checked: compile them and look at the pages.

    ./test.sh              compiles every test file to out/
    ./watch.sh layout      watches one of them

The same three are what this repository deploys,
so the rendered pages of the current commit are listed at
<https://lwirth.com/dottyp/>.
