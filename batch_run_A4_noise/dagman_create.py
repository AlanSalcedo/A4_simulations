with open('./A4.dag', 'w') as f:  #A4.dag for station 4 
	for k in range(1,5): #Configs (6 - 1 = 5 for A1)
		for i in range(0,50): ##Number of simulation runs
			f.write('JOB ARA_S4_C'+str(k)+'_Noise'+str(i)+' ARA_job.sub\n')
			f.write('VARS ARA_S4_C'+str(k)+'_Noise'+str(i)+' st="4" config="'+str(k)+'" sim_run="'+str(i)+'"\n')
			f.write('\n')
