# Stage Downloads
mkdir C:\bv-eventlogging\
cd C:\bv-eventlogging\

# Download GPOs
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -URI https://bvautomation.blob.core.windows.net/scripts/BV-Default-Domain-Advanced-Audit-Policy.zip -OutFile "BV-Default-Domain-Advanced-Audit-Policy.zip"


# Expand Archive
[System.Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem") > $null
[System.IO.Compression.ZipFile]::ExtractToDirectory("C:\bv-eventlogging\BV-Default-Domain-Advanced-Audit-Policy.zip", "\bv-eventlogging\BV-Default-Domain-Advanced-Audit-Policy\")


# Import and Create GPOs
Import-GPO -Path "C:\bv-eventlogging\BV-Default-Domain-Advanced-Audit-Policy\BV-Default-Domain-Advanced-Audit-Policy\BV Default Domain Controller Policy" -BackupGpoName "BV Default Domain Controller Policy" -CreateIfNeeded -TargetName "BV Default Domain Controller Policy" > $null
Import-GPO -Path "C:\bv-eventlogging\BV-Default-Domain-Advanced-Audit-Policy\BV-Default-Domain-Advanced-Audit-Policy\BV Default Domain Policy" -BackupGpoName "BV Default Domain Policy" -CreateIfNeeded -TargetName "BV Default Domain Policy" > $null

# write-host("New GPO Deployment requires linking to appropriate OU's")
write-host("Group policies have been imported for BV Default Domain Controller Policy and BV Default Domain Policy. These policies need to be linked before their settings are applied.")
