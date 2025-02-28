using './main.bicep'

param environmentName = 'ncc2272'
param secondaryLocation = 'eastus2'
param deploymentType = 'GlobalStandard'
param gptModelName = 'gpt-4o-mini'
param gptDeploymentCapacity = 30
param embeddingModel = 'text-embedding-ada-002'
param embeddingDeploymentCapacity = 80
param imageTag = 'latest'

