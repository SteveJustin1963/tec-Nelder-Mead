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

## example C code for Nelder-Mead algorithm with 64 nodes. 
But to define the objective function `objective_func()` for your specific optimization problem using the Nelder-Mead algorithm, you need your own implementation. Here's a example with Quadratic function :

```c
double objective_func(double* parameters) {
    // Replace this example implementation with your own objective function
    // that suits your optimization problem.
    
    // Example: Quadratic function f(x) = x^2 + 2x + 1
    double x = parameters[0];
    double result = pow(x, 2) + 2 * x + 1;
    
    return result;
}
```

In this revised example, the objective function takes a single parameter `x` from the `parameters` array and calculates the corresponding function value based on the quadratic equation `f(x) = x^2 + 2x + 1`. 

You should replace this example implementation with your own objective function that fits your optimization problem. The objective function should accept an array of parameters and return the corresponding function value based on those parameters.

## forth

1. Remove Libraries: Since Forth does not have built-in libraries like C, you can remove the `#include` statements for `stdio.h`, `stdlib.h`, and `math.h`. 
2. Define Constants: Replace the `#define` statements with Forth constants.  
3. Create Objective Function: Define a Forth word to represent the objective function. Forth does not have a power operator, so you can define a separate word for squaring.
4. 4. Initialize Simplex: Create a Forth word to initialize the simplex. Since Forth uses a stack, you can modify the `initialize_simplex` function to take the simplex array as input and initialize it directly. 
5. Evaluate Simplex: Define a Forth word to evaluate the objective function for each node in the simplex. Modify the `evaluate_simplex` function to take the simplex and f_values arrays as input and evaluate the function directly. 
6. Order Simplex: Create a Forth word to order the simplex based on the function values. Modify the `order_simplex` function to take the simplex and f_values arrays as input and sort them accordingly.  
7. Perform Nelder-Mead Algorithm: Define a Forth word to perform the Nelder-Mead algorithm. Modify the `nelder_mead` function to use Forth stack operations and allocate memory dynamically using the `ALLOCATE` word. 
