Param (
#
    $OutFile="./ZvitDnipro.csv",
#Перелік OU в домені user.zal де шукаються акаунти. Можливо через кому кілька OU
    $SearchBaseOUs="OU=Dnipro,DC=user,DC=zal"
)

[array]$ADAccounts = $()

foreach($OU in $SearchBaseOUs){

    try {
        #В наступному рядку слідкуй щоб в -Properties і в Select був однаковий перелік
        $ADAccounts += Get-ADUser -Filter * -SearchBase $OU -Properties SamAccountName,Name,Enabled,Company,Department,Title,OfficePhone,LastLogonDate,PasswordLastSet | Select SamAccountName,Name,Enabled,Company,Department,Title,OfficePhone,LastLogonDate,PasswordLastSet
    }

    catch{
        Write-Warning "Помилка при отриманні акаунтов з организації" + $OU
    }

}

Write-Host "Усього знайдено " , $ADAccounts.Count , " акаунтов в организації " , $OU

Write-Host "Експортую акаунти Дніпра в файл", $OutFile

$bOutFileIsWritable = $true

try{
    Set-Content -Path $OutFile -Value ""
}

catch{
    Write-Warning "Помилка при ініціалізації файла $OutFile чи е до нього доступ на запис ?"
    $bOutFileIsWritable = $false
}

if (-not $bOutFileIsWritable) {

    try{
        $ADAccounts | Export-CSV -Path $OutFile -Delimiter ';' -Encoding UTF8 -NoTypeInformation # -Append
    }

    catch{
        Write-Warning "Помилка при запису акаунтов в файл $OutFile"
    }

}


