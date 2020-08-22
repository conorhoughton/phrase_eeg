unset key

set yrange [0.05:0.6]

plot for [i=2:20] "itpc_anan_all.txt" us 1:i w lines lc rgb 'gray'

replot "itpc_anan_grand_av.txt" us 1:2 w lines lw 3 lc rgb 'black'

replot 0.18095922892332045 lw 1 lc rgb 'blue'
replot 0.2157065981843344  lw 1 lc rgb 'blue'
replot 0.14756807142095588 lw 1 lc rgb 'blue'


set arrow from 3.125, graph 0 to 3.125, graph 1 nohead front lw 1 lc rgb 'red'
set arrow from 1.5625, graph 0 to 1.5625, graph 1 nohead front lw 1  lc rgb 'red'

replot "< echo '3.125 0.075'" w p ls 3 ps 3 lw 3 lc rgb 'red'

replot