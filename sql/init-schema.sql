USE UpdateProgramDB
GO

--
-- The package types that detected by detection algorithm. (e.g. file header, file property, etc)
--

CREATE TABLE UpdateProgramPackageTypes
(
    -- ID
    Id SMALLINT IDENTITY(0, 1),

    -- The name of the package type.
    Name NVARCHAR(16) NOT NULL,

    -- The display name of the package type.
    DisplayName NVARCHAR(64) NOT NULL,

    PRIMARY KEY CLUSTERED (
        Id ASC
    )
) WITH (
    DATA_COMPRESSION = PAGE
)
GO

INSERT INTO UpdateProgramPackageTypes VALUES ( 'MSU', 'Microsoft Update Standalone Package (.msu)' )
INSERT INTO UpdateProgramPackageTypes VALUES ( 'MSI', 'Windows Installer Package (.msi)'  )
INSERT INTO UpdateProgramPackageTypes VALUES ( 'MSP', 'Windows Installer Patch (.msp)' )
INSERT INTO UpdateProgramPackageTypes VALUES ( 'ExeDotNet', '.NET Framework Update (.exe)' )

-- Index for Name
CREATE UNIQUE NONCLUSTERED INDEX index_Name ON UpdateProgramPackageTypes
(
    Name ASC
) INCLUDE (
	Id,
    DisplayName
) WITH (
    DATA_COMPRESSION = PAGE
)

--
-- The release types that retrieved from the 'releaseType' attribute of the 'package' element in update.mum file in the update program package file.
--

CREATE TABLE UpdateProgramPackageReleaseTypes
(
    -- ID
    Id SMALLINT IDENTITY(0, 1),

    -- The name of the release type.
    Name NVARCHAR(16) NOT NULL,

    -- The display name of the release type.
    DisplayName NVARCHAR(64) NOT NULL,

    PRIMARY KEY CLUSTERED (
        Id ASC
    )
) WITH (
    DATA_COMPRESSION = PAGE
)
GO

INSERT INTO UpdateProgramPackageReleaseTypes VALUES ( 'Hotfix', 'Hotfix' )
INSERT INTO UpdateProgramPackageReleaseTypes VALUES ( 'Update', 'Update' )
INSERT INTO UpdateProgramPackageReleaseTypes VALUES ( 'Security Update', 'Security Update' )

-- Index for Name
CREATE UNIQUE NONCLUSTERED INDEX index_Name ON UpdateProgramPackageReleaseTypes
(
    Name ASC
) INCLUDE (
	Id,
    DisplayName
) WITH (
    DATA_COMPRESSION = PAGE
)

--
-- The restart types that retrieved from the 'restart' attribute of the 'package' element in update.mum file in the update program package file.
--

CREATE TABLE UpdateProgramPackageRestartTypes
(
    -- ID
    Id SMALLINT IDENTITY(0, 1),

    -- The name of the restart type.
    Name NVARCHAR(16) NOT NULL,

    -- The display name of the restart type.
    DisplayName NVARCHAR(16) NOT NULL,

    PRIMARY KEY CLUSTERED (
        Id ASC
    )
) WITH (
    DATA_COMPRESSION = PAGE
)
GO

INSERT INTO UpdateProgramPackageRestartTypes VALUES ( 'possible', 'Possible' )

-- Index for Name
CREATE UNIQUE NONCLUSTERED INDEX index_Name ON UpdateProgramPackageRestartTypes
(
    Name ASC
) INCLUDE (
	Id,
    DisplayName
) WITH (
    DATA_COMPRESSION = PAGE
)

--
-- The architectures that retrieved from the 'processorArchitecture' attribute of the 'assemblyIdentity' element in package XML file in the update program package file.
--

CREATE TABLE UpdateProgramPackageAssemblyIdentityProcessorArchitectures
(
    -- ID
    Id SMALLINT IDENTITY(0, 1),

    -- The name of the architecture.
    Name NVARCHAR(8) NOT NULL,

    -- The display name of the architecture.
    DisplayName NVARCHAR(8) NOT NULL,

    PRIMARY KEY CLUSTERED (
        Id ASC
    )
) WITH (
    DATA_COMPRESSION = PAGE
)
GO

