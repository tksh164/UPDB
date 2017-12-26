USE UpdateProgramDB
GO

IF OBJECT_ID(N'UpdateProgramPackage_ModuleFiles', N'U') IS NOT NULL DROP TABLE UpdateProgramPackage_ModuleFiles
GO

IF OBJECT_ID(N'Logs', N'U') IS NOT NULL DROP TABLE Logs
GO

IF OBJECT_ID(N'UpdateProgramPackageHistories', N'U') IS NOT NULL DROP TABLE UpdateProgramPackageHistories
GO

IF OBJECT_ID(N'UpdateProgramPackages', N'U') IS NOT NULL DROP TABLE UpdateProgramPackages
GO

IF OBJECT_ID(N'ModuleFiles', N'U') IS NOT NULL DROP TABLE ModuleFiles
GO

IF OBJECT_ID(N'UpdateProgramPackageTypes', N'U') IS NOT NULL DROP TABLE UpdateProgramPackageTypes
GO

IF OBJECT_ID(N'UpdateProgramPackageReleaseTypes', N'U') IS NOT NULL DROP TABLE UpdateProgramPackageReleaseTypes
GO

IF OBJECT_ID(N'UpdateProgramPackageRestartTypes', N'U') IS NOT NULL DROP TABLE UpdateProgramPackageRestartTypes
GO

IF OBJECT_ID(N'UpdateProgramPackageAssemblyIdentityProcessorArchitectures', N'U') IS NOT NULL DROP TABLE UpdateProgramPackageAssemblyIdentityProcessorArchitectures
GO

IF OBJECT_ID(N'UpdateProgramPackagePropertyAppliesTos', N'U') IS NOT NULL DROP TABLE UpdateProgramPackagePropertyAppliesTos
GO

IF OBJECT_ID(N'UpdateProgramPackagePropertyCompanies', N'U') IS NOT NULL DROP TABLE UpdateProgramPackagePropertyCompanies
GO

IF OBJECT_ID(N'UpdateProgramPackagePropertyInstallationTypes', N'U') IS NOT NULL DROP TABLE UpdateProgramPackagePropertyInstallationTypes
GO

IF OBJECT_ID(N'UpdateProgramPackagePropertyInstallerEngines', N'U') IS NOT NULL DROP TABLE UpdateProgramPackagePropertyInstallerEngines
GO

IF OBJECT_ID(N'UpdateProgramPackagePropertyLanguages', N'U') IS NOT NULL DROP TABLE UpdateProgramPackagePropertyLanguages
GO

IF OBJECT_ID(N'UpdateProgramPackagePropertyPackageTypes', N'U') IS NOT NULL DROP TABLE UpdateProgramPackagePropertyPackageTypes
GO

IF OBJECT_ID(N'UpdateProgramPackagePropertyProcessorArchitectures', N'U') IS NOT NULL DROP TABLE UpdateProgramPackagePropertyProcessorArchitectures
GO

IF OBJECT_ID(N'UpdateProgramPackagePropertyProductNames', N'U') IS NOT NULL DROP TABLE UpdateProgramPackagePropertyProductNames
GO

IF OBJECT_ID(N'ModuleFileTypes', N'U') IS NOT NULL DROP TABLE ModuleFileTypes
GO

IF OBJECT_ID(N'ModuleFileProcessorArchitectures', N'U') IS NOT NULL DROP TABLE ModuleFileProcessorArchitectures
GO

IF OBJECT_ID(N'ProcessTargets', N'U') IS NOT NULL DROP TABLE ProcessTargets
GO

IF OBJECT_ID(N'LogClassifications', N'U') IS NOT NULL DROP TABLE LogClassifications
GO
