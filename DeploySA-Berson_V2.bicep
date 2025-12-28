param storageAccountName string = 'uwelusa001'
param location string = 'eastus'
param resourceTags object = {
   environment: 'demo'
   project: 'Mastering Bicep'
 }
 
var storageAccountSku = 'Standard_LRS' // in this exapmples Variables are used to define the SKU value and the Kind value
var storageAccountKind = 'StorageV2'



 resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
   name: storageAccountName
   location: location
   sku: {
     name: storageAccountSku
   }
   kind: storageAccountKind
   tags: resourceTags
   properties: {
     accessTier: 'Hot'
   }
 }
