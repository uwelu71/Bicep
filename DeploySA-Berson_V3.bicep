param namePrefix string = 'stg02' // prefix for the storage account name
param location string = resourceGroup().location // location of the storage account
param hotAccessTier bool = true // boolean parameter to set access tier to Hot or Cool

var storageAccountName = '${namePrefix}${uniqueString(resourceGroup().id)}' // generate a unique storage account name using the prefix and resource group ID

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: toLower(storageAccountName) // ensure the storage account name is in lower case
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: hotAccessTier ? 'Hot' : 'Cool' // set access tier based on the boolean parameter
    allowBlobPublicAccess: false // disable public access to blobs
    minimumTlsVersion: 'TLS1_2' // enforce minimum TLS version 1.2 for security
  }

}
output storageAccountName string = storageAccount.name // output the name of the created storage account
output storageAccountEndpoint string = storageAccount.properties.primaryEndpoints.web // output the web endpoint of the storage account 
output storageAccountLocation string = storageAccount.location // output the location of the storage account
output storageAccountSku string = storageAccount.sku.name // output the SKU of the storage account
output storageAccountKind string = storageAccount.kind // output the Kind of the storage account
output storageAccountAccessTier string = storageAccount.properties.accessTier // output the access tier of the storage account
output resourceGroupLocation string = resourceGroup().location // output the location of the resource group
output resourceGroupName string = resourceGroup().name // output the name of the resource group
