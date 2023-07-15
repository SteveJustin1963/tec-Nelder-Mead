#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define N 64  // Number of nodes
#define ALPHA 1.0  // Reflection parameter
#define GAMMA 2.0  // Expansion parameter
#define BETA 0.5  // Contraction parameter
#define DELTA 0.5  // Shrink parameter
#define MAX_ITERATIONS 1000  // Maximum number of iterations

// Example objective function for a quadratic problem: f(x) = x^2 + 2x + 1
double objective_func(double* x) {
    double result = pow(x[0], 2) + 2 * x[0] + 1;
    return result;
}

// Function to initialize the simplex
void initialize_simplex(double** simplex) {
    // Implementation depends on the problem and initialization strategy
    // Example: Random initialization
    for (int i = 0; i <= N; i++) {
        simplex[i] = (double*)malloc(N * sizeof(double));
        for (int j = 0; j < N; j++) {
            simplex[i][j] = rand() / ((double)RAND_MAX + 1.0);
        }
    }
}

// Function to evaluate the objective function for each node in the simplex
void evaluate_simplex(double** simplex, double* f_values) {
    for (int i = 0; i <= N; i++) {
        f_values[i] = objective_func(simplex[i]);
    }
}

// Function to order the simplex based on the function values
void order_simplex(double** simplex, double* f_values) {
    // Simplest approach: Bubble sort
    for (int i = 0; i <= N; i++) {
        for (int j = 0; j < N - i - 1; j++) {
            if (f_values[j] > f_values[j + 1]) {
                // Swap function values
                double temp_f = f_values[j];
                f_values[j] = f_values[j + 1];
                f_values[j + 1] = temp_f;

                // Swap nodes
                double* temp_node = simplex[j];
                simplex[j] = simplex[j + 1];
                simplex[j + 1] = temp_node;
            }
        }
    }
}

// Function to perform the Nelder-Mead algorithm
void nelder_mead() {
    double** simplex = (double**)malloc((N + 1) * sizeof(double*));
    double* f_values = (double*)malloc((N + 1) * sizeof(double));

    initialize_simplex(simplex);
    evaluate_simplex(simplex, f_values);
    order_simplex(simplex, f_values);

    int iterations = 0;
    while (iterations < MAX_ITERATIONS) {
        double* best_node = simplex[0];
        double* worst_node = simplex[N];
        double* second_worst_node = simplex[N - 1];

        // Compute the centroid (excluding the worst node)
        double centroid[N] = { 0.0 };
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < N; j++) {
                if (simplex[i] != worst_node) {
                    centroid[j] += simplex[i][j];
                }
            }
        }
        for (int j = 0; j < N; j++) {
            centroid[j] /= (N - 1); // correction here
        }

        // Reflect
        double* reflected_node = (double*)malloc(N * sizeof(double));
        for (int j = 0; j < N; j++) {
            reflected_node[j] = centroid[j] + ALPHA * (centroid[j] - worst_node[j]);
        }
        double reflected_value = objective_func(reflected_node);

        if (reflected_value < f_values[N - 1] && reflected_value >= f_values[0]) {
            // Replace the worst node with the reflected node
            free(worst_node);
            simplex[N] = reflected_node;
            f_values[N] = reflected_value;
        }
        else if (reflected_value < f_values[0]) {
            // Expand
            double* expanded_node = (double*)malloc(N * sizeof(double));
            for (int j = 0; j < N; j++) {
                expanded_node[j] = centroid[j] + GAMMA * (reflected_node[j] - centroid[j]);
            }
            double expanded_value = objective_func(expanded_node);

            if (expanded_value < reflected_value) {
                free(worst_node);
                simplex[N] = expanded_node;
                f_values[N] = expanded_value;
            }
            else {
                free(worst_node);
                simplex[N] = reflected_node;
                f_values[N] = reflected_value;
            }
        }
        else {
            // Contract
            double* contracted_node = (double*)malloc(N * sizeof(double));
            for (int j = 0; j < N; j++) {
                contracted_node[j] = centroid[j] + BETA * (worst_node[j] - centroid[j]);
            }
            double contracted_value = objective_func(contracted_node);

            if (contracted_value < f_values[N]) {
                free(worst_node);
                simplex[N] = contracted_node;
                f_values[N] = contracted_value;
            }
            else {
                // Shrink
                for (int i = 1; i <= N; i++) {
                    for (int j = 0; j < N; j++) {
                        simplex[i][j] = simplex[0][j] + DELTA * (simplex[i][j] - simplex[0][j]);
                    }
                    f_values[i] = objective_func(simplex[i]);
                }
            }
        }

        order_simplex(simplex, f_values);
        iterations++;
    }

    printf("Best solution found: ");
    for (int j = 0; j < N; j++) {
        printf("%f ", simplex[0][j]);
    }
    printf("\nObjective function value: %f\n", f_values[0]);

    // Clean up memory
    for (int i = 0; i <= N; i++) {
        free(simplex[i]);
    }
    free(simplex);
    free(f_values);
}

int main() {
    nelder_mead();
    return 0;
}
