set style data histogram 
set style histogram clustered

# Title
set title "Comparaison GCC & CLANG flag -O3"

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
plot "perf/clang/clang_O3.dat" using 12:xtic(1) linecolor rgb "#00A5E3" t "FLAG O3",\
"perf/gcc/gcc_O3.dat" using 12:xtic(1) linecolor rgb "#8DD7BF" t "FLAG O2",\
#"perf/clang/clang_O1.dat" using 12:xtic(1) linecolor rgb "#FF96C5" t "FLAG O1",\
#"perf/clang/clang_Ofast.dat" using 12:xtic(1) linecolor rgb "#FF5768" t "FLAG Ofast"

##FFBF65

