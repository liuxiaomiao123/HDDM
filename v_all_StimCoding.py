import hddm
import pandas as pd
import os

data = hddm.load_csv('D://brainbnu//haiyang//hddm//hddm_all_StimCoding.csv')
res_dir = 'D://brainbnu//haiyang//hddm//result//all_StimCoding//split_z//v'

models = []
dic = []
for i in range(3):
    m = hddm.HDDMStimCoding(data,
                  stim_col='stimulus',
                  split_param = 'v',
                  depends_on = {
                  'a':['group'],
                  'v':['condition','group'],
                  't':['group']
                  })
    m.find_starting_values()
    m.sample(20000, burn=2000, dbname='traces.db', db='pickle')
   # m.save('model_avz_all_StimCoding_split_z'+str(i+1))
    m_stat = m.gen_stats()
    m_stat.to_csv(os.path.join(res_dir, 'stat_v_all_StimCoding_split_z_' + str(i + 1) + '.csv'))
    dic.append(m.dic)
    models.append(m)

#models.save('models_all')

r = hddm.analyze.gelman_rubin(models)  # R hat is a dic
models_R = pd.DataFrame([r])
models_R.to_csv(os.path.join(res_dir, 'R_hat_v_all_StimCoding_split_z_' + '.csv'))

models_DIC = pd.DataFrame(dic)
models_DIC.columns = {"DIC"}
models_DIC.to_csv(os.path.join(res_dir, 'DIC_v_all_StimCoding_split_z_' + '.csv'))


