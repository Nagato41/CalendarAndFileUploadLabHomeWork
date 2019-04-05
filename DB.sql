USE [master]
GO
/****** Object:  Database [MyWork]    Script Date: 5/4/2019 23:44:46 ******/
CREATE DATABASE [MyWork]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyWork', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MyWork.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyWork_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MyWork_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MyWork] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyWork].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyWork] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyWork] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyWork] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyWork] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyWork] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyWork] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyWork] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyWork] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyWork] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyWork] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyWork] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyWork] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyWork] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyWork] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyWork] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyWork] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyWork] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyWork] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyWork] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyWork] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyWork] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyWork] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyWork] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyWork] SET  MULTI_USER 
GO
ALTER DATABASE [MyWork] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyWork] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyWork] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyWork] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyWork] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyWork] SET QUERY_STORE = OFF
GO
USE [MyWork]
GO
/****** Object:  Table [dbo].[My]    Script Date: 5/4/2019 23:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[My](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
	[FilePath] [varchar](250) NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_My] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[My] ON 

INSERT [dbo].[My] ([ID], [Name], [FilePath], [Date]) VALUES (1, N'asfasf', N'c.123.dd', CAST(N'2019-03-31' AS Date))
INSERT [dbo].[My] ([ID], [Name], [FilePath], [Date]) VALUES (2, N'53495890_394222108025105_1934198454003695616_n.gif', N'Upload/8b0aa4af-a742-44d3-8942-9998406b73a5.gif', CAST(N'2019-04-01' AS Date))
INSERT [dbo].[My] ([ID], [Name], [FilePath], [Date]) VALUES (3, N'53495890_394222108025105_1934198454003695616_n.gif', N'Upload/78fad152-bcaf-4d80-8133-5dd582fbe40d.gif', CAST(N'2019-04-01' AS Date))
SET IDENTITY_INSERT [dbo].[My] OFF
/****** Object:  StoredProcedure [dbo].[spInsertedFile]    Script Date: 5/4/2019 23:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertedFile]
	@Name varchar(MAX),
	@FilePath varchar(250),
	@Date Date
	
AS
BEGIN
	
	SET NOCOUNT ON;
	INSERT INTO My(Name, FilePath, Date)
	VALUES        (@Name,@FilePath,@Date)
END
GO
/****** Object:  StoredProcedure [dbo].[spUploadView]    Script Date: 5/4/2019 23:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUploadView]
@Date date

AS
BEGIN
	SET NOCOUNT ON;
	SELECT        ID, Name, Date
	FROM            My
	WHERE        (Date = @Date)
END
GO
USE [master]
GO
ALTER DATABASE [MyWork] SET  READ_WRITE 
GO
