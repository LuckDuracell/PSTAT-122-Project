{r}
set.seed(11152025)

people_blocks <- c("Stranger 1", "Stranger 2", "Stranger 3", "Stranger 4", "Stranger 5",
                   "Luke", "Aayushi", "Anna", "Joyce", "Karina")

randomized_people <- sample(people_blocks, length(people_blocks), replace = FALSE)

treatment_conditions <- c("iPhone", "iPad", "Macbook")
experiment_list <- lapply(randomized_people, function(person) {
  person_treat_order <- sample(treatment_conditions)
  
  data.frame(
    Block = person,
    Treatment = rep(person_treat_order, each = 10)
  )
})

experiment_plan <- do.call(rbind, experiment_list)

head(experiment_plan, 301)

write.csv(experiment_plan, "experiment_plan.csv", row.names = FALSE)

data <- read.csv("experiment_plan_filled.csv")
model <- aov(Reaction.Time..ms. ~ Treatment + Person, data = data)
summary(model)
