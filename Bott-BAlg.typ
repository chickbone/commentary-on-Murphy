#import "template.typ": conf
#import "functions.typ": *
#import "theorems.typ": thmrules
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#set cite(style: "alphanumeric")
#set figure(supplement: "diagram", gap: 1em)

#show: conf.with(headtitle: [Bott periodicity])
#show: thmrules.with(qed-symbol: $square$)
#show figure: set block(inset: 5pt)
#show outline.entry: set par(linebreaks: "simple")

#let KS = $cal(K)_scr(S)$
#let ToeS = $cal(T)_scr(S)$
#let ToeS0 = $cal(T)_scr(S)^0$
#let ToeSbar = $dash(cal(T)_scr(S))$

#let StarAlg = $*"-Alg"$



#v(2em)

#align(center)[
  #text(25pt)[
    Bott周期性 補完計画
  ]

  Kasshi K

  #datetime.today().display(年月日)
]
#v(2em)

// honbunn

#cite(<MR2340673>, supplement: "Thm 4.7") においてlocal Banach algebraに対するBott周期性が示されるが、 その証明には致命的な誤植がある。本稿ではその修正を図り、証明を完全なものとすることを目標とする。主に @fritz_cuntz_nodate を参考にした。

= 主定理の証明
示すべきは以下の主張である:


#theorem(cite(<MR2340673>, supplement: "Thm 4.7"))[
  Aがlocal Banach algebraのとき、

  $
    K_* (ToeS0(A)) = 0。
  $
]


#figure(caption: [$ToeS0$の定義])[
  #diagram(
    cell-size: 20mm,
    $
      KS(A) edge("hook->") edge("d", "=") & ToeS0(A) edge("d", "hook-->") edge(->>) & C^oo_0(TT backslash {1}, A) edge("d", "hook->")\
      KS(A) edge("hook->") & ToeS(A) edge(->>) edge("d", l, ->>) & C^oo (TT, A) edge("d", upright("ev")_1, ->>) \
      & A edge("=") & A
    $,
  )
]

//#move(dx: 0.2em, dy: 1.5em, rotate(90deg)[$angle.right$])

#proof()[
  bounded unital  $*$-homomorphism
  $
    l : ToeS(A) --> A , space S times.o a |-> a
  $
  はsection
  $
    q : A --> ToeS(A) , space a |-> 1 times.o a
  $

  を持つので、中央縦の完全列は分裂する。$K_*$はsplit-exactであったから、

  $
    K_*(ToeS0(A)) = 0 & <==> K_*(l) : K_* (ToeS(A)) --> K_*(CC) "が同型" \
                      & <== K_*(q) compose K_*(l) = id_(K_*(ToeS(A)))
  $
  となることがわかる。最後の主張を$K_*$のhomotopy invarianceと$KS$-stabilityを用いて示そう。簡単のため、以下$A = CC$とする。

  そのために、補助的なalgebra$ToeSbar$を次の図式により定義する。($ToeSbar$は#cite(<MR2340673>)における$hat(ToeS)$とやや異なるので注意。)


  #figure(caption: [$ToeSbar$の定義])[
    #diagram(
      cell-size: 20mm,
      $
        & ToeS edge("dl", label-side: #right, label: kappa : x |-> E_00 times.o x, ->) edge("dr", bend: #(-18deg), id, label-pos: #0.25, "<-") edge("dr", q compose l, bend: #(+18deg), <-)\
        KS times.o ToeS edge(iota, "hook->") edge("d", "=")
        & ToeSbar edge("d", r, "->") edge(label-side: #left, p, label-pos: #0.30, ->>)
        & ToeS edge("d", label-side: #left, v |-> pi(v) times.o v, "->") edge("l", bend: #30deg, s, ->)\
        KS times.o ToeS edge("hook->") & ToeS times.o ToeS edge(->>) & C^oo (TT) times.o ToeS \
      $,
    )
  ]

  但し右下の図式はpullbackである。このとき、pullbackの普遍性より、
  $
    s_0, alpha_0 : ToeS -> ToeS times.o ToeS\
    s_0(x) = x times.o 1, quad alpha_0(x) = S x S^* times.o 1
  $
  はhomomorphism$s, alpha : ToeS -> ToeSbar$をそれぞれ導く。

  ここで$p compose s = id$であるから、中央の完全列は分裂する。よって$K_*(iota)$は単射。

  また、$K_*$のstabilityより$K_*(kappa)$は同型。よって$j = iota compose kappa : ToeS -> ToeSbar$とおくと、$K_*(j)$は単射となることがわかる。

  ここで、$phi_0, phi_1 : ToeS -> ToeSbar$を
  $
    phi_0 & := alpha + j compose id, quad            & hat(S)_0 := phi_0(S) = S^2 S^* times.o 1 + E_00 times.o S \
    phi_1 & := alpha + j compose (q compose l), quad & hat(S)_1 := phi_1(S) = S^2 S^* times.o 1 + E_00 times.o 1
  $
  と定めると$phi_0, phi_1$はunital bounded $star$-homomorphismである。

  このとき、$phi_0$と$phi_1$はsmoothly homotopic。
  #subproof[
    $ToeS$のuniversalityより、
    $
      Hom_StarAlg (ToeS, ToeSbar) space &tilde.equiv "Isom"(ToeSbar) space (:= {v in ToeSbar mid(|) v^* v = 1}),\
      Hom_StarAlg (ToeS, C^oo ([0,1],ToeSbar) ) space &tilde.equiv "Isom"(C^oo ([0,1],ToeSbar))\
      &tilde.equiv C^oo ([0,1], "Isom"(ToeSbar))
    $
    であるから、$hat(S)_0$と$hat(S)_1$を結ぶsmoothなpath$hat(S)_t thick (t in [0,1])$を構成すればよい。

    ここで、$"Isom"(ToeSbar)$にはunitary elementによる左作用
    $
      cal(U)(ToeSbar) arrow.cw.half "Isom"(ToeSbar), space u |-> (v |-> u compose v)
    $
    が自然に定まる。このことから、$cal(U)(ToeSbar)$のsmoothなpath
    $ U(t) : [0,1] -> cal(U)(ToeSbar) $であって
    $
      hat(S)_i = U(i) compose (S times.o 1) quad (i = 0, 1)
    $
    なるものを構成すれば、$hat(S)_t = U(t) compose (S times.o 1)$が所望のhomotopyを与えることがわかる。

    具体的には、
    $
      U_0 & = S^2 (S^*)^2 times.o 1 + S E_00 times.o S^* + E_00 S^* times.o S + E_00 times.o E_00 \
      U_1 & = S^2 (S^*)^2 times.o 1 + S E_00 times.o 1 + E_00 S^* times.o 1
    $
    とおくと、$i = 0,1$に対して
    #enum[
      $hat(S)_i = U_i compose (S times.o 1)$
    ][
      $U_i^* = U_i$
    ][
      $U_i^2 = 1$
    ]
    が簡単な計算により分かり、
    $
      U^((i))(t) := 1/2 (1 + U_i) + 1/2 exp(pi i t) (1 - U_i)
    $
    は$1$と$U_(i)$を結ぶ$cal(U)(ToeSbar)$のsmoothなpathとなる。

    最後に$U(t)$を$U^((0)) (1-t)$と$U^((1)) (t)$の合成(の平滑化)とすればよい。
  ]
  よって、$K_*$のhomotopy invarianceより、$K_*(phi_0) = K_*(phi_1)$。

  一方、$alpha$と$j$の直交性より
  $
    K_*(phi_0) = K_*(alpha) + K_*(j) compose id, quad K_*(phi_1) = K_*(alpha) + K_*(j) compose K_*(q) compose K_*(l)
  $
  であるから、$K_*(j) compose K_*(q) compose K_*(l) = K_*(j) compose id$。さらに$K_*(j)$の単射性より
  $
    K_*(q) compose K_*(l) = id_(K_*(ToeS(A)))
  $
  となって証明が終わる。
]

