#import "template.typ": conf
#import "functions.typ": *
#import "theorems.typ": thmrules

#show: conf.with(headtitle: [GNS construction])
#show: thmrules.with(qed-symbol: $square$)

#v(2em)

#align(center)[
  #text(25pt)[
    GNS construction
  ]

  Kasshi K

  #datetime.today().display(年月日)
]
#v(2em)

$C^*$-環論におけるGNS constructionについてまとめる。GNS constructionとは、Hilbert空間への巡回表現を状態とよばれる汎関数から構成する基本的な手法である。#cite(<MR1074574>, form: "prose")を主に参考にした。
#outline(target: heading)

= 導入

$C^*$-環の巡回表現について考える前に、まず単位的環の巡回左加群について復習しておこう。

単位的環$A$の巡回左加群(cyclic left $space A$-module)とは、$A$の左加群$M$であって、ある元$m in M$が存在して、$M = A m$となるものをいうのであった。このとき、$I := Ann(m) = {a in A | a m = 0}$は$A$の左イデアルであり、準同型
$
  phi : A -> M, space a mapsto a m
$
は$A slash I$から$M$への同型を定める。

逆に、$A$の左イデアル$I$が与えられたとき、$A slash I$は$1_A + I$によって生成される$A$の巡回左加群となる。

$
  {A "の左イデアル"} & <--> {A"の巡回左加群"} slash tilde.equiv \
             I space & mapsto.long space A slash I \
        Ann(m) space & arrow.l.long.bar space A m
$

つまり、単位的環$A$の巡回左加群の同型類は、$A$の左イデアルという$A$の内在的な対象と1対1に対応することがわかる。ここで$A$が単位的という仮定は、$A slash I$が巡回的であることを保証するために本質的に用いられていることに注意しよう。

では、この対応の$C^*$-環版はどのようなものであろうか？つまり、$C^*$-環$A$の巡回表現(の同型類)は$A$のどのような内在的データで表されるのだろうか？その解答が本稿のテーマであるGNS constructionである。まず$C^*$-環の表現について定義しておこう。

#definition()[
  $C^*$-環$A$の表現(representation)とは、Hilbert空間$cal(H)$と$*$-準同型$pi : A -> B(cal(H))$の組$(pi, cal(H))$のことをいう。

  表現$(pi, cal(H))$が巡回(cyclic)であるとは、あるベクトル$xi in cal(H)$が存在して、$ cal(H) = overline(pi(A) xi) $となることをいう。このとき、$xi$を表現$(pi, cal(H))$の巡回ベクトル(cyclic vector)という。
]

#h(1em)一方,巡回表現に対応するのが$C^*$-環$A$の状態である。

#definition()[
  $C^*$-環$A$の状態(state)とは、$A$から複素数体$CC$への線型汎関数$phi : A -> CC$であって、次の条件を満たすものである。
  #align(center)[
    #set enum(numbering: "(i)", body-indent: 1.5em, number-align: end + bottom)
    1. $phi(A_plus) subset RR_plus$.
    2. $norm(phi) = 1$.
  ]
]

このとき、次の対応がある。

$
  {A "の状態"} & <--> {A"の巡回表現"} slash tilde.equiv \
     phi space & mapsto.long space (pi_phi, cal(H)_phi, xi_phi) \
  phi_xi space & arrow.l.long.bar space (pi, cal(H), xi)
$

ここで、$phi_xi$はベクトル状態、$(pi_phi, cal(H)_phi, xi_phi)$はGNS constructionによる巡回表現である(定義は後述)。この対応は、$C^*$-環$A$の状態と巡回表現の同型類が1対1に対応することを意味している。つまり、$C^*$-環の巡回表現の同型類は、$C^*$-環の状態という内在的な対象と1対1に対応することがわかる。

=  positve linear functional と state

$C^*$-環$A$に対して、
$
  A_plus := {a in A_"sa" mid(|) sigma(a) subset RR_plus} =  {a^* a | a in A}
$
を$A$の正錐(positive cone)と呼ぶ。ここで、$A_"sa"$は$A$の自己共役元全体の集合、$sigma(a) subset CC$は$a$のスペクトルを表す。

#definition("正値線形写像, positive map")[
  $A$を$C^*$-環とする。線形写像$phi : A -> B$が正値線形写像(positive linear map)であるとは、$phi(A_plus) subset B_plus$を満たすことをいう。特に、$B = CC$のとき、$phi$は$A$の正値線形汎関数(positive linear functional)であるという。
]

#example-ja("トレース")[
  $A = M_n (CC)$のとき、
  $
    tr_n : A -> CC, space a mapsto 1/n sum_(i=1)^n a_(i i)
  $
  は$A$の正値線形汎関数である。実際、$a in M_n (CC)_+$に対して、$tr_n (a)$は$a$の固有値の平均であるから、非負実数となる。
]

#example-ja("ベクトル状態")[

  $cal(H)$をHilbert空間、$pi : A -> B(cal(H))$を表現($*$-homomorphism)とする。
  
  $xi in cal(H)$に対して、$phi_xi : A -> CC$を
  $
    phi_xi (a) := chevron.l pi(a) xi, xi chevron.r
  $
  と定めると、$phi_xi$は$A$の正値線形汎関数となる。実際、$a in A_+$に対して、
  $ phi_xi (a) = chevron.l pi(a) xi, xi chevron.r = chevron.l pi(a^(1 slash 2)) xi, pi(a^(1 slash 2)) xi chevron.r >= 0 $である。
]

#proposition()[
  $phi : A -> CC$が$A$の正値線形汎関数であるならば、有界である。
]
#proof[
  まず$phi_(|A_plus) : A_plus -> RR_plus$が有界であることを示そう。そうでないと仮定する。このとき、$n in NN$に対して、$a_n in A_plus$が存在して、$norm(a_n) <= 1$かつ$phi(a_n) > 2^n$となる。このとき、$a := sum_(n=1)^oo 2^(-n) a_n$は
  $
    norm(a) <= sum_(n=1)^oo 2^(-n) norm(a_n) <= sum_(n=1)^oo 2^(-n) = 1
  $
  より絶対収束して$A_plus$の元を定めるが、任意の$N in NN$に対して
  $
    phi(a) >= phi(sum_(n=1)^N 2^(-n) a_n) = sum_(n=1)^N 2^(-n) phi(a_n) > N
  $
  となり、矛盾である。したがって、$phi_(|A_plus)$は有界である。
  
  一般の$a in A$に対して、$a = a_1 - a_2 + i a_3 - i a_4 space (a in A_plus)$と表せることを用いると、$phi$が有界であることがわかる。
]

= GNS construction



#pagebreak()
@strung2021introduction @tomatsu2024operators

#bibliography("references.bib", title: "参考文献", style: "ieee")