INSERT INTO UpdateProgramPackageAssemblyIdentityProcessorArchitectures VALUES ( 'x86', 'X86' )
INSERT INTO UpdateProgramPackageAssemblyIdentityProcessorArchitectures VALUES ( 'amd64', 'AMD64' )
INSERT INTO UpdateProgramPackageAssemblyIdentityProcessorArchitectures VALUES ( 'ia64', 'IA64' )
INSERT INTO UpdateProgramPackageAssemblyIdentityProcessorArchitectures VALUES ( 'arm', 'ARM' )

-- Index for Name
CREATE UNIQUE NONCLUSTERED INDEX index_Name ON UpdateProgramPackageAssemblyIdentityProcessorArchitectures
(
    Name ASC
) INCLUDE (
	Id,
    DisplayName
) WITH (
    DATA_COMPRESSION = PAGE
)

--
-- The applied operating systems that retrieved from the property file in the update program package file.
--

CREATE TABLE UpdateProgramPackagePropertyAppliesTos
(
    -- ID
    Id SMALLINT IDENTITY(0, 1),

    -- The name of the applied operating system.
    Name NVARCHAR(16) NOT NULL,

    -- The display name of the applied operating system.
    DisplayName NVARCHAR(64) NOT NULL,

    PRIMARY KEY CLUSTERED (
        Id ASC
    )
) WITH (
    DATA_COMPRESSION = PAGE
)
GO

INSERT INTO UpdateProgramPackagePropertyAppliesTos VALUES ( 'Windows 6.0', 'Windows 6.0 (Windows Vista)' )
INSERT INTO UpdateProgramPackagePropertyAppliesTos VALUES ( 'Windows 6.1', 'Windows 6.1 (Windows 7)' )
INSERT INTO UpdateProgramPackagePropertyAppliesTos VALUES ( 'IE11-Windows6.1', 'Windows6.1 IE11 (Windows 7)' )
INSERT INTO UpdateProgramPackagePropertyAppliesTos VALUES ( 'Windows 6.2', 'Windows 6.2 (Windows 8)' )
INSERT INTO UpdateProgramPackagePropertyAppliesTos VALUES ( 'Windows 6.3', 'Windows 6.3 (Windows 8.1)' )
INSERT INTO UpdateProgramPackagePropertyAppliesTos VALUES ( 'Windows 10.0', 'Windows 10.0 (Windows 10)' )

-- Index for Name
CREATE UNIQUE NONCLUSTERED INDEX index_Name ON UpdateProgramPackagePropertyAppliesTos
(
    Name ASC
) INCLUDE (
    Id,
    DisplayName
) WITH (
    DATA_COMPRESSION = PAGE
)

--
-- The companies that retrieved from the property file in the update program package file.
--

CREATE TABLE UpdateProgramPackagePropertyCompanies
(
    -- ID
    Id SMALLINT IDENTITY(0, 1),

    -- The name of the company.
    Name NVARCHAR(25) NOT NULL,

    -- The display name of the company.
    DisplayName NVARCHAR(25) NOT NULL,

    PRIMARY KEY CLUSTERED (
        Id ASC
    )
) WITH (
    DATA_COMPRESSION = PAGE
)
GO

INSERT INTO UpdateProgramPackagePropertyCompanies VALUES ( 'Microsoft Corporation', 'Microsoft Corporation' )

-- Index for Name
CREATE UNIQUE NONCLUSTERED INDEX index_Name ON UpdateProgramPackagePropertyCompanies
(
    Name ASC
) INCLUDE (
    Id,
    DisplayName
) WITH (
    DATA_COMPRESSION = PAGE
)

--
-- The installation types that retrieved from the property file in the update program package file.
--

CREATE TABLE UpdateProgramPackagePropertyInstallationTypes
(
    -- ID
    Id SMALLINT IDENTITY(0, 1),

    -- The name of the install type.
    Name NVARCHAR(8) NOT NULL,

    -- The display name of the install type.
    DisplayName NVARCHAR(8) NOT NULL,

    PRIMARY KEY CLUSTERED (
        Id ASC
    )
) WITH (
    DATA_COMPRESSION = PAGE
)
GO

