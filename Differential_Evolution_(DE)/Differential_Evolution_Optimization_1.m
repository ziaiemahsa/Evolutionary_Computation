function Differential_Evolution_Optimization
    num_experiments = 10;  
    max_iterations = 1000; 
    
    best_fitness_all_experiments = zeros(num_experiments, max_iterations);
    random_fitness_all_experiments = zeros(num_experiments, max_iterations);
    
    for experiment = 1:num_experiments
        [population, params] = initialize_population; 
        population = evaluate_fitness(population, params); 
        
        for iter = 1:max_iterations
            % Identify the best individual in the population
            best_individual = population(1);
            for k = 2:params.population_size
                if population(k).fitness < best_individual.fitness
                    best_individual = population(k);
                end
            end
            
            % Randomly select an individual for comparison
            random_individual = population(randi(params.population_size));
            
            % Evolutionary process (Mutation, Crossover, Selection)
            for j = 1:params.population_size
                % Mutation using the best individual and random pairs
                rand_idx = randperm(params.population_size);
                rand_idx = setdiff(rand_idx, j, 'stable'); 
                mutant_vector = best_individual.vector + ...
                    params.scaling_factor * (population(rand_idx(1)).vector - population(rand_idx(2)).vector);
                
                % Crossover
                offspring(j).vector = population(j).vector;
                crossover_point = randi(params.vector_length);
                for l = 1:params.vector_length
                    if rand < params.crossover_probability || l == crossover_point
                        offspring(j).vector(l) = mutant_vector(l);
                    end
                end
            end
            
            % Evaluate the fitness of the offspring
            offspring = evaluate_fitness(offspring, params);
            
            % Selection: Keep offspring if it has better fitness
            for j = 1:params.population_size
                if offspring(j).fitness < population(j).fitness
                    population(j) = offspring(j);
                end
                fitness_values(j) = min(population(j).fitness, offspring(j).fitness);
            end
            
            % Track best and random individual fitness over iterations
            best_fitness(iter) = min(fitness_values);
            random_fitness(iter) = random_individual.fitness;
        end
        
        best_fitness_all_experiments(experiment, :) = best_fitness;
        random_fitness_all_experiments(experiment, :) = random_fitness;
    end
    
    plot_mean_fitness(best_fitness_all_experiments, random_fitness_all_experiments, max_iterations);
end

function [population, params] = initialize_population
    params.population_size = 30;
    params.vector_length = 30;
    params.MaxIterations = 1000;
    params.crossover_probability = 0.5;
    params.scaling_factor = 0.8; 
    params.max_value = 5;
    params.min_value = -5;

    % Initialize individuals with random vectors
    for i = 1:params.population_size
        population(i).vector = unifrnd(params.min_value, params.max_value, [1, params.vector_length]);
    end
end

function population = evaluate_fitness(population, params)
    for i = 1:params.population_size
        population(i).fitness = sum((population(i).vector).^2);
    end
end

function plot_mean_fitness(best_fitness_all_experiments, random_fitness_all_experiments, max_iterations)
    avg_best_fitness = mean(best_fitness_all_experiments);
    avg_random_fitness = mean(random_fitness_all_experiments);
    
    figure;
    plot(1:max_iterations, avg_best_fitness, '--o', 'LineWidth', 1.5, 'DisplayName', 'Mean Best Fitness');
    hold on;
    plot(1:max_iterations, avg_random_fitness, '-*', 'LineWidth', 1.5, 'DisplayName', 'Mean Random Fitness');
    
    title('Average Fitness Evolution (10 Runs)', 'FontSize', 14);
    xlabel('Iteration', 'FontSize', 12);
    ylabel('Fitness', 'FontSize', 12);
    legend('show', 'Location', 'northeast');
    grid on;
    set(gca, 'FontSize', 12);
end
