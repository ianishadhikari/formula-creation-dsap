#set page(
  paper: "a4",
  margin: (top: 2cm, bottom: 2cm, left: 2.5cm, right: 2.5cm),
)

#set text(
  font: "New Computer Modern",
  size: 11pt,
)

#set par(justify: true)

#grid(
  columns: (1fr, auto, 1fr),
  align(left)[
    #highlight(fill:yellow)[
    #text(size:18pt, weight:"bold")[Chapter : 4]
    ]
  ],
  align(center)[
    #highlight(fill:yellow)[
      #text(size:18pt, weight:"bold")[Discrete Filter Structure]
    ]
  ],
[]
)

#v(1em)

$* h[n] = 0 quad "for" n >= M <- "(Def"^n": FIR)" $ 

= Causal FIR:

$ y[n] = sum_(k=-infinity)^infinity h[k] x[n-k] "{original LTI system}" $ 
$ = sum_(k=0)^(M-1) h[k]x[n-k] $
$ = sum_(k=0)^(M-1) b_k x[n-k] $

= Causal FIR Filter Realization:

$ y[n] = sum_(k=0)^(M-1) b_k x[n-k] $
$ ==> Y(Z)/X(Z) = H(Z) = sum_(k=0)^(M-1)b_k Z^(-k) $

= 2. Cascade - Form:

$ H(Z) = sum_(k=0)^(M-1) b_k Z^(-k) $
$ "Modify: " H(Z) = product_(k=1)^(kappa) H_k (Z) $
$ "where," $
$ H_k (Z) = b_k_0 + b_K_1 Z^(-1) + b_k_2 Z^(-2) "&" "k" = "integer part of " (M+1)/2 $

= 3. Lattice Structure:

$ H(Z) = "given" $

$ H_m (Z) = A_m (Z) " , " m = "order of FIR Filter" $
$ A_m (Z) = A_(m-1) (Z) + K_m Z^(-1) B_(m-1) (Z) $
$ B_m (Z) = K_m A_(m-1) (Z) + Z^(-1) B_(m-1) (Z) $
$ "Solve: " A_(m-1) (Z) = (A_m (Z) - K_m B_m (Z))/(1-(K_(m))^2) $
$ B_m (Z) = Z^(-m) A_m (Z^(-1)) $
$ K_m = " Lattice Coefficient = " alpha_m (m) " coefficient / multiplier of " Z^(-m) "in" A_m (Z). $

#pagebreak()

$* "if" K_1 , K_2, ... , K_n "given " , $

$ A_0 (Z) = B_0 (Z) = 1 $
$ A_m (Z) = A_(m-1) (Z) + K_m Z^(-1) B_(m-1) (Z) $
$ B_m (Z) = K_m A_(m-1) (Z) + Z^(-1) B_(m-1) (Z) $

= IIR Filter Structure: 

$ sum_(k=0)^(N) a_k y[n-k] = sum_(k=0)^(M) b_k x[n-k] $
$ H(Z) = Y(Z)/X(Z) = (sum_(k=0)^(M) b_k Z^(-k))/(1 + sum_(k=1)^(N) a_k Z^(-k)) $
$ = H_1 (Z).H_2 (Z) $
$ "where," H_1 (Z) = sum_(k=0)^(M) b_k Z^(-k) $
$ H_2 (Z) = 1 / (1 + sum_(k=1)^(N) a_k Z^(-k)) $

= Cascade Structure: 

$ H(Z) = product_(k=1)^(P) H_k (P) $
$ " where" $
$ H_k (P) = (b_k_0 + b_k_1 Z^(-1) + b_k_2 Z^(-2)) / (1 + a_k_1 Z^(-1) + a_k_2 Z^(-2)) $ 
$ "& P = integer part of" ((N+1)/2)  $

= 3. Lattice or Lattice-Ladder Structure:

$ H(Z) = P(Z)/Q(Z) $
$ "Let" A_m (Z) = Q(Z) ==> "Do as in FIR" $
$ C_(m-1) (Z) = C_m (Z) - U_m B_m (Z) " , " U_m = C_m (m) $
 $ "where" C_m (Z) = P(Z). $

 #pagebreak()

 #grid(
  columns: (1fr, auto, 1fr),
  align(left)[
    #highlight(fill:yellow)[
    #text(size:18pt, weight:"bold")[Chapter : 5]
    ]
  ],
 ) 
 
#align(center)[
    #highlight(fill:yellow)[
      #text(size:18pt, weight:"bold")[FIR Filter Design]
    ]
  ]

= Common Window: 

1. Rectangular :  $ w(n) = cases(
  1 &","  0 <= n <= M,
  0 &"," "otherwise"
) $

2. Bartlett : $ w(n) = cases(
  (2n)/M &","  0 <= n <= M/2,
  2 - (2n)/M &"," M/2 < n <= M,
  0 &"," "otherwise"
) $