INSERT INTO UpdateProgramPackagePropertyInstallationTypes VALUES ( 'FULL', 'Full' )

-- Index for Name
CREATE UNIQUE NONCLUSTERED INDEX index_Name ON UpdateProgramPackagePropertyInstallationTypes
(
    Name ASC
) INCLUDE (
    Id,
    DisplayName
) WITH (
    DATA_COMPRESSION = PAGE
)

--
-- The installer engines that retrieved from the property file in the update program package file.
--

CREATE TABLE UpdateProgramPackagePropertyInstallerEngines
(
    -- ID
    Id SMALLINT IDENTITY(0, 1),

    -- The name of the installer engine.
    Name NVARCHAR(40) NOT NULL,

    -- The display name of the installer engine.
    DisplayName NVARCHAR(40) NOT NULL,

    PRIMARY KEY CLUSTERED (
        Id ASC
    )
) WITH (
    DATA_COMPRESSION = PAGE
)
GO

INSERT INTO UpdateProgramPackagePropertyInstallerEngines VALUES ( 'Component Based Servicing - WUSA.exe', 'Component Based Servicing - WUSA.exe' )

-- Index for Name
CREATE UNIQUE NONCLUSTERED INDEX index_Name ON UpdateProgramPackagePropertyInstallerEngines
(
    Name ASC
) INCLUDE (
    Id,
    DisplayName
) WITH (
    DATA_COMPRESSION = PAGE
)

--
-- The languages that retrieved from the property file in the update program package file.
--

CREATE TABLE UpdateProgramPackagePropertyLanguages
(
    -- ID
    Id SMALLINT IDENTITY(0, 1),

    -- The name of the language.
    Name NVARCHAR(8) NOT NULL,

    -- The display name of the language.
    DisplayName NVARCHAR(8) NOT NULL,

    PRIMARY KEY CLUSTERED (
        Id ASC
    )
) WITH (
    DATA_COMPRESSION = PAGE
)
GO

INSERT INTO UpdateProgramPackagePropertyLanguages VALUES ( 'ALL', 'All' )

-- Index for Name
CREATE UNIQUE NONCLUSTERED INDEX index_Name ON UpdateProgramPackagePropertyLanguages
(
    Name ASC
) INCLUDE (
    Id,
    DisplayName
) WITH (
    DATA_COMPRESSION = PAGE
)

--
-- The package types that retrieved from the property file in the update program package file.
--

CREATE TABLE UpdateProgramPackagePropertyPackageTypes
(
    -- ID
    Id SMALLINT IDENTITY(0, 1),

    -- The name of the package type.
    Name NVARCHAR(16) NOT NULL,

    -- The display name of the package type.
    DisplayName NVARCHAR(16) NOT NULL,

    PRIMARY KEY CLUSTERED (
        Id ASC
    )
) WITH (
    DATA_COMPRESSION = PAGE
)
GO

INSERT INTO UpdateProgramPackagePropertyPackageTypes VALUES ( 'Hotfix', 'Hotfix' )
INSERT INTO UpdateProgramPackagePropertyPackageTypes VALUES ( 'Update', 'Update' )
INSERT INTO UpdateProgramPackagePropertyPackageTypes VALUES ( 'Security Update', 'Security Update' )

-- Index for Name
CREATE UNIQUE NONCLUSTERED INDEX index_Name ON UpdateProgramPackagePropertyPackageTypes
(
    Name ASC
) INCLUDE (
    Id,
    DisplayName
) WITH (
    DATA_COMPRESSION = PAGE
)

--
-- The architecture names that retrieved from the property file in the update program package file.
--

CREATE TABLE UpdateProgramPackagePropertyProcessorArchitectures
(
    -- ID
    Id SMALLINT IDENTITY(0, 1),

    -- The name of the architecture.
    Name NVARCHAR(8) NOT NULL,

    -- The display name of the architecture.
    DisplayName NVARCHAR(8) NOT NULL,

    PRIMARY KEY CLUSTERED (
        Id ASC
    )
) WITH (
    DATA_COMPRESSION = PAGE
)
GO

