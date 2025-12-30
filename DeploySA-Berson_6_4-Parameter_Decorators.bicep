@metadata({
  owner: 'uwelu' 
  description: 'This Bicep template deploys a Storage Account with parameter decorators for tags and access tier.'
  version: '1.0.0' 
  applyDate: '2025-12-28'
})
param storageAccountName string
param resourceTags object = {    // tags for the storage account
   environment: 'demo'
   project: 'Mastering Bicep'
 }

@ description('Access tier for the storage account, hot or cool are allowed values.')
@allowed(['Hot', 'Cool']  ) // allowed values for the access tier
param accessTier string // access tier for the storage account 
 
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
     accessTier: accessTier
   }
 }

 output stg string = storageAccount.properties.primaryEndpoints.blob
 

