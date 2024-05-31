# Evolutionary Algorithm
### Systems Engineering ⚙ - Unimontes 📚

This work consists of creating an evolutionary algorithm for the discipline of Evolutionary Computing.

## 🖥 Project
The genetic algorithm created contains the 3 operators mentioned above. When using the selection operator, 30% of the population is chosen due to elitism and the rest of the individuals, given a random number, are selected with a 50% probability of the choice being made via tournament or roulette. In crossover and mutation operations that are applied to individuals, there is also a 50% probability of whether there will be a mutation or not, that is, there will always be crossover in the population to ensure that the next individuals are created based on the current individuals.

### Selection of individuals:
The selection of individuals from the population is taking place using three methods, two of which are always used together in each generation: elitism and tournament or elitism and roulette.

### Crossing of individuals:
The method applied is to use a cross in which for each individual in the population a specific number of parents is randomly selected, and this is done through the randperm function, which selects random indices of individuals in the population. Thus, for each variable (gene) in an individual, the corresponding genes from the selected parents are combined to form the genes of the new individual. This combination occurs through a formula that takes
taking into account the gene value of the parent, the average of the gene values ​​between the parents and a random factor.

### Mutation of individuals:
The mutation of individuals in the population was applied using a dynamically adjustable mutation amplitude, that is, 𝑚𝑎𝑥(0.1, 1 − 𝑝𝑟𝑜𝑔𝑟𝑒𝑠𝑠) dynamically adjusts the mutation amplitude based on progress, which is a parameter that represents the progression of the generation current divided by the total number of generations. In this sense, the more advanced the generation (progress close to 1), the lower the multiplier value will be, which means that the amplitude of the mutation will decrease as the evolutionary algorithm advances.