INSERT INTO UpdateProgramPackagePropertyProcessorArchitectures VALUES ( 'x86', 'X86' )
INSERT INTO UpdateProgramPackagePropertyProcessorArchitectures VALUES ( 'amd64', 'AMD64' )
INSERT INTO UpdateProgramPackagePropertyProcessorArchitectures VALUES ( 'ia64', 'IA64' )
INSERT INTO UpdateProgramPackagePropertyProcessorArchitectures VALUES ( 'arm', 'ARM' )

-- Index for Name
CREATE UNIQUE NONCLUSTERED INDEX index_Name ON UpdateProgramPackagePropertyProcessorArchitectures
(
    Name ASC
) INCLUDE (
    Id,
    DisplayName
) WITH (
    DATA_COMPRESSION = PAGE
)

--
-- The product names that retrieved from the property file in the update program package file.
--

CREATE TABLE UpdateProgramPackagePropertyProductNames
(
    -- ID
    Id SMALLINT IDENTITY(0, 1) UNIQUE,

    -- The name of the product name.
    Name NVARCHAR(16) NOT NULL,

    -- The display name of the product name.
    DisplayName NVARCHAR(64) NOT NULL,

    PRIMARY KEY CLUSTERED (
        Name ASC
    )
) WITH (
    DATA_COMPRESSION = PAGE
)
GO

INSERT INTO UpdateProgramPackagePropertyProductNames VALUES ( 'Windows 6.0', 'Windows 6.0 (Windows Vista)' )
INSERT INTO UpdateProgramPackagePropertyProductNames VALUES ( 'Windows 6.1', 'Windows 6.1 (Windows 7)' )
INSERT INTO UpdateProgramPackagePropertyProductNames VALUES ( 'IE11-Windows6.1', 'Windows 6.1 IE11 (Windows 7)' )
INSERT INTO UpdateProgramPackagePropertyProductNames VALUES ( 'Windows 6.2', 'Windows 6.2 (Windows 8)' )
INSERT INTO UpdateProgramPackagePropertyProductNames VALUES ( 'Windows 6.3', 'Windows 6.3 (Windows 8.1)' )
INSERT INTO UpdateProgramPackagePropertyProductNames VALUES ( 'Windows 10.0', 'Windows 10.0 (Windows 10)' )

--
-- The update program packages.
--

