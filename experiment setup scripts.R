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

# average reaction time based on phone
databyphone <- data[data$Treatment == "Phone",]
phone.data <- databyphone$Reaction.Time..ms.
mean(phone.data, na.rm=TRUE)

#average reaction time based on tablet
databytablet <- data[data$Treatment == "Tablet",]
tablet.data <- databytablet$Reaction.Time..ms.
mean(tablet.data, na.rm=TRUE)

#average reaction time based on laptop
databylaptop <- data[data$Treatment == "Laptop",]
laptop.data <- databylaptop$Reaction.Time..ms.
mean(laptop.data, na.rm=TRUE)


# basic stats on reaction time of phone (SD, min, max)
min(phone.data, na.rm=TRUE)
max(phone.data, na.rm=TRUE)
sd(phone.data, na.rm=TRUE)

# basic stats on reaction time of tablet (SD, min, max)
min(tablet.data, na.rm=TRUE)
max(tablet.data, na.rm=TRUE)
sd(tablet.data, na.rm=TRUE)

# basic stats on reaction time of laptop (SD, min, max)
min(laptop.data, na.rm=TRUE)
max(laptop.data, na.rm=TRUE)
sd(laptop.data, na.rm=TRUE)




