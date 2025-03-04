#  .d8888b.        d8888 888888b.   8888888888
# d88P  Y88b      d88888 888  "88b  888
# 888    888     d88P888 888  .88P  888
# 888    888    d88P 888 8888888K.  8888888
# 888    888   d88P  888 888  "Y88b 888
# 888    888  d88P   888 888    888 888
# Y88b  d88P d8888888888 888   d88P 888
#  "Y8888P" d88P     888 8888888P"  8888888888
#
# Copyright (c) 2025, Abe Mishler
# Licensed under the Universal Permissive License v 1.0
# as shown at https://oss.oracle.com/licenses/upl/.
#
# Gnuplot script file for plotting big O analysis.

# Margins: left, right, bottom, top
set margins 15, 10, 10, 10

scale = 800/600
set terminal pngcairo size 1360*scale,1080*scale font "Liberation Mono,10" fontscale scale linewidth scale pointscale scale
set output "bigochart_loglog_basic.png"

unset key
unset mouse

set logscale x 2
set logscale y 2
set grid
set grid front
set xrange [0:2048]
set yrange [0:131072]

set tics front
set xtics nomirror
set ytics nomirror
set xtics (0,1,2,4,8,16,32,64,128,256,512,1024,"" 2048)
set ytics (0,1,2,4,8,16,32,64,128,256,512,1024,2048,4096,8192,16384,32768,65536,131072)

set title "Algorithm Analysis using O(g(n))" font "Liberation Mono,20" offset 0,-1
set xlabel "Input Size, n" font "Liberation Mono,15" offset 0,-0.75
set ylabel "Complexity, f(n)" font "Liberation Mono,15" offset 0.75,0

# Set some basic labels in the chart.
set label 1 at 540, 0.8 'O(1)' front
set label 2 at 540, 7 'O(log n)' front
set label 3 at 540, 64 'O(log^2 n)' front
set label 4 at 540, 425 'O(n)' front
set label 5 at 265, 1800 'O(n log n)' front
set label 6 at 90, 6000 'O(n^2)' front
set label 7 at 29, 19000 'O(n^3)' front
set label 8 at 16.5, 37000 'O(2^n)' front
set label 9 at 9.75, 75000 'O(n!)' front

# lc | linecolor
# lt | linetype
# lw | linewidth
# pt | pointtype
# ps | pointsize
# pi | pointinterval
set style line 1 lc rgb '#000000' lt 1 lw 1 pi -1 ps 1.0

# Define a log with arbitrary base function.
logb(x, base) = log(x)/log(base)

plot [1:*] gamma(x)      with filledcurves x1 fillstyle solid 1.0 fillcolor rgb "#efbfcf", \
     [1:*] 2**x          with filledcurves x1 fillstyle solid 1.0 fillcolor rgb "#efbfcf", \
     [1:*] x**3          with filledcurves x1 fillstyle solid 1.0 fillcolor rgb "#efbfcf", \
     [1:*] x**2          with filledcurves x1 fillstyle solid 1.0 fillcolor rgb "#ffbfbf", \
     [1:*] x*logb(x, 2)  with filledcurves x1 fillstyle solid 1.0 fillcolor rgb "#ffdfbf", \
     [1:*] x             with filledcurves x1 fillstyle solid 1.0 fillcolor rgb "#fffcbf", \
     [1:*] logb(x, 2)**2 with filledcurves x1 fillstyle solid 1.0 fillcolor rgb "#efffbf", \
     [1:*] logb(x, 2)    with filledcurves x1 fillstyle solid 1.0 fillcolor rgb "#efffbf", \
     [1:*] 1             with filledcurves x1 fillstyle solid 1.0 fillcolor rgb "#bfffbf", \
     [1:*] 1             with line ls 1, \
     [1:*] logb(x, 2)    with line ls 1, \
     [1:*] logb(x, 2)**2 with line ls 1, \
     [1:*] x             with line ls 1, \
     [1:*] x*logb(x, 2)  with line ls 1, \
     [1:*] x**2          with line ls 1, \
     [1:*] x**3          with line ls 1, \
     [1:*] 2**x          with line ls 1, \
     [1:*] gamma(x)      with line ls 1
