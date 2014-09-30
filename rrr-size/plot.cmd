set terminal png size 800,600
set title "RRR compression ratio vs block size and density"
set pm3d map
set xlabel "Block size"
set ylabel "Density"
set zlabel "Ratio"
set logscale y
set xrange [8:256]
set yrange [0.000001:0.1]
set zrange [0:1]
set output 'plot.png'
splot "plot.dat" using 1:3:2
