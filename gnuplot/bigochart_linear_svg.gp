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

set terminal svg dynamic size 680,540
set output "bigochart_linear_empty.svg"

unset key
unset mouse

unset xtics
unset ytics

unset title
unset xlabel
unset ylabel

set xrange [0:128]
set yrange [0:2048]

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
