resource virtualNetwork 'Microsoft.Network/virtualNetworks@2025-01-01'= {
  name: 'vnet-uludemo-01'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.1.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'subnet-uludemo00'
        properties: {
          addressPrefix: '10.1.0.0/24'
        }
      }
      {
        name: 'subnet-uludemo01'
        properties:{
          addressPrefix: '10.1.1.0/24'
        }
      }
      {
        name: 'subnet-uludemo02'
        properties:{
          addressPrefix: '10.1.2.0/24'
        }
      }       
    ]
  }
}
