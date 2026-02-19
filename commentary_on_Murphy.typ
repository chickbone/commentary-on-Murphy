#import "template.typ": conf
#import "functions.typ": *
#import "theorems.typ": thmrules

#show: conf.with(headtitle: [Murphy])
#show: thmrules.with(qed-symbol: $square$)

#v(2em)

#align(center)[
  #text(25pt)[
    Murphy補完計画
  ]

  Kasshi K
]
#v(2em)

Murphy, "$C^*$-algebras And Operator Theory"の行間を埋めます。
#outline(target: heading)

= Elementary Spectral Theory

== Banach Algebras

#example[
  #let lS = $ell^(infinity) (S)$
  $S in Set$とする。
  $
    ell^(infinity)(S) := {f : S -> CC | exists M > 0, s.t. thin forall s in S, space abs(f(s)) <= M }
  $
  を$S$上の$CC$値有界写像全体の集合とする。$f,g in lS$に対して
  $
       (f dot g) (s) & := f(s) g(s) \
    norm(f)_infinity & := sup_(s in S) thin abs(f(s)) space (< infinity)
  $
  とおくと、$(lS , (dot), norm(dot)_infinity)$はunital Banach algebra。
] <ex1.1.1>

#proof[
  #let lS = $ell^(infinity) (S)$
  $(lS, (dot))$が$CC$上のunital algebraであることは明らか.

  #enum(numbering: "(I)", indent: 0em)[
    $(lS, norm(dot)_infinity)$がnormed spaceであること

    $f, g in lS, c in CC$に対して、
    $
      norm(c f)_infinity = sup_s thin abs(c f(s)) = abs(c) sup_s thin abs(f(s)) = abs(c) norm(f)_infinity.
    $
    $
      norm(f)_infinity = 0 & <==> sup_s thin abs(f(s)) = 0 \
                           & <==> forall s in S, space abs(f(s)) <= 0 \
                           & <==> f equiv 0.
    $
    $
      forall s in S, space abs((f+g)(s)) = abs(f(s) + g(s)) <= abs(f(s)) + abs(g(s)) <= norm(f)_infinity + norm(g)_infinity\
      ==> norm(f + g) = sup_s thin abs((f + g)(s)) <= norm(f)_infinity + norm(g)_infinity\
    $
    よりわかる。
  ][ $norm(f dot g)_infinity <= norm(f)_infinity norm(g)_infinity space (f, g in lS)$であること
    $
      forall s in S, space abs((f dot g)(s)) = abs(f(s) g(s)) = abs(f(s)) abs(g(s)) <= norm(f)_infinity norm(g)_infinity\
      ==> norm(f dot g) = sup_s thin abs((f dot g)(s)) <= norm(f)_infinity + norm(g)_infinity\
    $
    よりわかる。
  ][
    $(lS, norm(dot)_infinity)$がBanach spaceであること

    ${f_k}$を$lS$の$norm(dot)_infinity$に関するCauthy列とする。$s in S, space n, m in NN$に対して、
    $
      abs(f_n (s) - f_m (s)) <= norm(f_n - f_m)_infinity stretch(->, size: #150%)^(n,m -> infinity) 0
    $
    より${f_k (s)}$は$CC$のCauthy列。$CC$は完備であるから、${f_k (s)}$は収束列である。$f : S -> CC$を
    $
      f(s) := lim_(k -> infinity) f_k (s)
    $
    と定める。このとき、$f in lS$と$f_k stretch(->, size: #120%)^(norm(dot)_infinity) f$を示そう:

    $epsilon > 0$と$s in S$を固定する。ある$N_1, N_2(s) in NN$が存在して
    $
      forall n, m >= N_1, & space norm(f_n - f_m)_infinity < epsilon \
      forall k >= N_2(s), & space abs(f(s) - f_k (s)) < epsilon
    $
    となる。このとき、$N(s) = max{N_1,N_2(s)}$とおくと、$forall k >= N_1$に対して
    $
      abs(f(s) - f_k (s)) & <= abs(f(s) - f_(N(s)) (s)) + abs(f_(N(s)) (s) - f_k (s)) \
                          & <= abs(f(s) - f_(N(s)) (s)) + norm(f_(N(s))- f_k)_infinity \
                          & < 2 epsilon。
    $
    ここで$s in S$は任意であり、$N_1$は$s in S$によらないので、
    $
      forall k >= N_1, space norm(f - f_k)_infinity <= 2 epsilon
    $
    となる。よって、$f = (f - f_(N_1)) + f_(N_1) in lS$と$f_k stretch(->, size: #120%)^(norm(dot)_infinity) f$が成り立つ。

    したがって、$lS$の任意のCauthy列は収束するから、$lS$は\
    Banach.
  ]
  #v(-2em)
]
#h(1em)実は上の証明において、$CC$がunital Banach algebraであること以外の$CC$の性質は用いていない。よって、より一般に次が成り立つ。

#proposition([@ex1.1.1 の一般化])[
  #let lS = $ell^(infinity) (S,B)$
  $S in Set$、$B$をunital Banach algebraとする。
  $
    lS := {f : S -> B | exists M > 0, s.t. thin forall s in S, space norm(f(s))_B <= M }
  $
  を$S$上の$B$値有界写像全体の集合とする。$f,g in lS$に対して
  $
            (f dot g) (s) & := f(s) g(s) \
    norm(f)_(infinity, B) & := sup_(s in S) thin norm(f(s))_B space (< infinity)
  $
  とおくと、$(lS , (dot), norm(dot)_(infinity,B))$はunital Banach algebra。
]

#h(1em)Normed space$X$と$x in X, space epsilon >0$に対して、$U(x,epsilon) := {y in X | norm(x - y) < epsilon}$を$x$の$epsilon$近傍としよう。
#example[
  #let lO = $ell^(infinity) (Omega)$
  #let CbO = $C_b (Omega)$
  $Omega in Top$とする。$CbO subset lO$を$Omega$上の$CC$値有界関数全体の集合とすると、$CbO$は$lO$のclosed unital subalgebraである。

  特に、$(CbO, (dot), norm(dot)_infinity)$はunital Banach algebra。
]  <ex1.1.2>