$ToeS0(A)$の$K$理論の消滅がBott map
$ beta :K_(2 + *) (A) --> K_* (A) $
の同型性を導くのは @MR2340673 の通りである。(Bott 周期性)

#pagebreak()

= 感想


== 結果について
@MR2340673 はとても洗練されたよい教科書ではあるのだが、肝心のBott周期性の証明において致命的なミスがあるのは玉に瑕である。(筆者が単に誤読しているだけかもしれないが。)
この本において信頼できるのは#strike[本文よりも]図であるという教訓が得られた。

この証明はほとんど @fritz_cuntz_nodate に依っているのだが、@fritz_cuntz_nodate では$C^*$-algebraのみを扱っているものの、より一般のadditive functorに対してBott周期性が示されている。これは上の証明を注意深く読んでもらうとわかる通り、用いられている$K_0$の性質は
+ split-exactness
+ ($KS$に関する) stabiliy
+ (smooth) homotopy invariance
の3つのみである。よって、Bott周期性は上の3つの性質を満たすadditive functor
$
  E : "BAlg" --> frak(C)
$
に直ちに一般化される。

== 証明について

証明の中で$ToeSbar$というalgebraが本質的に重要な働きをするが、なぜこのようなものを導入するのだろうか、という疑問があるのだが、これは以下のような理由があるのではないかと思う。

示したいのは
$K_*(q compose l) = id_(K_*(ToeS)) = K_* (id_ToeS)$
であったから、$q compose l$と$id_ToeS$とのhomotopyを作りたくなる…のだが、これは不可能である。実際、このようなhomotopyが存在すれば$S$と$1$がpathで結ばれることになるから、Fredholm indexの連続性より
$
  op("ind") S = op("ind") id = 0
$
とならなければならないが、これは$op("ind") S = -1$に反する。

ただ$j$を合成した上で$alpha$を足せばhomotopicになるというのが証明の核心である。ここから$K_*(q compose l) = id$が得られるのはひとえにstabilityとsplit-exactnessのおかげである。即ち、$K_*(q compose l) = id$を示すには$ToeS$内部ではなく外部の$ToeSbar$においてhomotopyを構成すれば十分である。このような$K_*$の"柔軟性"が$K$理論を計算可能なものとして、豊かな理論を織り成し、華やかな応用を生み出しているのではないかと思われる。

#pagebreak()

#[
  #set par(justify: false)
  #bibliography("references.bib", title: "参考文献")
]
