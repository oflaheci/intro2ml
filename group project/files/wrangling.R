### Wrangling

## Combine Data sets
# read in
d18q3 <- read.csv("./data/18Q3.csv")
d18q4 <- read.csv("./data/18Q4.csv")
d19q1 <- read.csv("./data/19Q1.csv")
d19q2 <- read.csv("./data/19Q2.csv")
d19q3 <- read.csv("./data/19Q3.csv")
d19q4 <- read.csv("./data/19Q4.csv")
d20q1 <- read.csv("./data/20Q1.csv")
d20q2 <- read.csv("./data/20Q2.csv")
d20q3 <- read.csv("./data/20Q3.csv")
d20q4 <- read.csv("./data/20Q4.csv")
d21q1 <- read.csv("./data/21Q1.csv")
d21q2 <- read.csv("./data/21Q2.csv")
d21q3 <- read.csv("./data/21Q3.csv")
d21q4 <- read.csv("./data/21Q4.csv")

# bind
df <- rbind(d18q3, d18q4, d19q1, d19q2, d19q3, d19q4, d20q1, d20q2, d20q3, d20q4,
            d21q1, d21q2, d21q3, d21q4)
df$X <- 1:nrow(df)
head(df)
ncol(df) # 14

# delete added observation col 
df <- subset(df, select = -c(X)) 

# write csv
write_csv(df, "./data/fullsubset.csv")

