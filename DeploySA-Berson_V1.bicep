/* Provide values for all
parameters before deplaying*/

param storageAccountName string // name of the storage account
param location string  // location of the storage account

param resourceTags object = {
  environment: 'demo'
  project: 'Mastering Bicep'

}

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  tags: resourceTags
  properties: {
    accessTier: 'Hot' // Acces tier can be Hot or Cool
  }
}
