#import "template.typ": conf
#import "functions.typ": *

#show: conf.with(headtitle: [Cohen-Macaulay ring])


#v(2em)

#align(center)[
  #text(25pt)[
    Cohen-Macaulay環
  ]

  Kasshi K
]
#v(2em)
#outline(target: heading)

= regular sequence

(可換)環$R$とその元$x in R$に対し、$x y = 0$なる$0 != y in R$が存在するとき$x$を零因子といい、そうでないとき非零因子というのであった。非零因子の一般化として、次の概念を考えよう。

#definition([正則元、正則列])[
  $R$を環、$M$を$R$加群とする。

  $x in R$が$M$*正則*(*regular*)であるとは、$forall m in M$に対して$x m = 0$ならば$m = 0$が成り立つことである。

  また、$R$の元の列$bold(x) = x_1 ,..., x_n subset R$に対して、次の条件を考える:
  #enum(numbering: "(i)")[
    $x_i$は$M slash (x_1,...,x_(i-1))M$正則 $quad (i = 1,...,n)$
  ][
    $M slash (x_1,...,x_n) M != 0$
  ]

  (i)が成り立つとき、$bold(x)$を*弱*$M$*正則列*といい、(i), (ii)が成り立つとき、$bold(x)$を$M$*正則列(regular sequence)*または単に$M$*列(sequence)*という。
]

#example[$R$正則元とは、非零因子のことである。]

#example[
  体$k$上の多項式環$R = k[X_1,...,X_n]$に対し、$X_1,...,X_n in R$は$R$列となる。

  実際、 $R slash (X_1,...,X_(i-1)) tilde.equiv k[X_i,...,X_n]$は$0$でない整域であるから、$X_i$は$R slash (X_1,...,X_(i-1))$正則元であり、$R slash (X_1,...,X_n) tilde.equiv k != 0$。
]

#h(1em)まず定義から簡単にわかる性質を述べよう。
#proposition[
  $R$を環、$M, M_1, M_2$を$R$加群、$x in R$とする。
  #enum[
    部分加群$N subset M$に対して、
    $x$が$M$正則$==> N$正則
  ][
    $x$が$M_1 plus.o M_2$正則 $<==>$ $x$が$M_1$正則かつ$M_2$正則
  ][
    $x$が$M$正則 $==>$ $x$が$R slash Ann M$正則
  ]
]
#proof[
  #enum[
    $m in N subset M$に対して$x m = 0$ならば、
    $x$が$M$正則であることから$m = 0$.
  ][
    $(==>)$ $M_1, M_2 subset M_1 plus.o M_2$より、(1)からしたがう。\
    $(<==)$ $m_1 plus.o m_2 in M_1 plus.o M_2$に対して、
    $
          & x(m_1 plus.o m_2) = 0 && ==> x m_1 = 0 and x m_2 = 0 \
      ==> & m_1 = 0 and m_2 = 0   && ==> m_1 plus.o m_2 = 0
    $
    より$x$は$M_1 plus.o M_2$正則。
  ][
    $y in R$に対し$x y in Ann M$となるとき、任意の$m in M$に対し、
    $
      x (y m) = (x y) m = 0 ==> y m = 0 quad (because x in R "は"M"正則")
    $
    となる。$m$は任意であるから、$y in Ann M$。よって、$x$は$R slash Ann M$正則である。
  ]
  #v(-2em)
]

#proposition[
  $phi : R -> S$を環準同型、$M$を$R$加群、$N$を$S$加群であって$R$加群として平坦なものする。$bold(x) = x_1,...,x_n$を$R$の元の列とするとき、
  $
    bold(x)" が弱 "M" 正則列"
    ==> bold(x), phi(bold(x)) := phi(x_1),...,phi(x_n) "は弱"
    (M times.o_R N) "正則列"
  $
  が成り立つ。さらに、$bold(x) (M times.o_R N) != M times.o_R N$ならば、$bold(x), phi(bold(x))$は$M times.o_R N$列となる。
] <flatness-regularity>

#proof[
  #let MN = $M times.o_R N$
  テンソル積の定義より、$x_i$による$MN$への乗算と$phi(x_i)$による$MN$への乗算は一致する。よって$bold(x)$に関する主張を示せばよい。

  $x_1 in R$は$M$正則であるから、$x_1$倍写像$(x_1 dot) : M -> M, m |-> x m$は単射である。さらに$N$は平坦$R$加群であるから、$(x_1 dot) times.o id_N : MN -> MN$もまた単射である。
  $(x_1 dot) times.o id_N$は$MN$の$x_1$倍写像に一致するので、$x_1$は$MN$正則元であることがわかる。

  また、$MN slash x_1(MN) tilde.equiv (M slash x_1 M) times.o_R N$より、弱$M slash x_1 M$列$x_2,...,x_n$に対して上の議論をくり返せば、$n$に関する帰納法により主張が成り立つ。
]


特に、局所化$R -> R_frak(p)$や完備化$R -> hat(R)$は平坦であるから、次の系を得る。

//(局所化と正則列の関係)
#corollary[
  $(R, frak(m))$をNoether局所環、$M$を有限生成$R$加群、
  $bold(x) subset frak(m)$を$M$列とする。
  このとき、次が成立:

  #enum(numbering: "(1)")[
    $frak(p) in Supp M$のとき、$bold(x)$は($R_(frak(p))$の列として)$M_(frak(p))$列。
  ][
    $bold(x)$は($hat(R)$の列として)$hat(M)$列。
  ]
]