3. Hanning : $ w(n) = cases(
  0.5 - 0.5 cos((2 pi n)/M) &","  0 <= n <= M,
  0 &"," "otherwise"
) $

4. Hamming : $ w(n) = cases(
  0.54 - 0.46 cos((2 pi n)/M) &","  0 <= n <= M,
  0 &"," "otherwise"
) $

5. Blackman : $ w(n) = cases(
  0.42 - 0.5 cos((2 pi n)/M) + 0.08 cos ((4 pi n)/M) &","  0 <= n <= M,
  0 &"," "otherwise"
) $

#pagebreak()

#table(
columns: (1fr, 1fr),
stroke: none,
  
  // Row 1
  [#underline("Main Lobe Width")], [#underline("Peak Approx. Error or stopband attenuation (dB)")],
  
  // Row 2
  [$ (4 pi) / ((M+1)) $], [-21],
  
  // Row 3
  [$ (8 pi) / M $], [-25],
  
  // Row 4
  [$ (8 pi) / M $], [-44],
  
  // Row 5
  [$ (8 pi) / M $], [-53],

  //Row 6
  [$ (12 pi) / M $], [-74]
)


= #underline("Linear - Phase Pass FIR Filter:")

Desired freq. response:

$ H_("lp") ("jw") = H_("lp")(e^("jw")) $
$ = cases(
  e^("jw"M/2) &"," |w| <= w_c,
  0 &"," w_c < |w| <= pi, 
) $ 
$ h_("lp") = F^(-1) [H_("lp") ("jw")] $
$ = sin[w_c (n- M/2)]/(pi (n - M/2)) $
$ = w_c/(pi) sin[w_c (n- M/2)]/(w_c (n- M/2)) $
$ = w_c/(pi) sinc[w_c (n- M/2)]. $

$ "symmetric:" h_("lp")[n] = h_("lp")[M-N] $

#pagebreak()

= #underline("Kaiser Window: ")
$ w[n] = cases(
I_0 ((beta sqrt(1-[((n-alpha)/alpha)^2]))) / (I_0 (beta)) &"," 0 <= n <= M,
0 &"," "otherwise"
)  $
$ alpha = M/2 $

$ I_0[.] = "Zeroth Order Modified Bessel Function of First Kind." $

$ I_0[x] = 1 + (0.25x^2)/(1!)^2 + (0.25x^2)^2/(2!)^2 + (0.25x^2)^3/(3!)^2+... $

$ upright(Delta w)= w_2 - w_1 = w_s - w_p $
$ A = -20 log_10 (delta) "," delta = min (delta_1, delta_2) $

$ beta = cases(
  0.1102(A-8.7) &"," A > 50,
  0.5842(A-21)^0.4 + 0.07886(A-21) &"," 21 <= A <= 50,
  0 &"," A < 20. 
) $

$ M = (A-8)/(2.285upright(Delta w)) $
$ w_c = (w_p + w_s)/2 $
$ = (w_1 + w_2)/2 $

$ "stopband attenuation" (A_s) = -20 log_10 (delta), delta = min (delta_1, delta_2) $
$ " Transition Width" (upright(Delta w)) = w_2 - w_1 = w_s - w_p $
$ upright(Delta) = "Main lobe width" $
$ upright(Delta) = (8 pi)/M ==> "Ex." $
$ w_c = (w_p + w_s)/2 $
$ N =  "filter length" $
$ M = "filter order" = N-1 $ 

#underline("For Hamming:")
$ upright(Delta) = w_s - w_c $

#pagebreak()


 #grid(
  columns: (1fr, auto, 1fr),
  align(left)[
    #highlight(fill:yellow)[
    #text(size:18pt, weight:"bold")[#underline("Chapter : 6")]
    ]
  ],
 ) 
 
#align(center)[
    #highlight(fill:yellow)[
      #text(size:18pt, weight:"bold")[#underline("Design of IIR Filter")]
    ]
  ]

= (i) #underline("IIR Filter Design using Impulse Invariance.")
$ "Analog Filter:" H_a(s) = sum_(k=1)^(N) C_k ------->s - P_k , C_k = "constants",  $
inverse Laplace Transform
$ h_a (t) = sum_(k=1)^(N) C_k.e^(P_k. t) $

$ h[n] = sum_(k=1)^(N) C_k.e^(P_k eta T) $
 Z-Transform
$ H(z) = sum_(n=-infinity)^(infinity) h[n] Z^(-n) $
$ = sum_(n=0)^(infinity) h[n] Z^(-n) $
$ = sum_(k=1)^(N)  C_k / (1 - e^(P_k T).Z^(-1)) $

#rect(
  stroke: 1pt + black,
  inset: 10pt,         // padding inside the box
)[
  $ "Replace" S - P_k "by" 1 - e^(P_k T) Z^(-1) $
]
