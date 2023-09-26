param ResGroupName string 
param ResGroupLoc string
param MigProjName string
param migSvrGroupName string
param MigGroupName string
param MigAssessName string
param AssessProjName string

targetScope = 'subscription'

module resGroup 'resGroup.bicep' = {
  name: 'ResGrp'
  params: {
     RgName: ResGroupName
     RgLocation: ResGroupLoc
  }
}

module migProject 'migrateproj.bicep' = {
  dependsOn: [
    resGroup
  ]
  scope: resourceGroup(ResGroupName)
  name: 'MigProjGrp' 
  params: {
     MigrationProjectName: MigProjName
     AssessmentProjectName: AssessProjName
  }
}

module assessProject 'assessment.bicep' = {
  dependsOn: [
    migProject
  ]
  scope: resourceGroup(ResGroupName)
  name: 'AssessProj'
  params: {
    AssessmentProjectName: AssessProjName
    MigrationGroupName: MigGroupName
    MigrationAssessmentName: MigAssessName 
  }
}

module migSrvGrp 'migrategroup.bicep' = {
  dependsOn: [
    migProject
  ]
  scope: resourceGroup(ResGroupName)
  name: 'SvrGroup'
  params: {
     GroupingName: migSvrGroupName 
     MigrationProjectName: MigProjName
  }
}
