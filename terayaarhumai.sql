USE [master]
GO
/****** Object:  Database [codehelperdb]    Script Date: 3/30/2024 11:34:03 PM ******/
CREATE DATABASE [codehelperdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'codehelperdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\codehelperdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'codehelperdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\codehelperdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [codehelperdb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [codehelperdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [codehelperdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [codehelperdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [codehelperdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [codehelperdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [codehelperdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [codehelperdb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [codehelperdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [codehelperdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [codehelperdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [codehelperdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [codehelperdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [codehelperdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [codehelperdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [codehelperdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [codehelperdb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [codehelperdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [codehelperdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [codehelperdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [codehelperdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [codehelperdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [codehelperdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [codehelperdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [codehelperdb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [codehelperdb] SET  MULTI_USER 
GO
ALTER DATABASE [codehelperdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [codehelperdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [codehelperdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [codehelperdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [codehelperdb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [codehelperdb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [codehelperdb] SET QUERY_STORE = OFF
GO
USE [codehelperdb]
GO
/****** Object:  Table [dbo].[coursefeedback]    Script Date: 3/30/2024 11:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[coursefeedback](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Course_id] [int] NULL,
	[fullname] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[subject] [varchar](100) NULL,
	[Comment] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[offermng]    Script Date: 3/30/2024 11:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[offermng](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](120) NULL,
	[course] [int] NULL,
	[discountamt] [int] NULL,
	[discountdate] [date] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 3/30/2024 11:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[sname] [varchar](100) NULL,
	[semail] [varchar](120) NOT NULL,
	[gender] [varchar](70) NULL,
	[mobile] [bigint] NULL,
	[college] [varchar](120) NULL,
	[course] [int] NULL,
	[year] [varchar](50) NULL,
	[profile] [varchar](100) NULL,
	[password] [varchar](70) NULL,
PRIMARY KEY CLUSTERED 
(
	[semail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_category]    Script Date: 3/30/2024 11:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cname] [varchar](100) NOT NULL,
	[cpic] [varchar](100) NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_course]    Script Date: 3/30/2024 11:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_course](
	[csr] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](100) NULL,
	[thumb] [varchar](100) NULL,
	[category] [int] NULL,
	[instructor] [int] NULL,
	[fee] [int] NULL,
	[ffee] [int] NULL,
	[details] [varchar](250) NULL,
	[duration] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[csr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_enroll]    Script Date: 3/30/2024 11:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_enroll](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[courseid] [int] NULL,
	[email] [varchar](120) NULL,
	[enrolldate] [datetime] NULL,
	[finalfee] [int] NULL,
	[expiry_date] [date] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_instructor]    Script Date: 3/30/2024 11:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_instructor](
	[sr] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[email] [varchar](120) NULL,
	[mobile] [bigint] NULL,
	[gender] [varchar](100) NULL,
	[ipic] [varchar](100) NULL,
	[summary] [varchar](250) NULL,
	[about] [varchar](250) NULL,
	[Btech] [varchar](60) NULL,
	[Mtech] [varchar](60) NULL,
	[BCA] [varchar](60) NULL,
	[MCA] [varchar](60) NULL,
	[Phd] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[sr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[video]    Script Date: 3/30/2024 11:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[video](
	[vsr] [int] IDENTITY(1,1) NOT NULL,
	[videoTitle] [varchar](100) NULL,
	[course] [int] NULL,
	[videolink] [varchar](250) NULL,
	[videodetails] [varchar](270) NULL,
	[duration] [int] NULL,
	[status] [bit] NULL,
	[chapter] [varchar](max) NULL,
	[ispaid] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[vsr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[coursefeedback] ON 

INSERT [dbo].[coursefeedback] ([id], [Course_id], [fullname], [Email], [subject], [Comment]) VALUES (1, 3, N'Nilesh shrivastav', N'n@gmail.com', N'python', N'gvg gvg vffdd54 gtyu')
INSERT [dbo].[coursefeedback] ([id], [Course_id], [fullname], [Email], [subject], [Comment]) VALUES (2, 3, N'Nilesh shrivastav', N'n@gmail.com', N'python', N'g  ghrte dj5y ')
INSERT [dbo].[coursefeedback] ([id], [Course_id], [fullname], [Email], [subject], [Comment]) VALUES (3, 3, N' shrivastav', N'nsr@gmail.com', N'python', N'hjj twtq34 yyuu')
INSERT [dbo].[coursefeedback] ([id], [Course_id], [fullname], [Email], [subject], [Comment]) VALUES (4, 1, N'pawan', N'p@gmail.com', N'python', N'nice sharing')
SET IDENTITY_INSERT [dbo].[coursefeedback] OFF
GO
SET IDENTITY_INSERT [dbo].[offermng] ON 

INSERT [dbo].[offermng] ([id], [email], [course], [discountamt], [discountdate], [status]) VALUES (1, N'n@gmail.com', 1, 100, CAST(N'2025-01-07' AS Date), 1)
INSERT [dbo].[offermng] ([id], [email], [course], [discountamt], [discountdate], [status]) VALUES (2, N'n@gmail.com', 1, 150, CAST(N'2024-11-28' AS Date), 1)
INSERT [dbo].[offermng] ([id], [email], [course], [discountamt], [discountdate], [status]) VALUES (3, N'deepkumar00110011@gmail.com', 1, 50, CAST(N'2024-03-30' AS Date), 1)
INSERT [dbo].[offermng] ([id], [email], [course], [discountamt], [discountdate], [status]) VALUES (4, N'nsrivastav081@gmail.com', 3, 1000, CAST(N'2024-03-31' AS Date), 1)
INSERT [dbo].[offermng] ([id], [email], [course], [discountamt], [discountdate], [status]) VALUES (5, N'priyalala408@gmail.com', 3, 2500, CAST(N'2024-03-30' AS Date), 1)
INSERT [dbo].[offermng] ([id], [email], [course], [discountamt], [discountdate], [status]) VALUES (1006, N'anuragsingh7459@gmail.com', 3, 2700, CAST(N'2024-03-30' AS Date), 1)
INSERT [dbo].[offermng] ([id], [email], [course], [discountamt], [discountdate], [status]) VALUES (1007, N'nku179037@gmail.com', 3, 2000, CAST(N'2024-03-30' AS Date), 1)
SET IDENTITY_INSERT [dbo].[offermng] OFF
GO
INSERT [dbo].[student] ([sname], [semail], [gender], [mobile], [college], [course], [year], [profile], [password]) VALUES (N'Anurag', N'anuragsingh7459@gmail.com', N'Male', 9087654321, N'Government Polytechnic jaunpur', 3, N'Fourth Year', N'm2.jpg', N'0987')
INSERT [dbo].[student] ([sname], [semail], [gender], [mobile], [college], [course], [year], [profile], [password]) VALUES (N'deep kumar', N'deepkumar00110011@gmail.com', N'Male', 9870654321, N'Gavernment Polytechnic Aurai', 1, N'Third Year', N'm5.jpg', N'deep')
INSERT [dbo].[student] ([sname], [semail], [gender], [mobile], [college], [course], [year], [profile], [password]) VALUES (N'Nilesh', N'n@gmail.com', N'Male', 8766453421, N'Government Polytechnic jaunpur', 1, N'Third Year', N'454c532e-5dbb-427f-afb8-a60cebd9918f.jpg', N'n123')
INSERT [dbo].[student] ([sname], [semail], [gender], [mobile], [college], [course], [year], [profile], [password]) VALUES (N'Shrivastav', N'nku179037@gmail.com', N'Male', 7800908767, N'Gavernment Polytechnic Aurai', 3, N'Second Year', N'm4.jpg', N'9870')
INSERT [dbo].[student] ([sname], [semail], [gender], [mobile], [college], [course], [year], [profile], [password]) VALUES (N'Nitesh Shrivastav', N'nsrivastav081@gmail.com', N'Male', 9807654098, N'Government Polytechnic jaunpur', 1, N'First Year', N'gallery-8.jpg', N'n8766')
INSERT [dbo].[student] ([sname], [semail], [gender], [mobile], [college], [course], [year], [profile], [password]) VALUES (N'priya Shrivastav', N'priyalala408@gmail.com', N'Male', 8907654321, N'Government Polytechnic jaunpur', 3, N'Third Year', N'm4.jpg', N'12345')
INSERT [dbo].[student] ([sname], [semail], [gender], [mobile], [college], [course], [year], [profile], [password]) VALUES (N'Ritesh', N'viveksrivastav857@gmail.com', N'Male', 9336860033, N'Gavernment Polytechnic Aurai', 1, N'Second Year', N'm4.jpg', N'12345')
INSERT [dbo].[student] ([sname], [semail], [gender], [mobile], [college], [course], [year], [profile], [password]) VALUES (N'Vivek', N'viveksrivastav933@gmail.com', N'Male', 9579522380, N'Saltnat Bahadur PG College', 1, N'Third Year', N'm2.jpg', N'vivek01')
GO
SET IDENTITY_INSERT [dbo].[tbl_category] ON 

INSERT [dbo].[tbl_category] ([id], [cname], [cpic], [status]) VALUES (2, N'Full stack with Python', N'course-27.jpg', 1)
INSERT [dbo].[tbl_category] ([id], [cname], [cpic], [status]) VALUES (3, N'Full stack development', N'skill-02.jpg', 1)
SET IDENTITY_INSERT [dbo].[tbl_category] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_course] ON 

INSERT [dbo].[tbl_course] ([csr], [title], [thumb], [category], [instructor], [fee], [ffee], [details], [duration]) VALUES (1, N'Python', N'3.jpg', 2, 2, 1300, 1100, N'<p>best <strong>course </strong><i><strong>in code</strong></i> helper</p>', CAST(N'2024-12-09' AS Date))
INSERT [dbo].[tbl_course] ([csr], [title], [thumb], [category], [instructor], [fee], [ffee], [details], [duration]) VALUES (3, N'.Net', N'course-15.jpg', 3, 3, 3400, 3000, N'<p>Full stack development using c#&nbsp;</p><p>HTml</p><p>css</p><p>bootstrap</p>', CAST(N'2024-03-30' AS Date))
SET IDENTITY_INSERT [dbo].[tbl_course] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_enroll] ON 

INSERT [dbo].[tbl_enroll] ([id], [courseid], [email], [enrolldate], [finalfee], [expiry_date], [status]) VALUES (2, 3, N'nku179037@gmail.com', CAST(N'2024-03-21T14:30:14.340' AS DateTime), 2000, CAST(N'2024-03-30' AS Date), 1)
INSERT [dbo].[tbl_enroll] ([id], [courseid], [email], [enrolldate], [finalfee], [expiry_date], [status]) VALUES (3, 3, N'priyalala408@gmail.com', CAST(N'2024-03-21T23:02:36.393' AS DateTime), 2500, CAST(N'2024-03-30' AS Date), 1)
INSERT [dbo].[tbl_enroll] ([id], [courseid], [email], [enrolldate], [finalfee], [expiry_date], [status]) VALUES (4, 1, N'deepkumar00110011@gmail.com', CAST(N'2024-03-24T20:15:14.160' AS DateTime), 50, CAST(N'2024-03-30' AS Date), 1)
SET IDENTITY_INSERT [dbo].[tbl_enroll] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_instructor] ON 

INSERT [dbo].[tbl_instructor] ([sr], [name], [email], [mobile], [gender], [ipic], [summary], [about], [Btech], [Mtech], [BCA], [MCA], [Phd]) VALUES (2, N'Nilesh Shrivastav', N'n@gmail.com', 8766573820, N'Male', N'm2.jpg', N'I am software developer', N'I am best in sql', N'Btech', N'Mtech', NULL, NULL, NULL)
INSERT [dbo].[tbl_instructor] ([sr], [name], [email], [mobile], [gender], [ipic], [summary], [about], [Btech], [Mtech], [BCA], [MCA], [Phd]) VALUES (3, N'priya', N'priya@gmail.com', 987654321, N'Female', N'tv.jpg', N'I am beautician', N'I am good', N'Btech', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_instructor] OFF
GO
SET IDENTITY_INSERT [dbo].[video] ON 

INSERT [dbo].[video] ([vsr], [videoTitle], [course], [videolink], [videodetails], [duration], [status], [chapter], [ispaid]) VALUES (1, N'First lecture', 1, N'https://www.youtube.com/embed/GceG8mikL10?si=XmBPU4PIJFaU_A33', NULL, 1, 1, N'Introduction of python', 0)
INSERT [dbo].[video] ([vsr], [videoTitle], [course], [videolink], [videodetails], [duration], [status], [chapter], [ispaid]) VALUES (2, N'First lecture', 1, N'https://www.youtube.com/embed/tHzhEypv2QE?si=GgAVqkYxxeLY8zGI', N'<p>in this <i>Video covered </i><strong>&nbsp;Introduction of </strong><i><strong>python</strong></i></p>', 1, 1, N'introduction of python', 1)
INSERT [dbo].[video] ([vsr], [videoTitle], [course], [videolink], [videodetails], [duration], [status], [chapter], [ispaid]) VALUES (3, N'Second video Lecture', 1, N'https://www.youtube.com/embed/nhlhDLvPi7k?si=8dh7b3AeAvkVfVeW', N'<p>Intruduction to variable and identifier</p>', 6, 1, N'Variables in python', 0)
INSERT [dbo].[video] ([vsr], [videoTitle], [course], [videolink], [videodetails], [duration], [status], [chapter], [ispaid]) VALUES (4, N'First lecture video', 3, N'https://www.youtube.com/embed/GceG8mikL10?si=XmBPU4PIJFaU_A33', N'<p>Indroduction to c# and .net</p>', 4, 1, N'Introduction of python', 1)
INSERT [dbo].[video] ([vsr], [videoTitle], [course], [videolink], [videodetails], [duration], [status], [chapter], [ispaid]) VALUES (5, N'third video', 1, N'https://www.youtube.com/embed/tHzhEypv2QE?si=GgAVqkYxxeLY8zGI', N'<p>python language is most pawerfull languange in web desinening</p>', 55, 1, N'variables of python', 1)
INSERT [dbo].[video] ([vsr], [videoTitle], [course], [videolink], [videodetails], [duration], [status], [chapter], [ispaid]) VALUES (6, N'introduction 2nd video', 3, N'https://www.youtube.com/embed/nhlhDLvPi7k?si=8dh7b3AeAvkVfVeW', N'<p>introduction .net in short video</p>', 23, 0, N'Introduction', 1)
INSERT [dbo].[video] ([vsr], [videoTitle], [course], [videolink], [videodetails], [duration], [status], [chapter], [ispaid]) VALUES (1007, N'Introduction of c# variable', 3, N'https://drive.google.com/file/d/1s06tVlhKB8h_n21eTkZy-0IdT4iTqIbO/preview', N'<p>best for full stack developer learn from here with cheap rate</p>', 21, 1, N'Variables in c#', 0)
SET IDENTITY_INSERT [dbo].[video] OFF
GO
ALTER TABLE [dbo].[coursefeedback]  WITH CHECK ADD FOREIGN KEY([Course_id])
REFERENCES [dbo].[tbl_course] ([csr])
GO
ALTER TABLE [dbo].[offermng]  WITH CHECK ADD FOREIGN KEY([course])
REFERENCES [dbo].[tbl_course] ([csr])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[offermng]  WITH CHECK ADD FOREIGN KEY([email])
REFERENCES [dbo].[student] ([semail])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD FOREIGN KEY([course])
REFERENCES [dbo].[tbl_course] ([csr])
GO
ALTER TABLE [dbo].[tbl_course]  WITH CHECK ADD FOREIGN KEY([category])
REFERENCES [dbo].[tbl_category] ([id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[tbl_course]  WITH CHECK ADD FOREIGN KEY([instructor])
REFERENCES [dbo].[tbl_instructor] ([sr])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[tbl_enroll]  WITH CHECK ADD FOREIGN KEY([courseid])
REFERENCES [dbo].[tbl_course] ([csr])
GO
ALTER TABLE [dbo].[tbl_enroll]  WITH CHECK ADD FOREIGN KEY([email])
REFERENCES [dbo].[student] ([semail])
GO
ALTER TABLE [dbo].[video]  WITH CHECK ADD FOREIGN KEY([course])
REFERENCES [dbo].[tbl_course] ([csr])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
/****** Object:  StoredProcedure [dbo].[selvideo]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[selvideo]
@course int=0,
@chapter varchar(max)=null
as
begin
select * from video where chapter=@chapter and course=@course and status=1 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_addCourse]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_addCourse]
@title varchar(100)=null,
@thumb varchar(100)=null,
@category int=null,
@instructor int=null,
@fee int=null,
@ffee int=null,
@details varchar(250)=null,
@duration date=null
as
begin
insert into tbl_course (title,thumb,category,instructor,fee,ffee,details,duration)
values (@title,@thumb,@category,@instructor,@fee,@ffee,@details,@duration)
select 'Record Added'
end



GO
/****** Object:  StoredProcedure [dbo].[sp_AddInstructor]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_AddInstructor]
@name varchar(100)=null,
@email varchar(120)=null,
@mobile bigint=null,
@gender varchar(100)=null,
@ipic varchar(100)=null,
@summary varchar(250)=null,
@about varchar(250)=null,
@Btech varchar(60)=null,
@Mtech  Varchar(60)=null,
@BCA varchar(60)=null,
@MCA varchar(60)=null,
@Phd varchar(60)=null
as
begin
insert into tbl_instructor (name,email,mobile,gender,ipic,summary,about,Btech,Mtech,BCA,MCA,Phd)
values(@name,@email,@mobile,@gender,@ipic,@summary,@about,@Btech,@Mtech,@BCA,@MCA,@Phd)
select 'Record Added'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Addoffermng]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_Addoffermng]
@semail varchar(120)=null,
@course int=null ,
@discountamt int=0,
@discountdate date=null,
@status bit=0
as
begin
begin try
if not exists(select * from offermng where email=@semail and course=@course)
begin
insert into offermng values(@semail,@course,@discountamt,@discountdate,@status) 
select 'Record Added'
end
else
begin
select 'Already offer assegned for this user'
end
end try
begin Catch
select 'error in db'
end catch
end

GO
/****** Object:  StoredProcedure [dbo].[sp_addstudent]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_addstudent]
@sname varchar(100)=null,
@semail varchar(120)=null,
@gender varchar(70)=null,
@mobile bigint=null,
@college varchar(120)=null,
@course int=null,
@year varchar(50)=null,
@profile varchar(100)=null,
@password varchar(70)=null
as
begin
begin try
if not exists(select * from student where semail=@semail)
begin
insert into student values(@sname,@semail,@gender,@mobile,@college,@course,@year,@profile,@password)
select 'Record Added'
end
else
begin
select 'Email already exist'
end
end try
begin Catch
select 'error in db'
end catch
end








GO
/****** Object:  StoredProcedure [dbo].[sp_addvideo]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_addvideo]
@status bit,
@videoTitle varchar(100)=null,
@course int=0,
@videolink varchar(250)=null,
@videodetails varchar(270)=null,
@duration int=0,
@chapter varchar(100),
@ispaid bit
as
begin
insert into video(status,videoTitle,course,videolink,videodetails,duration,chapter,ispaid) 
values(1,@videoTitle,@course,@videolink,@videodetails,@duration,@chapter,@ispaid)
select 'record added'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_category]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_category]
@cname varchar(100)=null,
@cpic varchar(100)=null
as 
begin
   begin try
      if not exists(select * from tbl_category where cname=@cname)
	  begin
	    insert into tbl_category(cname,cpic,status) values(@cname,@cpic,1)
		select 'Record added'
	  end
	  else
	  begin
	  select 'Category already exists'
	  end
   end try
   begin catch
       select 'Error in db'
   end catch
end
GO
/****** Object:  StoredProcedure [dbo].[sp_changepassword]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_changepassword]
@semail varchar(120)=null,
@npassword varchar(100)=null
as
begin
update student set password=@npassword where semail=@semail
select 'Password Changed'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_coursedurationfee]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_coursedurationfee]
@csr int=0
as
begin
select ffee,duration from tbl_course where csr=@csr
end

GO
/****** Object:  StoredProcedure [dbo].[sp_coursefeed]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[sp_coursefeed]
as
begin
select * from coursefeedback
end

GO
/****** Object:  StoredProcedure [dbo].[sp_coursefeedback]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_coursefeedback]

@Course_id int=0,
@fullname varchar(100)=null,
@Email varchar(100)=null,
@subject varchar(100)=null,
@comment varchar(100)=null
as
begin
Insert into coursefeedback values(@Course_id,@fullname,@Email,@subject,@comment)
select 'success'
end

GO
/****** Object:  StoredProcedure [dbo].[sp_coursen]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_coursen]
as
begin
select csr,title,ffee,duration from tbl_course
end
GO
/****** Object:  StoredProcedure [dbo].[sp_delcourse]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_delcourse]
@csr int=0
as
begin
delete from tbl_course where csr=@csr
end
GO
/****** Object:  StoredProcedure [dbo].[sp_delvideo]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_delvideo]
@vsr int=0
as
begin
delete from video where vsr=@vsr
end
GO
/****** Object:  StoredProcedure [dbo].[sp_emailveryfication]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_emailveryfication]
@userid varchar(100)=null
as
begin
select semail from student where semail=@userid 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Enroll]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Enroll]
@course int=0,
@email varchar(120)=null,
@finalfee int=0,
@expiry date,
@action int=0
as
begin
if(@action=1)
begin
if not exists (select * from tbl_enroll where  courseid=@course and email=@email)
begin
insert into  tbl_enroll (courseid, email, enrolldate,  finalfee, expiry_date, status) values (@course, @email, GETDATE(), @finalfee, @expiry,1)
select 'Congrats! Tou are enrolled in the course. Go to MyCourse'
end 
else
begin
select 'You are already enrolled'
end

end
end





GO
/****** Object:  StoredProcedure [dbo].[sp_enrolldata]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_enrolldata]
@course int=0,
@email varchar(120)=null
as
begin
select offermng.*,title from offermng left join tbl_course on offermng.course=tbl_course.csr where offermng.course=@course and email=@email
end
GO
/****** Object:  StoredProcedure [dbo].[sp_login]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_login]
@userid varchar(100)=null,
@password varchar(70)=null
as
begin
select sname, semail,password from student where semail=@userid and password=@password
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ManipulateCategary]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ManipulateCategary]
@id int=0,
@action int=0
As 
begin
if(@action=1)
begin
delete from tbl_category where id=@id
end
if(@action=2)
begin
declare @status bit;
set @status=(select status from tbl_category where id=@id)
update tbl_category set status=(case when @status=0 then 1 else 0  end) where id=@id
end
end






GO
/****** Object:  StoredProcedure [dbo].[sp_ManipulateInstructor]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ManipulateInstructor]
@sr int=0,
@action int=0
As 
begin
if(@action=1)
begin
select * from tbl_instructor order by sr
end
if(@action=2)
begin
delete from tbl_instructor where sr=@sr
end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_mycoursedata]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_mycoursedata]
@email varchar(120)=null
as
begin
with cte as(
select course,count(*) as 'TotalLecture',sum(duration) as 'totalduration' from video group by course)
select * from tbl_course left join cte on tbl_course.csr=cte.course left join tbl_category on tbl_course.instructor
=tbl_category.id left join tbl_instructor on tbl_course.instructor=tbl_instructor.sr left join tbl_enroll on tbl_course.csr=tbl_enroll.courseid
where tbl_enroll.email=@email 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_passwordchange]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_passwordchange]
@semail varchar(120)=null,
@npassword varchar(100)=null,
@opassword varchar(120)=null
as
begin
update student set password=@npassword where semail=@semail and password=@opassword
select 'Password Changed'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_profile]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_profile]
@semail varchar(120)=null
as
begin
select * from student left join tbl_course on student.course=tbl_course.csr where semail=@semail
end
GO
/****** Object:  StoredProcedure [dbo].[sp_selCourse]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_selCourse]
as
begin
select csr,title,thumb,tbl_category.cname,tbl_instructor.name,fee,ffee,details,duration from tbl_course left join tbl_category on
tbl_course.category=tbl_category.id left join tbl_instructor on tbl_instructor.sr=tbl_course.instructor
end

GO
/****** Object:  StoredProcedure [dbo].[sp_selcoursedetailsn]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_selcoursedetailsn]
@csr int=0
as
begin
select v.*, c.title from video as v left join tbl_course c on v.course=c.csr where csr=@csr order by vsr desc
end
GO
/****** Object:  StoredProcedure [dbo].[sp_selectAllCategory]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_selectAllCategory]
@action int=0
as 
begin
if(@action=1)
begin
select * from tbl_category order by id desc
end
if(@action=2)
begin
select * from tbl_category where status=1 order by id desc
end
if(@action=3)
begin
select * from tbl_instructor
end
if(@action=4)
begin
with cte as
(
select category as id,count(*) as 'totalcourse' from tbl_course group by category)
select top 8 tbl_category.*,isnull
(cte.totalcourse,0) from tbl_category left join cte on cte.id=tbl_category.id where status=1 order by cte.totalcourse desc 
end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_selectallData]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_selectallData]
@semail varchar(100)=null,
@csr int=0
as
begin
select * from student left join tbl_course on student.course=tbl_course.csr left Join offermng on tbl_course.csr=offermng.course and offermng.email=
@semail where semail=@semail and student.course=@csr
end
GO
/****** Object:  StoredProcedure [dbo].[sp_selectallDataoffer]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_selectallDataoffer]
@semail varchar(100)=null,
@csr int=0
as
begin
select discountamt,discountdate from offermng  where email=@semail and course=@csr
end
GO
/****** Object:  StoredProcedure [dbo].[sp_selectCourse]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_selectCourse]
as
begin
select * from tbl_course
end
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectCourseInfo]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_SelectCourseInfo]
as
begin
with cte as(
select course,count(*) as 'TotalLecture',sum(duration) as 'totalduration' from video group by course)
select top 6 * from tbl_course left join cte on tbl_course.csr=cte.course left join tbl_category on tbl_course.instructor
=tbl_category.id left join tbl_instructor on tbl_course.instructor=tbl_instructor.sr
order by tbl_course.csr desc
end
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectCourseWiseCategory]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectCourseWiseCategory]
@id int=0,
@action int=0
as
begin
if(@action=1)
begin
with cte as
(
select category as id,count(*) as 'totalcourse' from tbl_course group by category)
select tbl_category.*,isnull
(cte.totalcourse,0) as totalcourse from tbl_category left join cte on cte.id=tbl_category.id where status=1 order by cte.totalcourse desc
end
--select all courses with video details, category,and instructor
if(@action=2)
begin
with cte as(
select course,count(*) as 'TotalLecture',sum(duration) as 'totalduration' from video group by course)
select top 6 * from tbl_course left join cte on tbl_course.csr=cte.course left join tbl_category on tbl_course.instructor
=tbl_category.id left join tbl_instructor on tbl_course.instructor=tbl_instructor.sr 
order by tbl_course.csr desc
end
if(@action=3)
begin
with cte as(
select course,count(*) as 'TotalLecture',sum(duration) as 'totalduration' from video group by course)
select * from tbl_course left join cte on tbl_course.csr=cte.course left join tbl_category on tbl_course.instructor
=tbl_category.id left join tbl_instructor on tbl_course.instructor=tbl_instructor.sr where tbl_course.category=@id
order by tbl_course.csr desc
end
end

GO
/****** Object:  StoredProcedure [dbo].[sp_selectCoursewisechapter]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_selectCoursewisechapter]
@course int=0
as
begin
select min(vsr) as 'sr',chapter from video where course=@course group by chapter order by min(vsr)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_selectdata]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_selectdata]
@semail varchar(100)=null
as
begin
begin try
if exists(select * from student where semail=@semail)
begin
select * from student left join tbl_course on student.course=tbl_course.csr where semail=@semail
end
else
begin
select 'Email Not Found'
end
end try
begin Catch
select 'error in db'
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectoneCoursedetails]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_SelectoneCoursedetails]
@csr int=0
as
begin
with cte as(
select course,count(*) as 'TotalLecture',sum(duration) as 'totalduration' from video group by course)
select * from tbl_course left join cte on tbl_course.csr=cte.course left join tbl_category on tbl_course.instructor
=tbl_category.id left join tbl_instructor on tbl_course.instructor=tbl_instructor.sr where tbl_course.csr=@csr
order by tbl_course.csr desc
end
GO
/****** Object:  StoredProcedure [dbo].[sp_selectstudentmng]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_selectstudentmng]
as
begin
select student.*,title from student left join tbl_course on student.course=tbl_course.csr order by course
end
GO
/****** Object:  StoredProcedure [dbo].[sp_selOneCotegary]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_selOneCotegary]
@id int =0
as 
begin
select * from tbl_category where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_selonecourse]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_selonecourse]
@csr int=0
as
begin
select * from tbl_course where csr=@csr
end
GO
/****** Object:  StoredProcedure [dbo].[sp_selOneInstructor]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_selOneInstructor]
@sr int =0
as 
begin
select * from tbl_instructor where sr=@sr
end
GO
/****** Object:  StoredProcedure [dbo].[sp_selvideo]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_selvideo]
as
begin
select vsr,videoTitle,title,videolink,videodetails,video.duration from video left join tbl_course on video.course=tbl_course.csr
end
GO
/****** Object:  StoredProcedure [dbo].[sp_updateCotegary]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_updateCotegary]
@id int=0,
@cname varchar(100)=null,
@cpic varchar(100)=null
as
begin
update tbl_category set cname=@cname,cpic=@cpic where id=@id
select 'Record Updated'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_updateCourse]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_updateCourse]
@csr int=0,
@title varchar(100)=null,
@thumb varchar(100)=null,
@category int=null,
@instructor int=null,
@fee int=null,
@ffee int=null,
@details varchar(250)=null,
@duration date=null
as
begin
update tbl_course set title=@title,thumb=@thumb,category=@category,instructor=@instructor,fee=@fee,ffee=@ffee,details=@details,duration=@duration where csr=@csr
select 'Record Updated'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateInstructor]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_UpdateInstructor]
@sr int=0,
@name varchar(100)=null,
@email varchar(120)=null,
@mobile bigint=null,
@gender varchar(100)=null,
@ipic varchar(100)=null,
@summary varchar(250)=null,
@about varchar(250)=null,
@Btech varchar(60)=null,
@Mtech  Varchar(60)=null,
@BCA varchar(60)=null,
@MCA varchar(60)=null,
@Phd varchar(60)=null
as
begin
update tbl_instructor set name=@name,email=@email,mobile=@mobile,gender=@gender,ipic=@ipic,summary=@summary,about=@about,Btech=@Btech,
Mtech=@Mtech,BCA=@BCA,MCA=@MCA,Phd=@Phd where sr=@sr
select 'Record Updated'
end

GO
/****** Object:  StoredProcedure [dbo].[sp_updatestudent]    Script Date: 3/30/2024 11:34:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc  [dbo].[sp_updatestudent]
@sname varchar(100)=null,
@semail varchar(120)=null,
@gender varchar(70)=null,
@mobile bigint=null,
@college varchar(120)=null,
@course int=null,
@year varchar(50)=null,
@profile varchar(100)=null,
@password varchar(70)=null
as
begin
update student set sname=@sname,gender=@gender,mobile=@mobile,college=@college,course=@course,year=@year,profile=@profile,password=@password
where semail=@semail
select 'Record Updated'
end



GO
USE [master]
GO
ALTER DATABASE [codehelperdb] SET  READ_WRITE 
GO
