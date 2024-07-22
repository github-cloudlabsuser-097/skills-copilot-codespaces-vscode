# Login to Azure (Uncomment if not already logged in)
# Connect-AzAccount

# Variables
$resourceGroupName = "MyResourceGroup"
$location = "East US"
$storageAccountName = "mystorageaccount$(Get-Random)"
$skuName = "Standard_LRS"

# Create a Resource Group if it doesn't exist
$resourceGroup = Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue
if (-not $resourceGroup) {
    $resourceGroup = New-AzResourceGroup -Name $resourceGroupName -Location $location
    Write-Host "Resource Group '$resourceGroupName' created in '$location'."
} else {
    Write-Host "Resource Group '$resourceGroupName' already exists in '$location'."
}

# Create the Storage Account
$storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroupName `
                                       -Name $storageAccountName `
                                       -Location $location `
                                       -SkuName $skuName `
                                       -Kind "StorageV2" `
                                       -EnableHttpsTrafficOnly $true

Write-Host "Storage Account '$storageAccountName' created."

# Optional: Retrieve and display the storage account details
$retrievedAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName
Write-Host "Storage Account Details:"
Write-Host ($retrievedAccount | Format-List | Out-String)