param MigrationProjectName string
param GroupingName string
param vms array = [
  'realdevbox'
  'tainer1'
  'dc01'
]

resource azmigproj 'Microsoft.Migrate/assessmentProjects@2019-10-01' existing ={
  name: MigrationProjectName
}

resource azmiggrp 'Microsoft.Migrate/assessmentProjects/groups@2019-10-01' = {
  name: GroupingName
  parent: azmigproj
  properties: {
    groupType: 'Default'
    
  }
}

resource azassessVM 'Microsoft.Migrate/assessmentProjects/groups/assessments/assessedMachines@2019-10-01' existing = {
  name: '${MigrationProjectName}/${GroupingName}/dc01'
}