#proof[
  #let lO = $ell^(infinity) (Omega)$
  #let CbO = $C_b (Omega)$
  非自明なのは$CbO$が$lO$のclosed setであることのみ。以下それを示そう:

  ${f_k}$を$CbO$の点列であって$f in lO$に収束するものとする。このとき、$f in CbO$を示せばよい。これには、$c in CC, space epsilon >0$に対して$f^(-1)(U(c,epsilon))$がopenであることを示せば十分である。

  $omega in f^(-1)(U(c,epsilon))$とする。$delta > 0$であって$U(f(omega), delta) subset U(x,epsilon)$なるものを取る。
  $f_k stretch(->, size: #120%)^(norm(dot)_infinity) f$であるから、ある$n in NN$があって$norm(f - f_n)_infinity < delta slash 3$となる。このとき、$V := f_n^(-1)(U(f_n (omega),delta slash 3))$をopen setとしよう。$omega' in V$に対して、
  $
    abs(f(omega') - f(omega)) & <= abs(f(omega') - f_n (omega'))
                                + abs(f_n (omega') - f_n (omega)) + abs(f_n (omega) - f (omega)) \
                              & <= norm(f - f_n)_infinity
                                + abs(f_n (omega') - f_n (omega)) + norm(f - f_n)_infinity \
                              & < delta slash 3 + delta slash 3 + delta slash 3 = delta
  $
  であるから$omega' in f^(-1)(U(f(omega), delta))$。よって$V subset f^(-1)(U(f(omega), delta)) subset f^(-1)(U(c,epsilon))$である。また、$V$の定義より$omega in V$であるから、$V$は$f^(-1)(U(c,epsilon))$に含まれる$omega$の開近傍である。

  $omega in f^(-1)(U(c,epsilon))$は任意であったから、以上の議論により$f^(-1)(U(c,epsilon))$がopenであることがわかった。
]

#h(1em)$Omega in Top$がlocally compact Hausdorff spaceであるとは、$Omega$の位相がHausdorffであって、さらに任意の点がcompact近傍をもつ、即ち
#align(center)[
  $forall omega in Omega, space exists U subset Omega, exists K subset Omega space s. t.$
  $U$はopen, $K$はcompact,$omega in U subset K$
]
#h(-1em)が成り立つことであった。
また、$Omega in Top$に対して、
$
  C(Omega) := Hom_Top (Omega, CC)
$
を$Omega$上の$CC$値連続関数全体が成すunital algebraとする。
#example[
  #let CbO = $C_b (Omega)$
  #let C0O = $C_0 (Omega)$
  $Omega in Top$をlocally comapct Hausdorff spaceとする。

  $f in C(Omega)$がvanishing at infinity(無限遠で消える)であるとは、$forall epsilon > 0$に対して、
  $
    abs(f)^(-1)([epsilon, infinity)) = {omega in Omega mid(|) abs(f(omega)) >= epsilon}
  $
  が$Omega$のcompact setとなることである。
  $
    C0O := {f in C(Omega) | f "はvanising at infinity"}
  $
  とおくと、$C0O subset CbO$であり、$C0O$は$CbO$のclosed subalgebraとなる。

  特に、$(C0O, (dot), norm(dot)_infinity)$はBanach algebra。また$Omega$がcompactならば、$C0O = CbO = C(Omega)$。
] <ex1.1.3>

#proof[
  #let CbO = $C_b (Omega)$
  #let C0O = $C_0 (Omega)$

  #enum(numbering: "(I)", indent: 0em)[
    $C0O subset CbO$であること

    $f in C0O$に対し、$K := abs(f)^(-1)([1, infinity))$はcompactであるから、ある$M >= 1$があって
    $
      omega in K ==> abs(f(omega)) <= M
    $
    となる。このとき、$abs(f)(Omega backslash K) subset [0,1)$であるから、
    $
      abs(f)(Omega) = abs(f)(K) union abs(f)(Omega backslash K) subset [0,1) union [0,M] subset [0,M]
    $
    より、$abs(f)$は有界。したがって$f in CbO$。
  ][
    $C0O$がsubalgebraであること

    $0 in C0O, space f in C0O ==> c f in C0O space (forall c in CC)$は容易にわかる。

    $f, g in C0O$とする。$g != 0 <==> norm(g)_infinity != 0$のとき、$epsilon > 0, space omega in Omega$に対し、
    $
      abs((f + g)(omega)) >= epsilon & ==> abs(f(omega)) + abs(g(omega)) >= epsilon \
                                     & ==> abs(f(omega)) >= epsilon slash 2 "or" abs(g(omega)) >= epsilon slash 2
    $
    であるから、
    $
      abs(f + g)^(-1)([epsilon, infinity)) subset abs(f)^(-1) ([epsilon slash 2, infinity)) union abs(g)^(-1) ([epsilon slash 2, infinity))
    $
    より、$abs(f + g)^(-1)([epsilon, infinity))$はcompact setのclosed subsetなのでcomapact。また、
    $
      abs((f dot g)(omega)) >= epsilon & ==> norm(g)_infinity abs(f(omega)) >= epsilon \
                                       & ==> abs(f(omega)) >= epsilon / norm(g)_infinity
    $
    であるから、
    $
      abs(f dot g)^(-1)([epsilon, infinity)) subset abs(f)^(-1) ([epsilon / norm(g)_infinity, infinity))
    $
    より、$abs(f dot g)^(-1)([epsilon, infinity))$はcompact。

    これが任意の$epsilon > 0$に対して成り立つから、$f + g, f dot g in C0O$となる。\
    $g = 0$のとき$f + g = f in C0O, space f dot g = 0 in C0O$であるから、以上より$C0O$が和と積について閉じていることがわかった。

    したがって、$C0O$は$CbO$のsubalgebraである.
  ][
    $C0O subset CbO$がclosedであること


    ${f_k}$を$C0O$の点列であって$f in CbO$に収束するものとする。このとき、$f in C0O$を示せばよい。

    $epsilon > 0$を固定する。$f_k stretch(->, size: #120%)^(norm(dot)_infinity) f$より、ある$N in NN$が存在して
    $
      norm(f - f_N)_infinity < epsilon slash 2
    $
    となる。$omega in abs(f)^(-1)([epsilon, infinity))$に対して、
    $
      abs(abs(f(omega)) - abs(f_N (omega))) <= abs(f(omega) - f_N (omega)) <= norm(f - f_N)_infinity < epsilon slash 2
    $
    であるから、
    $abs(f_N (omega)) in (abs(f(omega)) - epsilon slash 2, abs(f(omega)) + epsilon slash 2)
    subset [epsilon slash 2, infinity)$
    となる。したがって、
    $
      abs(f)^(-1)([epsilon, infinity)) subset abs(f_N)^(-1)([epsilon slash 2, infinity))
    $
    となる。$f_N in C0O$であったから、右辺はcompact。よって$abs(f)^(-1)([epsilon, infinity))$もcompactである。

    $epsilon > 0$は任意であったから、$f in C0O$がしたがう。
  ]
  #v(-2em)
]

#h(1em)上の証明では愚直に$C_0 (Omega) subset C_b (Omega)$がclosed subalgebraであることを示したが、$C_0 (Omega)$がBanach algebraであることは$Omega$の一点compact化を援用して示すこともできる。まず$Omega$の一点compact化の定義を思い出そう:

#definition([Alexandroffの一点compact化])[
  $Omega in Top$とする。

  $Omega$に一点をつけ加えた集合$hat(Omega) := Omega union {omega_oo}$に以下のような位相を入れる:
  #align(center)[
    $U subset hat(Omega)$がopen
    $space :<==>$「$omega_oo in.not U$ かつ $U subset Omega$はopen 」\
    or「$omega_oo in U$ かつ $hat(Omega) backslash U subset Omega$はcompact closed 」
  ]
  このとき、$hat(Omega)$を$Omega$の*一点compact化*、$omega_oo in hat(Omega)$を$Omega$の*無限遠点*という。
]

#proposition[
  上の状況で、
  #enum[
    $hat(Omega)$はcompact.
  ][
    包含$i : Omega arrow.r.hook hat(Omega)$は連続
  ]
  が成り立つ。

  また、$Omega$がcompactでないとき、
  #enum(start: 3)[
    包含$i : Omega arrow.r.hook hat(Omega)$の像$i(Omega)$は$hat(Omega)$のdense open subset.
  ][
    $Omega$がlocally compact Hausdorff $<==>$ $hat(Omega)$が(compact) Hausdorff
  ]
  が成り立つ。
]

