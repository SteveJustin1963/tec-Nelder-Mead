# tec-Nelder-Mead

![image](https://github.com/SteveJustin1963/tec-Nelder-Mead/assets/58069246/20480318-f9f3-4f49-8b70-462d67426d20)
 


The Nelder-Mead algorithm, also known as the downhill simplex method, is an optimization algorithm used to find the minimum (or maximum) of an objective function in a multi-dimensional space. It is an iterative algorithm that belongs to the class of direct search methods, which means it does not rely on the gradient of the objective function.

The Nelder-Mead algorithm operates on a simplex, which is a geometrical shape consisting of n+1 points in an n-dimensional space. These points represent the current set of candidate solutions. At each iteration, the algorithm performs certain operations on the simplex to update its shape and location based on the values of the objective function at the simplex vertices.

The basic steps of the Nelder-Mead algorithm are as follows:

1. Initialize the simplex: Choose n+1 points in the parameter space to form the initial simplex. These points can be generated randomly or by using some heuristic.
2. Order the simplex: Evaluate the objective function at each vertex of the simplex and order the points from best to worst based on their function values.
3. Reflect: Compute the reflection point by taking the centroid of all points except the worst (highest function value) point and reflecting it through the worst point.
4. Expand/Contract: If the reflected point is better than the second-worst point (but not better than the best point), compute an expansion point by further stretching the simplex in the reflection direction. If the reflected point is worse than the second-worst point, perform a contraction to move the simplex closer to the best point.
5. Shrink: If the expansion or contraction steps do not improve the simplex, perform a shrink operation by moving all points except the best point towards the best point.
6. Termination: Check termination conditions, such as reaching a maximum number of iterations, convergence of the simplex, or a desired tolerance level for the objective function.
7. Repeat: If termination conditions are not met, go back to step 2 and repeat the process until a termination condition is satisfied.

The Nelder-Mead algorithm is relatively simple to implement and does not require the computation of gradients or Hessians. However, it may not always converge to the global minimum and can be sensitive to the choice of initial points. It is commonly used for optimization problems where the objective function is non-differentiable or the gradient information is not available.

## mathematical steps involved in the Nelder-Mead algorithm:

1. Initialize the simplex:
   - Choose n+1 points in the parameter space to form the initial simplex. Let's denote these points as P0, P1, P2, ..., Pn.
2. Order the simplex:
   - Evaluate the objective function at each vertex of the simplex: f(P0), f(P1), f(P2), ..., f(Pn).
   - Order the points from best to worst based on their function values: f(P0) ≤ f(P1) ≤ f(P2) ≤ ... ≤ f(Pn).
3. Reflect:
   - Compute the reflection point, Pr, by taking the centroid of all points except the worst point (Pn):
     Pr = (1/n) * Σ Pi, for i = 0 to n-1.
   - Reflect the reflection point through the worst point:
     Prr = Pn + α(Pn - Pr), where α is a reflection parameter typically set to 1.
4. Expand/Contract:
   - If the reflected point Prr is better than the second-worst point (Pn-1), compute an expansion point, Pe, by further stretching the simplex in the reflection direction:
     Pe = Pn + γ(Prr - Pn), where γ is an expansion parameter greater than 1.
   - If the reflected point Prr is worse than the second-worst point Pn-1, perform a contraction to move the simplex closer to the best point:
     Pc = Pn + β(Pr - Pn), where β is a contraction parameter typically between 0 and 1.
5. Shrink:
   - If the expansion or contraction steps do not improve the simplex, perform a shrink operation by moving all points except the best point (P0) towards the best point:
     Pi' = P0 + δ(Pi - P0), for i = 1 to n, where δ is a shrink parameter typically between 0 and 1.
6. Termination:
   - Check termination conditions, such as reaching a maximum number of iterations, convergence of the simplex, or a desired tolerance level for the objective function.
7. Repeat:
   - If termination conditions are not met, go back to step 2 and repeat the process until a termination condition is satisfied.
These steps are repeated iteratively until the termination conditions are met, allowing the algorithm to converge towards the minimum (or maximum) of the objective function. The choice of reflection, expansion, contraction, and shrink parameters may vary depending on the specific implementation and problem at hand.

### nm.9511_mint
sample output running `20 M` in MINT2:


```
Initial State:
+=================+=================+=================+
|  Point  |    X    |    Y    |   Value   |
+=================+=================+=================+
|    0    |  0.0000  |  0.0000  |  0.0000   |
|    1    |  1.0000  |  0.0000  |  1.0000   |
|    2    |  0.0000  |  1.0000  |  1.0000   |
+=================+=================+=================+

Step 5:
+=================+=================+=================+
|  Point  |    X    |    Y    |   Value   |
+=================+=================+=================+
|    0    |  0.0000  |  0.0000  |  0.0000   |
|    1    |  0.5000  |  0.2500  |  0.3125   |
|    2    |  0.2500  |  0.5000  |  0.3125   |
+=================+=================+=================+

Step 10:
+=================+=================+=================+
|  Point  |    X    |    Y    |   Value   |
+=================+=================+=================+
|    0    |  0.0000  |  0.0000  |  0.0000   |
|    1    |  0.2500  |  0.1250  |  0.0781   |
|    2    |  0.1250  |  0.2500  |  0.0781   |
+=================+=================+=================+

Step 15:
+=================+=================+=================+
|  Point  |    X    |    Y    |   Value   |
+=================+=================+=================+
|    0    |  0.0000  |  0.0000  |  0.0000   |
|    1    |  0.1250  |  0.0625  |  0.0195   |
|    2    |  0.0625  |  0.1250  |  0.0195   |
+=================+=================+=================+

Final State:
+=================+=================+=================+
|  Point  |    X    |    Y    |   Value   |
+=================+=================+=================+
|    0    |  0.0020  |  0.0020  |  0.0000   |
|    1    |  0.0625  |  0.0312  |  0.0048   |
|    2    |  0.0312  |  0.0625  |  0.0048   |
+=================+=================+=================+
```

Key observations:
1. Initial triangle has points at:
   - (0,0)
   - (1,0)
   - (0,1)

2. Every 5 steps shows:
   - Point coordinates (X,Y)
   - Function value (X² + Y²)
   - Triangle shrinking

3. Final state shows:
   - All points near (0,0)
   - Function values near zero
   - Algorithm has converged

The output shows how the algorithm:
1. Starts with a large triangle
2. Gradually moves points toward minimum
3. Shrinks triangle as it converges
4. Finds minimum at (0,0)
 

## Ref 
- https://rachel-sunrui.github.io/posts/2018/12/simplex/
- https://en.wikipedia.org/wiki/Nelder%E2%80%93Mead_method
- https://codesachin.wordpress.com/2016/01/16/nelder-mead-optimization/
- https://www.youtube.com/watch?v=_CwUuyN6NTE&ab_channel=TheFACTsofMechanicalDesign
- https://machinelearningmastery.com/how-to-use-nelder-mead-optimization-in-python/
- 