CREATE TABLE UpdateProgramPackages
(
    -- ID
    Id INT IDENTITY(0, 1) UNIQUE,

    -- The file hash of the package file.
    FileHash BINARY(20) UNIQUE NOT NULL,

    -- The file name of the package file.
    FileName NVARCHAR(256) NOT NULL,

    -- The package type of the package file.
    UpdateProgramPackageTypeId SMALLINT FOREIGN KEY REFERENCES UpdateProgramPackageTypes (Id),

    -- The KB number of the update program package that retrieved from the 'identifier' attribute of the 'package' element in update.mum file in the update program package file.
    UpdateProgramPackageKbNumber INT,

    -- The release type ID.
    UpdateProgramPackageReleaseTypeId SMALLINT FOREIGN KEY REFERENCES UpdateProgramPackageReleaseTypes (Id),

    -- The restart type ID.
    UpdateProgramPackageRestartTypeId SMALLINT FOREIGN KEY REFERENCES UpdateProgramPackageRestartTypes (Id),

    -- The name that retrieved from the 'name' attribute of the 'assemblyIdentity' element in package XML file in the update program package file.
    AssemblyIdentityName NVARCHAR(256),

    -- The version that retrieved from the 'version' attribute of the 'assemblyIdentity' element in package XML file in the update program package file.
    AssemblyIdentityVersionPart1 INT,

    -- The version that retrieved from the 'version' attribute of the 'assemblyIdentity' element in package XML file in the update program package file.
    AssemblyIdentityVersionPart2 INT,

    -- The version that retrieved from the 'version' attribute of the 'assemblyIdentity' element in package XML file in the update program package file.
    AssemblyIdentityVersionPart3 INT,

    -- The version that retrieved from the 'version' attribute of the 'assemblyIdentity' element in package XML file in the update program package file.
    AssemblyIdentityVersionPart4 INT,

    -- The language that retrieved from the 'language' attribute of the 'assemblyIdentity' element in package XML file in the update program package file.
    AssemblyIdentityLanguage NVARCHAR(64),

    -- The architecture ID.
    AssemblyIdentityProcessorArchitectureId SMALLINT FOREIGN KEY REFERENCES UpdateProgramPackageAssemblyIdentityProcessorArchitectures (Id),

    -- The publicKey token that retrieved from the 'publicKeyToken' attribute of the 'assemblyIdentity' element in package XML file in the update program package file.
    AssemblyIdentityPublicKeyToken NCHAR(16),

    -- The applicability info that retrieved from the 'ApplicabilityInfo' in the package property file.
    PropertyApplicabilityInfo NVARCHAR(256),

    -- The applies to ID.
    PropertyAppliesToId SMALLINT FOREIGN KEY REFERENCES UpdateProgramPackagePropertyAppliesTos (Id),

    -- The build date that retrieved from the 'Build Date' in the package property file.
    PropertyBuildDate DATE,

    -- The company ID.
    PropertyCompanyId SMALLINT FOREIGN KEY REFERENCES UpdateProgramPackagePropertyCompanies (Id),

    -- The file version that retrieved from the 'File Version' in the package property file.
    PropertyFileVersion SMALLINT,

    -- The installation type ID.
    PropertyInstallationTypeId SMALLINT FOREIGN KEY REFERENCES UpdateProgramPackagePropertyInstallationTypes (Id),

    -- The installation engine ID.
    PropertyInstallerEngineId SMALLINT FOREIGN KEY REFERENCES UpdateProgramPackagePropertyInstallerEngines (Id),

    -- The installer version that retrieved from the 'Installer Version' in the package property file.
    PropertyInstallerVersion NCHAR(8),

    -- The KB article number that retrieved from the 'KB Article Number' in the package property file.
    PropertyKbArticleNumber INT,

    -- The language ID.
    PropertyLanguageId SMALLINT FOREIGN KEY REFERENCES UpdateProgramPackagePropertyLanguages (Id),

    -- The package type ID.
    PropertyPackageTypeId SMALLINT FOREIGN KEY REFERENCES UpdateProgramPackagePropertyPackageTypes (Id),

    -- The processor architecture ID.
    PropertyProcessorArchitectureId SMALLINT FOREIGN KEY REFERENCES UpdateProgramPackagePropertyProcessorArchitectures (Id),

    -- The product name ID.
    PropertyProductNameId SMALLINT FOREIGN KEY REFERENCES UpdateProgramPackagePropertyProductNames (Id),

    -- The support link that retrieved from the 'Support Link' in the package property file.
    PropertySupportLink NVARCHAR(256)
) WITH (
    DATA_COMPRESSION = PAGE
)
GO

-- Index for UpdateProgramPackageKbNumber
CREATE NONCLUSTERED INDEX index_UpdateProgramPackageKbNumber ON UpdateProgramPackages
(
    UpdateProgramPackageKbNumber ASC
) INCLUDE (
    Id,
    FileHash,
    FileName
) WITH (
    DATA_COMPRESSION = PAGE
)

-- Index for AssemblyIdentityVersionPart1
CREATE NONCLUSTERED INDEX index_AssemblyIdentityVersionPart1 ON UpdateProgramPackages
(
    AssemblyIdentityVersionPart1 ASC
) INCLUDE (
    Id,
    FileHash,
    UpdateProgramPackageKbNumber,
    FileName
) WITH (
    DATA_COMPRESSION = PAGE
)

-- Index for AssemblyIdentityVersionPart2
CREATE NONCLUSTERED INDEX index_AssemblyIdentityVersionPart2 ON UpdateProgramPackages
(
    AssemblyIdentityVersionPart2 ASC
) INCLUDE (
    Id,
    FileHash,
    UpdateProgramPackageKbNumber,
    FileName
) WITH (
    DATA_COMPRESSION = PAGE
)

-- Index for FileName
CREATE NONCLUSTERED INDEX index_FileName ON UpdateProgramPackages
(
    FileName ASC
) INCLUDE (
    Id,
    FileHash,
    UpdateProgramPackageKbNumber
) WITH (
    DATA_COMPRESSION = PAGE
)

