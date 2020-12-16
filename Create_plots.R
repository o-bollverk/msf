dependencies <- c("ggplot2", "dplyr")

for (i in dependencies){
  if (require(i) == FALSE){
    install.packages(i)
  }
}

library(dplyr)
library(ggplot2)

unbalanced_df = read.csv2("resnet34_predictions/predictions_entire_unbalanced_dataset.csv", sep = ",")
balanced_df = read.csv2("resnet34_predictions/random_selection_predictions.csv", sep = ",")

# unbalanced data graph ---------
unbalanced_count <-  unbalanced_df %>% 
  group_by(correct) %>% 
  summarise(count = n()) %>% 
  ungroup %>% 
  arrange(count)

indeksid <- match(as.character(unbalanced_count$correct), levels(unbalanced_count$correct))
unbalanced_count$correct <- factor(unbalanced_count$correct, levels = levels(unbalanced_count$correct)[indeksid])

unbalanced_n_correct <-  unbalanced_df %>% 
  group_by(correct) %>% 
  summarise(n_corrects = sum(correct == prediction)) %>% 
  ungroup %>% 
  arrange(n_corrects)


indeksid <- match(as.character(unbalanced_n_correct$correct), levels(unbalanced_n_correct$correct))
unbalanced_n_correct$correct <- factor(unbalanced_n_correct$correct, levels = levels(unbalanced_n_correct$correct)[indeksid])

unbalanced_n_correct

names(unbalanced_count)[names(unbalanced_count) == "count"] <- "n_corrects"
unbalanced_n_correct$name <- "Correctly classified"
unbalanced_count$name <- "Count"

d <- rbind(unbalanced_n_correct, unbalanced_count)
names(d) <- c("Total", "Correct_predictions", "Legend")

p <- ggplot(d, aes(Total, Correct_predictions, fill = Legend)) + geom_bar(stat = "identity", position = "dodge", width = 0.75) +
  #  ylim(c(0, 160)) + 
  ylab("Number of instances") + 
  theme(axis.text.x = element_text(angle = 45, vjust = 0.8, hjust=1, size = 12)) +
  xlab("")
p

ggplot(unbalanced_n_correct, aes(correct, n_corrects)) +
  geom_bar(stat = "identity", width = 0.75) + 
  scale_y_continuous(breaks = scales::pretty_breaks(n = 5)) +
  xlab("") +
#  ylim(c(0, 160)) + 
  ylab("Correctly predicted") + 
  theme(axis.text.x = element_text(angle = 45, vjust = 0.8, hjust=1, size = 12))


# balanced data graph  ----------

n_corrects <-  balanced_df %>% 
  group_by(correct) %>% 
  summarise(n_corrects = sum(correct == prediction)) %>% 
  ungroup

ggplot(n_corrects, aes(correct, n_corrects)) +
  geom_bar(stat = "identity", width = 0.75) + 
  scale_y_continuous(breaks = scales::pretty_breaks(n = 5)) +
  xlab("") +
  ylim(c(0, 160)) + 
  ylab("Correctly predicted") + 
  theme(axis.text.x = element_text(angle = 45, vjust = 0.8, hjust=1, size = 12))
