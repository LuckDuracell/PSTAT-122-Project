{r}
set.seed(11152025)
people_blocks <- c("Luke", "Aayushi", "Anna", "Joyce", "Karina", 
                   "Stranger 1", "Stranger 2", "Stranger 3", "Stranger 4", "Stranger 5")

randomized_people <- sample(people_blocks, length(people_blocks), replace = FALSE)
treatment_conditions <- c("iPhone", "iPad", "Macbook")

experiment_plan <- data.frame(
  Block = rep(randomized_people, each = length(treatment_conditions) * 10),
  Treatment = rep(rep(treatment_conditions, each = 10), times = length(people_blocks))
)
head(experiment_plan, 301)