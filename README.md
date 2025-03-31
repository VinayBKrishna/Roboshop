# Roboshop

#spreading the arguments before sending it to the function
#while assigning no need to spread it but while using it need to do spreading
#fruits=('apple','banana','mango')
#
#
#but while using in function
#
#example3(){
#  echo "$@" "-----" "${1}"
#  newFruits=fruits
#  for arr in "${newFruits[@]}"; do
#    echo "$arr"
#  done
#
#}


#redirecting output to a file
# output redirector(>) input from a file
# input redirector(<) output to a file
# to append (>> or <<)

#every command had exit status
#0-255
#0 is successful
#non zero is partial or error or complete failure

"echo $?" is used to get output of exit status