set.seed(1234)

# Open file
df <- read.csv("/home/george/Git/IN1100/stat_project/suicidio_prop_100k_hab_mes_2015-2017.csv")

# Transpose columns as rows
t_df <- setNames(data.frame(t(df[,-1])), df[,1])

# Normality test with Shapiro-Wilk
shapiro.test(t_df$'2015')
shapiro.test(t_df$'2016')
shapiro.test(t_df$'2017')
