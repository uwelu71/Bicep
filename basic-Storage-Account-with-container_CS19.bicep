param namePrefix string = 'stg'
param location string = 'westeurope'
param blobContainers array = [ 
  {
    name: 'bicep'
    publicAccess: 'blob'
  }
  {
    name: 'simply'
    publicAccess: 'container'
  }
  {
    name: 'rules'
    publicAccess: 'none'
  }
]
var storageAccountName = '${namePrefix}${uniqueString(resourceGroup().id)}'

resource stg 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: toLower(storageAccountName)
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}
resource blob 'Microsoft.Storage/storageAccounts/blobServices/containers@2019-06-01' = [
  for (container, i) in blobContainers: {
    name: '${stg.name}/default/${container.name}'
    properties: {
      publicAccess: container.publicAccess
    }
  }
]


