
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
Local address - on which port and IP address the process is listening on
Foreign Address - from which address and port connection is established
State - LISTEN means the process is waiting, ESTABLISHED the process is processing input, UDP protocol doesn't have any state
PID/Program name - PID of a process and its name


