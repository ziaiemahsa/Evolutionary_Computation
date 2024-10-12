function Differential_Evolution_Optimization
]    num_runs = 10; 
    
    for run = 1:num_runs
        [population, option] = initialize_population; 
        population = evaluate_population(population, option); 
        
        t = 1;
        while t <= option.MaxIt
            % Identify the best individual in the population
            best_individual = population(1);
            for i = 2:option.np
                if population(i).f < best_individual.f
                    best_individual = population(i);
                end
            end
            
            % Mutation and Crossover
            for i = 1:option.np
                % Select distinct random individuals
                random_idx = randperm(option.np);
                random_idx = setdiff(random_idx, i, 'stable');
                
                % Mutation strategy based on best individual
                mutant_vector = best_individual.vector + option.beta * ...
                    (population(random_idx(1)).vector - population(random_idx(2)).vector);
                
                % Crossover
                child(i).vector = population(i).vector;
                jstar = randi(option.nv, 1); % Random crossover point
                for j = 1:option.nv
                    if (rand < option.pr) || (j == jstar)
                        child(i).vector(1, j) = mutant_vector(1, j);
                    end
                end
            end
            
            % Fitness Evaluation and Selection
            child = evaluate_population(child, option);
            for i = 1:option.np
                if population(i).f >= child(i).f
                    population(i) = child(i); % Replace if offspring is better
                end
                fitness_values(1, i) = min(population(i).f, child(i).f);
            end
            
            % Track best fitness in this iteration
            best_fitness(t) = min(fitness_values);
            t = t + 1;
        end
        
        fitness_across_runs(run, :) = best_fitness;
    end
    
    mean_fitness = mean(fitness_across_runs);
    
    plot_fitness(mean_fitness);
    
    disp(fitness_across_runs(:, 100));
end

function [population, option] = initialize_population
    option.np = 10;  % Population size
    option.nv = 30;  % Dimensionality of vectors
    option.MaxIt = 1000; % Maximum iterations
    option.pr = 0.5; % Crossover probability
    option.beta = 1; % Mutation factor
    option.Maxvar = 5; % Upper bound of variables
    option.Minvar = -5; % Lower bound of variables
    
    % Create population with uniformly random vectors
    for i = 1:option.np
        population(i).vector = unifrnd(option.Minvar, option.Maxvar, [1, option.nv]);
    end
end

% Evaluate population fitness based on sum of squares
function population = evaluate_population(population, option)
    for i = 1:option.np
        population(i).f = sum((population(i).vector).^2); % Fitness: sum of squared vector values
    end
end

function plot_fitness(mean_fitness)
    figure;
    plot(mean_fitness, '--*', 'LineWidth', 1.5, 'MarkerSize', 6);
    
    title('Mean Fitness Evolution (10 Runs)', 'FontSize', 14);
    xlabel('Iteration', 'FontSize', 12);
    ylabel('Mean Fitness', 'FontSize', 12);
    grid on;
    set(gca, 'FontSize', 12);
end
