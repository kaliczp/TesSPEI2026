## no: 35116 elev: 471.4 latlong: 47.2622 18.0322
rawTes <- read.table("HABP_1D_20020101_20251231_35116.csv", head = TRUE, sep = ";")
## Monthly
rawTesHon <- read.table("HABP_1MO_200201_202512_35116.csv", head = TRUE, sep = ";")
a
rawTesHon$PET <- thornthwaite(rawTesHon$t, 47.2622)
rawTesHon$BAL <- rawTesHon$rau - rawTesHon$PET

## grafikus error check
par(oma = c(3.1,0,0.4,0), mar = c(0,4.1,0,0.4), mfrow = c(3,1), xaxs = "i")
plot(rawTesHon$BAL, type = "l")
plot(rawTesHon$rau, type = "h")
plot(rawTesHon$PET, type = "l")

## Csapadék gond tölrés
rawTesHon[rawTesHon$rau < -10, "rau"] <- 0

rawTesHon.ts <- ts(rawTesHon[, -c(1, 2)],start = c(2002, 1), frequency = 12) # make ts
plot(rawTesHon.ts[,c(1,3)]) # wiew multi-variable ts

spei12 <- spei(rawTesHon.ts[, "BAL"], 12)
plot(spei12)

spei24 <- spei(rawTesHon.ts[, "BAL"], 24)
plot(spei24)
