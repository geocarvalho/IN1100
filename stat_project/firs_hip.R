# Open file
df <- read.csv("/home/george/Git/IN1100/stat_project/suicidio_prop_100k_hab_mes_2015-2017.csv")

# Transpose columns as rows
t_df <- setNames(data.frame(t(df[,-1])), df[,1])

