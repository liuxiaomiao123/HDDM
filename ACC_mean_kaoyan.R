
data <- read.csv("D:/brainbnu/haiyang/hddm/ACC.csv")
head(data)
data2<-split(data,data$group)

stress <- data2$`stress`
control <- data2$`control`

stress_0back <-split(stress,stress$condition) $'0'
stress_2back <-split(stress,stress$condition) $'2'

control_0back <-split(control,control$condition) $'0'
control_2back <-split(control,control$condition) $'2'


stress_0back_CRESP<-aggregate(stress_0back$CRESP, by=list(stress_0back$﻿sub), FUN=sum)
stress_0back_RESP<-aggregate(stress_0back$RESP, by=list(stress_0back$﻿sub), FUN=sum)
stress_0back_ACC = data.frame(stress_0back_CRESP$x,stress_0back_RESP$x)
stress_0back_ACC$group = rep("s0",36)
names(stress_0back_ACC)[names(stress_0back_ACC) == "stress_0back_CRESP.x"] <- "CRESP"
names(stress_0back_ACC)[names(stress_0back_ACC) == "stress_0back_RESP.x"] <- "RESP"
write.csv(stress_0back_ACC, file="D:/brainbnu/haiyang/hddm/result/s0_ACC.csv")



stress_2back_CRESP<-aggregate(stress_2back$CRESP, by=list(stress_2back$﻿sub), FUN=sum)
stress_2back_RESP<-aggregate(stress_2back$RESP, by=list(stress_2back$﻿sub), FUN=sum)
stress_2back_ACC = data.frame(stress_2back_CRESP$x,stress_2back_RESP$x)
stress_2back_ACC$group = rep("s2",36)
names(stress_2back_ACC)[names(stress_2back_ACC) == "stress_2back_CRESP.x"] <- "CRESP"
names(stress_2back_ACC)[names(stress_2back_ACC) == "stress_2back_RESP.x"] <- "RESP"
write.csv(stress_2back_ACC, file="D:/brainbnu/haiyang/hddm/result/s2_ACC.csv")



control_0back_CRESP<-aggregate(control_0back$CRESP, by=list(control_0back$﻿sub), FUN=sum)
control_0back_RESP<-aggregate(control_0back$RESP, by=list(control_0back$﻿sub), FUN=sum)
control_0back_ACC = data.frame(control_0back_CRESP$x,control_0back_RESP$x)
control_0back_ACC$group = rep("c0",32)
names(control_0back_ACC)[names(control_0back_ACC) == "control_0back_CRESP.x"] <- "CRESP"
names(control_0back_ACC)[names(control_0back_ACC) == "control_0back_RESP.x"] <- "RESP"
write.csv(control_0back_ACC, file="D:/brainbnu/haiyang/hddm/result/c0_ACC.csv")



control_2back_CRESP<-aggregate(control_2back$CRESP, by=list(control_2back$﻿sub), FUN=sum)
control_2back_RESP<-aggregate(control_2back$RESP, by=list(control_2back$﻿sub), FUN=sum)
control_2back_ACC = data.frame(control_2back_CRESP$x,control_2back_RESP$x)
control_2back_ACC$group = rep("c2",32)
names(control_2back_ACC)[names(control_2back_ACC) == "control_2back_CRESP.x"] <- "CRESP"
names(control_2back_ACC)[names(control_2back_ACC) == "control_2back_RESP.x"] <- "RESP"
write.csv(control_2back_ACC, file="D:/brainbnu/haiyang/hddm/result/c2_ACC.csv")
