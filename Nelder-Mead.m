% Define the objective function to be minimized
objective = @(x) (1 - x(1))^2 + 100 * (x(2) - x(1)^2)^2;

% Define starting point
x_start = [-1.2, 1];

% Define maximum number of iterations and tolerance for convergence
max_iter = 200;
tol = 1e-6;

% Define coefficients for the Nelder-Mead algorithm
rho = 1; % Reflection coefficient
chi = 2; % Expansion coefficient
gamma = 0.5; % Contraction coefficient
sigma = 0.5; % Shrink coefficient

% Step 1: Initialize simplex
n = size(x_start, 2); % Number of dimensions
simplex = [x_start; bsxfun(@plus, x_start, eye(n))];

% Main Nelder-Mead algorithm loop
for iter = 1:max_iter
    % Step 2: Evaluate the function at the vertices of the simplex
    f_vals = arrayfun(@(i) objective(simplex(i,:)), 1:n+1);

    % Step 3: Order the vertices
    [f_vals, order] = sort(f_vals);
    simplex = simplex(order,:);

    % Convergence check
    if std(f_vals) < tol
        fprintf('Converged after %d iterations.\n', iter);
        break;
    end

    % Step 4: Calculate the centroid of the n best points
    centroid = mean(simplex(1:n,:), 1);

    % Step 5: Reflect the worst point
    x_reflected = centroid + rho * (centroid - simplex(end,:));
    f_reflected = objective(x_reflected);

    if f_reflected < f_vals(1)
        % Step 6a: Expansion
        x_expanded = centroid + chi * (x_reflected - centroid);
        f_expanded = objective(x_expanded);
        if f_expanded < f_reflected
            simplex(end,:) = x_expanded;
        else
            simplex(end,:) = x_reflected;
        end
    elseif f_reflected < f_vals(end-1)
        % Step 6b: Accept the reflected point
        simplex(end,:) = x_reflected;
    else
        % Step 6c: Contraction
        if f_reflected < f_vals(end)
            x_contracted = centroid + gamma * (x_reflected - centroid);
            f_contracted = objective(x_contracted);
            if f_contracted <= f_reflected
                simplex(end,:) = x_contracted;
            else
                % Step 6d: Shrink the simplex
                for i = 2:n+1
                    simplex(i,:) = simplex(1,:) + sigma * (simplex(i,:) - simplex(1,:));
                end
            end
        else
            x_contracted = centroid + gamma * (simplex(end,:) - centroid);
            f_contracted = objective(x_contracted);
            if f_contracted < f_vals(end)
                simplex(end,:) = x_contracted;
            else
                % Step 6d: Shrink the simplex
                for i = 2:n+1
                    simplex(i,:) = simplex(1,:) + sigma * (simplex(i,:) - simplex(1,:));
                end
            end
        end
    end
end

% If the maximum number of iterations was reached
if iter == max_iter
    fprintf('Maximum iterations reached without convergence.\n');
end

% Get the best point and its function value
[fmin, min_idx] = min(f_vals);
xmin = simplex(min_idx,:);
disp(['The minimum value found is ', num2str(fmin), ...
      ' at the point [', num2str(xmin), '].']);
