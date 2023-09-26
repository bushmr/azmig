param MigrationGroupName string
param MigrationAssessmentName string
param AssessmentProjectName string 

resource azmigproj 'Microsoft.Migrate/assessmentProjects@2019-10-01' existing = {
  name: AssessmentProjectName
}

resource azmiggrp1 'Microsoft.Migrate/assessmentProjects/groups@2019-10-01' = {
  name: MigrationGroupName
  parent: azmigproj
}
resource azmigasmnt1 'Microsoft.Migrate/assessmentProjects/groups/assessments@2019-10-01' = {
  name: MigrationAssessmentName
  parent: azmiggrp1
  properties: {
    azureDiskType: 'Premium'
    azureHybridUseBenefit: 'No'
    azureLocation: 'EastUs'
    azureOfferCode: 'MSAZR0003P'
    azurePricingTier: 'Standard'
    azureStorageRedundancy: 'LocallyRedundant'
    azureVmFamilies: [
      'Basic_A0_A4','Standard_A0_A7','Av2_series','D_series','Dv2_series','Dav4_series','Ddv4_series','Ddv5_series','Dv3_series','Dv4_series','Dv5_series','DC_series','Dv2_series','Ev5_series','Eav4_series','Edv5_series','Edv4_series','Ev3_series','Ev4_series','F_series','H_series','Dadsv5_series','Dasv4_series','Dasv5_series','Ddsv4_series','Ddsv5_series','Dsv3_series','Dsv4_series','Dsv5_series','DS_series','DSv2_series','Edsv5_series','Esv5_series','Eadsv5_series','Easv4_series','Easv5_series','Ebdsv5_series','Ebsv5_series','Edsv4_series','Esv3_series','Esv4_series','M_series','Mdsv2_series','Msv2_series','Mv2_series','Fs_series','Fsv2_series','Lsv2_series'
    ]
    currency: 'USD'
    discountPercentage: 0
    percentile: 'Percentile95'
    reservedInstance: 'None'
    scalingFactor: 1
    sizingCriterion: 'PerformanceBased'
    stage: 'InProgress'
    timeRange: 'Week'
    vmUptime: {
      daysPerMonth: 31
      hoursPerDay: 24
    }
  }
}

