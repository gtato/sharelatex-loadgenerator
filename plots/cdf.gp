#!/usr/bin/gnuplot

#usage
#i=1; for j in `head -1 cloud.30mins.10users-5321`; do echo $i "${j//\\/}"; ((i++)); done;
# gnuplot -e "m=3" cdf.gp

if (!exists("df1")) df1='../out/core.1800secs.10users-8f0b'
if (!exists("df2")) df2='../out/edge.1800secs.10users-04ad'
if (!exists("m")) m=2

set xlabel "ms"
set ylabel '%'


#set xrange [0:100]


#set key autotitle columnhead


firstrow = system('head -1 '.df1)
tl = word(firstrow, m)
set title tl

plot df1 using m:1 title "core" with lines lw 1.3  lc rgb "red" ,\
	 df2 using m:1 title "edge" with lines lw 1.3  lc rgb "blue" 
	 
pause mouse close