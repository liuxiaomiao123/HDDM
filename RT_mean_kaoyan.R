
data <- read.csv("D:/brainbnu/haiyang/hddm/hddm_all_StimCoding.csv")
head(data)
data2<-split(data,data$group)

stress <- data2$`stress`
control <- data2$`control`

stress_0back <-split(stress,stress$condition) $'0'
stress_2back <-split(stress,stress$condition) $'2'

control_0back <-split(control,control$condition) $'0'
control_2back <-split(control,control$condition) $'2'

stress_0back_hit <- split(stress_0back,stress_0back$response)$'1'
stress_2back_hit <- split(stress_2back,stress_2back$response)$'1'

control_0back_hit <- split(control_0back,control_0back$response)$'1'
control_2back_hit <- split(control_2back,control_2back$response)$'1'


stress_0back_hit_id<-aggregate(stress_0back_hit$rt, by=list(stress_0back_hit$﻿subj_idx), FUN=mean)
stress_0back_hit_id$group = rep("s0",36)
names(stress_0back_hit_id)[names(stress_0back_hit_id) == "Group.1"] <- "id"
write.csv(stress_0back_hit_id, file="D:/brainbnu/haiyang/hddm/result/s0.csv")


stress_2back_hit_id<-aggregate(stress_2back_hit$rt, by=list(stress_2back_hit$﻿subj_idx), FUN=mean)
stress_2back_hit_id$group = rep("s2",36)
names(stress_2back_hit_id)[names(stress_2back_hit_id) == "Group.1"] <- "id"
write.csv(stress_2back_hit_id, file="D:/brainbnu/haiyang/hddm/result/s2.csv")

control_0back_hit_id<-aggregate(control_0back_hit$rt, by=list(control_0back_hit$﻿subj_idx), FUN=mean)
control_0back_hit_id$group = rep("c0",32)
names(control_0back_hit_id)[names(control_0back_hit_id) == "Group.1"] <- "id"
write.csv(control_0back_hit_id, file="D:/brainbnu/haiyang/hddm/result/c0.csv")

control_2back_hit_id<-aggregate(control_2back_hit$rt, by=list(control_2back_hit$﻿subj_idx), FUN=mean)
control_2back_hit_id$group = rep("c2",32)
names(control_2back_hit_id)[names(control_2back_hit_id) == "Group.1"] <- "id"
write.csv(control_2back_hit_id, file="D:/brainbnu/haiyang/hddm/result/c2.csv")
