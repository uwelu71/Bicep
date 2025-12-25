param storageAccountName string
param containerName string = 'logs'
param location string = resourceGroup().location

var tier = 'Standard_LRS'
var accessTier = 'Hot'

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: tier
  }
  kind: 'StorageV2'
  properties: {
    accessTier: accessTier
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
    supportsHttpsTrafficOnly: true
  }
}
resource blobContainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-09-01' = {
  name: '${storageAccount.name}/default/${containerName}'
  properties: {
    publicAccess: 'None'
  }
}

output containerPath string = '${storageAccount.name}/default/${containerName}'
