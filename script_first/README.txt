
Networlk script
The first command is netstat with -tunapl options, which is used to display socket statistics,  options:
- t - show TCP sockets
- u - show UDP sockets
- n - show numbers instead of names for interfaces and ports
- a - show listening and established sockets
- p - show the process using the sockets
- l - show only listening sockets
The output of command:
Proto - means protocol
Recv-Q, Send-Q - received and sent data correspondingly
Local Address - on which port and IP address the process is listening on, 0.0.0.0 stands for all network interfaces for IPv4, ::: same for IPv6, * for all ports
Foreign Address - from which address and port connection is established
State - LISTEN means the process is waiting, ESTABLISHED the process is processing input, UDP protocol doesn't have any state
PID/Program name - PID of a process and its name

awk - the table data processing tool, /firefox/ - match only lines with firefox word, {print $5} - print the fifth column

cut - cut text, -d':' - delimeter is used for colon separating pattern, -f1 - print the first part of the string separated by colon 

sort - sorts the contents of standart input and sends the results to standart output

uniq - removes any duplicate lines from a sorted file or standart input and sends the results to standart output, often used with sort, -c option - lines will be preceeded by the number of times the line occurs




