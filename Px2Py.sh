#!/bin/bash
# p7 -> 11.49 rperf
# p6 -> 8.54 rperf
# p8 -> 16.43 rperf
# Version: 0.1

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
#=================================
if [[ -z "$1" ]]; then  show_usage; fi
while [ ! -z "$1" ]; do
   if [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
      show_usage
   elif [[ "$1" == "-p6" ]]; then
      nCPU="$2"
      echo "   $nCPU cores of Power 6 are:  $(P6rperf $nCPU) rperfs"
      shift
   elif [[ $1 == "-p7" ]]; then
      nCPU="$2"
      echo "   $nCPU cores of Power 7 are:  $(P7rperf $nCPU) rperfs"
      shift
   elif [[ $1 == "-p8" ]]; then
      nCPU="$2"
      echo "   $nCPU cores of Power 8 are:  $(P8rperf $nCPU) rperfs"
      shift
   else
      echo "Incorrect input provided $1"
      show_usage
   fi
shift
done
