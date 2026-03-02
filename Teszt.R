## install.packages("SPEI")
library(SPEI)

## load example file in spi() funciton help
data(wichita)
wichita$PET <- thornthwaite(wichita$TMED, 37.6475)
plot(wichita$PET, type = "l")

wichita.ts <- ts(wichita[, -c(1, 2)], end = c(2011, 10), frequency = 12) # make ts
plot(wichita.ts) # wiew multi-variable ts
