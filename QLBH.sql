CREATE DATABASE [QLBH]
GO

USE [QLBH]
GO

/****** Object:  Table [dbo].[Customer]    Script Date: 26/05/2018 3:16:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] NULL,
	[Phone] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[CustomerName] [nvarchar](255) NULL,
	[isVender] [bit] NULL,
	[isCustomer] [bit] NULL,
	[WriteDate] [nvarchar](255) NULL,
	[EditDate] [nvarchar](255) NULL,
	[WriterId] [int] NULL,
	[EditorId] [int] NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 26/05/2018 3:16:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] NULL,
	[Phone] [nvarchar](255) NULL,
	[EmployeeName] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[WriteDate] [nvarchar](255) NULL,
	[EditDate] [nvarchar](255) NULL,
	[EditorId] [int] NULL,
	[WriterId] [int] NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[OAuth]    Script Date: 26/05/2018 3:16:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OAuth](
	[Id] [varchar](255) NOT NULL,
	[Email] [varchar](255) NULL,
	[Token] [varchar](255) NULL,
	[Photo] [varchar](255) NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_OAuth] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Product]    Script Date: 26/05/2018 3:16:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] NOT NULL,
	[ProductName] [nvarchar](255) NULL,
	[Price] [bigint] NULL,
	[Barcode] [varchar](255) NULL,
	[Qty] [int] NULL,
	[ProductGroupId] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[ProductGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ProductGroup]    Script Date: 26/05/2018 3:16:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductGroup](
	[ProductGroupId] [int] NOT NULL,
	[ProductGroupName] [nvarchar](255) NULL,
	[Remark] [nvarchar](255) NULL,
 CONSTRAINT [PK_ProductGroup_1] PRIMARY KEY CLUSTERED 
(
	[ProductGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Sale]    Script Date: 26/05/2018 3:16:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[SaleId] [int] NOT NULL,
	[CustomerId] [int] NULL,
	[EmployeeId] [int] NULL,
	[SaleDate] [datetime] NULL,
	[Status] [int] NULL,
	[Note] [nvarchar](255) NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[SaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SaleItem]    Script Date: 26/05/2018 3:16:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleItem](
	[SaleItemId] [int] NOT NULL,
	[SaleId] [int] NULL,
	[ProductId] [int] NULL,
	[Qty] [int] NULL,
 CONSTRAINT [PK_SaleItem] PRIMARY KEY CLUSTERED 
(
	[SaleItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Notification]    Script Date: 3/12/2019 3:12:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationId] [int] NOT NULL,
	[SaleId] [int] NULL,
	[StatusNoti] [int] NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[User]    Script Date: 26/05/2018 3:16:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Username] [varchar](255) NOT NULL,
	[Password] [varchar](255) NULL,
	[LastLogin] [datetime] NULL,
	[Email] [varchar](255) NULL,
	[EmployeeId] [int] NULL,
	[Token] [varchar](255) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- !! CUstommer
INSERT [dbo].[Customer] ([CustomerId], [Phone], [Email], [CustomerName], [isVender], [isCustomer], [WriteDate], [EditDate], [WriterId], [EditorId]) 
VALUES (1, N'01674404746', N'minhmeo0507@gmail.com', N'Nguyễn Đặng Minh Nghĩa', 1, 0, N'', N'', 0, 0)
GO
INSERT [dbo].[Customer] ([CustomerId], [Phone], [Email], [CustomerName], [isVender], [isCustomer], [WriteDate], [EditDate], [WriterId], [EditorId]) 
VALUES (2, N'56667915023', N'Bao230903@gmail.com', N'Nguyễn Thiên Bảo', 1, 1, N'', N'', 0, 0)
GO
INSERT [dbo].[Customer] ([CustomerId], [Phone], [Email], [CustomerName], [isVender], [isCustomer], [WriteDate], [EditDate], [WriterId], [EditorId]) 
VALUES (3, N'0907882994', N'winterhokha@gmail.com', N'Hồ Khả Việt Huấn', 0, 1, N'', N'', 0, 0)
GO
INSERT [dbo].[Customer] ([CustomerId], [Phone], [Email], [CustomerName], [isVender], [isCustomer], [WriteDate], [EditDate], [WriterId], [EditorId]) 
VALUES (4, N'56237915023', N'pnha99@gmail.com', N'Nguyễn Phước Nhã', 0, 1, N'', N'', 0, 0)
GO
INSERT [dbo].[Customer] ([CustomerId], [Phone], [Email], [CustomerName], [isVender], [isCustomer], [WriteDate], [EditDate], [WriterId], [EditorId]) 
VALUES (5, N'56237915023', N'TaiVuong99@gmail.com', N'Vương Duy Tài', 0, 1, N'', N'', 0, 0)
GO

-- ?? Employee
INSERT [dbo].[Employee] ([EmployeeId], [Phone], [EmployeeName], [Email], [Address], [WriteDate], [EditDate], [EditorId], [WriterId]) 
VALUES (2, N'1234567890', N'Trần Bá Khoa', N'khoaba99@gmail.com', N'Ngã tư Ga, Q12, TPHCM', N'', N'', 0, 0)
GO
INSERT [dbo].[Employee] ([EmployeeId], [Phone], [EmployeeName], [Email], [Address], [WriteDate], [EditDate], [EditorId], [WriterId]) 
VALUES (3, N'0123456789', N'Nguyễn Thiên Ân', N'thienan99@gmail.com', N'Dương Quảng Hàm, Gò Vấp, TPHCM', N'', N'', 0, 0)
GO
INSERT [dbo].[Employee] ([EmployeeId], [Phone], [EmployeeName], [Email], [Address], [WriteDate], [EditDate], [EditorId], [WriterId]) 
VALUES (4, N'0119229745', N'Lê Hoàng Phúc', N'phucle99@gmail.com', N'Dương Quảng Hàm, Gò Vấp, TPHCM', N'', N'', 0, 0)
GO
INSERT [dbo].[Employee] ([EmployeeId], [Phone], [EmployeeName], [Email], [Address], [WriteDate], [EditDate], [EditorId], [WriterId]) 
VALUES (1, N'0000000000', N'Gol D.Roger', N'admin@gmail.com', N'6273g462', N'', N'', 0, 0)
GO
INSERT [dbo].[OAuth] ([Id], [Email], [Token], [Photo], [Name]) 
VALUES (N'115393469596787670000', N'nguyenhoangduy1997@gmail.com', N'ya29.GlvHBbfTzTE33F-dQrOz7TDzMVnq3Kz70RdVuIqfc6DagFbP3_xmc9fNoO2igntFfzLnX4XFi3k0NxD-G85TvADUDWAU_rX2AIUtXXtiSvfhQGz6JP1DH2rYCmtK', N'https://lh3.googleusercontent.com/-zNi6M5Usdb8/AAAAAAAAAAI/AAAAAAAAAC0/wGrTpe3Q5C4/s96-c/photo.jpg', N'hoang duy Nguyen')
GO

-- **** Product Group
INSERT [dbo].[ProductGroup] ([ProductGroupId], [ProductGroupName], [Remark]) VALUES (1, N'Chính Trị - Pháp Luật', N'')
GO
INSERT [dbo].[ProductGroup] ([ProductGroupId], [ProductGroupName], [Remark]) VALUES (2, N'Ngoại Ngữ', N'')
GO
INSERT [dbo].[ProductGroup] ([ProductGroupId], [ProductGroupName], [Remark]) VALUES (3, N'Thiếu Nhi', N'')
GO
INSERT [dbo].[ProductGroup] ([ProductGroupId], [ProductGroupName], [Remark]) VALUES (4, N'Văn Học - Nghệ Thuật', N'')
GO

-- ** Product
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Barcode], [Qty], [ProductGroupId]) 
VALUES (1, N'Bộ luật dân sự', 50000, N'8934588873058', 100, 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Barcode], [Qty], [ProductGroupId]) 
VALUES (2, N'Bộ luật hình sự', 60000, N'8934588873058', 100, 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Barcode], [Qty], [ProductGroupId]) 
VALUES (3, N'Bộ luật tố tụng dân sự', 55000, N'8934588873058', 100, 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Barcode], [Qty], [ProductGroupId]) 
VALUES (4, N'Luật thương mại', 100000, N'8934588873058', 100, 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Barcode], [Qty], [ProductGroupId]) 
VALUES (5, N'Hiến pháp Việt Nam', 60000, N'8934588873058', 100, 1)
GO

INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Barcode], [Qty], [ProductGroupId]) 
VALUES (6, N'Ngữ pháp Tiếng Anh', 95000, N'8934588873058', 100, 2)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Barcode], [Qty], [ProductGroupId]) 
VALUES (7, N'Từ vựng Tiếng Anh', 150000, N'8934588873058', 100, 2)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Barcode], [Qty], [ProductGroupId]) 
VALUES (8, N'Hack não với Tiếng Anh', 55000, N'8934588873058', 100, 2)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Barcode], [Qty], [ProductGroupId]) 
VALUES (9, N'Tập viết chữ Hàn', 80000, N'8934588873058', 100, 2)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Barcode], [Qty], [ProductGroupId]) 
VALUES (10, N'Tiếng Nhật cơ bản', 100000, N'8934588873058', 100, 2)
GO

INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Barcode], [Qty], [ProductGroupId]) 
VALUES (11, N'Siêu nhân Khoai', 20000, N'8934588873058', 100, 3)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Barcode], [Qty], [ProductGroupId]) 
VALUES (12, N'Siêu nhân Chuối', 21000, N'8934588873058', 100, 3)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Barcode], [Qty], [ProductGroupId]) 
VALUES (13, N'Siêu nhân Cà rốt', 22000, N'8934588873058', 100, 3)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Barcode], [Qty], [ProductGroupId]) 
VALUES (14, N'Siêu nhân Rau', 23000, N'8934588873058', 100, 3)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Barcode], [Qty], [ProductGroupId]) 
VALUES (15, N'Siêu nhân Bá Khoa', 2000000, N'8934588873058', 100, 3)
GO

INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Barcode], [Qty], [ProductGroupId]) 
VALUES (16, N'Cho tôi xin một vé đi tuổi thơ', 60000, N'8934588873058', 100, 4)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Barcode], [Qty], [ProductGroupId]) 
VALUES (17, N'Mắt biếc', 70000, N'8934588873058', 100, 4)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Barcode], [Qty], [ProductGroupId]) 
VALUES (18, N'Tôi thấy hoa vàng trên cỏ xanh', 80000, N'8934588873058', 100, 4)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Barcode], [Qty], [ProductGroupId]) 
VALUES (19, N'Nhà giả kim', 90000, N'8934588873058', 100, 4)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Barcode], [Qty], [ProductGroupId]) 
VALUES (20, N'Hạ đỏ', 99000, N'8934588873058', 100, 4)
GO

-- TODO: Sale
INSERT [dbo].[Sale] ([SaleId], [CustomerId], [EmployeeId], [SaleDate], [Status], [Note]) VALUES (1, 3, 2, CAST(N'2018-05-24T00:00:00.000' AS DateTime), 0, N'')
GO
INSERT [dbo].[Sale] ([SaleId], [CustomerId], [EmployeeId], [SaleDate], [Status], [Note]) VALUES (2, 4, 3, CAST(N'2018-05-24T00:00:00.000' AS DateTime), 0, N'')
GO
INSERT [dbo].[Sale] ([SaleId], [CustomerId], [EmployeeId], [SaleDate], [Status], [Note]) VALUES (3, 5, 4, CAST(N'2018-05-24T00:00:00.000' AS DateTime), 0, N'')
GO
INSERT [dbo].[Sale] ([SaleId], [CustomerId], [EmployeeId], [SaleDate], [Status], [Note]) VALUES (4, 2, 2, CAST(N'2018-05-24T00:00:00.000' AS DateTime), 1, N'')
GO
INSERT [dbo].[Sale] ([SaleId], [CustomerId], [EmployeeId], [SaleDate], [Status], [Note]) VALUES (5, 2, 3, CAST(N'2018-05-24T00:00:00.000' AS DateTime), 2, N'')
GO

INSERT [dbo].[SaleItem] ([SaleItemId], [SaleId], [ProductId], [Qty]) VALUES (1, 1, 1, 2)
GO
INSERT [dbo].[SaleItem] ([SaleItemId], [SaleId], [ProductId], [Qty]) VALUES (2, 1, 11, 1)
GO
INSERT [dbo].[SaleItem] ([SaleItemId], [SaleId], [ProductId], [Qty]) VALUES (3, 2, 4, 4)
GO
INSERT [dbo].[SaleItem] ([SaleItemId], [SaleId], [ProductId], [Qty]) VALUES (4, 3, 7, 1)
GO
INSERT [dbo].[SaleItem] ([SaleItemId], [SaleId], [ProductId], [Qty]) VALUES (5, 4, 8, 2)
GO
INSERT [dbo].[SaleItem] ([SaleItemId], [SaleId], [ProductId], [Qty]) VALUES (6, 5, 16, 3)
GO
INSERT [dbo].[SaleItem] ([SaleItemId], [SaleId], [ProductId], [Qty]) VALUES (7, 5, 20, 10)
GO

-- !! TODO: USER: 
INSERT [dbo].[User] ([Username], [Password], [LastLogin], [Email], [EmployeeId], [Token]) 
VALUES (N'admin', N'21232f297a57a5a743894a0e4a801fc3', CAST(N'2018-05-25T12:11:15.000' AS DateTime), N'admin@gmail.com', 1, N'jmgi4ge1xdwnuvlinbk0g4zm')
GO
INSERT [dbo].[User] ([Username], [Password], [LastLogin], [Email], [EmployeeId], [Token]) 
VALUES (N'thienan', N'05fdab880f63d7c20a09724c5180784d', CAST(N'2019-12-25T12:11:15.000' AS DateTime), N'thienan99@gmail.com', 3, N'')
GO
INSERT [dbo].[User] ([Username], [Password], [LastLogin], [Email], [EmployeeId], [Token]) 
VALUES (N'bakhoa', N'791e2fb0983dc6b24e445c68f3ed3fb9', CAST(N'2019-12-25T12:11:15.000' AS DateTime), N'khoaba99@gmail.com', 2, N'')
GO
INSERT [dbo].[User] ([Username], [Password], [LastLogin], [Email], [EmployeeId], [Token]) 
VALUES (N'hoangphuc', N'419717adc7d8d97dea8575797e330bb1', CAST(N'2019-12-25T12:11:15.000' AS DateTime), N'phucle99@gmail.com', 4, N'')
GO

-- ?? TODO: NOTIFICATION:
INSERT [dbo].[Notification] ([NotificationId], [SaleId], [StatusNoti])
VALUES (1, 1, 1)
GO
INSERT [dbo].[Notification] ([NotificationId], [SaleId], [StatusNoti])
VALUES (2, 2, 1)
GO
INSERT [dbo].[Notification] ([NotificationId], [SaleId], [StatusNoti])
VALUES (3, 3, 1)
GO
INSERT [dbo].[Notification] ([NotificationId], [SaleId], [StatusNoti])
VALUES (4, 4, 1)
GO
INSERT [dbo].[Notification] ([NotificationId], [SaleId], [StatusNoti])
VALUES (5, 5, 1)
GO