param RgName string
param RgLocation string

targetScope='subscription'
resource resGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: RgName
  location: RgLocation
}







