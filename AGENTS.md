# dottyp

One Typst library for the notation, the template and the conventions every
document of mine uses.
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
- `template/`:
  the single starting point, copied out by `new.sh` to become a repo of its own.
  It carries the scaffolding and a minimal body, the kind of document being what
  the copy specializes itself into out of the blocks this library exports.

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
  A stroke names its paint, since a bare width takes black.
- **Never duplicate setup in a document that can be done here:**
  a document declares its choices, and dottyp carries everything else.
- **`@preview/ctheorems` is the only external dependency.**
- **A document takes the library as a flake input, never a path in its environment:**
  `flake.lock` pins the revision and the devShell exports `TYPST_PACKAGE_PATH`,
  so a build depends on nothing outside the checkout and its lock.
- **The toolchain is declared by the checkout as the library is:**
  a flake devShell, entered by direnv interactively and by the build script itself
  otherwise, since a non-interactive shell loads no direnv.
- **The pinned copy is read-only, lying in the Nix store:**
  the library is edited in its own checkout,
  which a document reaches with `--override-input` while the lock stays as it is.
- **Leanness is a goal, so a default beats a setting:**
  a parameter earns its place only where two documents genuinely differ,
  and one that nothing reads is deleted along with what it configured.
- **Nothing institution-specific lives here:**
  what one institution demands of a document belongs to the document that hands it in,
  the library carrying it for every document that does not.

## Conventions

- **What Typst already provides is never redefined here:**
  a name is added only where it is substantially better than the builtin,
  and an alias that merely repeats one does not earn a place.
- Vectors bold italic, matrices upright bold.
- **The first-order operators carry two notations:**
  `grad`, `curl` and `div` set the word, Typst's `nabla` the symbol,
  and a formula takes whichever of the two reads better in it.
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

## Writing a document

What every document of mine follows, wherever the library cannot carry it itself.
A document's own `AGENTS.md` records only what departs from this.

- **A label goes on what is cross-referenced, and an orphan is stripped:**
  a display equation is named exactly where it carries one,
  so numbering is never a document's setting.
- **An equation is cited by a name, never by a number:**
  a name a reader recognizes without turning back,
  the math symbol it defines or the abbreviation the field already uses,
  and the Typst label is spelled as the name prints wherever it can be.
  The prose names what each reference points at, so nothing has to be looked up to read on.
- **What Typst provides is written as it stands:**
  an alias loses the name everywhere else.
- **`exp` wherever `e^` would set the exponent across the line.**
- **Units are stated through `unit`, at the quantity's introduction and once,**
  and only where they are not read off the name.
  A value carrying its unit is `qty`, the two never interchangeable.
- **`term` marks the defining occurrence, and bold belongs to it alone:**
  emphasis carrying no definition is italic.
- **`key` marks the one sentence a section has to be able to state:**
  it opens with words, Typst's highlight leaving math unpainted.
- **Code mode `{...}` over content mode `[...]` where the body is mostly commands,**
  so no stray hashes.
- **Notation general enough to outlive the document belongs here,**
  promoted once the document has actually written it.

## Verifying

Run `just ci`, which checks that every test file compiles, and look at a page
with `just watch layout`.
Never assert that a change renders.
The showcase checks itself against the modules, so a new export must be added there,
but that only proves the name exists.

The template is verified by its own `just ci`.

## Typst 0.15

Names that moved, and that older documents still carry:
`angle.l`/`angle.r` are now `chevron.l`/`chevron.r`,
and `diff` is now `partial`.
