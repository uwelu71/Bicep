param namePrefix string = 'stg'
param location string = 'eastus'
param createContainer bool = true 

var storageAccountName = '${namePrefix}${uniqueString(resourceGroup().id)}' 

resource stg 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageAccountName 
  location: location 
  kind: 'StorageV2' 
  sku: { name: 'Standard_LRS' }
  properties:{
    accessTier: 'Hot'
  }
}
resource blob 'Microsoft.Storage/storageAccounts/blobServices/containers@2019-06-01' =
 if (createContainer == true) {
  name: '${stg.name}/default/bicep'
}

output stg string = stg.name
 

