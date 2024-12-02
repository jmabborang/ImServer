IF OBJECT_ID('tblSecurityKeys') IS NULL
BEGIN
    CREATE TABLE [dbo].[tblSecurityKeys](
        [Id] [int] IDENTITY(1,1) NOT NULL,
        [SecurityKey] [varchar](200) NULL,
        [Description] [varchar](200) NULL,
        [CheckSum] [varchar](200) NULL,
        [ParentId] [int] NULL,
        [Active] [int] NULL
    ) ON [PRIMARY]

	ALTER TABLE [dbo].[tblSecurityKeys] ADD  DEFAULT ((0)) FOR [Active]
END

GO
