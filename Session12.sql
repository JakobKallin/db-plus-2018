SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[Doctor] [varchar](100) NOT NULL,
	[PatientID] [char](10) NOT NULL
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[ID] [char](10) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DatePrescribed] [date] NOT NULL,
	[Medicine] [varchar](100) NOT NULL,
	[PatientID] [char](10) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointment] ON

INSERT [dbo].[Appointment] ([ID], [Date], [Doctor], [PatientID]) VALUES (1, CAST(N'2017-12-05' AS Date), N'Brad Pitt', N'8502101234')
INSERT [dbo].[Appointment] ([ID], [Date], [Doctor], [PatientID]) VALUES (2, CAST(N'2017-10-25' AS Date), N'Cate Blanchett', N'8502101234')
INSERT [dbo].[Appointment] ([ID], [Date], [Doctor], [PatientID]) VALUES (3, CAST(N'2017-08-14' AS Date), N'Brad Pitt', N'8502101234')
INSERT [dbo].[Appointment] ([ID], [Date], [Doctor], [PatientID]) VALUES (4, CAST(N'2017-11-20' AS Date), N'Sigourney Weaver', N'9012151234')
INSERT [dbo].[Appointment] ([ID], [Date], [Doctor], [PatientID]) VALUES (5, CAST(N'2017-01-09' AS Date), N'Richard Gere', N'9012151234')
INSERT [dbo].[Appointment] ([ID], [Date], [Doctor], [PatientID]) VALUES (6, CAST(N'2017-04-19' AS Date), N'Richard Gere', N'7905271234')
SET IDENTITY_INSERT [dbo].[Appointment] OFF
INSERT [dbo].[Patient] ([ID], [Password]) VALUES (N'7905271234', N'p455w0rd')
INSERT [dbo].[Patient] ([ID], [Password]) VALUES (N'8502101234', N'secret123')
INSERT [dbo].[Patient] ([ID], [Password]) VALUES (N'9012151234', N'unh4ckabl3')
SET IDENTITY_INSERT [dbo].[Prescription] ON

INSERT [dbo].[Prescription] ([ID], [DatePrescribed], [Medicine], [PatientID]) VALUES (1, CAST(N'2017-05-20' AS Date), N'Samarin', N'8502101234')
INSERT [dbo].[Prescription] ([ID], [DatePrescribed], [Medicine], [PatientID]) VALUES (2, CAST(N'2017-10-12' AS Date), N'Omeprazol', N'8502101234')
INSERT [dbo].[Prescription] ([ID], [DatePrescribed], [Medicine], [PatientID]) VALUES (3, CAST(N'2017-02-24' AS Date), N'Ipren', N'7905271234')
INSERT [dbo].[Prescription] ([ID], [DatePrescribed], [Medicine], [PatientID]) VALUES (4, CAST(N'2017-08-10' AS Date), N'Alvedon', N'7905271234')
INSERT [dbo].[Prescription] ([ID], [DatePrescribed], [Medicine], [PatientID]) VALUES (5, CAST(N'2017-08-15' AS Date), N'Emovat', N'9012151234')
INSERT [dbo].[Prescription] ([ID], [DatePrescribed], [Medicine], [PatientID]) VALUES (6, CAST(N'2017-11-29' AS Date), N'Hydrokortison', N'9012151234')
SET IDENTITY_INSERT [dbo].[Prescription] OFF
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Patient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([ID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Patient]
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_Patient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([ID])
GO
ALTER TABLE [dbo].[Prescription] CHECK CONSTRAINT [FK_Prescription_Patient]
GO