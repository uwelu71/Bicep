param namePrefix string = 'stg'
param location string = 'eastus'

param blobContainerNames array = [
 'bicep'
 'simply'
 'rules'
 ]



var storageAccountName = '${namePrefix}${uniqueString(resourceGroup().id)}'

resource stg 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    accessTier: 'Hot'
  }
}

resource blob 'Microsoft.Storage/storageAccounts/blobServices/containers@2019-06-01' = [
  for containerName in blobContainerNames: {
  name: '${stg.name}/default/${containerName}'
  properties: {
    publicAccess: 'None'
  }
}]

output stg string = stg.name

output blobContainers array = [for blobContainerName in blobContainerNames: blobContainerName]
output storageAccountEndpoint string = stg.properties.primaryEndpoints.blob
output storageAccountLocation string = stg.location
output storageAccountSku string = stg.sku.name
