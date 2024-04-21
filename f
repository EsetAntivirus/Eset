$dropboxUrl = "https://dl.dropboxusercontent.com/scl/fi/ai74cey1k0wlen7ioszb0/8-84064_image-result-for-bulan-ramadhan-background-wallpapers-hd.jpg?rlkey=gfaap6f7fzyxp5zc19yr7vnqw&dl=0"


$fileName = [System.IO.Path]::GetFileName($dropboxUrl)


$fileName = $fileName -replace '[\\/:*?"<>|]', '-'


$startupFolder = [System.IO.Path]::Combine([System.Environment]::GetFolderPath("Startup"), $fileName)

Invoke-WebRequest -Uri $dropboxUrl -OutFile $startupFolder


if (Test-Path $startupFolder) {
    Write-Host "File downloaded and placed in the startup folder with the name: $fileName"
} else {
    Write-Host "Download failed."
}
