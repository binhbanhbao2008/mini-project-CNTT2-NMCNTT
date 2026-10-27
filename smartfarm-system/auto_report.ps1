
$report = ".\backup\bao-cao-su-co.txt"
$log = ".\log-he-thong.log"

# Tao thu muc backup neu chua co
New-Item -ItemType Directory -Force ".\backup" | Out-Null

# Tao tieu de bao cao
"=== BAO CAO SU CO HE THONG ===" | Set-Content $report
"Thoi gian: $(Get-Date)" | Add-Content $report

# Loc loi tu file log
if (Test-Path $log) {
    Get-Content $log |
        Select-String "CRITICAL|ERROR" |
        ForEach-Object { $_.Line } |
        Add-Content $report
} else {
    "Khong tim thay file log: $log" | Add-Content $report
}

Write-Output "Da tao bao cao tai $report"
