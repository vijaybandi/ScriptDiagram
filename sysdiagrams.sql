﻿/*
When using Tool_ScriptDiagram (https://github.com/neutmute/ScriptDiagram)
SSDT throws warnings about the sysdiagram table being unknown. Placing this in your project silences the warnings.
*/
CREATE TABLE dbo.sysdiagrams
(
	name			sysname NOT NULL,
	principal_id	int NOT NULL,
	diagram_id		int IDENTITY(1,1) NOT NULL,
	[version]		int NULL,
	[definition]	varbinary(max) NULL,

	PRIMARY KEY CLUSTERED 
	(
		diagram_id ASC
	)
	,CONSTRAINT UK_principal_name UNIQUE NONCLUSTERED 
	(
		principal_id ASC
		,name ASC
	)
)
GO

EXEC sys.sp_addextendedproperty @name=N'microsoft_database_tools_support', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysdiagrams'
GO