--
-- The module file types that detected by detection algorithm. (e.g. file header, file property, etc)
--

CREATE TABLE ModuleFileTypes
(
    -- ID
    Id SMALLINT IDENTITY(0, 1) UNIQUE,

    -- The name of the module file type.
    Name NVARCHAR(8) NOT NULL,

    -- The display name of the module file type.
    DisplayName NVARCHAR(32) NOT NULL,

    PRIMARY KEY CLUSTERED (
        Name ASC
    )
) WITH (
    DATA_COMPRESSION = PAGE
)
GO

INSERT INTO ModuleFileTypes VALUES ( 'exe', 'Executable File (.exe)' )

--
-- The processor architectures of module file that retrieved by detection algorithm. (e.g. file header, etc)
--

CREATE TABLE ModuleFileProcessorArchitectures
(
    -- ID
    Id SMALLINT IDENTITY(0, 1) UNIQUE,

    -- The name of the processor architecture of module file.
    Name NVARCHAR(8) NOT NULL,

    -- The display name of the processor architecture of module file.
    DisplayName NVARCHAR(8) NOT NULL,

    PRIMARY KEY CLUSTERED (
        Name ASC
    )
) WITH (
    DATA_COMPRESSION = PAGE
)
GO

INSERT INTO ModuleFileProcessorArchitectures VALUES ( 'amd64', 'AMD64' )

--
-- The module file informations.
--

CREATE TABLE ModuleFiles
(
    -- ID
    Id INT IDENTITY(0, 1) UNIQUE

) WITH (
    DATA_COMPRESSION = PAGE
)
GO

--
-- The junction table for UpdateProgramPackage table and ModuleFiles table.
--

CREATE TABLE UpdateProgramPackage_ModuleFiles
(
    -- The update program package ID.
    UpdateProgramPackageId INT FOREIGN KEY REFERENCES UpdateProgramPackages (Id),

    -- The module file ID.
    ModuleFileId INT FOREIGN KEY REFERENCES ModuleFiles (Id),

    UNIQUE CLUSTERED (
        UpdateProgramPackageId ASC,
        ModuleFileId           ASC
    )
) WITH (
    DATA_COMPRESSION = PAGE
)
GO

--
-- The processed update program package histories.
--

CREATE TABLE UpdateProgramPackageHistories
(
    -- ID
    Id INT IDENTITY(0, 1) UNIQUE,

    -- The update program package ID.
    UpdateProgramPackageId INT FOREIGN KEY REFERENCES UpdateProgramPackages (Id),

    -- The date of processed.
    ProcessedDate DATE NOT NULL,

    -- The additional data at processed.
    AdditionalData NVARCHAR(400) NOT NULL DEFAULT N''

    PRIMARY KEY CLUSTERED (
        UpdateProgramPackageId ASC
    )
) WITH (
    DATA_COMPRESSION = PAGE
)
GO

-- Index for AdditionalData
CREATE NONCLUSTERED INDEX index_AdditionalData ON UpdateProgramPackageHistories
(
    AdditionalData ASC
) INCLUDE (
    UpdateProgramPackageId,
    ProcessedDate
) WITH (
    DATA_COMPRESSION = PAGE
)

-- Index for ProcessedDate
CREATE NONCLUSTERED INDEX index_ProcessedDate ON UpdateProgramPackageHistories
(
    ProcessedDate ASC
) INCLUDE (
    UpdateProgramPackageId
) WITH (
    DATA_COMPRESSION = PAGE
)

--
-- Target file list and Process progress management table.
--

CREATE TABLE ProcessTargets
(
    -- ID
    Id INT IDENTITY(0, 1) UNIQUE,

    -- The file path to the process target file.
    FilePath NVARCHAR(4000) NOT NULL,

    -- The additional data for the process target file.
    AdditionalData NVARCHAR(400) NOT NULL DEFAULT N'',

    -- The flag for the process started.
    IsProcessStarted BIT NOT NULL DEFAULT 0,

    -- The flag for the process completed.
    IsProcessCompleted BIT NOT NULL DEFAULT 0,

    -- The timestamp when target was inserted as UTC.
    InsertedTimestampUtc DATETIME2(0) NOT NULL,

    -- The timestamp when target was started process as UTC.
    ProcessStartedTimestampUtc DATETIME2(0) NOT NULL DEFAULT '0001-01-01 00:00:00',

    -- The timestamp when target was completed process as UTC.
    ProcessCompletedTimestampUtc DATETIME2(0) NOT NULL DEFAULT '0001-01-01 00:00:00'
   
    PRIMARY KEY CLUSTERED (
        Id ASC
    )
) WITH (
    DATA_COMPRESSION = PAGE
)
GO

