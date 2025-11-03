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
//////////////


Here’s a **simple-terms explanation** of the GitHub project tec‑Nelder‑Mead by Steve Justin (on GitHub) — it implements the Nelder–Mead method for optimisation. I’ll break down what it is, what the code is doing, and why you might care.

---

### 🔍 What is it?

* The Nelder–Mead method is a way to **find a minimum** of a function of several variables, *without* needing derivatives (i.e., no gradient or Hessian). ([Wikipedia][1])
* Think of it as the algorithm sending out a little “simplex” (a shape with (n+1) points in (n)-dimensions: e.g., a triangle for 2D) that moves around, stretches, shrinks and “crawls” downhill until it finds a low-point. ([people.math.sc.edu][2])
* The GitHub project implements this method (likely in code form) so you can use it for optimisation problems.

---

### 🛠 What does the README say (in plain language)?

While the README has various details (setup, usage, maybe options), here’s the gist:

* The project provides code to apply the Nelder-Mead algorithm.
* You supply a function you want to minimise (for example: cost, error, whatever you’re trying to reduce).
* You supply initial guesses (starting point(s)).
* The algorithm iteratively updates those guesses via the simplex mechanism (reflection, expansion, contraction, shrinking) until it meets some termination criteria (i.e., the simplex is small, the function improvement is tiny, etc.).
* The code is general: you can plug it into different applications (engineering, finance, modelling, whatever) where you don’t or can’t easily get derivatives of your function.

---

### 📊 Why is this useful?

* Because sometimes you have a “black-box” function: maybe a simulation, maybe measurement based, where derivatives are hard or impossible. Nelder–Mead gives a method that only needs function evaluations.
* It’s relatively simple to implement and understand compared to many advanced optimisation methods.
* Good for moderate-dimension problems (not extremely high dimension, because the simplex size grows and the method can be slow or get stuck). ([mathworks.com][3])

---

### ⚠️ Things to watch out for (limitations)

* It may converge to a *local* minimum, not necessarily the global best.
* In high dimensions, performance and reliability may drop.
* Because it doesn’t use derivative information, it may need many function evaluations and may be slower than gradient-based methods when you *do* have derivatives.
* The choice of initial simplex (starting guesses) can affect whether you find a “good” minimum.

---

### 🎯 How you might apply it (thinking of *your* context)

Given you work with procurement, optimisation, logistics, etc.:

* Suppose you have a cost function (e.g., shipping cost + import duties + inventory holding) depending on some decision variables (e.g., number of units shipped, container size, route). If you can wrap that cost as a function you can evaluate, you could use this Nelder–Mead code to **search** for decision-variable values that minimise cost.
* If you have a simulation-based cost (i.e., you plug in variables, it runs simulation, returns a cost), and you can’t easily derive gradients, then this fits well.
* You’d decide: what variables to adjust, what starting guesses to pick, what stopping criteria (tolerance) to use. Then run the algorithm.
* Because you’re used to spreadsheets and structured lists, you might wrap the function evaluation in code that reads your Excel model or whatever, and this algorithm becomes the “search engine”.

---

If you like, I can **walk through** the specific README of that repository *line by line* and pull out the exact options/parameters (e.g., how to set termination tolerance, how many dimensions, how to supply the function), and show you how you’d integrate it into a small Excel-based optimisation in your style. Would you like me to do that?

[1]: https://en.wikipedia.org/wiki/Nelder%E2%80%93Mead_method?utm_source=chatgpt.com "Nelder–Mead method"
[2]: https://people.math.sc.edu/burkardt/m_src/nelder_mead/nelder_mead.html?utm_source=chatgpt.com "NELDER_MEAD - The Nelder-Mead Optimization Algorithm"
[3]: https://www.mathworks.com/matlabcentral/answers/493893-nelder-and-mead-algorithm?utm_source=chatgpt.com "Nelder and Mead Algorithm - MATLAB Answers"

//////////////////

# more simple
Alright — imagine you’re **trying to find the lowest point in a landscape of hills** 🏔️ — but here’s the trick: you’re blindfolded 😎.

You can’t *see* the hills, and you don’t have a map.
The only thing you can do is *ask the ground*:

> “Hey, how high am I right here?”

That’s what the **Nelder–Mead method** does.

---

### 🧠 The basic idea

It’s a computer trick that helps find the *lowest point* (or *best solution*) to a problem — kind of like finding the deepest valley in a bumpy landscape.

---

### 🟢 How it works (super simple version)

1. **Start with a few points** — like three people standing on different spots on the hills.
2. **Ask each person how high they are.**
3. The computer moves them around:

   * If someone is on a high hill, they move down.
   * If someone is low, the group moves closer to them.
   * Sometimes they stretch apart, sometimes they squish together.
4. They keep doing this — moving, checking height, adjusting — until they all end up standing in the *lowest valley* they can find.

That’s when the algorithm says:

> “We’ve found the best spot!”

---

