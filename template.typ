#let firstindent = (
  par(
    text(size: 0pt, ""),
  )
    + v(-1em - 2.926pt)
)

#let conf(
  title: none,
  author: (),
  headtitle: [],
  textfont: "Harano Aji Mincho",
  headfont: "Yu Gothic",
  doc,
) = {
  //
  set text(
    lang: "jp",
    region: "JP",

    font: textfont,
    12pt,
  )
  show emph: set text(font: headfont)
  show strong: set text(font: headfont, weight: "regular")

  set document(
    title: title,
    author: author,
    date: auto,
  )

  // \
  set page(
    paper: "a4",
    header: align(right)[
      #headtitle
    ],
    // width: auto,
    // height: auto,
    // flipped: false,
    //  margin: (left: 31.2694445mm, right: 31.2694445mm + 8em, top: 31.2044445mm, bottom: 21.3344445mm),
    margin: (top: 40mm, bottom: 30mm),
    // ( 31.2694445 * 2  - 3.88 - 4.23 - 1.76) / 2
    // binding: auto,
    // columns: 1,
    // fill: auto,
    numbering: "1",
    // number-align: center + bottom,
  )

  set par(
    leading: 0.85em,
    first-line-indent: 1em,
    justify: true,
    linebreaks: "simple",
    justification-limits: (tracking: (min: -0.01em, max: 0.02em)),
  )

  show link: set text(fill: rgb("#0000ff"))

  set list(indent: 2em)
  set enum(numbering: "(1)", indent: 2em)

  set heading(numbering: "1.")
  show heading: set text(font: headfont, weight: "semibold")
  show heading.where(level: 1): set text(size: 18pt)
  show heading: it => {
    it
    v(-0.3em)
    par(text(size: 0pt, ""))
  }

  //show figure: set block(breakable: true)

  set outline(
    title: "目次",
    indent: 1em,
  )

  set outline.entry(fill: repeat([.], gap: 0.30em))
  show outline.entry: it => {
    let prefix = text(font: headfont, weight: "semibold")[#it.prefix()]
    let inner = [
      #text(font: headfont, weight: "semibold")[#it.element.body]
      #box(width: 1fr, it.fill)
      #it.page()
    ]

    link(
      it.element.location(),
      it.indented(prefix, inner),
    )
  }
  show "、": ", "
  show "。": ". "

  //math
  show math.frac: math.display
  show math.integral: math.display

  set math.equation(supplement: none)
  show math.equation: set text(font: ("New Computer Modern Math", textfont))
  show math.equation.where(block: false): it => {
    h(0.17em, weak: true)
    it
    h(0.17em, weak: true)
  }

  firstindent + doc
}
