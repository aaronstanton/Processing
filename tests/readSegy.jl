using Seismic

#SegyToSeis("dpp_curve.segy", "dpp_curve", true)
#SegyToSeis("dps_curve.segy", "dps_curve", true)
#SegyToSeis("epp_curve.segy", "epp_curve", true)
#SegyToSeis("eps_curve.segy", "eps_curve", true)


stream = open("/Users/wenyue/gitclone/Seismic/data/P-Image.segy")
SegyToSeis("/Users/wenyue/gitclone/Seismic/data/P-Image.segy","P-wave","segy")

