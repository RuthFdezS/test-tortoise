USE [master]
GO
/****** Object:  Database [Expediente]    Script Date: 17/11/2018 12:56:49 a. m. ******/
CREATE DATABASE [Expediente]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Expediente', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Expediente.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Expediente_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Expediente_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Expediente] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Expediente].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Expediente] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Expediente] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Expediente] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Expediente] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Expediente] SET ARITHABORT OFF 
GO
ALTER DATABASE [Expediente] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Expediente] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Expediente] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Expediente] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Expediente] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Expediente] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Expediente] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Expediente] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Expediente] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Expediente] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Expediente] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Expediente] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Expediente] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Expediente] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Expediente] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Expediente] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Expediente] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Expediente] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Expediente] SET  MULTI_USER 
GO
ALTER DATABASE [Expediente] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Expediente] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Expediente] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Expediente] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Expediente] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Expediente] SET QUERY_STORE = OFF
GO
USE [Expediente]
GO
/****** Object:  User [admin]    Script Date: 17/11/2018 12:56:55 a. m. ******/
CREATE USER [admin] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin]
GO
/****** Object:  Table [dbo].[Expediente]    Script Date: 17/11/2018 12:56:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expediente](
	[identificacion] [varchar](50) NOT NULL,
	[promedioprueba] [varchar](50) NULL,
	[fechanacimiento] [date] NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[correoelectronico] [varchar](50) NULL,
	[genero] [varchar](50) NULL,
	[estadocivil] [varchar](50) NULL,
	[idioma] [varchar](50) NULL,
	[certificacion] [varchar](50) NULL,
	[titulo] [varchar](50) NULL,
	[ubicacion] [varchar](50) NULL,
 CONSTRAINT [PK_Expediente] PRIMARY KEY CLUSTERED 
(
	[identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfiles]    Script Date: 17/11/2018 12:56:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfiles](
	[codPerfil] [int] NOT NULL,
	[nomperfil] [varchar](50) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_Perfiles] PRIMARY KEY CLUSTERED 
(
	[codPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puesto]    Script Date: 17/11/2018 12:57:01 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puesto](
	[codpuesto] [int] NOT NULL,
	[disponibilidad] [int] NULL,
	[nombrepuesto] [varchar](50) NULL,
	[idioma] [varchar](50) NULL,
	[certificacion] [varchar](50) NULL,
	[titulo] [varchar](50) NULL,
 CONSTRAINT [PK_Puesto] PRIMARY KEY CLUSTERED 
(
	[codpuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PuestoPorExpediente]    Script Date: 17/11/2018 12:57:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PuestoPorExpediente](
	[codPuesto] [int] NOT NULL,
	[identificacion] [varchar](50) NOT NULL,
	[aproboprueba] [varchar](50) NULL,
	[promedioPruebaFinal] [float] NULL,
 CONSTRAINT [PK_PuestoPorExpediente] PRIMARY KEY CLUSTERED 
(
	[codPuesto] ASC,
	[identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 17/11/2018 12:57:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[nicknameUsuario] [varchar](20) NOT NULL,
	[nomusuario] [varchar](50) NULL,
	[pass] [varchar](15) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[nicknameUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuariosPorPerfiles]    Script Date: 17/11/2018 12:57:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuariosPorPerfiles](
	[nicknameUsuario] [varchar](20) NOT NULL,
	[codPerfil] [int] NOT NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_UsuariosPorPerfiles] PRIMARY KEY CLUSTERED 
(
	[nicknameUsuario] ASC,
	[codPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Perfiles] ADD  CONSTRAINT [DF_Perfiles_nomperfil]  DEFAULT ('Sin Asignar') FOR [nomperfil]
GO
ALTER TABLE [dbo].[Perfiles] ADD  CONSTRAINT [DF_Perfiles_activo]  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuario_activo]  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[UsuariosPorPerfiles] ADD  CONSTRAINT [DF_UsuariosPorPerfiles_activo]  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[PuestoPorExpediente]  WITH CHECK ADD  CONSTRAINT [FK_PuestoPorExpediente_Expediente] FOREIGN KEY([identificacion])
REFERENCES [dbo].[Expediente] ([identificacion])
GO
ALTER TABLE [dbo].[PuestoPorExpediente] CHECK CONSTRAINT [FK_PuestoPorExpediente_Expediente]
GO
ALTER TABLE [dbo].[PuestoPorExpediente]  WITH CHECK ADD  CONSTRAINT [FK_PuestoPorExpediente_Puesto] FOREIGN KEY([codPuesto])
REFERENCES [dbo].[Puesto] ([codpuesto])
GO
ALTER TABLE [dbo].[PuestoPorExpediente] CHECK CONSTRAINT [FK_PuestoPorExpediente_Puesto]
GO
ALTER TABLE [dbo].[UsuariosPorPerfiles]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosPorPerfiles_Perfiles] FOREIGN KEY([codPerfil])
REFERENCES [dbo].[Perfiles] ([codPerfil])
GO
ALTER TABLE [dbo].[UsuariosPorPerfiles] CHECK CONSTRAINT [FK_UsuariosPorPerfiles_Perfiles]
GO
ALTER TABLE [dbo].[UsuariosPorPerfiles]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosPorPerfiles_Usuarios] FOREIGN KEY([nicknameUsuario])
REFERENCES [dbo].[Usuarios] ([nicknameUsuario])
GO
ALTER TABLE [dbo].[UsuariosPorPerfiles] CHECK CONSTRAINT [FK_UsuariosPorPerfiles_Usuarios]
GO
/****** Object:  StoredProcedure [dbo].[pa_Actualizar_Promedio_Final_Puesto_Por_Expediente]    Script Date: 17/11/2018 12:57:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pa_Actualizar_Promedio_Final_Puesto_Por_Expediente]
@identificacion varchar(20),
@codPuesto int,
@aproboprueba varchar(50),
@promedioPruebaFinal float
as
begin
-- SET NOCOUNT ON added to prevent extra result sets from 
-- interfering with SELECT statements
    SET NOCOUNT ON;

    UPDATE PuestoPorExpediente
    SET aproboprueba = @aproboprueba, promedioPruebaFinal = @promedioPruebaFinal
    WHERE identificacion = @identificacion and codPuesto = @codPuesto
end
GO
/****** Object:  StoredProcedure [dbo].[pa_AgregarExpediente]    Script Date: 17/11/2018 12:57:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pa_AgregarExpediente]
@identificacion varchar(20),
@promedioprueba varchar(50),
@fechanacimiento date,
@nombre varchar(50),
@apellido varchar(50),
@correoelectronico varchar(50),
@genero varchar(50),
@estadocivil varchar(50),
@idioma varchar(50),
@certificacion varchar(50),
@titulo varchar(50),
@ubicacion varchar (100)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [dbo].[Expediente]
           ([identificacion]
           ,[promedioprueba]
           ,[fechanacimiento]
           ,[nombre]
           ,[apellido]
           ,[correoelectronico]
		   ,[genero]
		   ,[estadocivil]
		   ,[idioma]
		   ,[certificacion]
		   ,[titulo]
		   ,[ubicacion])
     VALUES
           (@identificacion
           ,@promedioprueba
           ,@fechanacimiento
           ,@nombre
           ,@apellido
           ,@correoelectronico
		   ,@genero
		   ,@estadocivil
		   ,@idioma
		   ,@certificacion
		   ,@titulo
		   ,@ubicacion)

END




SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[pa_AgregarPuesto]    Script Date: 17/11/2018 12:57:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pa_AgregarPuesto]
@codpuesto int,
@disponibilidad int,
@nombrepuesto varchar(50),
@idioma varchar(50),
@certificacion varchar(50),
@titulo varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [dbo].[Puesto]
           ([codpuesto]
           ,[disponibilidad]
           ,[nombrepuesto]
		   ,[idioma]
		   ,[certificacion]
		   ,[titulo])
     VALUES
           (@codpuesto
           ,@disponibilidad
           ,@nombrepuesto
		   ,@idioma
		   ,@certificacion
		   ,@titulo)
END




SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[pa_AgregarPuestoPorExpediente]    Script Date: 17/11/2018 12:57:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pa_AgregarPuestoPorExpediente]
@codPuesto int,
@identificacion varchar(50),
@aproboprueba varchar(50),
@promedioPruebaFinal float

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [dbo].[PuestoPorExpediente]
           ([codPuesto]
           ,[identificacion]
           ,[aproboprueba]
		   ,[promedioPruebaFinal])
     VALUES
           (@codPuesto
           ,@identificacion
           ,@aproboprueba
		   ,@promedioPruebaFinal)
END
GO
/****** Object:  StoredProcedure [dbo].[pa_EliminarExpediente]    Script Date: 17/11/2018 12:57:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[pa_EliminarExpediente]
@identificacion varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM Expediente
	WHERE identificacion = @identificacion

END
GO
/****** Object:  StoredProcedure [dbo].[pa_FiltroCandidatosPorPuesto]    Script Date: 17/11/2018 12:57:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pa_FiltroCandidatosPorPuesto]
@codpuesto int
as
begin

select Expediente.identificacion,Expediente.nombre, Expediente.apellido, Expediente.idioma,Expediente.certificacion, Expediente.titulo, Puesto.codpuesto,Puesto.nombrepuesto, Puesto.idioma, Puesto.certificacion,Puesto.titulo 
from Expediente  
inner join Puesto
ON (Expediente.idioma = Puesto.idioma AND Expediente.certificacion = Puesto.certificacion AND Expediente.titulo = Puesto.titulo)
where Puesto.codpuesto = @codpuesto
end 
GO
/****** Object:  StoredProcedure [dbo].[pa_ModificarExpediente]    Script Date: 17/11/2018 12:57:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[pa_ModificarExpediente]
@identificacion varchar(20),
@promedioprueba varchar(50),
@fechanacimiento date,
@nombre varchar(50),
@apellido varchar(50),
@correoelectronico varchar(50),
@genero varchar(50),
@estadocivil varchar(50),
@idioma varchar(50),
@certificacion varchar(50),
@titulo varchar(50),
@ubicacion varchar (100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Expediente SET promedioprueba = @promedioprueba, fechanacimiento = @fechanacimiento, nombre = @nombre, apellido = @apellido, correoelectronico = @correoelectronico, genero = @genero, estadocivil = @estadocivil, idioma = @idioma, certificacion = @certificacion, titulo = @titulo, ubicacion = @ubicacion
	WHERE identificacion = @identificacion

END
GO
/****** Object:  StoredProcedure [dbo].[pa_ModificarPermisosPerfil]    Script Date: 17/11/2018 12:57:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pa_ModificarPermisosPerfil]
@nicknameUsuario varchar(20),
@codPerfil int
as
begin
-- SET NOCOUNT ON added to prevent extra result sets from 
-- interfering with SELECT statements
    SET NOCOUNT ON;

    UPDATE UsuariosPorPerfiles
    SET codPerfil = @codPerfil
    WHERE nicknameUsuario = @nicknameUsuario
end
GO
/****** Object:  StoredProcedure [dbo].[pa_ObtenerExpediente]    Script Date: 17/11/2018 12:57:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[pa_ObtenerExpediente]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT identificacion, promedioprueba, fechanacimiento, nombre, apellido, correoelectronico, genero, estadocivil, idioma, certificacion, titulo, ubicacion
	FROM Expediente

END
GO
/****** Object:  StoredProcedure [dbo].[pa_ObtenerIDCodPuesto]    Script Date: 17/11/2018 12:57:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pa_ObtenerIDCodPuesto]
@identificacion varchar(50),
@codpuesto int
as
begin

select Expediente.identificacion,Expediente.idioma, Expediente.certificacion, Expediente.titulo, Puesto.codpuesto, Puesto.idioma, Puesto.certificacion,Puesto.titulo 
from Expediente  
inner join Puesto
ON Expediente.idioma = Puesto.idioma
where Expediente.identificacion = @identificacion AND Puesto.codpuesto = @codpuesto

end 
GO
/****** Object:  StoredProcedure [dbo].[pa_ObtenerNombreUsuario]    Script Date: 17/11/2018 12:57:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pa_ObtenerNombreUsuario]
@nicknameUsuario varchar(20)
as
begin

SELECT u.nomusuario
FROM Usuarios as u
    
WHERE u.nicknameUsuario = @nicknameUsuario
end
GO
/****** Object:  StoredProcedure [dbo].[pa_ObtenerPerfilesUsuario]    Script Date: 17/11/2018 12:57:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pa_ObtenerPerfilesUsuario]
@nicknameUsuario varchar(20)
as
begin

SELECT u.nicknameUsuario, p.nomperfil
FROM Usuarios u inner join UsuariosPorPerfiles uxp on u.nicknameUsuario = uxp.nicknameUsuario
                inner join Perfiles p on p.codPerfil = uxp.codPerfil
    
WHERE u.nicknameUsuario = @nicknameUsuario
end
GO
/****** Object:  StoredProcedure [dbo].[pa_ObtenerPromedioCandidatos]    Script Date: 17/11/2018 12:57:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[pa_ObtenerPromedioCandidatos]
@codpuesto int
AS
BEGIN

Select e.identificacion, p.codpuesto, pe.aproboprueba, pe.promedioPruebaFinal, p.nombrepuesto, e.nombre, e.apellido, e.correoelectronico, e.genero, e.estadocivil, e.idioma, e.certificacion, e.titulo, e.ubicacion

from Expediente as e INNER JOIN PuestoPorExpediente as pe

ON e.identificacion = pe.identificacion

INNER JOIN Puesto p

ON pe.codPuesto = p.codpuesto
where pe.codPuesto = @codpuesto
ORDER BY pe.promedioPruebaFinal DESC -- Para ordenar de mayor a menor
end 
GO
/****** Object:  StoredProcedure [dbo].[pa_ObtenerPromedioCandidatosPorPuesto]    Script Date: 17/11/2018 12:57:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[pa_ObtenerPromedioCandidatosPorPuesto]
@codPuesto int
AS
BEGIN

Select e.identificacion, p.codpuesto, pe.aproboprueba, pe.promedioPruebaFinal, p.nombrepuesto, e.nombre, e.apellido, e.correoelectronico, e.genero, e.estadocivil, e.idioma, e.certificacion, e.titulo, e.ubicacion

from Expediente as e INNER JOIN PuestoPorExpediente as pe

ON e.identificacion = pe.identificacion

INNER JOIN Puesto p

ON pe.codPuesto = p.codpuesto
where pe.codPuesto = @codPuesto
ORDER BY pe.promedioPruebaFinal DESC -- Para ordenar de mayor a menor
end 
GO
/****** Object:  StoredProcedure [dbo].[pa_ObtenerPuesto]    Script Date: 17/11/2018 12:57:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_ObtenerPuesto]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT codpuesto, disponibilidad, nombrepuesto, idioma, certificacion, titulo
	FROM Puesto

END
GO
/****** Object:  StoredProcedure [dbo].[pa_ObtenerPuestoPorExpediente]    Script Date: 17/11/2018 12:57:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_ObtenerPuestoPorExpediente]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT codpuesto, identificacion, aproboprueba, promedioprueba
	FROM PuestoPorExpediente

END
GO
/****** Object:  StoredProcedure [dbo].[pa_ObtenerUsuariosActivos]    Script Date: 17/11/2018 12:57:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[pa_ObtenerUsuariosActivos]
AS
BEGIN


Select  p.nomperfil, u.nomusuario, u.nicknameUsuario, u.activo

from Usuarios as u INNER JOIN UsuariosPorPerfiles as up

ON u.nicknameUsuario = up.nicknameUsuario

INNER JOIN Perfiles p


ON  up.codPerfil = p.codPerfil

END


GO
/****** Object:  StoredProcedure [dbo].[pa_VerificarLogin]    Script Date: 17/11/2018 12:57:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[pa_VerificarLogin]
@nicknameUsuario varchar(20),
@pass varchar(15)
as
begin

SELECT nicknameUsuario
FROM Usuarios
WHERE nicknameUsuario = @nicknameUsuario
and pass = @pass
and activo = 1

end 
GO
USE [master]
GO
ALTER DATABASE [Expediente] SET  READ_WRITE 
GO
