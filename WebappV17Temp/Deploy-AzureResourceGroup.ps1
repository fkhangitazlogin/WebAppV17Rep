#Login into Azure using Azure service principle 

$clientID = "4fba8a7c-f687-4c19-a175-ae3b4f985bcd"
$key = "0qGYY:*XR_.95VN9Kkm+hG2M4QXF/A8p"
$SecurePassword = $key | ConvertTo-SecureString -AsPlainText -Force
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $clientID, $SecurePassword
$tenantID = "8a4817cb-3770-402d-a466-85c895620d10"
Add-AzureRmAccount -Credential $cred -TenantId $tenantID -ServicePrincipal

# Creating New ResourceGroup for Deployment

#New-AzureRmResourceGroup -Name DotNetApps -Location "Central US"
#Checking the Poll SCM in jenkins

#Deploying web app template to azure using template

New-AzureRmResourceGroupDeployment -Name ExampleDeployment -ResourceGroupName DotNetApps `
  -TemplateFile "C:\Program Files (x86)\Jenkins\workspace\WebAppV17_Temp_Deploy\WebappV17Temp\WebSite.json" `
  -TemplateParameterFile "C:\Program Files (x86)\Jenkins\workspace\WebAppV17_Temp_Deploy\WebappV17Temp\WebSite.parameters.json"