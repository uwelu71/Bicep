param supportsHttpsTrafficeOnbly bool = true

@minLength(3)
@maxLength(24)
param storageAccountName string

@allowed([
  'STANDARD_LRS'
  'STANDARD_GRS'
  ])
param skuName string 

@allowed([
  'eastus'
  'eastus2'
  'westus'
  'westus2'
  'centralus'
  ])
param location string 

var storageKind = 'StorageV2'

resource storageAccount 'Microsoft.Storage/storageAccounts@2025-06-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: skuName
  }
  kind: storageKind
  properties: {
    supportsHttpsTrafficOnly: supportsHttpsTrafficeOnbly
  }
}
