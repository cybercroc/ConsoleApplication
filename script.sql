USE [master]
GO
/****** Object:  Database [Auto3000]    Script Date: 06/17/2013 01:56:52 ******/
CREATE DATABASE [Auto3000] ON  PRIMARY 
( NAME = N'Auto3000', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.ANUJ\MSSQL\DATA\Auto3000.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Auto3000_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.ANUJ\MSSQL\DATA\Auto3000.LDF' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Auto3000] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Auto3000].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Auto3000] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Auto3000] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Auto3000] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Auto3000] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Auto3000] SET ARITHABORT OFF
GO
ALTER DATABASE [Auto3000] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Auto3000] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Auto3000] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Auto3000] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Auto3000] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Auto3000] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Auto3000] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Auto3000] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Auto3000] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Auto3000] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Auto3000] SET  DISABLE_BROKER
GO
ALTER DATABASE [Auto3000] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Auto3000] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Auto3000] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Auto3000] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Auto3000] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Auto3000] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Auto3000] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Auto3000] SET  READ_WRITE
GO
ALTER DATABASE [Auto3000] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Auto3000] SET  MULTI_USER
GO
ALTER DATABASE [Auto3000] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Auto3000] SET DB_CHAINING OFF
GO
USE [Auto3000]
GO
/****** Object:  Schema [Customer]    Script Date: 06/17/2013 01:56:52 ******/
CREATE SCHEMA [Customer] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [Admin]    Script Date: 06/17/2013 01:56:52 ******/
CREATE SCHEMA [Admin] AUTHORIZATION [dbo]
GO
/****** Object:  Table [Customer].[Feedbacks]    Script Date: 06/17/2013 01:56:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Customer].[Feedbacks](
	[FeedBackId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[FeedBack] [nvarchar](max) NULL,
	[Ratings] [int] NOT NULL,
	[IsShown] [bit] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Feedbacks] PRIMARY KEY CLUSTERED 
(
	[FeedBackId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Admin].[Announcements]    Script Date: 06/17/2013 01:56:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Admin].[Announcements](
	[AnnouncementId] [int] IDENTITY(1,1) NOT NULL,
	[ExpiryDate] [date] NULL,
	[Title] [varchar](100) NULL,
	[Description] [nvarchar](1000) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Announments] PRIMARY KEY CLUSTERED 
(
	[AnnouncementId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Admin].[ChatHistory]    Script Date: 06/17/2013 01:56:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Admin].[ChatHistory](
	[ChatId] [int] IDENTITY(1,1) NOT NULL,
	[ToUserId] [nvarchar](100) NULL,
	[FromUserId] [nvarchar](100) NULL,
	[UserName] [nvarchar](50) NULL,
	[ClientName] [nvarchar](50) NULL,
	[Message] [nvarchar](500) NULL,
	[Date] [datetime] NULL,
	[ChatConnectionID] [nvarchar](100) NULL,
 CONSTRAINT [PK_ChatHistory] PRIMARY KEY CLUSTERED 
(
	[ChatId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarInfo]    Script Date: 06/17/2013 01:56:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CarInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[voertuignr_hexon] [varchar](max) NULL,
	[voertuignr] [varchar](max) NULL,
	[voertuignr_klant] [varchar](max) NULL,
	[klantnummer] [varchar](max) NULL,
	[kenteken] [varchar](max) NULL,
	[merk] [varchar](max) NULL,
	[model] [varchar](max) NULL,
	[type] [varchar](max) NULL,
	[voertuigsoort] [varchar](max) NULL,
	[carrosserie] [varchar](max) NULL,
	[aantal_deuren] [varchar](max) NULL,
	[tellerstand] [varchar](max) NULL,
	[brandstof] [varchar](max) NULL,
	[transmissie] [varchar](max) NULL,
	[aantal_versnellingen] [varchar](max) NULL,
	[btw_marge] [varchar](max) NULL,
	[nieuw_voertuig] [varchar](max) NULL,
	[laktint] [varchar](max) NULL,
	[kleur] [varchar](max) NULL,
	[basiskleur] [varchar](max) NULL,
	[laksoort] [varchar](max) NULL,
	[bouwjaar] [varchar](max) NULL,
	[datum_deel_1] [varchar](max) NULL,
	[datum_deel_1a] [varchar](max) NULL,
	[datum_deel_1b] [varchar](max) NULL,
	[verkoopprijs_particulier] [varchar](max) NULL,
	[actieprijs] [varchar](max) NULL,
	[verkoopprijs_handel] [varchar](max) NULL,
	[apk] [varchar](max) NULL,
	[massa] [varchar](max) NULL,
	[max_trekgewicht] [varchar](max) NULL,
	[cilinder_aantal] [varchar](max) NULL,
	[cilinder_inhoud] [varchar](max) NULL,
	[vermogen_motor_kw] [varchar](max) NULL,
	[vermogen_motor_pk] [varchar](max) NULL,
	[aantal_zitplaatsen] [varchar](max) NULL,
	[bpm_bedrag] [varchar](max) NULL,
	[interieurkleur] [varchar](max) NULL,
	[bekleding] [varchar](max) NULL,
	[aantal_sleutels] [varchar](max) NULL,
	[aantal_handzenders] [varchar](max) NULL,
	[code_pas_sleutel] [varchar](max) NULL,
	[nap_weblabel] [varchar](max) NULL,
	[onderhoudsboekjes] [varchar](max) NULL,
	[locatie_voertuig] [varchar](max) NULL,
	[exportprijs] [varchar](max) NULL,
	[meeneemprijs] [varchar](max) NULL,
	[opknapkosten] [varchar](max) NULL,
	[kosten_rijklaar] [varchar](max) NULL,
	[gemiddeld_verbruik] [varchar](max) NULL,
	[schadevoertuig] [varchar](max) NULL,
	[consignatie] [varchar](max) NULL,
	[demovoertuig] [varchar](max) NULL,
	[wielbasis] [varchar](max) NULL,
	[laadvermogen] [varchar](max) NULL,
	[gvw] [varchar](max) NULL,
	[aantal_assen] [varchar](max) NULL,
	[lengte] [varchar](max) NULL,
	[breedte] [varchar](max) NULL,
	[hoogte] [varchar](max) NULL,
	[vin] [varchar](max) NULL,
	[emissieklasse] [varchar](max) NULL,
	[energielabel] [varchar](max) NULL,
	[volautomatisch] [varchar](max) NULL,
	[voortbeweging_zelfstandig] [varchar](max) NULL,
	[verplaatsing] [varchar](max) NULL,
	[bediening] [varchar](max) NULL,
	[generatorvermogen] [varchar](max) NULL,
	[compressorsoort] [varchar](max) NULL,
	[doorvoercapaciteit] [varchar](max) NULL,
	[maximale_reikwijdte] [varchar](max) NULL,
	[voedingsspanning] [varchar](max) NULL,
	[mastlengte] [varchar](max) NULL,
	[bovenarmlengte] [varchar](max) NULL,
	[rupsbandbreedte] [varchar](max) NULL,
	[laadschopinhoud] [varchar](max) NULL,
	[minimale_koeltemperatuur] [varchar](max) NULL,
	[maximale_koeltemperatuur] [varchar](max) NULL,
	[toepassingsmateriaal] [varchar](max) NULL,
	[ce_markering] [varchar](max) NULL,
	[staat_algemeen] [varchar](max) NULL,
	[staat_technischh] [varchar](max) NULL,
	[staat_optisch] [varchar](max) NULL,
	[nieuwprijs] [varchar](max) NULL,
	[netto_catalogusprijs] [varchar](max) NULL,
	[fiscale_waarde] [varchar](max) NULL,
	[bijtelling_pct] [varchar](max) NULL,
	[verkocht_datum] [varchar](max) NULL,
	[eigen_garantielabel] [varchar](max) NULL,
	[verlengd] [varchar](max) NULL,
	[verhoogd] [varchar](max) NULL,
	[assen_aangedreven] [varchar](max) NULL,
	[datum_binnenkomst] [varchar](max) NULL,
	[verhuur] [varchar](max) NULL,
	[klassieker] [varchar](max) NULL,
	[aantal_eigenaren] [varchar](max) NULL,
	[meldcode] [varchar](max) NULL,
	[land] [varchar](max) NULL,
	[topsnelheid] [varchar](max) NULL,
	[tankinhoud] [varchar](max) NULL,
	[actieradius] [varchar](max) NULL,
	[max_trekgewicht_ongeremd] [varchar](max) NULL,
	[acceleratie] [varchar](max) NULL,
	[max_dakbelasting] [varchar](max) NULL,
	[inhoud_laadruimte_banken_weggeklapt] [varchar](max) NULL,
	[verbruik_stad] [varchar](max) NULL,
	[verbruik_snelweg] [varchar](max) NULL,
	[co2_uitstoot] [varchar](max) NULL,
	[fijnstof_uitstoot] [varchar](max) NULL,
	[munteenheid] [varchar](max) NULL,
	[fabrieksgarantie_tot] [varchar](max) NULL,
	[merkgarantie] [varchar](max) NULL,
	[autotrust_garantie] [varchar](max) NULL,
	[bovag_garantie] [varchar](max) NULL,
	[garantie_maanden] [varchar](max) NULL,
	[garantie_km] [varchar](max) NULL,
	[opmerkingen_garantie] [varchar](max) NULL,
	[opmerkingen] [varchar](max) NULL,
	[opmerkingen_engels] [varchar](max) NULL,
	[opmerkingen_duits] [varchar](max) NULL,
	[opmerkingen_frans] [varchar](max) NULL,
	[opmerkingen_spaans] [varchar](max) NULL,
	[opmerkingen_portugees] [varchar](max) NULL,
	[opmerkingen_italiaans] [varchar](max) NULL,
	[opmerkingen_grieks] [varchar](max) NULL,
	[opmerkingen_russisch] [varchar](max) NULL,
	[opmerkingen_roemeens] [varchar](max) NULL,
	[opmerkingen_hongaars] [varchar](max) NULL,
	[opmerkingen_pools] [varchar](max) NULL,
	[opmerkingen_tsjechisch] [varchar](max) NULL,
	[opmerkingen_bulgaars] [varchar](max) NULL,
	[opmerkingen_kroatisch] [varchar](max) NULL,
	[opmerkingen_handel] [varchar](max) NULL,
	[opmerkingen_handel_engels] [varchar](max) NULL,
	[opmerkingen_handel_duits] [varchar](max) NULL,
	[opmerkingen_handel_frans] [varchar](max) NULL,
	[opmerkingen_handel_spaans] [varchar](max) NULL,
	[opmerkingen_handel_portugees] [varchar](max) NULL,
	[opmerkingen_handel_italiaans] [varchar](max) NULL,
	[opmerkingen_handel_grieks] [varchar](max) NULL,
	[opmerkingen_handel_russisch] [varchar](max) NULL,
	[opmerkingen_handel_roemeens] [varchar](max) NULL,
	[opmerkingen_handel_hongaars] [varchar](max) NULL,
	[opmerkingen_handel_pools] [varchar](max) NULL,
	[opmerkingen_handel_tsjechisch] [varchar](max) NULL,
	[opmerkingen_handel_bulgaars] [varchar](max) NULL,
	[opmerkingen_handel_kroatisch] [varchar](max) NULL,
	[titel] [varchar](max) NULL,
	[titel_engels] [varchar](max) NULL,
	[titel_duits] [varchar](max) NULL,
	[titel_frans] [varchar](max) NULL,
	[titel_spaans] [varchar](max) NULL,
	[titel_portugees] [varchar](max) NULL,
	[titel_italiaans] [varchar](max) NULL,
	[titel_grieks] [varchar](max) NULL,
	[titel_russisch] [varchar](max) NULL,
	[titel_roemeens] [varchar](max) NULL,
	[titel_hongaars] [varchar](max) NULL,
	[titel_pools] [varchar](max) NULL,
	[titel_tsjechisch] [varchar](max) NULL,
	[titel_bulgaars] [varchar](max) NULL,
	[titel_kroatisch] [varchar](max) NULL,
	[highlights] [varchar](max) NULL,
	[highlights_engels] [varchar](max) NULL,
	[highlights_duits] [varchar](max) NULL,
	[highlights_frans] [varchar](max) NULL,
	[highlights_spaans] [varchar](max) NULL,
	[highlights_portugees] [varchar](max) NULL,
	[highlights_italiaans] [varchar](max) NULL,
	[highlights_grieks] [varchar](max) NULL,
	[highlights_russisch] [varchar](max) NULL,
	[highlights_roemeens] [varchar](max) NULL,
	[highlights_hongaars] [varchar](max) NULL,
	[highlights_pools] [varchar](max) NULL,
	[highlights_tsjechisch] [varchar](max) NULL,
	[highlights_bulgaars] [varchar](max) NULL,
	[highlights_kroatisch] [varchar](max) NULL,
	[wegenbelasting_kwartaal] [varchar](max) NULL,
	[verkocht] [varchar](max) NULL,
	[verwacht] [varchar](max) NULL,
	[gereserveerd] [varchar](max) NULL,
	[aantal_afbeeldingen] [varchar](max) NULL,
	[videos] [varchar](max) NULL,
	[documenten] [varchar](max) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[aS_fn_Split]    Script Date: 06/17/2013 01:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create FUNCTION [dbo].[aS_fn_Split]
(
	@text varchar(8000), 
	@delimiter varchar(20)
)

RETURNS @Strings TABLE

(    

  position int IDENTITY PRIMARY KEY,

  value varchar(8000)   

)

AS

BEGIN

 

DECLARE @index int 

SET @index = -1 

 

WHILE (LEN(@text) > 0) 

  BEGIN  

    SET @index = CHARINDEX(@delimiter , @text)  

    IF (@index = 0) AND (LEN(@text) > 0)  

      BEGIN   

        INSERT INTO @Strings VALUES (@text)

          BREAK  

      END  

    IF (@index > 1)  

      BEGIN   

        INSERT INTO @Strings VALUES (LEFT(@text, @index - 1))   

        SET @text = RIGHT(@text, (LEN(@text) - @index))  

      END  

    ELSE 

      SET @text = RIGHT(@text, (LEN(@text) - @index)) 

    END

  RETURN

END
GO
/****** Object:  Table [Admin].[AppointmentTime]    Script Date: 06/17/2013 01:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Admin].[AppointmentTime](
	[dateId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[StartHours] [time](5) NULL,
	[EndHours] [time](5) NULL,
 CONSTRAINT [PK_AppointmentTime] PRIMARY KEY CLUSTERED 
(
	[dateId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Admin].[UserTypes]    Script Date: 06/17/2013 01:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Admin].[UserTypes](
	[UserTypeId] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserTypes] PRIMARY KEY CLUSTERED 
(
	[UserTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Admin].[Users]    Script Date: 06/17/2013 01:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Admin].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[UserTypeId] [int] NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Gender] [char](1) NULL,
	[Address] [nvarchar](1000) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_zoekaccessoires]    Script Date: 06/17/2013 01:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_zoekaccessoires](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[voertuignr_hexon] [varchar](50) NULL,
	[accessoire] [varchar](max) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_schade]    Script Date: 06/17/2013 01:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_schade](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[voertuignr_hexon] [varchar](50) NULL,
	[status] [varchar](max) NULL,
	[opmerkingen] [varchar](max) NULL,
	[beschadigingen] [varchar](max) NULL,
	[defecte_onderdelen] [varchar](max) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_accessoires]    Script Date: 06/17/2013 01:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_accessoires](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[voertuignr_hexon] [varchar](50) NULL,
	[accessoire] [varchar](max) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_accessoiregroepen]    Script Date: 06/17/2013 01:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_accessoiregroepen](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[voertuignr_hexon] [varchar](50) NULL,
	[Overige_accessoire] [varchar](max) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Customer].[Subjects]    Script Date: 06/17/2013 01:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Customer].[Subjects](
	[SubjectId] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Admin].[Questions]    Script Date: 06/17/2013 01:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Admin].[Questions](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](300) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Admin].[OffLineMessage]    Script Date: 06/17/2013 01:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Admin].[OffLineMessage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](80) NULL,
	[Message] [nvarchar](500) NULL,
	[ReplyMessage] [nvarchar](max) NULL,
	[IsRead] [bit] NULL,
	[SendDate] [date] NULL,
	[ReplyDate] [date] NULL,
 CONSTRAINT [PK_OffLineMessage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[InsertXMLData]    Script Date: 06/17/2013 01:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertXMLData]
@xml xml
as
begin



INSERT INTO carinfo	
	
	SELECT  A.B.value('(voertuignr_hexon)[1]', 'VARCHAR(MAX)' ) voertuignr_hexon,
        A.B.value('(voertuignr)[1]', 'VARCHAR(MAX)' ) voertuignr,
        A.B.value('(voertuignr_klant)[1]', 'VARCHAR(MAX)' ) voertuignr_klant,
        A.B.value('(klantnummer)[1]', 'VARCHAR(MAX)' ) klantnummer,
        A.B.value('(kenteken)[1]', 'VARCHAR(MAX)' ) kenteken,
        A.B.value('(merk)[1]', 'VARCHAR(MAX)' ) merk,
        A.B.value('(model)[1]', 'VARCHAR(MAX)' ) model,
        A.B.value('(type)[1]', 'VARCHAR(MAX)' ) type,
        A.B.value('(voertuigsoort)[1]', 'VARCHAR(MAX)' ) voertuigsoort,
        A.B.value('(carrosserie)[1]', 'VARCHAR(MAX)' ) carrosserie,
        A.B.value('(aantal_deuren)[1]', 'VARCHAR(MAX)' ) aantal_deuren,
        A.B.value('(tellerstand)[1]', 'VARCHAR(MAX)' ) tellerstand,
        A.B.value('(brandstof)[1]', 'VARCHAR(MAX)' ) brandstof,
        A.B.value('(transmissie)[1]', 'VARCHAR(MAX)' ) transmissie,
        A.B.value('(aantal_versnellingen)[1]', 'VARCHAR(MAX)' ) aantal_versnellingen,
        A.B.value('(btw_marge)[1]', 'VARCHAR(MAX)' ) btw_marge,
        A.B.value('(nieuw_voertuig)[1]', 'VARCHAR(MAX)' ) nieuw_voertuig,
        A.B.value('(laktint)[1]', 'VARCHAR(MAX)' ) laktint,
        A.B.value('(kleur)[1]', 'VARCHAR(MAX)' ) kleur,
        A.B.value('(basiskleur)[1]', 'VARCHAR(MAX)' ) basiskleur,
        A.B.value('(laksoort)[1]', 'VARCHAR(MAX)' ) laksoort,
        A.B.value('(bouwjaar)[1]', 'VARCHAR(MAX)' ) bouwjaar,
        A.B.value('(datum_deel_1)[1]', 'VARCHAR(MAX)' ) datum_deel_1,
        A.B.value('(datum_deel_1a)[1]', 'VARCHAR(MAX)' ) datum_deel_1a,
        A.B.value('(datum_deel_1b)[1]', 'VARCHAR(MAX)' ) datum_deel_1b,
        A.B.value('(verkoopprijs_particulier)[1]', 'VARCHAR(MAX)' ) verkoopprijs_particulier,
        A.B.value('(actieprijs)[1]', 'VARCHAR(MAX)' ) actieprijs,
        A.B.value('(verkoopprijs_handel)[1]', 'VARCHAR(MAX)' ) verkoopprijs_handel,
        A.B.value('(apk)[1]', 'VARCHAR(MAX)' ) apk,
        A.B.value('(massa)[1]', 'VARCHAR(MAX)' ) massa,
        A.B.value('(max_trekgewicht)[1]', 'VARCHAR(MAX)' ) max_trekgewicht,
        A.B.value('(cilinder_aantal)[1]', 'VARCHAR(MAX)' ) cilinder_aantal,
        A.B.value('(cilinder_inhoud)[1]', 'VARCHAR(MAX)' ) cilinder_inhoud,
        A.B.value('(vermogen_motor_kw)[1]', 'VARCHAR(MAX)' ) vermogen_motor_kw,
        A.B.value('(vermogen_motor_pk)[1]', 'VARCHAR(MAX)' ) vermogen_motor_pk,
        A.B.value('(aantal_zitplaatsen)[1]', 'VARCHAR(MAX)' ) aantal_zitplaatsen,
        A.B.value('(bpm_bedrag)[1]', 'VARCHAR(MAX)' ) bpm_bedrag,
        A.B.value('(interieurkleur)[1]', 'VARCHAR(MAX)' ) interieurkleur,
        A.B.value('(bekleding)[1]', 'VARCHAR(MAX)' ) bekleding,
         A.B.value('(aantal_sleutels)[1]', 'VARCHAR(MAX)' ) aantal_sleutels,
          A.B.value('(aantal_handzenders)[1]', 'VARCHAR(MAX)' ) aantal_handzenders,
           A.B.value('(code_pas_sleutel)[1]', 'VARCHAR(MAX)' ) code_pas_sleutel,
            A.B.value('(nap_weblabel)[1]', 'VARCHAR(MAX)' ) nap_weblabel,
             A.B.value('(onderhoudsboekjes)[1]', 'VARCHAR(MAX)' ) onderhoudsboekjes,
              A.B.value('(locatie_voertuig)[1]', 'VARCHAR(MAX)' ) locatie_voertuig,
               A.B.value('(exportprijs)[1]', 'VARCHAR(MAX)' ) exportprijs,
          A.B.value('(meeneemprijs)[1]', 'VARCHAR(MAX)' ) meeneemprijs,
           A.B.value('(opknapkosten)[1]', 'VARCHAR(MAX)' ) opknapkosten,
            A.B.value('(kosten_rijklaar)[1]', 'VARCHAR(MAX)' ) kosten_rijklaar,
             A.B.value('(gemiddeld_verbruik)[1]', 'VARCHAR(MAX)' ) gemiddeld_verbruik,
              A.B.value('(schadevoertuig)[1]', 'VARCHAR(MAX)' ) schadevoertuig,
              
               A.B.value('(consignatie)[1]', 'VARCHAR(MAX)' ) consignatie,
          A.B.value('(demovoertuig)[1]', 'VARCHAR(MAX)' ) demovoertuig,
           A.B.value('(wielbasis)[1]', 'VARCHAR(MAX)' ) wielbasis,
            A.B.value('(laadvermogen)[1]', 'VARCHAR(MAX)' ) laadvermogen,
             A.B.value('(gvw)[1]', 'VARCHAR(MAX)' ) gvw,
              A.B.value('(aantal_assen)[1]', 'VARCHAR(MAX)' ) aantal_assen,
              
               A.B.value('(lengte)[1]', 'VARCHAR(MAX)' ) lengte,
          A.B.value('(breedte)[1]', 'VARCHAR(MAX)' ) breedte,
           A.B.value('(hoogte)[1]', 'VARCHAR(MAX)' ) hoogte,
            A.B.value('(vin)[1]', 'VARCHAR(MAX)' ) vin,
             A.B.value('(emissieklasse)[1]', 'VARCHAR(MAX)' ) emissieklasse,
              A.B.value('(energielabel)[1]', 'VARCHAR(MAX)' ) energielabel,
              
               A.B.value('(volautomatisch)[1]', 'VARCHAR(MAX)' ) volautomatisch,
          A.B.value('(voortbeweging_zelfstandig)[1]', 'VARCHAR(MAX)' ) voortbeweging_zelfstandig,
           A.B.value('(verplaatsing)[1]', 'VARCHAR(MAX)' ) verplaatsing,
            A.B.value('(bediening)[1]', 'VARCHAR(MAX)' ) bediening,
             A.B.value('(generatorvermogen)[1]', 'VARCHAR(MAX)' ) generatorvermogen,
              A.B.value('(compressorsoort)[1]', 'VARCHAR(MAX)' ) compressorsoort,
              
               A.B.value('(doorvoercapaciteit)[1]', 'VARCHAR(MAX)' ) doorvoercapaciteit,
          A.B.value('(maximale_reikwijdte)[1]', 'VARCHAR(MAX)' ) maximale_reikwijdte,
           A.B.value('(voedingsspanning)[1]', 'VARCHAR(MAX)' ) voedingsspanning,
            A.B.value('(mastlengte)[1]', 'VARCHAR(MAX)' ) mastlengte,
             A.B.value('(bovenarmlengte)[1]', 'VARCHAR(MAX)' ) bovenarmlengte,
              A.B.value('(rupsbandbreedte)[1]', 'VARCHAR(MAX)' ) rupsbandbreedte,
                 A.B.value('(laadschopinhoud)[1]', 'VARCHAR(MAX)' ) laadschopinhoud,
          A.B.value('(minimale_koeltemperatuur)[1]', 'VARCHAR(MAX)' ) minimale_koeltemperatuur,
           A.B.value('(maximale_koeltemperatuur)[1]', 'VARCHAR(MAX)' ) maximale_koeltemperatuur,
            A.B.value('(toepassingsmateriaal)[1]', 'VARCHAR(MAX)' ) toepassingsmateriaal,
             A.B.value('(ce_markering)[1]', 'VARCHAR(MAX)' ) ce_markering,
              A.B.value('(staat_algemeen)[1]', 'VARCHAR(MAX)' ) staat_algemeen,
                   A.B.value('(staat_technisch)[1]', 'VARCHAR(MAX)' ) staat_technisch,
          A.B.value('(staat_optisch)[1]', 'VARCHAR(MAX)' ) staat_optisch,
           A.B.value('(nieuwprijs)[1]', 'VARCHAR(MAX)' ) nieuwprijs,
            A.B.value('(netto_catalogusprijs)[1]', 'VARCHAR(MAX)' ) netto_catalogusprijs,
             A.B.value('(fiscale_waarde)[1]', 'VARCHAR(MAX)' ) fiscale_waarde,
              A.B.value('(bijtelling_pct)[1]', 'VARCHAR(MAX)' ) bijtelling_pct,
                   A.B.value('(verkocht_datum)[1]', 'VARCHAR(MAX)' ) verkocht_datum,
          A.B.value('(eigen_garantielabel)[1]', 'VARCHAR(MAX)' ) eigen_garantielabel,
           A.B.value('(verlengd)[1]', 'VARCHAR(MAX)' ) verlengd,
            A.B.value('(verhoogd)[1]', 'VARCHAR(MAX)' ) verhoogd,
             A.B.value('(assen_aangedreven)[1]', 'VARCHAR(MAX)' ) assen_aangedreven,
              A.B.value('(datum_binnenkomst)[1]', 'VARCHAR(MAX)' ) datum_binnenkomst,
                   A.B.value('(verhuur)[1]', 'VARCHAR(MAX)' ) verhuur,
          A.B.value('(klassieker)[1]', 'VARCHAR(MAX)' ) klassieker,
           A.B.value('(aantal_eigenaren)[1]', 'VARCHAR(MAX)' ) aantal_eigenaren,
            A.B.value('(meldcode)[1]', 'VARCHAR(MAX)' ) meldcode,
             A.B.value('(land)[1]', 'VARCHAR(MAX)' ) land,
              A.B.value('(topsnelheid)[1]', 'VARCHAR(MAX)' ) topsnelheid,
                   A.B.value('(tankinhoud)[1]', 'VARCHAR(MAX)' ) tankinhoud,
          A.B.value('(actieradius)[1]', 'VARCHAR(MAX)' ) actieradius,
           A.B.value('(max_trekgewicht_ongeremd)[1]', 'VARCHAR(MAX)' ) max_trekgewicht_ongeremd,
            A.B.value('(acceleratie)[1]', 'VARCHAR(MAX)' ) acceleratie,
             A.B.value('(max_dakbelasting)[1]', 'VARCHAR(MAX)' ) max_dakbelasting,
              A.B.value('(inhoud_laadruimte_banken_weggeklapt)[1]', 'VARCHAR(MAX)' ) inhoud_laadruimte_banken_weggeklapt,
                   A.B.value('(verbruik_stad)[1]', 'VARCHAR(MAX)' ) verbruik_stad,
          A.B.value('(verbruik_snelweg)[1]', 'VARCHAR(MAX)' ) verbruik_snelweg,
           A.B.value('(co2_uitstoot)[1]', 'VARCHAR(MAX)' ) co2_uitstoot,
            A.B.value('(fijnstof_uitstoot)[1]', 'VARCHAR(MAX)' ) fijnstof_uitstoot,
             A.B.value('(munteenheid)[1]', 'VARCHAR(MAX)' ) munteenheid,
              A.B.value('(fabrieksgarantie_tot)[1]', 'VARCHAR(MAX)' ) fabrieksgarantie_tot,
                   A.B.value('(merkgarantie)[1]', 'VARCHAR(MAX)' ) merkgarantie,
          A.B.value('(autotrust_garantie)[1]', 'VARCHAR(MAX)' ) autotrust_garantie,
           A.B.value('(bovag_garantie)[1]', 'VARCHAR(MAX)' ) bovag_garantie,
            A.B.value('(garantie_maanden)[1]', 'VARCHAR(MAX)' ) garantie_maanden,
             A.B.value('(garantie_km)[1]', 'VARCHAR(MAX)' ) garantie_km,
              A.B.value('(opmerkingen_garantie)[1]', 'VARCHAR(MAX)' ) opmerkingen_garantie,
                   A.B.value('(opmerkingen)[1]', 'VARCHAR(MAX)' ) opmerkingen,
          A.B.value('(opmerkingen_engels)[1]', 'VARCHAR(MAX)' ) opmerkingen_engels,
           A.B.value('(opmerkingen_duits)[1]', 'VARCHAR(MAX)' ) opmerkingen_duits,
            A.B.value('(opmerkingen_frans)[1]', 'VARCHAR(MAX)' ) opmerkingen_frans,
             A.B.value('(opmerkingen_spaans)[1]', 'VARCHAR(MAX)' ) opmerkingen_spaans,
              A.B.value('(opmerkingen_portugees)[1]', 'VARCHAR(MAX)' ) opmerkingen_portugees,  
               A.B.value('(opmerkingen_italiaans)[1]', 'VARCHAR(MAX)' ) opmerkingen_italiaans,
           A.B.value('(opmerkingen_grieks)[1]', 'VARCHAR(MAX)' ) opmerkingen_grieks,
            A.B.value('(opmerkingen_russisch)[1]', 'VARCHAR(MAX)' ) opmerkingen_russisch,
             A.B.value('(opmerkingen_roemeens)[1]', 'VARCHAR(MAX)' ) opmerkingen_roemeens,
              A.B.value('(opmerkingen_hongaars)[1]', 'VARCHAR(MAX)' ) opmerkingen_hongaars,  
                A.B.value('(opmerkingen_pools)[1]', 'VARCHAR(MAX)' ) opmerkingen_pools,
           A.B.value('(opmerkingen_tsjechisch)[1]', 'VARCHAR(MAX)' ) opmerkingen_tsjechisch,
            A.B.value('(opmerkingen_bulgaars)[1]', 'VARCHAR(MAX)' ) opmerkingen_bulgaars,
             A.B.value('(opmerkingen_kroatisch)[1]', 'VARCHAR(MAX)' ) opmerkingen_kroatisch,
              A.B.value('(opmerkingen_handel)[1]', 'VARCHAR(MAX)' ) opmerkingen_handel,  
                A.B.value('(opmerkingen_handel_engels)[1]', 'VARCHAR(MAX)' ) opmerkingen_handel_engels,
           A.B.value('(opmerkingen_handel_duits)[1]', 'VARCHAR(MAX)' ) opmerkingen_handel_duits,
            A.B.value('(opmerkingen_handel_frans)[1]', 'VARCHAR(MAX)' ) opmerkingen_handel_frans,
             A.B.value('(opmerkingen_handel_spaans)[1]', 'VARCHAR(MAX)' ) opmerkingen_handel_spaans,
              A.B.value('(opmerkingen_handel_portugees)[1]', 'VARCHAR(MAX)' ) opmerkingen_handel_portugees,  
                A.B.value('(opmerkingen_handel_italiaans)[1]', 'VARCHAR(MAX)' ) opmerkingen_handel_italiaans,
           A.B.value('(opmerkingen_handel_grieks)[1]', 'VARCHAR(MAX)' ) opmerkingen_handel_grieks,
            A.B.value('(opmerkingen_handel_russisch)[1]', 'VARCHAR(MAX)' ) opmerkingen_handel_russisch,
             A.B.value('(opmerkingen_handel_roemeens)[1]', 'VARCHAR(MAX)' ) opmerkingen_handel_roemeens,
              A.B.value('(opmerkingen_handel_hongaars)[1]', 'VARCHAR(MAX)' ) opmerkingen_handel_hongaars,  
                A.B.value('(opmerkingen_handel_pools)[1]', 'VARCHAR(MAX)' ) opmerkingen_handel_pools,
           A.B.value('(opmerkingen_handel_tsjechisch)[1]', 'VARCHAR(MAX)' ) opmerkingen_handel_tsjechisch,
            A.B.value('(opmerkingen_handel_bulgaars)[1]', 'VARCHAR(MAX)' ) opmerkingen_handel_bulgaars,
             A.B.value('(opmerkingen_handel_kroatisch)[1]', 'VARCHAR(MAX)' ) opmerkingen_handel_kroatisch,
              A.B.value('(titel)[1]', 'VARCHAR(MAX)' ) titel,    
              A.B.value('(titel_engels)[1]', 'VARCHAR(MAX)' ) titel_engels,
           A.B.value('(titel_duits)[1]', 'VARCHAR(MAX)' ) titel_duits,
            A.B.value('(titel_frans)[1]', 'VARCHAR(MAX)' ) titel_frans,
             A.B.value('(titel_spaans)[1]', 'VARCHAR(MAX)' ) titel_spaans,
              A.B.value('(titel_portugees)[1]', 'VARCHAR(MAX)' ) titel_portugees,  
               A.B.value('(titel_italiaans)[1]', 'VARCHAR(MAX)' ) titel_italiaans,
             A.B.value('(titel_grieks)[1]', 'VARCHAR(MAX)' ) titel_grieks,
              A.B.value('(titel_russisch)[1]', 'VARCHAR(MAX)' ) titel_russisch,    
              A.B.value('(titel_roemeens)[1]', 'VARCHAR(MAX)' ) titel_roemeens,
           A.B.value('(titel_hongaars)[1]', 'VARCHAR(MAX)' ) titel_hongaars,
            A.B.value('(titel_pools)[1]', 'VARCHAR(MAX)' ) titel_pools,
             A.B.value('(titel_tsjechisch)[1]', 'VARCHAR(MAX)' ) titel_tsjechisch,
              A.B.value('(titel_bulgaars)[1]', 'VARCHAR(MAX)' ) titel_bulgaars, 
               A.B.value('(titel_kroatisch)[1]', 'VARCHAR(MAX)' ) titel_kroatisch,
             A.B.value('(highlights)[1]', 'VARCHAR(MAX)' ) highlights,
              A.B.value('(highlights_engels)[1]', 'VARCHAR(MAX)' ) highlights_engels,    
              A.B.value('(highlights_duits)[1]', 'VARCHAR(MAX)' ) highlights_duits,
           A.B.value('(highlights_frans)[1]', 'VARCHAR(MAX)' ) highlights_frans,
            A.B.value('(highlights_spaans)[1]', 'VARCHAR(MAX)' ) highlights_spaans,
             A.B.value('(highlights_portugees)[1]', 'VARCHAR(MAX)' ) highlights_portugees,
              A.B.value('(highlights_italiaans)[1]', 'VARCHAR(MAX)' ) highlights_italiaans,  
                   A.B.value('(highlights_grieks)[1]', 'VARCHAR(MAX)' ) highlights_grieks,
             A.B.value('(highlights_russisch)[1]', 'VARCHAR(MAX)' ) highlights_russisch,
              A.B.value('(highlights_roemeens)[1]', 'VARCHAR(MAX)' ) highlights_roemeens,  
                   A.B.value('(highlights_hongaars)[1]', 'VARCHAR(MAX)' ) highlights_hongaars,
             A.B.value('(highlights_pools)[1]', 'VARCHAR(MAX)' ) highlights_pools,
              A.B.value('(highlights_tsjechisch)[1]', 'VARCHAR(MAX)' ) highlights_tsjechisch,  
                   A.B.value('(highlights_bulgaars)[1]', 'VARCHAR(MAX)' ) highlights_bulgaars,
             A.B.value('(highlights_kroatisch)[1]', 'VARCHAR(MAX)' ) highlights_kroatisch,
              A.B.value('(wegenbelasting_kwartaal)[1]', 'VARCHAR(MAX)' ) wegenbelasting_kwartaal,  
                A.B.value('(verkocht)[1]', 'VARCHAR(MAX)' ) verkocht,  
                  A.B.value('(verwacht)[1]', 'VARCHAR(MAX)' ) verwacht,  
                  A.B.value('(gereserveerd)[1]', 'VARCHAR(MAX)' ) gereserveerd ,
                    A.B.value('(aantal_afbeeldingen)[1]', 'VARCHAR(MAX)' ) aantal_afbeeldingen,  
                  A.B.value('(videos)[1]', 'VARCHAR(MAX)' ) videos,  
                  A.B.value('(documenten)[1]', 'VARCHAR(MAX)' ) documenten 
FROM    @xml.nodes('voorraad/voertuig') A(B)

----------------------------------------------------------------------------------------------------------------------------------

INSERT INTO tbl_accessoires	
	
	SELECT AA1.N.value('text()[1]', 'VARCHAR(MAX)' ) voertuignr_hexon, 
	AA.N.value('text()[1]', 'VARCHAR(MAX)' ) accessoire
FROM    @xml.nodes('voorraad/voertuig') x(y)
outer apply x.y.nodes('voertuignr_hexon') as AA1(N)
outer apply x.y.nodes('accessoires/accessoire') as AA(N)

----------------------------------------------------------------------------------------------------------------------------------

INSERT INTO tbl_accessoiregroepen	
	
	SELECT  AA1.N.value('text()[1]', 'VARCHAR(MAX)' ) voertuignr_hexon,
	AA.N.value('text()[1]', 'VARCHAR(MAX)' ) accessoire
FROM    @xml.nodes('voorraad/voertuig') x(y)
outer apply x.y.nodes('voertuignr_hexon') as AA1(N)
outer apply x.y.nodes('accessoiregroepen/accessoiregroep/accessoire') as AA(N)


----------------------------------------------------------------------------------------------------------------------------------


INSERT INTO tbl_zoekaccessoires	
	
	SELECT AA1.N.value('text()[1]', 'VARCHAR(MAX)' ) voertuignr_hexon,  
	AA.N.value('text()[1]', 'VARCHAR(MAX)' ) accessoire
FROM    @xml.nodes('voorraad/voertuig') x(y)
outer apply x.y.nodes('voertuignr_hexon') as AA1(N)
outer apply x.y.nodes('zoekaccessoires/accessoire') as AA(N)


----------------------------------------------------------------------------------------------------------------------------------
INSERT INTO tbl_schade	
	
	SELECT  AA11.N.value('text()[1]', 'VARCHAR(MAX)' ) voertuignr_hexon, 
	 AA.N.value('text()[1]', 'VARCHAR(MAX)' ) status,
	AA1.N.value('text()[1]', 'VARCHAR(MAX)' ) opmerkingen,
	AA2.N.value('text()[1]', 'VARCHAR(MAX)' ) beschadigingen,
	AA3.N.value('text()[1]', 'VARCHAR(MAX)' ) defecte_onderdelen
FROM    @xml.nodes('voorraad/voertuig') x(y)
outer apply x.y.nodes('voertuignr_hexon') as AA11(N)
outer apply x.y.nodes('schade/status') as AA(N)
outer apply x.y.nodes('schade/opmerkingen') as AA1(N)
outer apply x.y.nodes('schade/beschadigingen') as AA2(N)
outer apply x.y.nodes('schade/defecte_onderdelen') as AA3(N)

----------------------------------------------------------------------------------------------------------------------------------


end
GO
/****** Object:  Table [Admin].[Appointment]    Script Date: 06/17/2013 01:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Admin].[Appointment](
	[AppointmentId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](80) NULL,
	[Comment] [nvarchar](500) NULL,
	[TimeSlot] [int] NULL,
	[SetDate] [date] NULL,
	[IsApproved] [bit] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[AppointmentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [Admin].[usp_Announcement_sel]    Script Date: 06/17/2013 01:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Gurpreet>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Admin].[usp_Announcement_sel]
(
@AnnouncementId int
)
AS
BEGIN
--[Admin].[usp_Announcement_sel] 0
if @AnnouncementId=0 begin set @AnnouncementId=null end 
	SET NOCOUNT ON;
select AnnouncementId, CONVERT(VARCHAR(10), ExpiryDate, 101)ExpiryDate, Title,IsActive, [Description] from [Admin].Announcements
where  AnnouncementId=isnull(@AnnouncementId,AnnouncementId)
END
GO
/****** Object:  StoredProcedure [Admin].[usp_Announcement_ins]    Script Date: 06/17/2013 01:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [Admin].[usp_Announcement_ins]
(
@AnnouncementId int ,
@Title varchar(100),
@Description nvarchar(max),
@Expiry nvarchar(15),
@IsActive bit
)
as 
begin

if @AnnouncementId=0
begin
Insert into [Admin].Announcements (ExpiryDate , Title, [Description],  CreatedOn,IsActive)
values                         (@Expiry,@Title, @Description ,    getdate(),@IsActive)
select cast( scope_identity() as int ) as ReturnValue
end
else
begin
update [Admin].Announcements 
set ExpiryDate =@Expiry,
 Title=@Title,
 [Description]=@Description,
 ModifiedOn=getdate(),
 IsActive=@IsActive
 where AnnouncementId=@AnnouncementId
select @AnnouncementId
end
end
GO
/****** Object:  StoredProcedure [Admin].[usp_Announcement_del]    Script Date: 06/17/2013 01:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Gurpreet>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Admin].[usp_Announcement_del]
	(
	@AnnouncementId int
	)
AS
BEGIN

delete from Admin.Announcements where AnnouncementId=@AnnouncementId
END
GO
/****** Object:  StoredProcedure [Admin].[usp_AdminUsers_del]    Script Date: 06/17/2013 01:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Gurpreet>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [Admin].[usp_AdminUsers_del]
	(
	@UserId int
	)
AS
BEGIN

delete from [Admin].Users where UserId=@UserId
END
GO
/****** Object:  StoredProcedure [Admin].[usp_AdminUser_sel]    Script Date: 06/17/2013 01:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [Admin].[usp_AdminUser_sel]
(
@UserName nvarchar(100),
@Password nvarchar(100)
)
as
begin

if exists (select 1 from Admin.Users where UserName=@UserName and [Password]=@Password)
begin
select cast(UserId as varchar(100) )+'|'+ FirstName+'|'+LastName+'|'+'UserTypeId' as  ResultVal from Admin.Users where UserName=@UserName and [Password]=@Password
end 
else
begin
select '0' as ResultVal
end
end
GO
/****** Object:  StoredProcedure [Admin].[usp_AdminUser_ins]    Script Date: 06/17/2013 01:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [Admin].[usp_AdminUser_ins]
(
@UserId int ,
@UserName nvarchar(100),
@Password nvarchar(100),
@UserTypeId int,
@FirstName nvarchar(100),
@LastName nvarchar(100),
@Email nvarchar(50),
@IsActive bit
)
as 
begin
--[Admin].[usp_AdminUser_ins] 2,'SA','AS',1,'SASAS','SASASA','ASAAS',1
if @UserId=0
begin
if not exists(select 1 from [Admin].Users where UserName=@UserName)
begin
Insert into [Admin].Users ( UserName, [Password], UserTypeId, FirstName, LastName,  Email, IsActive, CreatedOn)
values                    (@UserName,  @Password, @UserTypeId,@FirstName,@LastName,@Email, @IsActive,getdate())
select cast( scope_identity() as int ) 
end
else
begin
select 0
end
end
else
begin
if not exists(select 1 from [Admin].Users where UserName=@UserName and UserId<>@UserId)
begin
update [Admin].Users
set UserName=@UserName, UserTypeId=@UserTypeId, FirstName=@FirstName,
 LastName=@LastName,  Email=@Email, IsActive=@IsActive, ModifiedOn=getdate()
 where UserId=@UserId
select @UserId
end
else
begin
select 0
end
end
end
GO
/****** Object:  Table [Customer].[FeedbackAnswers]    Script Date: 06/17/2013 01:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Customer].[FeedbackAnswers](
	[FeedBackId] [int] NOT NULL,
	[QuestionId] [int] NOT NULL,
	[Answers] [nvarchar](max) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Customer].[Contacts]    Script Date: 06/17/2013 01:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Customer].[Contacts](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NULL,
	[LastName] [varchar](100) NULL,
	[SubjectId] [int] NULL,
	[Email] [varchar](100) NULL,
	[Phone] [varchar](30) NULL,
	[ZipCode] [varchar](10) NULL,
	[IsApproved] [bit] NULL,
	[Date] [datetime] NULL,
	[Subject] [nvarchar](100) NULL,
	[IsFinance] [bit] NULL,
	[IsTradeIn] [bit] NULL,
	[LicensePlate] [nvarchar](50) NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [Admin].[usp_ChatHistory_sel]    Script Date: 06/17/2013 01:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author: Anuj  
-- Create date: 23-05-2010  
-- Description: Get records from Admin.ChatHistory  
-- =============================================  
CREATE PROCEDURE [Admin].[usp_ChatHistory_sel] --'6efa04ad-28b7-4c40-ac91-4fe993240580' , '1'
 (  
   
    @FromUserId NVARCHAR(100),  
    @ToUserId NVARCHAR(MAX)  
 )  
AS  
BEGIN  
  
 --SET NOCOUNT ON;  
   
    SELECT ToUserId,FromUserId,[Message], UserName,ClientName FROM Admin.ChatHistory   
    WHERE (FromUserId IN(SELECT VALUE FROM [dbo].[aS_fn_Split](@ToUserId,',')) OR ToUserId IN(SELECT VALUE FROM [dbo].[aS_fn_Split](@ToUserId,',')))  
    AND (FromUserId = @FromUserId OR ToUserId = @FromUserId)  
    order by ChatConnectionID,ChatId  
      
END
GO
/****** Object:  StoredProcedure [Admin].[usp_ChatHistory_ins]    Script Date: 06/17/2013 01:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--- =============================================
-- Author:		Anuj
-- Create date: 23-05-2013
-- Description:	Insert records into chat history table
-- =============================================
CREATE PROCEDURE [Admin].[usp_ChatHistory_ins]
 (
   @ToUserId NVARCHAR(100),
   @FromUserId NVARCHAR(100),
   @Message NVARCHAR(500),
   @UserName NVARCHAR(50),
   @ClientName NVARCHAR(50),
   @ConnectionId NVARCHAR(100)
 )
AS
BEGIN
     INSERT Admin.ChatHistory(ToUserId, FromUserId, [Message], [Date], UserName, ClientName, ChatConnectionID)
     VALUES(@ToUserId, @FromUserId, @Message, GETDATE(),@UserName, @ClientName, @ConnectionId)
END
GO
/****** Object:  StoredProcedure [Admin].[usp_AppointmentTime_upd]    Script Date: 06/17/2013 01:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- =============================================
-- Author:		Anuj
-- Create date: 11-06-2013
-- Description:	Insert, update records into Admin.AppointmentTime
-- =============================================
CREATE PROCEDURE [Admin].[usp_AppointmentTime_upd]
(
  @dateId INT = NULL,
  @Date DATE,
  @StartHours Varchar(5),
  @EndHours Varchar(5)
)
AS
BEGIN
	 IF(ISNULL(@dateId,0) > 0)
	    BEGIN
	      UPDATE Admin.AppointmentTime SET [Date] = @Date, StartHours = @StartHours, EndHours = @EndHours
	      WHERE dateId = @dateId
	      SELECT @dateId
	    END
	 ELSE
		 BEGIN
		   INSERT Admin.AppointmentTime([Date], StartHours, EndHours)
		   VALUES(@Date, @StartHours, @EndHours)
		   SELECT cast( scope_identity() as int ) 
		 END   
END
GO
/****** Object:  StoredProcedure [Admin].[usp_AppointmentTime_sel]    Script Date: 06/17/2013 01:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Anuj
-- Create date: 10-06-2013
-- Description:	Get records from Admin.AppointmentTime
-- =============================================
CREATE PROCEDURE [Admin].[usp_AppointmentTime_sel]
AS
BEGIN
	SELECT dateId ,CONVERT(VARCHAR(10),[Date], 120) AS [Date], CONVERT(VARCHAR(10), StartHours) AS StartHours,
	CONVERT(VARCHAR(10), EndHours) AS endHours FROM Admin.AppointmentTime
END
--select * from truncate table Admin.AppointmentTime
GO
/****** Object:  StoredProcedure [Customer].[usp_SchduledDays_sel]    Script Date: 06/17/2013 01:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Anuj
-- Create date: 15-06-2013
-- Description:	Show scheduled days
-- =============================================
CREATE PROCEDURE [Customer].[usp_SchduledDays_sel]

AS
BEGIN
	SELECT DISTINCT([DATE]) AS datecount, CONVERT(VARCHAR(10),[Date], 120) AS [Date] FROM Admin.AppointmentTime
END
GO
/****** Object:  StoredProcedure [Admin].[usp_OffLineMessage_sel]    Script Date: 06/17/2013 01:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Anuj
-- Create date: 26-05-2013
-- Description:	Get records from Admin.OffLineMessage table
-- =============================================
CREATE PROCEDURE [Admin].[usp_OffLineMessage_sel]
(
  @Id INT  = NULL
)
AS
BEGIN
	SELECT Email, [Message], SendDate FROM Admin.OffLineMessage 
	WHERE IsRead = 0 AND Id = ISNULL(@id, id)
END
GO
/****** Object:  StoredProcedure [Admin].[usp_OffLineMessage_ins]    Script Date: 06/17/2013 01:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Anuj
-- Create date: 26-05-2013
-- Description:	Insert records into Admin.OffLineMessage
-- =============================================
CREATE PROCEDURE [Admin].[usp_OffLineMessage_ins]
(
  @Id INT,
  @Email NVARCHAR(80) = NULL,
  @Message NVARCHAR(80)= NULL,
  @ReplyMessage NVARCHAR(MAX)= NULL
)
AS
BEGIN
	IF(@Id > 0)
	BEGIN
	 UPDATE Admin.OffLineMessage SET ReplyMessage = @ReplyMessage, IsRead = 1,
	     ReplyDate = GETDATE()   WHERE Id = @Id
	END
	ELSE
	BEGIN
	 INSERT Admin.OffLineMessage(Email,[Message],[SendDate])
	 VALUES(@Email, @Message, GETDATE())
	END
END
GO
/****** Object:  StoredProcedure [Admin].[usp_Feedbacks_upd]    Script Date: 06/17/2013 01:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Admin].[usp_Feedbacks_upd]
	(
	  @FeedBackId NVARCHAR(4000),
	  @IsShown BIT
	 )
	AS
	BEGIN
		UPDATE Customer.Feedbacks SET IsShown = @IsShown WHERE FeedBackId = @FeedBackId
		select @FeedBackId
	END
GO
/****** Object:  StoredProcedure [Admin].[usp_Users_sel]    Script Date: 06/17/2013 01:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Gurpreet>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [Admin].[usp_Users_sel]
(
@UserId int
)
AS
BEGIn
if @UserId=0 begin set @UserId=null end 
	SET NOCOUNT ON;
select UserId, UserName, Password, UserTypeId, FirstName, LastName, Email, IsActive
from [Admin].Users where UserId=isnull(@UserId,UserId)
END
GO
/****** Object:  StoredProcedure [Customer].[usp_Subject_sel]    Script Date: 06/17/2013 01:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [Customer].[usp_Subject_sel]

as
begin

Select * from Customer.Subjects

end
GO
/****** Object:  StoredProcedure [Customer].[usp_ShowTimeSlots_sel]    Script Date: 06/17/2013 01:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Anuj
-- Create date: 13-06-2013
-- Description:	Show time slots at client sides from Admin.AppointmentTime
-- =============================================
CREATE PROCEDURE [Customer].[usp_ShowTimeSlots_sel] --'2013-06-15'
(
  @Date DATE,
  @TimeSlot INT = NULL
)
AS
BEGIN
	SELECT APT.dateId, CAST(APT.StartHours AS VARCHAR(20))+' - '+ CAST(APT.EndHours AS VARCHAR(20)) AS TimeSlots FROM 
	Admin.AppointmentTime APT
	WHERE APT.[DATE] = @Date AND APT.dateId NOT IN(SELECT TimeSlot FROM Admin.Appointment 
	                                               WHERE SetDate = @Date 
	            AND (@TimeSlot IS NULL OR TimeSlot <> @TimeSlot)) 
END
GO
/****** Object:  StoredProcedure [Admin].[usp_Feedbacks_sel]    Script Date: 06/17/2013 01:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
	-- Author:		<Author, Gopi>
	-- Create date: <Create Date, 29-04-2013>
	-- Description:	<Description, Get records from Customer.Feedbacks table to show on admin>
	-- =============================================
	CREATE PROCEDURE [Admin].[usp_Feedbacks_sel]
	 (
	  @FeedBackId INT = NULL
	 )
	AS
	BEGIN
		 SELECT FB.FeedBackId, FB.FeedBack, FB.Ratings, 
		  FB.IsShown AS Show, CONVERT(VARCHAR, FB.[Date], 101) AS SentDate,     
		 FBAnsw.Answers, Ques.[Description] AS Question, UserId
		 FROM Customer.Feedbacks FB INNER JOIN Customer.FeedbackAnswers FBAnsw
		 ON FB.FeedBackId = FBAnsw.FeedBackId
		 INNER JOIN 
		 Admin.Questions Ques ON FBAnsw.QuestionId = Ques.QuestionId
		 WHERE  FB.FeedBackId = ISNULL(@FeedBackId, FB.FeedBackId)
		
	END
GO
/****** Object:  StoredProcedure [Customer].[usp_Feedbacks_ins]    Script Date: 06/17/2013 01:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
	-- Author:		Gopi
	-- Create date:  27-Apr-2013
	-- Description:	Insert records into Customer.Feedbacks table
	-- =============================================
	CREATE PROCEDURE [Customer].[usp_Feedbacks_ins]
	(
	  @UserId NVARCHAR(50),
	  @FeedBack NVARCHAR(MAX),
	  @Ratings INT,
	  @QuestionId INT,
	  @Answers NVARCHAR(MAX)
	  
	 )
	AS
	BEGIN
	DECLARE @retVal INT
	DECLARE @FeedbackId INT
	BEGIN TRAN FBIns
	BEGIN TRY
		 --Insert Value into Feedback Table---
		 INSERT Customer.Feedbacks(UserId, FeedBack, Ratings, [Date])
		 VALUES(@UserId, @FeedBack, @Ratings, GETDATE())
	 
		 SET @FeedbackId = SCOPE_IDENTITY()
	    
		--- Insert Value into FeedbackAnswer Table--
		 INSERT Customer.FeedbackAnswers(FeedBackId, QuestionId, Answers)
		 VALUES(@FeedbackId, @QuestionId, @Answers)
	     
		 SELECT @retVal = 1
	     
		COMMIT TRAN  FBIns
	END TRY
	BEGIN CATCH
	 SELECT @retVal = 0
	 ROLLBACK TRAN FBIns
	END CATCH
		
	END
GO
/****** Object:  StoredProcedure [Admin].[usp_Feedbacks_Del]    Script Date: 06/17/2013 01:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Admin].[usp_Feedbacks_Del] 
(
@FeedBackId INT
)
AS
BEGIN
DECLARE @retVal INT
BEGIN TRAN
BEGIN TRY 

DELETE Customer.FeedbackAnswers WHERE FeedBackId = @FeedBackId 
DELETE Customer.Feedbacks WHERE FeedBackId = @FeedBackId

SET @retVal = 1

COMMIT TRAN	
END TRY
BEGIN CATCH
SET @retVal = 0
ROLLBACK TRAN
END CATCH
RETURN @retVal
END
GO
/****** Object:  StoredProcedure [Admin].[usp_Contacts_upd]    Script Date: 06/17/2013 01:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Admin].[usp_Contacts_upd]
(
 @ContactId INT,
 @IsApproved BIT
)
AS
BEGIN

	UPDATE Customer.Contacts SET IsApproved = @IsApproved  WHERE ContactID = @ContactId
    Select @ContactId
END
GO
/****** Object:  StoredProcedure [Admin].[usp_Contacts_sel]    Script Date: 06/17/2013 01:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
	-- Author:		Gopi
	-- Create date: 30-Apr-2013
	-- Description:	Get records from Customer.Contacts table
	-- =============================================
	CREATE PROCEDURE [Admin].[usp_Contacts_sel]
	(
	 @ContactId INT = NULL
	)
	AS
	BEGIN
		
		SELECT ContactId, Con.FirstName+ SPACE(1) +Con.LastName AS UserName,Con.Email, Con.Phone, Con.ZipCode,Con.IsApproved,
		CONVERT(VARCHAR, Con.[Date], 101) AS SentDate, Sub.SubjectName
		FROM Customer.Contacts Con INNER JOIN Customer.Subjects Sub ON Sub.SubjectId = Con.SubjectId
		WHERE Con.ContactId = ISNULL(@ContactId, Con.ContactId)
		 
	END
GO
/****** Object:  StoredProcedure [Customer].[usp_Contacts_ins]    Script Date: 06/17/2013 01:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [Customer].[usp_Contacts_ins]
(
@FirstName varchar(100),
 @LastName varchar(100),
  @Email varchar(100),
   @Phone varchar(30),
 @ZipCode  varchar(10),
   @Subject int,
   @IsFinance int,
   @IsTradeIn int,
   @LicensePlate nvarchar(50)
)
AS
BEGIN

insert into Customer.Contacts (FirstName, LastName,  Email, Phone, ZipCode, Date,SubjectId,IsFinance,IsTradeIn)

	values(@FirstName, @LastName,  @Email, @Phone, @ZipCode,  getdate(),@Subject,@IsFinance,@IsTradeIn)
END
GO
/****** Object:  StoredProcedure [Admin].[usp_Contacts_del]    Script Date: 06/17/2013 01:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gopi
-- Create date: 30-Apr-2-13
-- Description:	Delete records from Customer.Contacts table
-- =============================================
CREATE PROCEDURE [Admin].[usp_Contacts_del]
(
  @ContactId INT
)
AS
BEGIN
	DELETE Customer.Contacts WHERE ContactId = @ContactId
END
GO
/****** Object:  StoredProcedure [Admin].[usp_AppointmentTime_del]    Script Date: 06/17/2013 01:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Anuj
-- Create date: 11-06-2013
-- Description:	Delete records from  Admin.AppointmentTime
-- =============================================
CREATE PROCEDURE [Admin].[usp_AppointmentTime_del]
(
  @dateId INT
)
AS
BEGIN
    IF NOT EXISTS(SELECT COUNT(1) FROM Admin.Appointment WHERE TimeSlot = @dateId)
     BEGIN
	    DELETE Admin.AppointmentTime WHERE dateId = @dateId
	 	SELECT CAST(@dateId AS INT)
	 END 
	 ELSE
	 BEGIN
	    SELECT CAST(-99 AS INT)
	 END  
   
END
GO
/****** Object:  StoredProcedure [Admin].[usp_Appointment_upd]    Script Date: 06/17/2013 01:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Admin].[usp_Appointment_upd]
( 
  @AppointmentId INT = NULL,
  @FirstName NVARCHAR(50),
  @LastName NVARCHAR(50),
  @Email NVARCHAR(80),
  @Comment NVARCHAR(500),
  @TimeSlot INT,
  @SetDate DATE,
  @IsApproved  BIT
)
AS
BEGIN
	IF(ISNULL(@AppointmentId, 0) > 0)
	  BEGIN
	    UPDATE Admin.Appointment SET FirstName = @FirstName, LastName = @LastName,
	    Email =  @Email, Comment = @Comment, SetDate = @SetDate, IsApproved = @IsApproved
	    WHERE AppointmentId = @AppointmentId
	    SELECT CAST(@AppointmentId AS INT)
	  END
	  ELSE
	  BEGIN
	    INSERT Admin.Appointment(FirstName, LastName, Email, Comment, TimeSlot, SetDate)
	    VALUES(@FirstName, @LastName, @Email, @Comment, @TimeSlot, @SetDate)
	    SELECT CAST(SCOPE_IDENTITY() AS INT)
	  END
END
GO
/****** Object:  StoredProcedure [Admin].[usp_Appointment_sel]    Script Date: 06/17/2013 01:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Anuj
-- Create date: 14-06-2012
-- Description:	Select records from Admin.Appointment
-- =============================================
CREATE PROCEDURE [Admin].[usp_Appointment_sel]
 ( 
	@AppointmentId INT = NULL
 )
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT Appoint.AppointmentId, Appoint.FirstName, Appoint.LastName, Appoint.Email, Appoint.Comment,
	 Appoint.SetDate AS [date], Appoint.IsApproved,
	 CAST(AppointTime.StartHours AS VARCHAR(8))+' - '+ CAST(AppointTime.EndHours AS VARCHAR(8)) AS TimeSlots,
	 CONVERT(VARCHAR(10),Appoint.SetDate, 120) AS SetDate
	FROM Admin.Appointment Appoint INNER JOIN 
	Admin.AppointmentTime AppointTime ON Appoint.TimeSlot = AppointTime.dateId
	WHERE Appoint.AppointmentId = ISNULL(@AppointmentId, Appoint.AppointmentId)
    
    
END
GO
/****** Object:  StoredProcedure [Admin].[usp_Appointment_ins]    Script Date: 06/17/2013 01:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Anuj
-- Create date: 15-06-2013
-- Description:	Insert records into Admin.Appointment and Admin.AppointmentTime
-- =============================================
CREATE PROCEDURE [Admin].[usp_Appointment_ins]
(
  @Date DATE,
  @StartHours VARCHAR(5),
  @EndHours  VARCHAR(5),
  @FirstName NVARCHAR(50),
  @LastName NVARCHAR(50),
  @Email NVARCHAR(80),
  @Comment NVARCHAR(500),
  @IsApproved bit
)
AS
BEGIN
    DECLARE @dateId INT
    
	INSERT Admin.AppointmentTime([Date], StartHours, EndHours)
	VALUES(@Date, @StartHours, @EndHours)
	SET @dateId = SCOPE_IDENTITY()
	
	INSERT Admin.Appointment(FirstName, LastName, Email,Comment, TimeSlot,SetDate, IsApproved)
	VALUES(@FirstName, @LastName, @Email, @Comment, @dateId, @Date, @IsApproved)
	
	SELECT CAST(SCOPE_IDENTITY() AS INT)
	
END
GO
/****** Object:  StoredProcedure [Admin].[usp_Appointment_del]    Script Date: 06/17/2013 01:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- =============================================
-- Author:		 Anuj
-- Create date: 14-06-2013
-- Description:	Delete records from Admin.Appointment
-- =============================================
CREATE PROCEDURE [Admin].[usp_Appointment_del]
(
  @AppointmentId INT
)
AS
BEGIN
	 DELETE Admin.Appointment WHERE AppointmentId = @AppointmentId
END
GO
/****** Object:  Default [DF_Feedbacks_IsShown]    Script Date: 06/17/2013 01:56:54 ******/
ALTER TABLE [Customer].[Feedbacks] ADD  CONSTRAINT [DF_Feedbacks_IsShown]  DEFAULT ((0)) FOR [IsShown]
GO
/****** Object:  Default [DF_OffLineMessage_IsRead]    Script Date: 06/17/2013 01:56:58 ******/
ALTER TABLE [Admin].[OffLineMessage] ADD  CONSTRAINT [DF_OffLineMessage_IsRead]  DEFAULT ((0)) FOR [IsRead]
GO
/****** Object:  Default [DF_Appointment_IsApproved]    Script Date: 06/17/2013 01:57:09 ******/
ALTER TABLE [Admin].[Appointment] ADD  CONSTRAINT [DF_Appointment_IsApproved]  DEFAULT ((0)) FOR [IsApproved]
GO
/****** Object:  Default [DF_Appointment_IsActive]    Script Date: 06/17/2013 01:57:09 ******/
ALTER TABLE [Admin].[Appointment] ADD  CONSTRAINT [DF_Appointment_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_Contacts_IsApproved]    Script Date: 06/17/2013 01:57:09 ******/
ALTER TABLE [Customer].[Contacts] ADD  CONSTRAINT [DF_Contacts_IsApproved]  DEFAULT ((0)) FOR [IsApproved]
GO
/****** Object:  ForeignKey [FK_Users_Users]    Script Date: 06/17/2013 01:56:58 ******/
ALTER TABLE [Admin].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users] FOREIGN KEY([CreatedBy])
REFERENCES [Admin].[Users] ([UserId])
GO
ALTER TABLE [Admin].[Users] CHECK CONSTRAINT [FK_Users_Users]
GO
/****** Object:  ForeignKey [FK_Users_Users1]    Script Date: 06/17/2013 01:56:58 ******/
ALTER TABLE [Admin].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users1] FOREIGN KEY([ModifiedBy])
REFERENCES [Admin].[Users] ([UserId])
GO
ALTER TABLE [Admin].[Users] CHECK CONSTRAINT [FK_Users_Users1]
GO
/****** Object:  ForeignKey [FK_Appointment_AppointmentTime]    Script Date: 06/17/2013 01:57:09 ******/
ALTER TABLE [Admin].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_AppointmentTime] FOREIGN KEY([TimeSlot])
REFERENCES [Admin].[AppointmentTime] ([dateId])
GO
ALTER TABLE [Admin].[Appointment] CHECK CONSTRAINT [FK_Appointment_AppointmentTime]
GO
/****** Object:  ForeignKey [FK_FeedbackAnswers_Feedbacks]    Script Date: 06/17/2013 01:57:09 ******/
ALTER TABLE [Customer].[FeedbackAnswers]  WITH CHECK ADD  CONSTRAINT [FK_FeedbackAnswers_Feedbacks] FOREIGN KEY([FeedBackId])
REFERENCES [Customer].[Feedbacks] ([FeedBackId])
GO
ALTER TABLE [Customer].[FeedbackAnswers] CHECK CONSTRAINT [FK_FeedbackAnswers_Feedbacks]
GO
/****** Object:  ForeignKey [FK_FeedbackAnswers_Questions]    Script Date: 06/17/2013 01:57:09 ******/
ALTER TABLE [Customer].[FeedbackAnswers]  WITH CHECK ADD  CONSTRAINT [FK_FeedbackAnswers_Questions] FOREIGN KEY([QuestionId])
REFERENCES [Admin].[Questions] ([QuestionId])
GO
ALTER TABLE [Customer].[FeedbackAnswers] CHECK CONSTRAINT [FK_FeedbackAnswers_Questions]
GO
/****** Object:  ForeignKey [FK_Contacts_Subjects]    Script Date: 06/17/2013 01:57:09 ******/
ALTER TABLE [Customer].[Contacts]  WITH CHECK ADD  CONSTRAINT [FK_Contacts_Subjects] FOREIGN KEY([SubjectId])
REFERENCES [Customer].[Subjects] ([SubjectId])
GO
ALTER TABLE [Customer].[Contacts] CHECK CONSTRAINT [FK_Contacts_Subjects]
GO
