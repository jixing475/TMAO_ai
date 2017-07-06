library(clipr)
ifelse(TMAO_1_4_5$TMAO <= 17.9,"low","high") %>%
  as.factor() -> TMAO_1_4_5$TMAO_group

#=====
TMAO_12_34_5 %>%
  filter(TMAO <= 100) %>%
  select(TMAO,CKD_stage) %>%
  arrange(CKD_stage) %>%
  #to_impute() %>%
  clipr::write_clip()


#TMAO~Cardiothoracic_ration
TMAO_1_4_5 %>%
  filter(TMAO <= 100) %>%
  select(TMAO,Cardiothoracic_ration) %>%
  arrange(Cardiothoracic_ration) %>%
  to_impute() %>%
  clipr::write_clip()

#TMAO~heart_ultrasound
TMAO_1_4_5 %>%
  filter(TMAO <= 100) %>%
  select(TMAO,heart_ultrasound) %>%
  arrange(heart_ultrasound) %>%
  to_impute() %>%
  clipr::write_clip()

# CKD_5 LVEF~TMAO_group
TMAO_1_4_5 %>%
  #filter(TMAO <= 100) %>%
  filter(CKD_stage == "stage_5") %>%
  select(LVEF,TMAO_group) %>%
  arrange(TMAO_group) %>%
  to_impute() %>%
  clipr::write_clip()

# CKD_5 TMAO~age
TMAO_1_4_5 %>%
  filter(TMAO <= 100) %>%
  filter(CKD_stage == "stage_5") %>%
  select(TMAO,age) %>%
  arrange(age) %>%
  to_impute() %>%
  clipr::write_clip()
#CKD_5 TMAO~LVEF
TMAO_1_4_5 %>%
  filter(TMAO <= 100) %>%
  filter(CKD_stage == "stage_5") %>%
  select(TMAO,LVEF) %>%
  arrange(LVEF) %>%
  to_impute() %>%
  clipr::write_clip()

#CKD_5 TMAO~eGFR
TMAO_1_4_5 %>%
  filter(TMAO <= 100) %>%
  #filter(CKD_stage == "stage_5") %>%
  select(TMAO,eGFR) %>%
  arrange(eGFR) %>%
  clipr::write_clip()




TMAO_1_4_5 %>%
  filter(TMAO <= 100) %>%
  filter(CKD_stage == "stage_5") %>%
  select(TMAO) -> nithi
sd(nithi$TMAO)

TMAO_1_4_5 %>%
  filter(TMAO <= 100) %>%
  filter(CKD_stage == "stage_5") -> eGFR_TMAO

library(radiant)
summary(correlation(dataset=eGFR_TMAO,vars=c("TMAO","eGFR","LVEF","age"),method="spearman"))