-- Index for IsProcessStarted and IsProcessCompleted
CREATE NONCLUSTERED INDEX index_IsProcessStarted_IsProcessCompleted ON ProcessTargets
(
    IsProcessStarted   ASC,
    IsProcessCompleted ASC
) INCLUDE (
    Id
) WITH (
    DATA_COMPRESSION = PAGE
)

-- Index for AdditionalData
CREATE NONCLUSTERED INDEX index_AdditionalData ON ProcessTargets
(
    AdditionalData ASC
) INCLUDE (
    Id,
    FilePath,
    IsProcessStarted,
    IsProcessCompleted,
    InsertedTimestampUtc,
    ProcessStartedTimestampUtc,
    ProcessCompletedTimestampUtc
) WITH (
    DATA_COMPRESSION = PAGE
)

--
-- The log classifications.
--

CREATE TABLE LogClassifications
(
    -- ID
    Id SMALLINT UNIQUE,

    -- The display name of the classification.
    DisplayName NVARCHAR(12) NOT NULL,

    PRIMARY KEY CLUSTERED (
        Id ASC
    )
) WITH (
    DATA_COMPRESSION = PAGE
)
GO

INSERT INTO LogClassifications VALUES ( 0, 'Information' )
INSERT INTO LogClassifications VALUES ( 1, 'Warning' )
INSERT INTO LogClassifications VALUES ( 2, 'Error' )
INSERT INTO LogClassifications VALUES ( 3, 'Debug' )

--
-- The application log store table.
--

CREATE TABLE Logs
(
    -- ID
    Id INT IDENTITY(0, 1) UNIQUE,

    -- The timestamp of the log record as UTC.
    TimestampUtc DATETIME2(0) NOT NULL,

    -- The source of log. 
    Source NVARCHAR(20) NOT NULL, 

    -- The classification of the log record.
    ClassificationId SMALLINT FOREIGN KEY REFERENCES LogClassifications (Id),

    -- The log message.
    Message NVARCHAR(400) NOT NULL,

    -- The log data.
    Data NVARCHAR(4000) NOT NULL DEFAULT N'',

    -- The process target ID. This may NULL, for example, the log is generated before the process target insertion. 
    ProcessTargetId INT

    PRIMARY KEY CLUSTERED (
        TimestampUtc ASC
    )
) WITH (
    DATA_COMPRESSION = PAGE
)
GO

-- Index for Source
CREATE NONCLUSTERED INDEX index_Source ON Logs
(
    Source ASC
) INCLUDE (
    Id,
    TimestampUtc,
    ClassificationId,
    Message,
    Data,
    ProcessTargetId
) WITH (
    DATA_COMPRESSION = PAGE
)

-- Index for ClassificationId
CREATE NONCLUSTERED INDEX index_ClassificationId ON Logs
(
    ClassificationId ASC
) INCLUDE (
    Id,
    TimestampUtc,
    Source,
    Message,
    Data,
    ProcessTargetId
) WITH (
    DATA_COMPRESSION = PAGE
)

-- Index for Message
CREATE NONCLUSTERED INDEX index_Message ON Logs
(
    Message ASC
) INCLUDE (
    Id,
    TimestampUtc,
    Source,
    ClassificationId,
    Data,
    ProcessTargetId
) WITH (
    DATA_COMPRESSION = PAGE
)

-- Index for ProcessTargetId
CREATE NONCLUSTERED INDEX index_ProcessTargetId ON Logs
(
    ProcessTargetId ASC
) INCLUDE (
    Id,
    TimestampUtc,
    Source,
    ClassificationId,
    Message,
    Data
) WITH (
    DATA_COMPRESSION = PAGE
)