#proof[
  (1) #h(1em) $R_frak(p)$は$R$上平坦であり$M_frak(p) tilde.equiv M times.o_R R_(frak(p))$であるから、@flatness-regularity より$bold(x)$は
  弱$M_frak(p)$列である。また、$M_frak(p) != 0$は$R_frak(p)$上有限生成であるから、中山の補題より
  $
    bold(x) M_frak(p) subset frak(p) M subset.neq M
  $
  であり、$M_frak(p) slash bold(x) M_frak(p) != 0$となるから、$bold(x)$は$M_frak(p)$列。

  (2) #h(1em) $hat(R)$は$R$上平坦であり、$M$が有限生成であるから、$hat(M) tilde.equiv M times.o hat(R)$である。よって (1) と同様の議論により成り立つ。
]

#h(1em)正則列について考察するとき、ホモロジー代数的な手法が用いられることがあるが、以下の命題はその基盤を与える。
#proposition[
  #set math.equation(numbering: num => [(#{ [\*] * num })])
  $R$を環、$bold(x) subset R$を$R$の元の列、
  $
    U stretch(->)^f L stretch(->)^g M stretch(->)^h N stretch(->) 0
  $ <retu1>
  を$R$加群の完全列とする。$bold(x)$が弱$N$正則列であるとき、列
  $
    U slash bold(x) U stretch(->)^(dash(f)) L slash bold(x) L
    stretch(->)^(dash(g)) M slash bold(x) M stretch(->)^(dash(h)) N slash bold(x) N stretch(->) 0
  $ <retu2>
  は完全である。
] <exactness-regularity1>

#proof[
  $bold(x)$の長さに関する帰納法により、長さが1、即ち$bold(x) = x in R$のときを示せばよい。また、複体 @retu2 は @retu1 に$R slash x R$をテンソルすることにより得られるので、非自明なのは$L slash x L$における完全性である。以下それを示そう:

  $dash(g) compose dash(f) = 0$より、$Image dash(f) subset ker dash(g)$。
  一方、$dash(l) in ker dash(g)$とすると$g(l) in x M$であるから、ある$m in M$が存在して$g(l) = x m$となる。
  $
    x h(m) = h(x m) = (h compose g)(l) = 0
  $
  より、$x$が$N$正則であることから、$h(m) = 0, space m in ker h = Image g$となる。

  よって、ある$l' in L$が存在して$m = g(l')$となる。このとき、
  $
    g(l - x l') = g(l) - x g(l') = x m - x m = 0
  $
  であるから、ある$u in U$が存在して$l - x l' = f(u)$となる。よって$dash(l) = dash(l - x l') = dash(f)(dash(u)) in Image dash(f)$となり、$ker dash(g) subset Image dash(f)$がしたがう。
]

// (完全性と正則性)
#proposition[
  $R$を環、$bold(x) = x_1,...,x_n subset R$とする。また、
  $
    0 -> U stretch(->)^phi M stretch(->)^psi N -> 0
  $
  を$R$加群の完全列とする。このとき、
]

#pagebreak()

= depth

#definition([grade])[]

#proposition[
  (zero divisorで生成されるidealはassosiate primeに含まれる)
]

#lemma([prime avoidance])[

]

#proposition[
  (Homと正則元の関係)
]

#theorem[
  (Hom = Ext)
]


#theorem[
  (gradeとExt)
]
= CM ring

#theorem([miracle flatness])[
  $phi : (R, frak(m)) -> (S, frak(n))$をNoether local ringのlocal morphismとする。このとき、
  #enum(numbering: "(i)")[
    $R$はregular local
  ][
    $S$は#CM
  ][
    $dim S = dim R + dim S slash frak(m) S$
  ]
  が成り立つとき、$phi$はflat morphism。
]

#proof[
  $dim R$に関する帰納法により示そう。$dim R = 0$のとき、$R$は体であるから明らか。

  $dim R > 0$のとき、(iii)より$dim S slash frak(m) S < dim S$。$frak(p)_1 ,..., frak(p)_m$を$S$のassosiate primeとすると、$S$は#CM であるから$frak(p)_i$はminimal primeであり、(iii)より$frak(p)_i in.not V(frak(m)S)$となる。

  もしある$i$に対し$frak(m) subset phi^(-1)(frak(p)_i)$であると仮定すると、
  $
    frak(m) S subset phi(phi^(-1)(frak(p)_i))S subset frak(p)_i
  $
  となり$frak(p)_i in.not V(frak(m)S)$に矛盾。したがって、$frak(m) subset.not phi^(-1)(frak(p)_i) space (i = 1,...,m)$であるから、prime avoidanceより$x in frak(m)$であって$x in.not frak(m)^2, phi^(-1)(frak(p)_1),...,phi^(-1)(frak(p)_m)$となるものが存在する。このとき、$x$は$R$の正則巴系の一部であり、$phi(x)$は$S$正則であるから、
  $
    dash(phi) : R slash (x) --> S slash (phi(x))
  $
  に対して、(i), (ii)が成り立つ。さらに、
  $
    dim R slash (x) & = dim R - 1 < dim R, \
    dim S slash (phi(x)) & = dim S - 1, \
    (S slash (phi(x))) slash (frak(m)S slash (phi(x))) & tilde.equiv S slash frak(m) S
  $
  であるから、(iii)も成り立つ。よって、帰納法の仮定より、$dash(phi)$はflat。したがって、次の補題より$phi$もflatとなる。
]

#lemma[
  $phi : R -> S$をNoether local ringのlocal morphism, $M$をfinite $S$加群とする。$x in R$に対して、
  #enum(numbering: "(i)")[
    $x$は$R$正則かつ$M$正則
  ][
    $M slash x M$は$R slash (x)$上flat
  ]
  が成り立つとき、$M$は$R$上flat。
]

#proof[ Stacks projectを参照]