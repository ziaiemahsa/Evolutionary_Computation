# Summary 1
**Differential Evolution Optimization with Multiple Experiments**
This implementation of the Differential Evolution (DE) algorithm optimizes a population of candidate solutions across ten independent runs, each with up to 1000 iterations. It tracks and compares the fitness of the best and a randomly selected individual, using a sum of squares fitness function. The results from all experiments are visualized, providing insights into the algorithm's performance across multiple runs.

<img width="820" alt="1" src="https://github.com/user-attachments/assets/a555b018-6742-47cc-986e-c390cda144c2">


# Summary 2
**Streamlined Differential Evolution Optimization**
This variant of the DE algorithm optimizes candidate solutions in ten independent runs, executing a single loop until a maximum iteration limit is reached. It employs a mutation strategy based on the best individual and uses random crossover points for offspring creation. Mean fitness across runs is calculated and visualized, offering a concise analysis of the algorithm's effectiveness with a focus on efficiency.

<img width="817" alt="2" src="https://github.com/user-attachments/assets/44daf099-3d73-4bc3-88d5-f400b330512c">


### Key Differences:
1. **Structure**: The first code has nested loops for experiments, while the second uses a single loop for iterations.
2. **Fitness Tracking**: The first captures best and random fitness; the second focuses on mean fitness.
3. **Efficiency**: The second implementation prioritizes streamlined execution, offering a more direct approach to fitness evaluation.
