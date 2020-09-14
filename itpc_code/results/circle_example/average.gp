
file="noOutlier.txt"

set size 0.5,0.5

plot file us 1:3  title "samples"  w lines 
replot file us 1:5  title "bootstrap" w lines



