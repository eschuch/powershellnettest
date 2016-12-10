

:: command > logfile 2>&1

:: :: RUN PS in a batch command example
:: SET LONG_COMMAND= ^
:: if ($true) ^
:: { ^
::	Write-Host "Result is True"; ^
::	Write-Host "Multiple statements must be separated by a semicolon." ^
:: } ^
:: else ^
:: { ^
::	Write-Host "Result is False" ^
:: }
::
:: START Powershell -command %LONG_COMMAND%



:: PS get internet ipv4 addresse from a external helper...
:: Invoke-WebRequest -Uri https://api.ipify.org).Content

:: PS get the timer
:: Get-Date -Format 'yyy-mm-dd HH:mm:ss.ffff'

:: PS get local ipv6 address global unicast rfc4291
:: (Get-NetIPAddress).IPv6Address | Select-String -pattern '^[23][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]:'

:: PS tempo de execução
:: (Measure-Command {sleep 1 ### COMMAND PARA MONITORAR}).TotalMilliseconds


:: PS teste porta
:: (Test-NetConnection -ComputerName google.com -InformationLevel Detailed -Port 80).tcptestsucceeded


:: ps TEST Dns SERVER
::(Resolve-DnsName google.com -Type AAAA -Server 8.8.8.8 ).ipaddress

:: PS tracert IPv6Address
:: Test-NetConnection (Resolve-DnsName google.com -Type AAAA).ipaddress -TraceRoute

:: PS tracert ipv4address
:: Test-NetConnection (Resolve-DnsName google.com -Type A ).ipaddress -TraceRoute











SET LONG_COMMAND='^
Start-Transcript events.log ; ^
$time=Get-Date -Format "yyy-mm-dd HH:mm:ss.ffff" ; ^
$ipv6=(Get-NetIPAddress).IPv6Address | Select-String -pattern "^[23][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]:"; ^
$ipv4=(Invoke-WebRequest -Uri https://api.ipify.org).Content ; ^
$tcpGoogleIPv4Time=(Measure-Command { ^
$tcpGoogleIPv4=(Test-NetConnection -ComputerName (Resolve-DnsName google.com -Type A).ipaddress -InformationLevel Detailed -Port 80).tcptestsucceeded; ^
}).TotalMilliseconds ;^
$tcpTerraIPv4Time=(Measure-Command { ^
$tcpTerraIPv4=(Test-NetConnection -ComputerName (Resolve-DnsName terra.com.br -Type A).ipaddress -InformationLevel Detailed -Port 80).tcptestsucceeded; ^
}).TotalMilliseconds ;^
$tcpVivoTimeIPv4=(Measure-Command { ^
$tcpVivoIPv4=(Test-NetConnection -ComputerName (Resolve-DnsName vivo.com.br -Type A).ipaddress -InformationLevel Detailed -Port 80).tcptestsucceeded; ^
}).TotalMilliseconds ;^
stop-transcript"
	
START Powershell -NOEXIT -command %LONG_COMMAND%
