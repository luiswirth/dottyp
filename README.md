# dottyp

One Typst library for the mathematical notation I write across papers, theses, summaries and slides,
replacing the `math.typ` copies that had drifted apart in each project.

## Use

Point Typst at the package root and import the package:

    export TYPST_PACKAGE_PATH=$HOME/dev/dottyp/pkg

```typst
#import "@local/dottyp:0.1.0": *
```

The repo is its own package root:
`pkg/local/dottyp/0.1.0` is a symlink back to the top level,
which is the directory shape Typst's local package namespace expects.
Publishing to Typst Universe would replace the env var, not the imports.

No name is defined twice across the modules,
so the glob import is unambiguous and a name means one thing wherever it is read.
A document that would rather qualify can import a module by name instead:

```typst
#import "@local/dottyp:0.1.0": exterior
$exterior.dif omega$
```

## Modules

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
| `aliases` | single-letter shorthands, opt-in |

`aliases` is never re-exported by the glob:
importing it puts a hundred single letters in scope,
which is fine in a document that wants them and a disaster in one that does not.

```typst
#import "@local/dottyp:0.1.0": aliases
#import aliases: *
```

The typography is separate from the notation, and a document turns it on itself:

```typst
#show: math-style
```

## Conventions

Vectors are bold italic, matrices upright bold.
Intervals follow Bourbaki, so the open interval is `oo(a, b)` and prints as `]a, b[`.
Unary operators such as the exterior derivative, the Hodge star and the musical isomorphisms
are declared with `math.class` so they bind to their argument rather than taking operator spacing.

## Test

`test/showcase.typ` exercises every exported name.
It is how a change is checked: compile it and look at the pages.

    TYPST_PACKAGE_PATH=$PWD/pkg typst compile test/showcase.typ "test/showcase-{p}.png" --ppi 130
