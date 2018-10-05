USE [aspnet-TS.Choosco.Admin.Web-20171203090315]
GO
/****** Object:  StoredProcedure [dbo].[p_ins_article]    Script Date: 10/5/2018 7:33:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[p_ins_article](@ID int,
							   @UniqueId uniqueidentifier,
							   @Header nvarchar(200),
							   @SubHeader nvarchar(500) = NULL,
							   @Story nvarchar(max) = NULL,
							   @ThumbImage nvarchar(200) =  NULL,
							   @MainImage nvarchar(200) = NULL,
							   @FullImage nvarchar(200) = NULL,
							   @AssignedTo nvarchar(256) = NULL,
							   @DateModified datetime = NULL,
							   @Author nvarchar(100) = NULL,
							   @Status nvarchar(1) = NULL,
							   @CreatedUser nvarchar(150) = NULL,
							   @ModifiedUsers nvarchar(max) = NULL,
							   @ReturnId int = NULL output) 
							   
As

SET NOCOUNT ON

IF @Id = 0

begin

		INSERT INTO [dbo].[Article]
           ([UniqueId]
		   ,[Header]
           ,[SubHeader]
           ,[Story]
           ,[ThumbImage]
           ,[MainImage]
           ,[FullImage]
           ,[AssignedTo]
           ,[DateModified]
           ,[Author]
           ,[Status]
           ,[CreatedUser]
           ,[ModifiedUsers])
     VALUES
           (@UniqueId,
		   @Header,
           @SubHeader,
           @Story,
           @ThumbImage,
           @MainImage,
           @FullImage,
           @AssignedTo,
           @DateModified,
           @Author,
           @Status,
           @CreatedUser,
           @ModifiedUsers)

		   SET @ReturnId=SCOPE_IDENTITY()
	end
else
	begin

		update [dbo].[Article]
		set [UniqueId] = @UniqueId,
			[Header] = @Header,
			[SubHeader] = @SubHeader,
            [Story] = @Story,
            [ThumbImage] = @ThumbImage,
            [MainImage] = @MainImage,
            [FullImage] = @FullImage,
            [AssignedTo] = @AssignedTo,
            [DateModified] = @DateModified,
            [Author] = @Author,
            [Status] = @Status,
            [CreatedUser] = @CreatedUser,
            [ModifiedUsers] = @ModifiedUsers
       where Id = @Id

	   Set @ReturnId = @Id


	 end


GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 10/5/2018 7:33:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Article]    Script Date: 10/5/2018 7:33:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[Id] [int] IDENTITY(1973,1) NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[Header] [nvarchar](200) NOT NULL,
	[SubHeader] [nvarchar](500) NULL,
	[Story] [nvarchar](max) NULL,
	[ThumbImage] [nvarchar](200) NULL,
	[MainImage] [nvarchar](200) NULL,
	[FullImage] [nvarchar](200) NULL,
	[AssignedTo] [nvarchar](256) NULL,
	[DateCreated] [timestamp] NULL,
	[DateModified] [datetime] NULL,
	[Author] [nvarchar](100) NULL,
	[Status] [nvarchar](1) NOT NULL,
	[CreatedUser] [nvarchar](150) NULL,
	[ModifiedUsers] [nvarchar](max) NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ArticleKeywords]    Script Date: 10/5/2018 7:33:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleKeywords](
	[Id] [int] NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[KeywordUniqueId] [uniqueidentifier] NOT NULL,
	[ArticleUniqueId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/5/2018 7:33:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/5/2018 7:33:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/5/2018 7:33:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/5/2018 7:33:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/5/2018 7:33:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Keywords]    Script Date: 10/5/2018 7:33:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Keywords](
	[Id] [int] NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Active] [nchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Posts]    Script Date: 10/5/2018 7:33:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1973,1) NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[Header] [nvarchar](200) NOT NULL,
	[SubHeader] [nvarchar](500) NULL,
	[Story] [nvarchar](max) NULL,
	[ThumbImage] [nvarchar](200) NULL,
	[MainImage] [nvarchar](200) NULL,
	[FullImage] [nvarchar](200) NULL,
	[AssignedTo] [nvarchar](256) NULL,
	[DateCreated] [timestamp] NULL,
	[DateModified] [datetime] NULL,
	[Author] [nvarchar](100) NULL,
	[Status] [nvarchar](1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Table]    Script Date: 10/5/2018 7:33:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table](
	[Id] [int] NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[Header] [nvarchar](200) NOT NULL,
	[SubHeader] [nvarchar](500) NULL,
	[Story] [nvarchar](max) NULL,
	[ThumbImage] [nvarchar](200) NULL,
	[MainImage] [nvarchar](200) NULL,
	[FullImage] [nvarchar](200) NULL,
	[AssignedTo] [nvarchar](256) NULL,
	[DateCreated] [timestamp] NULL,
	[DateModified] [datetime] NULL,
	[Author] [nvarchar](100) NULL,
	[Status] [nvarchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT (newid()) FOR [UniqueId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
