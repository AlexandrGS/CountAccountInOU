Приклад
.\ZvitDnipro.ps1 -SearchBaseOUs "OU=Dnipro,DC=domain,DC=com" -OutFile ".\zvit.csv"
В підрозділі домена "OU=Dnipro,DC=domain,DC=com" бере усі акаунти і експортуе їх в файл zvit.csv в поточному каталозі

Файл csv мае таки стовбчики. котрі відповідають полям акаунта в домені
"SamAccountName" - імя акаунта
"Name" - імя користувача
"Enabled" - увімкнен чи вимкнен акаунт
"Company" - Организація користувача
"Department" - відділ користувача
"Title" - посада користувача
"OfficePhone" - телефон користувача
"LastLogonDate" - коли останный раз користувач заходив
"PasswordLastSet" - коли останный раз користувач міняв пароль