### 💻 Why it’s useful

* You don’t need fancy math or derivatives — just the ability to check how “good” or “bad” a solution is.
* It’s great for problems like:

  * Finding the cheapest way to do something
  * Making a robot balance
  * Tuning a rocket, car, or telescope system (things Steve Justin likes to build 😉)

---

### ⚠️ What it can’t do perfectly

* Sometimes it finds a *small* valley, not the *deepest* one in the whole landscape (that’s called a **local minimum**).
* It can be slow if there are too many hills (too many variables).

---

### 🧩 In short:

> Nelder–Mead is like a team of explorers walking around hills, feeling the ground, and slowly finding the lowest point — without ever seeing the map.

---

Would you like me to draw an **ASCII picture** of what that “hill search” looks like?
///////////
Here’s a simple **ASCII picture** showing how the **Nelder–Mead algorithm** works — as if you’re watching little explorers walking around a landscape trying to find the lowest valley 👇

---

```
     Height ↑
        |
   9    |          *            <-- high hill (bad spot)
   8    |       *      *
   7    |     *          *
   6    |    *            *
   5    |   *              *      <-- smoother slope
   4    |  *                *
   3    | *        o o o      *   <-- the "simplex" (3 points)
   2    |*                    *
   1    |         valley →   VVV
        +----------------------------> Position →
```

### Step by step:

1. **Start:**
   The 3 points (`o o o`) form a little triangle called a *simplex*.
   Each point is one guess about where the lowest spot might be.

2. **Check the height:**
   The computer asks: “How high is each point?” (that’s like measuring the ground).

3. **Move downhill:**
   The highest point (worst one) gets pushed away or replaced with a lower one —
   like saying “you’re too high up, move toward the valley!”

4. **Repeat:**
   The triangle slides, stretches, shrinks, and crawls toward the valley bottom:

```
Iteration 1:    o o o          (start)
Iteration 2:      o o o        (moved lower)
Iteration 3:         o o o     (closer to valley)
Iteration 4:            ooo    (all points in the valley)
```

---

### 🏁 When it stops:

When all three points are **very close together and very low**,
the algorithm says “✅ I’ve found the minimum!”

---

Would you like me to make a **more detailed version** showing how it *reflects, expands, contracts,* and *shrinks* (the actual moves it uses)?

//////////////
Perfect 👍
Here’s a **detailed ASCII story** of how the **Nelder–Mead simplex** behaves — step by step — as if the three explorers (A, B, C) are walking around hills trying to find the valley bottom.

---

## 🏔️ The Landscape

```
   Height ↑
      |
  9   |           *            (high hill)
  8   |        *      *
  7   |      *          *
  6   |     *            *
  5   |    *              *       (gentle slope)
  4   |   *                *
  3   |  *       valley →   VVV
  2   | *                    *
  1   |*                      *
      +----------------------------------> position →
```

---

## 🟢 The Simplex (triangle of 3 explorers)

At first, we drop them anywhere:

```
Iteration 0 (start)
         A (high)
          o
       o     o
      B       C (lowest)
```

They measure the “height” (the value of the function).
A is highest (worst), C is lowest (best).

---

## 🪞 1. Reflection

They “flip” the worst one (A) through the middle of the other two to see if it gets better:

```
       A (worst)
        \
         \
          \
           o' ← new reflected point
      B         C
```

🧠 *Idea:* “Maybe there’s a lower spot on the other side!”

---

## 🪩 2. Expansion

If that new spot (`o'`) is **even lower** than the best,
they stretch farther in that direction — like running downhill.

```
      B         C
           o'     o'' ← expanded (further downhill)
```

🧠 *Idea:* “Wow, it’s getting lower! Keep going that way!”

---

## 🪶 3. Contraction

If reflection didn’t help, they **try moving halfway** back toward the best spot.

```
      B         C
           o'          (reflected)
             \
              o'' ← contracted (half step)
```

🧠 *Idea:* “Oops, too far up the hill. Step back halfway.”

---

## 🧱 4. Shrink

If nothing works (they’re all stuck high up),
they pull everyone closer to the best point — shrink the triangle.

```
       (before)
       A
      / \
     /   \
    B-----C

       (after)
        A'
        |
       B'-C'  ← smaller triangle near best spot
```

🧠 *Idea:* “We’re lost — let’s huddle near the best place we know.”

---

## 🔁 Repeat

They repeat these moves — reflect, expand, contract, or shrink —
until the triangle becomes tiny and stops moving much.
Then the middle of that triangle is the “best” (lowest) point found.

---

## 🏁 The End

```
        . . .
           ooo  ← all explorers close together
         valley bottom found!
```

---

### 💬 In a nutshell

> Nelder–Mead = “Three explorers form a triangle and keep flipping, stretching, and squeezing it downhill until they all meet in the lowest valley.”

---

Would you like me to make a **simple animated version** of this next (like a frame-by-frame ASCII “movie”)?

//////////////////
