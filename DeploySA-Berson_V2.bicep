param storageAccountName string
param resourceTags object = {    // tags for the storage account
   environment: 'demo'
   project: 'Mastering Bicep'
 }
 
var storageAccountSku = 'Standard_LRS' // in this exapmples Variables are used to define the SKU value and the Kind value
var storageAccountKind = 'StorageV2'
var location = resourceGroup().location // location  is provided by the  location function
var saName = toLower(storageAccountName) // make sure that the Storage account name string value is converteed to lower case


 resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
   name: saName
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
