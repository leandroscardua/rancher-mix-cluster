# Get the information from teh Windows Node Registration
curl.exe --insecure -fL {{ enter the  rancher IP here like https://xxx.xxx.xxx.xxx }}/wins-agent-install.ps1 -o install.ps1; Set-ExecutionPolicy Bypass -Scope Process -Force; ./install.ps1 -Server {{ enter the  rancher IP here like https://xxx.xxx.xxx.xxx }} -Label 'cattle.io/os=windows' -Token {{ enter Token here }} -Worker -CaChecksum {{ enter CaChecksum }}