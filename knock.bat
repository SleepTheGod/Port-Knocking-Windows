@echo off
REM This must be ran as admin
Rem You must change line 7 to your ip
setlocal

:: Define the IP address and ports to knock
set "IP_ADDRESS=YOUR_IP_GOES_HERE"
set "PORTS=1234 5678 43764 9012"

:: Loop through the list of ports and knock on each one
for %%p in (%PORTS%) do (
    :: Use the "powershell" command to send a TCP packet to knock on the port
    powershell -c "(New-Object Net.Sockets.TcpClient).Connect('%IP_ADDRESS%', %%p)"
)

:: Wait for a few seconds before exiting
ping -n 5 127.0.0.1 > nul

:: End of script