#proof[略]

このとき、$C_0(Omega)$は$C"("hat(Omega)")"$に埋め込むことができる。

#proposition([@ex1.1.3 の別証])[
  #let COhat = $C"("hat(Omega)")"$
  $Omega in Top$をcompactでないlocally comapct Hausdorff spaceとする。

  $f in C_0 (Omega)$に対し、$hat(f) : hat(Omega) -> CC$を
  $
    hat(f)(omega) = cases(
      f(omega) & quad (omega in Omega),
      0 & quad (omega = omega_oo)
    )
  $
  と定めると、$hat(f) in COhat$である。また、
  $
    Phi : C_0(Omega) -> COhat, space f |-> hat(f)
  $
  と定めると、$Phi$はnormed algebraの単射等長準同型であり、$COhat$のclosed maximal ideal
  $
    M_(omega_oo) := {g in COhat mid(|) g(omega_oo) = 0}
  $
  への等長同型$C_0(Omega) tilde.equiv M_(omega_oo)$を与える。

  特に、$(C_0 (Omega), (dot), norm(dot)_infinity)$はunitalでないBanach algebra。
]

#proof[
  #let COhat = $C"("hat(Omega)")"$
  #enum(numbering: "(I)", indent: 0em)[
    $hat(f) in M_(omega_oo) subset COhat$であること

    $CC$のopen subset $U subset CC$に対して、$hat(f)^(-1)(U)$が$hat(Omega)$のopen subsetであることを示せばよい。$0 in.not U$のとき、$hat(f)^(-1)(U) = f^(-1)(U)$であり、$f$の連続性より$f^(-1)(U)$は$Omega$のopen setであるから、$hat(Omega)$の位相の定義より$hat(f)^(-1)(U)$はopen。

    $0 in U$のとき、$0 in U(0, 2 epsilon) subset U$なる$epsilon > 0$をとる。まず$hat(f)^(-1)(U(0, 2 epsilon))$がopenであることを示そう。
    #subproof[
      $omega_oo in hat(f)^(-1)(U(0, 2 epsilon))$より、 $hat(Omega) backslash hat(f)^(-1)(U(0, 2 epsilon))$がcompactであることを示せばよい。これは
      $ hat(Omega) backslash hat(f)^(-1)(U(0, 2 epsilon))
      &= hat(f)^(-1)(CC backslash U(0, 2 epsilon))\
      &= f^(-1)(CC backslash U(0, 2 epsilon)) &&quad (because hat(f)(omega_oo) = 0)\
      &= abs(f)^(-1) ([2 epsilon, oo)) $
      であり、$f in C_0 (Omega)$より$abs(f)^(-1) ([2 epsilon, oo))$がcompactであることからわかる。
    ]また、$V := U backslash dash(U(0,epsilon))$は$0$を含まない$CC$のopen subsetであるから、$hat(f)^(-1)(V)$はopen. したがって、
    $
      hat(f)^(-1)(U) = hat(f)^(-1)(U(0, 2 epsilon) union V) = hat(f)^(-1)(U(0, 2 epsilon)) union hat(f)^(-1)(V)
    $
    もまたopenである。

    よって$hat(f)$が連続であることがわかった。さらに、$hat(f)(omega_oo) = 0$より$hat(f) in M_(omega_oo)$である。
  ][
    $M_(omega_oo)$が$COhat$のclosed maximal idealであること

    これは本文のp.4に記述がある。(ここで$Omega$がlocally comapct Hausdorffであることを用いる。)
  ][
    $Phi : C_0(Omega) -> COhat, space f |-> hat(f)$が等長同型$C_0(Omega) tilde.equiv M_(omega_oo)$を与えること

    $Phi$の等長性は$hat(f)(omega_oo) = 0$より明らか。また$Phi$が準同型であることも明らか。

    $g in M_(omega_oo)$に対して、$g_(|Omega) = g compose i in C_0 (Omega)$である。
    #subproof[
      $f := g_(|Omega) in C(Omega)$とおく。
      
      $epsilon > 0$とする。このとき$g(omega_oo) = 0$であるから、$g^(-1) (U(0,epsilon))$は$omega_oo$を含む$hat(Omega)$のopen set。したがって、$hat(Omega) backslash g^(-1) (U(0,epsilon))$は$Omega$のcompact setである。一方(I)と同様にして
      $
        abs(f)^(-1) ([epsilon, oo)) = hat(Omega) backslash g^(-1) (U(0,epsilon))
      $
      が成り立つので、$abs(f)^(-1) ([epsilon, oo))$はcompact。

      $epsilon > 0$は任意であったから、$f in C_0 (Omega)$.
    ]

    したがって、
    $
      Psi : M_(omega_oo) -> C_0 (Omega), space g |-> g_(|Omega)
    $
    を制限写像とすると、$Phi^(-1) = Psi$となり、$Phi, Psi$が等長同型$C_0(Omega) tilde.equiv M_(omega_oo)$を与える。
  ]
  #v(-2em)
]

$M_(omega_oo)$は無限遠点で消える$hat(Omega)$の連続関数の集合なので、$f : Omega -> CC$がvanishing at infinityであるとは「$hat(Omega)$の無限遠点で消えている」と解釈することができる。こちらの方が$C_0 (Omega)$の定義の意味がわかりやすいかもしれない。