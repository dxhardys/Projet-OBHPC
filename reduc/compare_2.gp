set style data histogram 
set style histogram clustered

# Title
set title "Comparaison Compiler GCC & CLANG flag -O2"

# Axis Title
set xlabel "Versions"
set ylabel "Performance (MiB/s)"

# Range
set xrange [0:*]
set datafile separator ';'

# Filling
set style fill solid
set xtics rotate by -45


# Saving
set terminal png
# Plotting
set output "histogrammes/Comparaison2.png"
plot "perf/clang/clang_O2.dat" using 12:xtic(1) linecolor rgb "#00A5E3" t "CLANG",\
"perf/gcc/gcc_O2.dat" using 12:xtic(1) linecolor rgb "#8DD7BF" t "GCC",\
#"perf/clang/clang_O1.dat" using 12:xtic(1) linecolor rgb "#FF96C5" t "FLAG O1",\
#"perf/clang/clang_Ofast.dat" using 12:xtic(1) linecolor rgb "#FF5768" t "FLAG Ofast"

##FFBF65

