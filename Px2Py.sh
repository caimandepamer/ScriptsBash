#!/bin/bash
#version: 0.5
#mantainer: caimandepamer (telegram)
# p7 -> 11.49 rperf
# p6 -> 8.54 rperf
# p8 -> 16.43 rperf
# Change Log:
# 2022-11-07: Add functions to convert num of CPUs in different tecnologies (P6,7,8) from rperfs.


#=================================
rperfsp8=16.43
rperfsp7=11.49
rperfsp6=8.54
#=================================
function show_usage() {
   printf "Usage: $0 [ONE mandatory parameter [argument]]\n"
   printf "\n"
   printf "Options:\n"
   printf " -p6 [num_cpu], Show num perfs for Power 6 num_cpu's\n"
   printf " -p7 [num_cpu], Show num perfs for Power 7 num_cpu's\n"
   printf " -p8 [num_cpu], Show num perfs for Power 8 num_cpu's\n"
   printf " -h|--help, Print help\n"

return 0
}
#=================================
# llamar a la funcion con el 
# numero de cores como parametro
function P8rperf () {
	res=$(echo "scale=2;$1 * $rperfsp8"|bc)
  echo $res
}
function P7rperf () {
	res=$(echo "scale=2;$1 * $rperfsp7"|bc)
	echo $res
}
function P6rperf () {
	res=$(echo "scale=2;$1 * $rperfsp6"|bc)
	echo $res
}
function rperf2P8 () {
  res=$(echo "scale=2;$1 / $rperfsp8"|bc)
  echo $res
}
function rperf2P7 () {
  res=$(echo "scale=2;$1 / $rperfsp7"|bc)
  echo $res
}

function rperf2P6 () {
  res=$(echo "scale=2;$1 / $rperfsp6"|bc)
  echo $res
}
#=================================
if [[ -z "$1" ]]; then  show_usage; fi
while [ ! -z "$1" ]; do
   if [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
      show_usage
   elif [[ "$1" == "-p6" ]]; then
      nCPU="$2"
      rperf="$(P6rperf $nCPU)"
      echo "   $nCPU cores of Power 6 are:  $rperf rperfs"
      echo "   $nCPU cores P6 = $(rperf2P8 $rperf) cores P8"
      echo "   $nCPU cores P6 = $(rperf2P7 $rperf) cores P7"
      shift
   elif [[ $1 == "-p7" ]]; then
      nCPU="$2"
      rperf="$(P7rperf $nCPU)"
      echo "   $nCPU cores of Power 7 are:  $rperf rperfs"
      echo "   $nCPU cores P7 = $(rperf2P8 $rperf) cores P8"
      echo "   $nCPU cores P7 = $(rperf2P6 $rperf) cores P6"
      shift
   elif [[ $1 == "-p8" ]]; then
      nCPU="$2"
      rperf="$(P8rperf $nCPU)"
      echo "   $nCPU cores of Power 8 are:  $rperf rperfs"
      echo "   $nCPU cores P8 = $(rperf2P7 $rperf) cores P7"
      echo "   $nCPU cores P8 = $(rperf2P6 $rperf) cores P6"
      shift
   else
      echo "Incorrect input provided $1"
      show_usage
   fi
shift
done
