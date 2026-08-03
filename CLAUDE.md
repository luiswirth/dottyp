# dottyp

One Typst library for the notation and templates every document of mine uses.
See the README for how it is imported and what each module carries.

## Layout

Two halves, and nothing crosses between them except that `layout` may use `math`.

- `src/math/`:
  the notation a document writes.
- `src/layout/`:
  the shape it is written in.
- `src/lib.typ`:
  glob-reexports both halves and exposes each module as a named handle.
- `test/`:
  one file per half, plus the dark variant, compiled and looked at.
- `templates/`:
  one starting point per kind of document, copied out to become a repo of its own.

## Invariants

- **No name is defined twice across the modules:**
  the glob import stays unambiguous, and a name means one thing wherever it is read.
  A new export is checked against the whole library, not just its own module.
- **`aliases` is never re-exported by the glob:**
  importing it puts a hundred single letters in scope.
- **A module handle must not shadow a Typst builtin:**
  which is why the page template is `template.typ` exporting `document-style`,
  not `document`.
- **`dif` overrides the Typst builtin on purpose:**
  the builtin sets a thin space before the d, which is right for the `dx` of an
  integral and wrong for an operator, and this is a library for exterior calculus.
  An integrand that wants the space asks for it, as `f thin dif x`.
- **Colors come from the theme, never from a literal:**
  a box reads `palette.get()` under `context`.
  This is what makes light and dark one code path.
- **A document declares its choices and nothing else:**
  a `setup.typ` names a title, a palette and a typeface, and applies
  `article-document` or `notes-document`.
  Anything it would otherwise spell out itself, the order the rules go on in
  included, belongs here instead, or the projects drift apart one by one.
- **`@preview/ctheorems` is the only external dependency.**
- **A document vendors the library, never a path in its environment:**
  a submodule at `lib/dottyp`, and `TYPST_PACKAGE_PATH` exported by the build script
  and by the deploy workflow, so a build depends on nothing outside the checkout.

## Conventions

- Vectors bold italic, matrices upright bold.
- Bourbaki intervals, so the open one prints as `]a, b[`.
- Unary operators are declared with `math.class` so they bind to their argument
  rather than taking operator spacing.
- Kebab-case is unusable inside math mode, where the hyphen reads as subtraction.
  Hence `gammadist`, not `gamma-dist`.
- Symbols come from `sym`, functions from `math`,
  so the two kinds of name are told apart on sight.
- A name that is typed as a symbol stays short, `bigwedge` and `dalem`.
  A name that wraps content may read as prose, `pushforward` and `dualspace`.
- A name standing for a bare letter is kept, `msize` and `noise`:
  it is what fixes which letter a concept owns across every document.

## Verifying

Run `./test.sh` and look at the rendered pages in `out/`.
Never assert that a change renders.
The showcase checks itself against the modules, so a new export must be added there,
but that only proves the name exists.

A template is verified by its own `build.sh`,
which needs the library vendored at `lib/dottyp` as `templates/new.sh` puts it there.

## Typst 0.15

Names that moved, and that older documents still carry:
`angle.l`/`angle.r` are now `chevron.l`/`chevron.r`,
and `diff` is now `partial`.
