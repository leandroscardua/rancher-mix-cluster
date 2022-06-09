# Get the information from teh Windows Node Registration
curl.exe --insecure -fL {{ enter the  rancher IP here like https://xxx.xxx.xxx.xxx }}/wins-agent-install.ps1 -o install.ps1; Set-ExecutionPolicy Bypass -Scope Process -Force; ./install.ps1 -Server {{ enter the  rancher IP here like https://xxx.xxx.xxx.xxx }} -Label 'cattle.io/os=windows' -Token {{ enter Token here }} -Worker -CaChecksum {{ enter CaChecksum }}

# Open Firewall port to enable OOB CPU and Memory metrics
New-NetFirewallRule -DisplayName "Allow Metric OOB" -Direction Inbound -Action Allow -EdgeTraversalPolicy Allow -Protocol TCP -LocalPort 10248-10256
