#import "theorems.typ": *
#show: thmrules

#let default_thm(title) = thmbox(
  "theorem",
  title,
  stroke: (left: 1pt),
)


//identifier: same
#let theorem = default_thm("Theorem")
#let corollary = default_thm("系")
#let proposition = default_thm("命題").with(numbering: none)
#let lemma = default_thm("補題")
#let definition = default_thm("定義").with(numbering: none)


#let example = default_thm("Example")
#let proof = thmproof(
  "proof",
  strong("証明"),
  padding: (bottom: 1em),
  breakable: true,
)

#let subproof = thmproof(
  "proof",
  math.because,
  separator: [#h(0.1em))#h(0.8em)],
  padding: (bottom: 1em),
  breakable: true,
  stroke: (left: 1pt),
)
//#let qed = align(right)[#sym.qed]
//#let semiqed = align(right)[#sym.ballot]

//abbreviations
#let Hom = $op("Hom")$
#let Ext = $op("Ext")$
#let Tor = $op("Tor")$
#let End = $op("End")$
#let GL = $op("GL")$
#let Mat = $op("Mat")$
#let Ass = $op("Ass")$
#let Ann = $op("Ann")$
#let Image = $op("Im")$

#let char = $op("char")$
#let codim = $op("codim")$
#let depth = $op("depth")$
#let gr = $op("gr")$
#let grade = $op("grade")$
#let height = $op("ht")$
#let nil = $op("nil")$
#let rad = $op("rad")$
#let projdim = $op("proj dim")$
#let injdim = $op("inj dim")$
#let rank = $op("rank")$
#let supp = $op("supp")$
#let Supp = $op("Supp")$

#let Set = $sans("Set")$
#let Top = $sans("Top")$
#let alg = $hyph #h(0pt, weak: true) sans("alg")$

//names
#let CM = "Cohen-Macaulay"

#let hat(b) = std.math.accent(b, math.hat, size: 140%)
