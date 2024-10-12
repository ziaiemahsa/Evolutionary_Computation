A Genetic Algorithm Optimized CNN Model for Brain Tumor Classification

Summary
1. Data Acquisition and Preprocessing
This project begins with an extensive process of acquiring and preparing image data from .mat files. The data is resized to a standard dimension and adjusted for compatibility with the model, including expanding the channel dimension. The dataset is then split into training and testing subsets, ensuring a balanced 80-20 distribution. This preprocessing is crucial for preparing the data for robust model training and evaluation.

2. CNN Model Development
A Convolutional Neural Network (CNN) is constructed using TensorFlow and Keras. The model features a sequence of convolutional layers and max-pooling operations, followed by dense layers with dropout regularization. This architecture is designed to effectively learn and classify image features. The CNN is compiled using the Adam optimizer and categorical crossentropy loss function, tailored for multi-class classification tasks.

3. Genetic Algorithm for Hyperparameter Optimization
A significant aspect of this project is the application of genetic algorithms to optimize CNN hyperparameters. Genetic algorithms, inspired by evolutionary principles, are employed to explore and refine various model configurations. This approach involves creating a diverse population of models, applying mutation and crossover techniques to evolve the hyperparameters—such as the number of convolutional filters, dense units, and dropout rates. The models are evaluated based on their validation performance, allowing the genetic algorithm to identify and retain the most effective hyperparameter combinations. This method provides a systematic and innovative approach to improving model performance.

4. Integration and Results
The project integrates data processing, CNN model construction, and genetic algorithm-based optimization into a cohesive framework. This comprehensive approach not only illustrates the application of advanced optimization techniques but also highlights their potential to enhance machine learning models. The optimized CNN, refined through genetic algorithms, is tested to demonstrate its effectiveness and generalization capabilities.

![image](https://github.com/user-attachments/assets/1286dcf6-381f-43ae-a505-56448e1ded85)
