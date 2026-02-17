#import "template.typ": conf
#import "functions.typ": *

#show: conf.with(headtitle: [Murphy])

#v(2em)

#align(center)[
  #text(25pt)[
    Murphyの行間
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
]

#proof[
  #let lS = $ell^(infinity) (S)$
  $(lS, (dot))$が$CC$上のunital algebraであることは明らか.

  #enum(numbering: "(I)", indent: 0em)[
    $(lS, norm(dot)_infinity)$がnorm spaceであること

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

    したがって、$lS$の任意Cauthy列は収束するから、$lS$は\
    Banach.
  ]
  #v(-2em)
]
#h(1em)実は上の証明において、$CC$がunital Banach algebraであること以外の$CC$の性質は用いていない。よって、より一般に次が成り立つ。

#proposition([Example 1.1.1の一般化])[
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
