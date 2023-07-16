64 CONSTANT N
1.0 CONSTANT ALPHA
2.0 CONSTANT GAMMA
0.5 CONSTANT BETA
0.5 CONSTANT DELTA
1000 CONSTANT MAX-ITERATIONS

: square ( n -- n^2 ) dup * ;
: objective-func ( addr -- n ) dup @ square 2 * swap 1 + + ;

: initialize-simplex ( addr -- )
  N 0 DO
    DUP I 2 * 1E6 RND F!
  LOOP ;

: evaluate-simplex ( addr1 addr2 -- )
  N 0 DO
    DUP I @ objective-func I 4 * + F!
  LOOP ;

: order-simplex ( addr1 addr2 -- )
  N 0 DO
    N 1 DO
      DUP I F@ DUP J F@ F> IF
        SWAP I F! SWAP J F!
      THEN
    LOOP
  LOOP ;

: nelder-mead ( -- )
  N ALLOCATE DUP >R
  N 4 * ALLOCATE DUP >R

  R@ initialize-simplex
  R> R@ evaluate-simplex
  R> R@ order-simplex

  MAX-ITERATIONS 0 ?DO
    R@ DUP R> R@ R> R@

    \ Compute the centroid (excluding the worst node)
    N 0 DO
      DUP I @
      N 1 DO
        DUP I @ DUP J @ <> IF
          F+
        THEN
      LOOP
      DUP N 1- F/ FSWAP I F!
    LOOP

    \ Reflect
    R@ ALLOCATE DUP >R
    N 0 DO
      DUP I @ DUP I @ R> F@ R> F@ F- ALPHA F* F+ I F!
    LOOP
    DUP R> F@ N 4 * + F!
    R> F@ N 4 * + F> R> IF
      R> FREE
      R> DUP N 4 * + F!
    ELSE
      R> FREE
      R> DUP N 4 * + F!
    THEN

    \ Expand or Contract
    DUP F@ R> F@ F< IF
      R@ ALLOCATE DUP >R
      N 0 DO
        DUP I @ DUP R> F@ DUP R> F@ F- GAMMA F* F+ I F!
      LOOP
      DUP R> F@ N 4 * + F!
      R> F@ N 4 * + F> R> IF
        R> FREE
        R> DUP N 4 * + F!
      ELSE
        R> FREE
        R> DUP N 4 * + F!
      THEN
    ELSE
      R@ ALLOCATE DUP >R
      N 0 DO
        DUP I @ DUP R> F@ DUP R> F@ F- BETA F* F+ I F!
      LOOP
      DUP R> F@ N 4 * + F!
      R> F@ N 4 * + F> R> IF
        R> FREE
        N 1 DO
          DUP I 2DUP @ 2DUP F@ F- DELTA F* F+ I F!
        LOOP
      ELSE
        N 1 DO
          DUP I 2DUP @ 2DUP F@ F- DELTA F* F+ I F!
        LOOP
      THEN
    THEN

    R@ R> order-simplex
    LOOP

  CR ." Best solution found: "
  N 0 DO
    DUP I @ . FSPACE
  LOOP
  CR ." Objective function value: " DUP N 4 * + F@ .
  CR

  FREE FREE ;

: main ( -- )
  NELDER-MEAD ;

main
