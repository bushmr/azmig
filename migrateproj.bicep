param MigrationProjectName string
param AssessmentProjectName string


resource azMigrateProj 'Microsoft.Migrate/MigrateProjects@2020-05-01' = {
  name: MigrationProjectName
  location: 'centralus'
  properties: { 
  publicNetworkAccess: 'enabled'
  }
}

// resource azAssessProj 'Microsoft.Migrate/assessmentProjects@2019-10-01' = {
//   name: AssessmentProjectName
//   location: 'centralus'
//   properties: {
//      publicNetworkAccess: 'enabled'
//      projectStatus: 'Active'
//   }
// }

resource azSrvAssess 'Microsoft.Migrate/migrateProjects/Solutions@2020-05-01' = {
  dependsOn: [
    azMigrateProj
  ]
  name: '${MigrationProjectName}/Servers-Assessment-ServersAssessment'
  properties: {
  tool: 'ServerAssessment'
  purpose: 'Assessment'
  goal: 'Servers'
  status: 'Active'
 }
}

resource azSrvDiscovery 'Microsoft.Migrate/migrateProjects/solutions@2020-05-01' = {
  dependsOn: [
    azMigrateProj
  ]
  name: '${MigrationProjectName}/Servers-Discovery-ServerDiscovery'
  properties: {
    tool: 'ServerDiscovery'
    purpose: 'Discovery'
    goal: 'Servers'
    status: 'Inactive'
  }
}

resource azSrvMigration 'Microsoft.Migrate/migrateProjects/solutions@2020-05-01' = {
  dependsOn: [
    azMigrateProj
  ]
  name: '${MigrationProjectName}/Servers-Migration-ServerMigration'
  properties: {
    tool: 'ServerMigration'
    purpose: 'Migration'
    goal: 'Servers'
    status: 'Active'
  }
}
