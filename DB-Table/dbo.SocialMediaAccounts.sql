USE [FStepCommunity_prod]
GO

/****** Object:  Table [dbo].[SocialMediaAccounts]    Script Date: 13/02/2020 15:40:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SocialMediaAccounts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountName] [varchar](max) NOT NULL,
	[Link] [varchar](max) NULL,
	[AccountType] [varchar](20) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

