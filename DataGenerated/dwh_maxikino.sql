USE master -- be sure that you're not on MYDB
ALTER DATABASE maxikino SET SINGLE_USER WITH ROLLBACK IMMEDIATE
DROP DATABASE maxikino
GO
CREATE DATABASE [maxikino]
GO
USE [maxikino]
GO
CREATE TABLE [dbo].[Bilet](
	[ID_biletu] int IDENTITY(1,1),
	[Rodzaj] [varchar](20) NULL,
	[Technologia] [varchar](20) NULL,
 CONSTRAINT [Bilet_PK] PRIMARY KEY CLUSTERED 
(
	[ID_biletu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Czas](
	[ID_czasu] int IDENTITY(1,1),
	[Godzina] [varchar](5) NULL,
	[PoraDnia] [varchar](20) NULL,
 CONSTRAINT [Czas_PK] PRIMARY KEY CLUSTERED 
(
	[ID_czasu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Data](
	[ID_daty] int IDENTITY(1,1),
	[Data] [date] NULL,
	[Rok] [numeric](28, 0) NULL,
	[Miesiac] [varchar](20) NULL,
	[DzienTygodnia] [varchar](20) NULL,
	[PoraRoku] [varchar](20) NULL,
	[Swieto] [varchar](20) NULL,
	[RodzajDnia] [varchar](20) NULL,
 CONSTRAINT [Data_PK] PRIMARY KEY CLUSTERED 
(
	[ID_daty] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Data_miesieczna](
	[ID_daty_miesiecznej] int IDENTITY(1,1),
	[Miesiac] [varchar](20) NULL,
	[Rok] [numeric](28, 0) NULL,
 CONSTRAINT [Data_miesieczna_PK] PRIMARY KEY CLUSTERED 
(
	[ID_daty_miesiecznej] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Dystrybucja](
	[Dystrybutor_ID_dystrybutora] int NOT NULL,
	[Film_ID_filmu] int NOT NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Dystrybutor](
	[ID_dystrybutora] int IDENTITY(1,1),
	[Nazwa] [varchar](20) NULL,
 CONSTRAINT [Dystrybutor_PK] PRIMARY KEY CLUSTERED 
(
	[ID_dystrybutora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Film](
	[ID_filmu] int IDENTITY(1,1),
	[Tytul] [varchar](60) NULL,
	[Gatunek] [varchar](20) NULL,
	[RokPremiery] [numeric](4, 0) NULL,
 CONSTRAINT [Film_PK] PRIMARY KEY CLUSTERED 
(
	[ID_filmu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Kino](
	[ID_kina] int IDENTITY(1,1),
	[Nazwa] [varchar](30) NULL,
	[Miasto] [varchar](30) NULL,
 CONSTRAINT [Kino_PK] PRIMARY KEY CLUSTERED 
(
	[ID_kina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Pracownik](
	[ID_pracownika] int IDENTITY(1,1),
	[PESEL] [varchar](11) NULL,
	[ImieINazwisko] [varchar](50) NULL,
	[Aktualnosc] [bit] NOT NULL,
	[Pracownik_ID_szefa] int NULL,
	[Kino_ID_kina] int NOT NULL,
 CONSTRAINT [Pracownik_PK] PRIMARY KEY CLUSTERED 
(
	[ID_pracownika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Raport_reklamowy](
	[ID_raportu] int IDENTITY(1,1),
	[CzasAntenowyReklamTelewizyjnych] [numeric](18, 0) NULL,
	[CzasAntenowyReklamRadiowych] [numeric](18, 0) NULL,
	[LiczbaWystapienWPrasie] [numeric](28, 0) NULL,
	[SzacowanyKosztReklam] [numeric](28, 0) NULL,
	[Data_miesieczna_ID_daty_miesiecznej] int NOT NULL,
	[Film_ID_filmu] int NOT NULL,
 CONSTRAINT [Raport_reklamowy_PK] PRIMARY KEY CLUSTERED 
(
	[ID_raportu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Rezyser](
	[ID_rezysera] int IDENTITY(1,1),
	[ImieINazwisko] [varchar](50) NULL,
 CONSTRAINT [Rezyser_PK] PRIMARY KEY CLUSTERED 
(
	[ID_rezysera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Rezyseria](
	[Rezyser_ID_rezysera] int NOT NULL,
	[Film_ID_filmu] int NOT NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Sala](
	[ID_sali] int IDENTITY(1,1),
	[Numer_sali] varchar(20) NULL,
	[Kino_ID_kina] int NOT NULL,
 CONSTRAINT [Sala_PK] PRIMARY KEY CLUSTERED 
(
	[ID_sali] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Junk](
	[ID_junk] int IDENTITY(1,1),
	[Informacje] VARCHAR(20) NULL,
 CONSTRAINT [Junk_PK] PRIMARY KEY CLUSTERED 
(
	[ID_junk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Sprzedaz_biletu](
	[Ilosc] numeric(28, 0) null,
	[CenaKupna] [decimal](28, 0) NULL,
	[Numer_seansu] NUMERIC(28, 0) NULL,
	[Zapelnienie] NUMERIC(28, 4) NULL,
	[Godzina_seansu] int NOT NULL,
	[Data_seansu] int NOT NULL,
	[Czas_sprzedazy] int NOT NULL,
	[Data_Sprzedazy] int NOT NULL,
	[Pracownik_ID_pracownika] int NOT NULL,
	[Bilet_ID_biletu] int NOT NULL,
	[Sala_ID_sali] int NOT NULL,
	[Film_ID_filmu] int NOT NULL,
	[Junk_ID_junku] int NOT NULL
) ON [PRIMARY]
ALTER TABLE [dbo].[Dystrybucja]  WITH CHECK ADD  CONSTRAINT [Dystrybucja_Dystrybutor_FK] FOREIGN KEY([Dystrybutor_ID_dystrybutora])
REFERENCES [dbo].[Dystrybutor] ([ID_dystrybutora])
GO
ALTER TABLE [dbo].[Dystrybucja] CHECK CONSTRAINT [Dystrybucja_Dystrybutor_FK]
GO
ALTER TABLE [dbo].[Dystrybucja]  WITH CHECK ADD  CONSTRAINT [Dystrybucja_Film_FK] FOREIGN KEY([Film_ID_filmu])
REFERENCES [dbo].[Film] ([ID_filmu])
GO
ALTER TABLE [dbo].[Dystrybucja] CHECK CONSTRAINT [Dystrybucja_Film_FK]
GO
ALTER TABLE [dbo].[Pracownik]  WITH CHECK ADD  CONSTRAINT [Pracownik_Kino_FK] FOREIGN KEY([Kino_ID_kina])
REFERENCES [dbo].[Kino] ([ID_kina])
GO
ALTER TABLE [dbo].[Pracownik] CHECK CONSTRAINT [Pracownik_Kino_FK]
GO
ALTER TABLE [dbo].[Pracownik]  WITH CHECK ADD  CONSTRAINT [Pracownik_Szef_FK] FOREIGN KEY([Pracownik_ID_szefa])
REFERENCES [dbo].[Pracownik] ([ID_pracownika])
GO
ALTER TABLE [dbo].[Pracownik] CHECK CONSTRAINT [Pracownik_Szef_FK]
GO
ALTER TABLE [dbo].[Raport_reklamowy]  WITH CHECK ADD  CONSTRAINT [Raport_reklamowy_Data_miesieczna_FK] FOREIGN KEY([Data_miesieczna_ID_daty_miesiecznej])
REFERENCES [dbo].[Data_miesieczna] ([ID_daty_miesiecznej])
GO
ALTER TABLE [dbo].[Raport_reklamowy] CHECK CONSTRAINT [Raport_reklamowy_Data_miesieczna_FK]
GO
ALTER TABLE [dbo].[Raport_reklamowy]  WITH CHECK ADD  CONSTRAINT [Raport_reklamowy_Film_FK] FOREIGN KEY([Film_ID_filmu])
REFERENCES [dbo].[Film] ([ID_filmu])
GO
ALTER TABLE [dbo].[Raport_reklamowy] CHECK CONSTRAINT [Raport_reklamowy_Film_FK]
GO
ALTER TABLE [dbo].[Rezyseria]  WITH CHECK ADD  CONSTRAINT [Rezyserstwo_Film_FK] FOREIGN KEY([Film_ID_filmu])
REFERENCES [dbo].[Film] ([ID_filmu])
GO
ALTER TABLE [dbo].[Rezyseria] CHECK CONSTRAINT [Rezyserstwo_Film_FK]
GO
ALTER TABLE [dbo].[Rezyseria]  WITH CHECK ADD  CONSTRAINT [Rezyserstwo_Rezyser_FK] FOREIGN KEY([Rezyser_ID_rezysera])
REFERENCES [dbo].[Rezyser] ([ID_rezysera])
GO
ALTER TABLE [dbo].[Rezyseria] CHECK CONSTRAINT [Rezyserstwo_Rezyser_FK]
GO
ALTER TABLE [dbo].[Sala]  WITH CHECK ADD  CONSTRAINT [Sala_Kino_FK] FOREIGN KEY([Kino_ID_kina])
REFERENCES [dbo].[Kino] ([ID_kina])
GO
ALTER TABLE [dbo].[Sala] CHECK CONSTRAINT [Sala_Kino_FK]
GO
ALTER TABLE [dbo].[Sprzedaz_biletu]  WITH CHECK ADD  CONSTRAINT [Sprzedaz_biletu_Bilet_FK] FOREIGN KEY([Bilet_ID_biletu])
REFERENCES [dbo].[Bilet] ([ID_biletu])
GO
ALTER TABLE [dbo].[Sprzedaz_biletu] CHECK CONSTRAINT [Sprzedaz_biletu_Bilet_FK]
GO
ALTER TABLE [dbo].[Sprzedaz_biletu]  WITH CHECK ADD  CONSTRAINT [Sprzedaz_biletu_Czas_FK] FOREIGN KEY([Godzina_seansu])
REFERENCES [dbo].[Czas] ([ID_czasu])
GO
ALTER TABLE [dbo].[Sprzedaz_biletu] CHECK CONSTRAINT [Sprzedaz_biletu_Czas_FK]
GO
ALTER TABLE [dbo].[Sprzedaz_biletu]  WITH CHECK ADD  CONSTRAINT [Sprzedaz_biletu_Data_FK] FOREIGN KEY([Data_Sprzedazy])
REFERENCES [dbo].[Data] ([ID_daty])
GO
ALTER TABLE [dbo].[Sprzedaz_biletu] CHECK CONSTRAINT [Sprzedaz_biletu_Data_FK]
GO
ALTER TABLE [dbo].[Sprzedaz_biletu]  WITH CHECK ADD  CONSTRAINT [Sprzedaz_biletu_Film_FK] FOREIGN KEY([Film_ID_filmu])
REFERENCES [dbo].[Film] ([ID_filmu])
GO
ALTER TABLE [dbo].[Sprzedaz_biletu] CHECK CONSTRAINT [Sprzedaz_biletu_Film_FK]
GO
ALTER TABLE [dbo].[Sprzedaz_biletu]  WITH CHECK ADD  CONSTRAINT [Sprzedaz_biletu_Pracownik_FK] FOREIGN KEY([Pracownik_ID_pracownika])
REFERENCES [dbo].[Pracownik] ([ID_pracownika])
GO
ALTER TABLE [dbo].[Sprzedaz_biletu] CHECK CONSTRAINT [Sprzedaz_biletu_Pracownik_FK]
GO
ALTER TABLE [dbo].[Sprzedaz_biletu]  WITH CHECK ADD  CONSTRAINT [Sprzedaz_biletu_Sala_FK] FOREIGN KEY([Sala_ID_sali])
REFERENCES [dbo].[Sala] ([ID_sali])
GO
ALTER TABLE [dbo].[Sprzedaz_biletu] CHECK CONSTRAINT [Sprzedaz_biletu_Sala_FK]
GO
ALTER TABLE [dbo].[Sprzedaz_biletu]  WITH CHECK ADD  CONSTRAINT [Sprzedaz_biletu_Czas2_FK] FOREIGN KEY([Czas_sprzedazy])
REFERENCES [dbo].[Czas] ([ID_czasu])
GO
ALTER TABLE [dbo].[Sprzedaz_biletu] CHECK CONSTRAINT [Sprzedaz_biletu_Czas2_FK]
GO
ALTER TABLE [dbo].[Sprzedaz_biletu]  WITH CHECK ADD  CONSTRAINT [Sprzedaz_biletu_Data2_FK] FOREIGN KEY([Data_seansu])
REFERENCES [dbo].[Data] ([ID_daty])
GO
ALTER TABLE [dbo].[Sprzedaz_biletu] CHECK CONSTRAINT [Sprzedaz_biletu_Data2_FK]
GO
ALTER TABLE [dbo].[Sprzedaz_biletu]  WITH CHECK ADD  CONSTRAINT [Sprzedaz_biletu_Junk_FK] FOREIGN KEY([Junk_ID_junku])
REFERENCES [dbo].[Junk] ([ID_junk])
GO
ALTER TABLE [dbo].[Sprzedaz_biletu] CHECK CONSTRAINT [Sprzedaz_biletu_Junk_FK]
GO