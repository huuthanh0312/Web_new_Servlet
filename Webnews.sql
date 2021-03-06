USE [master]
GO
/****** Object:  Database [Webnews]    Script Date: 9/11/2020 10:08:55 PM ******/
CREATE DATABASE [Webnews]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Webnews', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Webnews.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Webnews_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Webnews_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Webnews] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Webnews].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Webnews] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Webnews] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Webnews] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Webnews] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Webnews] SET ARITHABORT OFF 
GO
ALTER DATABASE [Webnews] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Webnews] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Webnews] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Webnews] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Webnews] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Webnews] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Webnews] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Webnews] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Webnews] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Webnews] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Webnews] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Webnews] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Webnews] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Webnews] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Webnews] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Webnews] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Webnews] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Webnews] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Webnews] SET  MULTI_USER 
GO
ALTER DATABASE [Webnews] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Webnews] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Webnews] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Webnews] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Webnews] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Webnews] SET QUERY_STORE = OFF
GO
USE [Webnews]
GO
/****** Object:  Table [dbo].[DANHMUC]    Script Date: 9/11/2020 10:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHMUC](
	[categoryid] [int] IDENTITY(1,1) NOT NULL,
	[categoryname] [nvarchar](50) NULL,
 CONSTRAINT [PK_DANHMUC] PRIMARY KEY CLUSTERED 
(
	[categoryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DANHMUCADMIN]    Script Date: 9/11/2020 10:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHMUCADMIN](
	[adminid] [int] IDENTITY(1,1) NOT NULL,
	[adminname] [ntext] NULL,
 CONSTRAINT [PK_DANHMUCADMIN] PRIMARY KEY CLUSTERED 
(
	[adminid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEWS]    Script Date: 9/11/2020 10:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEWS](
	[newsid] [int] IDENTITY(1,1) NOT NULL,
	[categoryid] [int] NOT NULL,
	[tieude] [ntext] NULL,
	[mota] [ntext] NULL,
	[noidung] [ntext] NULL,
	[date] [date] NULL,
	[img] [nvarchar](50) NULL,
	[usersid] [int] NOT NULL,
 CONSTRAINT [PK_NEWS_1] PRIMARY KEY CLUSTERED 
(
	[newsid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USER]    Script Date: 9/11/2020 10:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER](
	[usersid] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[fullname] [nvarchar](50) NULL,
	[adminid] [int] NOT NULL,
 CONSTRAINT [PK_USER_1] PRIMARY KEY CLUSTERED 
(
	[usersid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DANHMUC] ON 

INSERT [dbo].[DANHMUC] ([categoryid], [categoryname]) VALUES (1, N'MOBILE')
INSERT [dbo].[DANHMUC] ([categoryid], [categoryname]) VALUES (2, N'TIN ICT')
INSERT [dbo].[DANHMUC] ([categoryid], [categoryname]) VALUES (3, N'INTERNET')
SET IDENTITY_INSERT [dbo].[DANHMUC] OFF
GO
SET IDENTITY_INSERT [dbo].[DANHMUCADMIN] ON 

INSERT [dbo].[DANHMUCADMIN] ([adminid], [adminname]) VALUES (1, N'Quản trị chính')
INSERT [dbo].[DANHMUCADMIN] ([adminid], [adminname]) VALUES (2, N'Quản trị phụ')
SET IDENTITY_INSERT [dbo].[DANHMUCADMIN] OFF
GO
SET IDENTITY_INSERT [dbo].[NEWS] ON 

INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (1, 1, N'Vsmart 4 Live  rò rỉ toàn bộ: Snapdragon 675, pin 5000mAh, 4 camera, màn hình đục lỗ', N'Smartphone tiếp theo của VinSmart là Vsmart Live 4 đã rò rỉ hình ảnh thiết kế và thông số cấu hình. Ẩn số còn lại duy nhất là mức giá.', N'Smartphone tiếp theo của VinSmart là Vsmart Live 4 đã rò rỉ hình ảnh thiết kế và thông số cấu hình. Ẩn số còn lại duy nhất là mức giá.

Mới đây, hình ảnh được cho là của mẫu Vsmart Live 4 đã bất ngờ xuất hiện trên Internet, cho chúng ta một cái nhìn chi tiết về mẫu smartphone sắp ra mắt của VinSmart. Dù không phải lần đầu tiên bị rò rỉ, thế nhưng những hình ảnh mới đã giúp cho chúng ta xác nhận những thông tin về tên gọi, thiết kế và cả cấu hình của mẫu máy mới này.

Qua hình ảnh được chia sẻ, Vsmart Live 4 sẽ sử dụng màn hình đục lỗ được đặt ở góc trái. Đây là lần đầu tiên có một mẫu smartphone Vsmart mang thiết kế này.

 Mặt lưng của máy nổi bật bởi cụm 4 camera được đặt trong một cụm hình chữ nhật, khá giống với những mẫu máy tầm trung của Samsung ra mắt gần đây. Ngoài ra, người dùng còn có thể thấy được sự xuất hiện của cảm biến vân tay vật lý ở mặt lưng này.', CAST(N'2020-08-23' AS Date), N'vinfast.jpg', 1)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (2, 2, N'Epic Games và Apple, ai đúng ai sai?', N'Chia sẻ doanh thu là một quy tắc kinh doanh rất phổ biến, trong đó 30% cũng là tỷ lệ thường thấy trong ngành nội dung số.', N'  Chủ đề phổ biến nhất trong giới công nghệ gần đây là cuộc chiến giữa Epic Games với Apple và Google.
 Nguyên nhân là bởi vì Epic đã thêm phương thức thanh toán mua hàng trong ứng dụng của riêng mình vào trò chơi nổi tiếng Fornite, nhằm vượt qua các quy tắc thanh toán của cửa hàng App Store và Google Play.

Tất nhiên, Apple và Google sẽ không bỏ qua một hoạt động thách thức hiển nhiên như vậy. Do đó, cả hai đều đã gỡ Fornite khỏi các kho ứng dụng của riêng mình.

Đáp lại, không chỉ tung chủ đề #FreeFortnite lên mạng xã hội để hướng dẫn cộng đồng người chơi, Epic còn nhanh chóng thuê luật sư kiện Apple và Google vì nghi ngờ độc quyền.

Nhìn lại “màn trình diễn” của Epic những ngày này, nó khá giống với trận blitzkrieg trong lịch sử, đều là những cuộc tấn công chớp nhoáng, nhưng kết quả của hai bên lại khác nhau. Trong Thế chiến thứ hai, các quốc gia như Đức và Liên Xô đã chiếm được Ba Lan một cách bất ngờ thông qua các cuộc hành quân thần tốc, nhưng cuộc chiến vô hình giữa Epic với Apple và Google lại bị cuốn vào vòng xoáy lo lắng.

Nguyên nhân của vấn đề bắt nguồn từ tuần trước, khi Epic thêm phương thức thanh toán mới vào trò chơi nổi tiếng. Giá gốc của 1.000 đồng tiền trò chơi trong trò chơi là 9,99 USD. Tuy nhiên, nếu sử dụng phương thức thanh toán mới do Epic cung cấp thì chỉ có giá 7,99 USD.

Lý do của sự chênh lệch giá này là do Google và Apple tính phí 30% giao dịch mua hàng hóa ảo trong trò chơi. Do đó, hành vi thêm phương thức thanh toán mới của Epic chắc chắn đã bỏ qua hệ thống thanh toán của App Store và Google Play. Apple và Google đã loại bỏ trò chơi Fortnite một cách không mấy bất ngờ.

Một câu hỏi đặt ra, đó là việc gỡ bỏ có ảnh hưởng lớn đến các nhà sản xuất game như Epic hay không? Trước hết, do chiến lược đóng cửa App Store của Apple bên phía iOS, người dùng khó có thể tải ứng dụng mới thông qua các hình thức khác ngoài App Store. Điều này khiến người dùng iPhone mới không thể tải về Fornite.

Về phía Android, dù Epic đã mất kênh phân phối của Google Play, người dùng vẫn có thể lấy gói cài đặt ứng dụng từ các kênh khác. Tuy nhiên, tầm ảnh hưởng mạnh mẽ ở nước ngoài của Google Play vẫn tác động lớn đến việc thu hút người dùng mới của Epic.
Theo thông tin của Epic, người dùng đã tải xuống Fortnite vẫn có thể sử dụng hầu hết các tính năng của trò chơi.', CAST(N'2020-08-23' AS Date), N'applevsEpic.jpg', 2)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (3, 2, N'Facebook đối mặt với một cuộc khủng hoảng mới tại Ấn Độ', N'Tại Ấn Độ, Facebook đang phải đối mặt với một cuộc khủng hoảng về quan hệ công chúng và chính trị.', N'  Tin tức trước đó cho biết, Ankhi Das, giám đốc vận động hành lang của Facebook ở Ấn Độ, phản đối việc áp dụng các quy tắc xử lý ngôn từ đả kích đối với một chính trị gia trong đảng Nhân dân Ấn Độ của Thủ tướng Modi. Chính trị gia này đã đăng một bài viết trên nền tảng Facebook, gọi người Hồi giáo là kẻ phản bội.

Nhiều nhân viên của Facebook đã đặt ra câu hỏi về việc liệu nhóm người Ấn Độ của công ty đã tuân thủ các quy trình giám sát nội dung phù hợp hay chưa. Những nhân viên này sau đó đã công bố một bức thư ngỏ trên nền tảng nội bộ.

Trong thư, họ yêu cầu ban lãnh đạo công nhận và lên án "thành kiến ​​đối với người Hồi giáo" và đảm bảo tính nhất quán trong chính sách. Tuy nhiên, cả Facebook và Das đều không trả lời yêu cầu bình luận.

Trong những năm gần đây, Facebook đã bị chỉ trích vì xử lý lỏng lẻo các nội dung sai sự thật và bạo lực. Đáp lại các báo cáo có liên quan, Facebook đã tuyên bố rằng chính sách của công ty là cấm phát ngôn kích động bạo lực và thù hận, đồng thời không xem xét lập trường chính trị hoặc đảng phái khi thực hiện chính sách này.

Facebook cho biết: “Mặc dù còn rất nhiều việc phải làm, nhưng chúng tôi đang đạt được tiến bộ trong việc thực hiện chính sách và kiểm toán thường xuyên". Facebook hiện có hơn 300 triệu người dùng ở Ấn Độ.

Das, 49 tuổi, được coi là một trong những giám đốc vận động hành lang doanh nghiệp có ảnh hưởng nhất ở Ấn Độ. Kể từ khi gia nhập vào năm 2011, ông này đã trở thành nhân vật cốt lõi trong việc phát triển kinh doanh của Facebook tại Ấn Độ.', CAST(N'2020-08-23' AS Date), N'fvsando.jpg', 2)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (4, 1, N'Trải nghiệm Oneplus 8 Pro 5G: Quá tốt nhưng vẫn còn điều phải lăn tăn', N'Những người yêu thích tốc độ hẳn sẽ thích chiếc smartphone này, nhưng có đủ thích để bỏ ra số tiền 25 triệu Đồng không?', N'  OnePlus là một hãng khiến tôi và khá nhiều người dùng Việt Nam tò mò khi chỉ xuất hiện tại thị trường nước ta trong một thời gian rất ngắn rồi biến mất trong suốt 4 năm. Hãng này nổi lên nhờ những lời khen ''có cánh'' của các reviewer nước ngoài là hãng smartphone nhanh về mọi mặt, dành cho những người ''mê cấu hình'' và và thích sự tối giản ở mức giá không quá cao, tạo một lượng fan gắn bó trung thành.

Điều này có lẽ đã thay đổi với Oneplus 8 Pro 5G, khi chiếc smartphone này tiến thẳng lên phân khúc cao cấp để cạnh tranh với flagship của những tên tuổi lớn; hãng cũng nhân cơ hội này để có màn ''comeback'' vào Việt Nam sau thời gian dài vắng bóng. Trong tình hình thị trường smartphone trong nước đã quá bão hòa, Oneplus 8 Pro 5G đem lại điều gì khác biệt để giúp màn trở lại của OnePlus có thể thành công?
Phần cứng đạt đỉnh, chỉ thiếu gập đôi vào mà thôi!

Nhắc đi nhắc lại có lẽ phải đến chục lần, nhưng những sự nâng cấp của smartphone ''truyền thống'' đã chậm lại trong mấy năm nay rồi. Từ sản phẩm flagship này sang sản phẩm flagship khác có những điểm tương đồng không hề nhỏ, thậm chí những nâng cấp của các đời máy từ năm này qua năm khác cũng đã không còn quá lớn, bỏ một số tiền đủ lớn là chắc chắn bạn sẽ có cấu hình cao cấp để làm được tất cả mọi thứ.', CAST(N'2020-08-23' AS Date), N'oneplus.jpg', 1)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (6, 1, N'Vì công nghệ 5G, Apple buộc phải dùng pin rẻ tiền hơn cho iPhone 12?', N'Apple phải sử dụng một số linh kiện rẻ tiền hơn nhằm giảm thiểu chi phí sản xuất iPhone 12, theo nhà phân tích nổi tiếng Ming-chi Kuo.', N' Việc iPhone 12 lần đầu tiên bổ sung thêm công nghệ 5G đã khiến chi phí sản xuất của mẫu smartphone này tăng cao hơn so với các thế hệ iPhone trước đây. Chính vấn đề này đã buộc Apple phải sử dụng một số linh kiện rẻ tiền hơn nhằm giảm thiểu chi phí sản xuất iPhone 12, theo nhà phân tích nổi tiếng Ming-chi Kuo.

Vì công nghệ 5G, Apple buộc phải dùng pin rẻ tiền hơn cho iPhone 12? 

Cụ thể, các lớp bảng mạch pin của iPhone 12 sẽ bị giảm, trong khi kích thước các thành phần của cell pin cũng được rút gọn kích thước. Sự thay đổi trong thiết kế bảng mạch pin đã giúp chi phí sản xuất dành cho linh kiện này trên iPhone 12 rẻ hơn từ 40-50% so với iPhone 11. Không dừng lại ở đây, sang năm 2021, chi phí sản xuất pin thế hệ tiếp theo của iPhone 12 sẽ tiếp tục giảm sâu thêm từ 30 đến 40%, theo Ming-chi Kuo.

Không chỉ riêng iPhone, chi phí sản xuất pin cho AirPods thế hệ thứ 3 vốn ra mắt vào năm sau cũng sẽ giảm mạnh, khi mẫu tai nghe này chuyển sang sử dụng kiểu thiết kế SiP (system in package) tương tự như AirPods Pro.

Tuy nhiên, nhà phân tích Ming-chi Kuo cũng khẳng định, những thay đổi nói trên của Apple vẫn chưa thể bù đắp nổi chi phí sản xuất phần cứng cho công nghệ 5G, vốn rất đắt đỏ. Kuo tin rằng, việc iPhone 12 hỗ trợ dải băng tần mmWave sẽ khiến Apple tiêu tốn từ 125 USD đến 135 USD cho chi phí sản xuất. Chưa kể đến, việc hỗ trợ cả băng tần Sub-6 cũng khiến hãng này tiêu tốn thêm từ 75 đến 85 USD.

Theo AppleInsider, việc iPhone 12 loại bỏ củ sạc và tai nghe kèm theo được cho là cũng là một cách để Apple bù đáp chi phí sản xuất các linh kiện 5G, nhằm giữ cho giá bán của sản phẩm không bị đội lên quá cao, đồng thời giúp Táo khuyết đạt được lợi nhuận cao nhất có thể. 

Được biết, iPhone 12 sẽ được Apple trình làng muộn hơn vài tuần so với hàng năm, có thể rơi vào tháng 10 năm nay.', CAST(N'2020-08-23' AS Date), N'apple.jpg', 2)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (7, 3, N'SpaceX vừa lập thêm một kỷ lục chưa từng có hãng nào làm được', N'Tên lửa Falcon 9 vừa được SpaceX phóng lên đã được tái sử dụng đến lần 6, một kỷ lục chưa từng có hãng nào làm được.', N'Ngày 18 tháng Tám vừa qua, hãng SpaceX vừa phóng tên lửa thứ 11 trong dự án Starlink của mình, mang theo 58 vệ tinh phát internet Starlink lên bầu trời để chuẩn bị cho dự án truyền internet từ ngoài không gian của mình.

Không chỉ đưa dự án Starlink tiến gần thêm một bước nữa, lần phóng vừa qua của SpaceX còn chứng kiến một kỷ lục ít người ngờ tới: đây là lần thứ 6 tên lửa Falcon 9 của SpaceX được tái sử dụng – một kỷ lục cho đến nay chưa hãng phóng tên lửa đối thủ nào có thể bắt kịp.

SpaceX vừa lập thêm một kỷ lục chưa từng có hãng nào làm được 

Tầng đầu của tên lửa Falcon 9 hạ cánh xuống bệ đỡ di động

Dù đã được tái sử dụng đến lần thứ 6, nhưng tên lửa Falcon 9 vẫn không gặp khó khăn gì khi tiến vào không gian và triển khai 58 vệ tinh Starlink cùng 3 vệ tinh khác của hãng Planet Labs. Và cũng như 5 lần phóng và hạ cánh thành công trước đây, lần này tầng đầu tiên của tên lửa Falcon 9 lại hạ cánh an toàn xuống bệ đỡ di động trên biển "Of Course I Still Love You".

Nhiệm vụ vừa qua cho chúng ta một cái nhìn hoàn toàn mới về kỹ thuật thu hồi tên lửa đã phóng của SpaceX. Giờ đây không chỉ thu hồi được tầng đầu của tên lửa khi lập trình cho chúng hạ cánh an toàn xuống các bệ đỡ di động trên biển, SpaceX còn có thể thu hồi được tầng thứ hai của tên lửa bằng cách dùng lưới nhẹ nhàng đón lấy nó giữa biển khơi.

Cảnh đón bắt bằng lưới với tầng thứ hai của tên lửa Falcon 9 trên biển.
Trong khi việc tầng phóng đầu tiên đã được lập trình để có thể hạ cánh chính xác xuống các bệ đỡ di động trên biển, việc đón bắt được tầng tên lửa thứ hai trở nên khó khăn hơn nhiều. Do chúng sẽ được hạ cánh bằng dù trên biển, nên việc dự đoán chính xác vị trí hạ cánh của chúng khó khăn hơn nhiều khi gió biển hoặc các điều kiện khác hoàn toàn có thể tác động đến nó.

Trong lần hạ cánh trước, SpaceX đã thất bại khi tầng tên lửa thứ hai này rơi xuống nhanh hơn dự tính và tàu giăng lưới của công ty đã không kịp tới để đón lấy nó.

Mặc dù vậy, thành công vừa qua của SpaceX cho thấy công ty đang dần hoàn thiện hơn nữa khả năng đón bắt 100% mỗi tên lửa phóng lên không gian của mình. Cũng giống như các thách thức trong việc lập trình hạ cánh tầng đầu của mỗi tên lửa, công ty thường gặp nhiều thất bại và trở ngại trong các lần phóng đầu tiên nhưng sau đó SpaceX đều có thể khắc phục ', CAST(N'2020-08-23' AS Date), N'tenlua.jpg', 2)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (9, 3, N'Chỉ cần xem một đoạn video 2D, AI mới của Facebook có thể biến nó thành hình ảnh 3D', N'Thuật toán nay có thể xem một đoạn video bình thường, và trong quá trình đó, nó sẽ tìm ra cách để biến video thành một khung cảnh 3D hoàn chỉnh theo từng khung hình.', N'"Đánh tôi đi", Morpheus nói. "Nếu anh có thể." Neo liền nạp một chương trình võ thuật và tung ra một loạt các chiêu thức về phía người thầy của mình. Morpheus chặn được mọi nỗ lực tấn công mà không mất chút sức lực. Khung cảnh này chính là màn huấn luyện được trích từ phim Ma Trận năm 1999, một bộ phim khiến bao người sững sờ vào thời đó khi kết hợp cốt truyện tập trung vào trí tuệ nhân tạo (AI) với đồ hoạ máy tính tiên tiến.

Hơn 20 năm sau, khung cảnh đó được Facebook sử dụng làm demo biểu diễn công nghệ nhận dạng hình ảnh AI đột phá của họ. Trên màn hình, khung cảnh này vẫn diễn ra như bình thường. Gần như bình thường thì đúng hơn. Trong khi Morpheus và hậu cảnh không hề thay đổi, đoạn phim 2D có mặt Keanu Reeve đã được biến đổi thành một mô hình 3D. Dù bản demo này chỉ được dựng một cách sơ sài, Andrea Vedaldi, một trong những chuyên gia về AI của Facebook (cụ thể là thị giác máy tính và học máy), cho biết khung cảnh 3D biến đổi từ 2D kia có thể được dựng hình trong thời gian thực.

Điều đó có nghĩa là các thuật toán AI của Facebook có thể xem một video thông thường, và khi video đang chiếu, AI có thể tìm ra cách để biến nó thành một khung cảnh 3D hoàn chỉnh, theo từng khung hình. Demo lấy từ phim Ma Trận có thể được xem là một ví dụ đặc biệt ấn tượng của thuật toán, bởi những thế võ kung-fu dù đẹp mắt nhưng vẫn cực kỳ khó xử lý kể cả với con người, chứ chưa nói là một cỗ máy chỉ biết ngoại suy. Kết quả thu được chưa hoàn hảo, nhưng khá tốt đấy chứ!
Chỉ cần xem một đoạn video 2D, AI mới của Facebook có thể biến nó thành hình ảnh 3D - Ảnh 1.
"Đây là một video rất, rất thử thách bởi nó cho bạn thấy những tư thế võ thuật" - Vedaldi nói. "Đây không phải là thứ bạn thường thấy trong một ứng dụng người dùng. Nó được thực hiện cho vui, chỉ để biểu diễn khả năng của hệ thống mà thôi".
Trước một tác vụ đơn giản hơn - ví dụ, biến một video cậu nhóc nhà bạn đang đá banh thành các mô hình khung dây hay làm điều tương tự với một bức ảnh tĩnh chụp khi đi du lịch - thuật toán của Facebook trở nên lão luyện hơn nhiều. Và nó cũng dần tốt hơn theo thời gian.
Trích xuất dữ liệu từ hình ảnh

Việc Facebook tập trung nghiên cứu về thuật toán như trên mới nghe qua có vẻ khá kỳ lạ. Lẽ ra họ nên cải thiện thuật toán news feed chứ? Hoặc tìm ra những cách mới mẻ để đề xuất các nhãn hiệu hoặc nội dung mà có thể bạn sẽ hứng thú muốn tương tác? Nhưng tại sao lại là biến ảnh 2D thành 3D? Rõ ràng đây không phải là loại nghiên cứu mà bạn có thể nghĩ một gã khổng lồ truyền thông xã hội sẽ đầu tư. Nhưng đúng là vậy - kể cả khi chẳng hề có kế hoạch nào nhằm biến nghiên cứu này thành một tính năng trên giao diện người dùng của Facebook.

Trên thực tế, trong 7 năm qua, Facebook đã là một trong những cái tên hàng đầu trong lĩnh vực trí tuệ nhân tạo. Năm 2013, Yann LeCun, một trong những chuyên gia đầu ngành về học sâu trên thế giới, đã gia nhập Facebook để nghiên cứu AI trên một quy mô mà hầu như không thể đạt được tại 99% số phòng thí nghiệm AI toàn cầu. Kể từ đó, Facebook đã mở rộng bộ phận AI của hãng - gọi là FAIR (Facebook AI Research) - ra toàn thế giới. Ngày nay, hãng có 300 kỹ sư và nhà khoa học toàn thời gian đang tích cực làm việc với mục tiêu đưa ra được những công nghệ trí tuệ nhân tạo hấp dẫn của tương lai. Các văn phòng của FAIR được đặt tại Seattle, Pittsburgh, Montreal, Boston, London, và Tel Aviv, Israel - với đội ngũ nhân viên gồm toàn những nhà nghiên cứu hàng đầu trong lĩnh vực này.
Tim ra phương pháp để hiểu rõ hơn nội dung các bức ảnh là một trọng tâm lớn đối với Facebook. Kể từ năm 2017, Facebook đã sử dụng các mạng thần kinh nhân tạo để tự động tag tên người dùng trong các bức ảnh, kể cả khi họ không được người khác tag. Từ đó đến nay, công nghệ nhận dạng hình ảnh của gã khổng lồ truyền thông xã hội đã trở nên tinh vi hơn rất nhiều.

Chỉ cần xem một đoạn video 2D, AI mới của Facebook có thể biến nó thành hình ảnh 3D.
Trớ trêu thay, một trong những tình huống gần đây nhất mà công nghệ này lộ diện trước mắt người dùng là khi Facebook gặp vấn đề. Vào tháng 7/2019, một đợt mất điện tạm thời đã khiến nhiều ảnh không hiển thị trên Facebook. Tại vị trí của chúng là các khung ảnh, đi kèm với những tag do học máy tạo ra miêu tả suy nghĩ của AI về những thứ có trong ảnh. Một số tag ghi rằng: "Ảnh có thể chứa: cây, bầu trời, ngoài trời, tự nhiên, mèo, người đang đứng". Giống hệt như phim Ma Trận, cảnh cuối cùng trong phần 1, khi Neo đạt được cảnh giới mới, có thể thấy được thế giới dưới dạng những dòng mã chạy liên tục không ngừng nghỉ!
Facebook hiện đã tiến thêm được một bước mới. Theo một slide đi kèm với đoạn demo Ma Trận của Facebook nói trên thì: "Chúng tôi muốn hiểu mọi thứ dưới dạng 3D, ngay lần đầu nhìn thấy." Tất nhiên không chỉ nhận biết con người, mà "Chúng tôi thực sự muốn AI có thể hiểu được thế giới như chúng ta vậy" - Vedaldi nói.

Chỉ cần xem một đoạn video 2D, AI mới của Facebook có thể biến nó thành hình ảnh 3D - Ảnh 3.

Điều đó có nghĩa là Facebook muốn khi cho AI của họ bức ảnh một chiếc máy bay, nó sẽ có thể nhận biết đó là một chiếc máy bay, hiểu được hình dáng của nó trong không gian 3D, và dự đoán nó sẽ di chuyển ra sao. Điều tương tự cũng diễn ra với một cái ghế. Một chú chim. Một chiếc xe. Hay một người đang tập yoga
.
Liệu công nghệ này có được mang lên một ứng dụng bạn thường dùng?
Không đâu. Demo này sẽ không hiện diện như một tính năng Facebook trong tương lai gần, nhưng huấn luyện AI hiểu thế giới thông qua các hình ảnh mà nó thấy rõ ràng là một điều Facebook đang thực hiện trong mô hình kinh doanh tổng thể của họ. Từ khi Facebook được hình thành đến nay, đã có hơn 250 tỷ bức ảnh được đăng tải lên nền tảng, tức xấp xỉ 350 triệu ảnh mỗi ngày. Facebook còn sở hữu Instagram, có xấp xỉ 40 tỷ ảnh và video được đăng tải từ khi thành hình, và 95 triệu ảnh được đăng tải mỗi ngày.

Là một trong những cách chính để mọi người giao tiếp với nhau trên internet, hiểu được điều gì đang diễn ra trong những bức ảnh sẽ mang lại giá trị to lớn - theo nhiều khía cạnh khác nhau - cho sứ mệnh của Faecbook. Hiểu và tương tác được với các hình ảnh trong môi trường 3D cũng sẽ cho phép Facebook phát triển mạnh mẽ hơn các công nghệ mới như AR. Hãy hình dung một ứng dụng AR có khả năng biến các bức ảnh Facebook 2D của bạn từ nhiều năm trước thành ảnh 3D, và cho phép bạn khám phá lại khung cảnh đó trong AR mà xem. Liệu Facebook có tạo ra một thứ như vậy? Không chắc, nhưng công nghệ để tạo ra điều đó - và rất nhiều thứ khác nữa - đã có rồi.

"Hướng nghiên cứu của chúng tôi là khá nhất quán với các ưu tiên của công ty" - Natalia Neverova, trưởng nhóm nghiên cứu tại FAIR Paris nói. "Chúng tôi kỳ vọng ít nhất một lượng lớn trong số các nghiên cứu sẽ được ứng dụng vào các sản phẩm. Nhưng tôi không thể nói thời gian hay ứng dụng cụ thể"', CAST(N'2020-08-24' AS Date), N'ai.jpg', 2)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (16, 3, N'Chỉ cần xem một đoạn video 2D, AI mới của Facebook có thể biến nó thành hình ảnh 3D', N'Thuật toán nay có thể xem một đoạn video bình thường, và trong quá trình đó, nó sẽ tìm ra cách để biến...', N'   Neo liền nạp một chương trình võ thuật và tung ra một loạt các chiêu thức về phía người thầy của mình. Morpheus chặn được mọi nỗ lực tấn công mà không mất chút sức lực. Khung cảnh này chính là màn huấn luyện được trích từ phim Ma Trận năm 1999, một bộ phim khiến bao người sững sờ vào thời đó khi kết hợp cốt truyện tập trung vào trí tuệ nhân tạo (AI) với đồ hoạ máy tính tiên tiến.

Hơn 20 năm sau, khung cảnh đó được Facebook sử dụng làm demo biểu diễn công nghệ nhận dạng hình ảnh AI đột phá của họ. Trên màn hình, khung cảnh này vẫn diễn ra như bình thường. Gần như bình thường thì đúng hơn. Trong khi Morpheus và hậu cảnh không hề thay đổi, đoạn phim 2D có mặt Keanu Reeve đã được biến đổi thành một mô hình 3D. Dù bản demo này chỉ được dựng một cách sơ sài, Andrea Vedaldi, một trong những chuyên gia về AI của Facebook (cụ thể là thị giác máy tính và học máy), cho biết khung cảnh 3D biến đổi từ 2D kia có thể được dựng hình trong thời gian thực.

Điều đó có nghĩa là các thuật toán AI của Facebook có thể xem một video thông thường, và khi video đang chiếu, AI có thể tìm ra cách để biến nó thành một khung cảnh 3D hoàn chỉnh, theo từng khung hình. Demo lấy từ phim Ma Trận có thể được xem là một ví dụ đặc biệt ấn tượng của thuật toán, bởi những thế võ kung-fu dù đẹp mắt nhưng vẫn cực kỳ khó xử lý kể cả với con người, chứ chưa nói là một cỗ máy chỉ biết ngoại suy. Kết quả thu được chưa hoàn hảo, nhưng khá tốt đấy chứ!

Chỉ cần xem một đoạn video 2D, AI mới của Facebook có thể biến nó thành hình ảnh 3D - Ảnh 1.

"Đây là một video rất, rất thử thách bởi nó cho bạn thấy những tư thế võ thuật" - Vedaldi nói. "Đây không phải là thứ bạn thường thấy trong một ứng dụng người dùng. Nó được thực hiện cho vui, chỉ để biểu diễn khả năng của hệ thống mà thôi".

Trước một tác vụ đơn giản hơn - ví dụ, biến một video cậu nhóc nhà bạn đang đá banh thành các mô hình khung dây hay làm điều tương tự với một bức ảnh tĩnh chụp khi đi du lịch - thuật toán của Facebook trở nên lão luyện hơn nhiều. Và nó cũng dần tốt hơn theo thời gian.

Trích xuất dữ liệu từ hình ảnh

Việc Facebook tập trung nghiên cứu về thuật toán như trên mới nghe qua có vẻ khá kỳ lạ. Lẽ ra họ nên cải thiện thuật toán news feed chứ? Hoặc tìm ra những cách mới mẻ để đề xuất các nhãn hiệu hoặc nội dung mà có thể bạn sẽ hứng thú muốn tương tác? Nhưng tại sao lại là biến ảnh 2D thành 3D? Rõ ràng đây không phải là loại nghiên cứu mà bạn có thể nghĩ một gã khổng lồ truyền thông xã hội sẽ đầu tư. Nhưng đúng là vậy - kể cả khi chẳng hề có kế hoạch nào nhằm biến nghiên cứu này thành một tính năng trên giao diện người dùng của Facebook.

Trên thực tế, trong 7 năm qua, Facebook đã là một trong những cái tên hàng đầu trong lĩnh vực trí tuệ nhân tạo. Năm 2013, Yann LeCun, một trong những chuyên gia đầu ngành về học sâu trên thế giới, đã gia nhập Facebook để nghiên cứu AI trên một quy mô mà hầu như không thể đạt được tại 99% số phòng thí nghiệm AI toàn cầu. Kể từ đó, Facebook đã mở rộng bộ phận AI của hãng - gọi là FAIR (Facebook AI Research) - ra toàn thế giới. Ngày nay, hãng có 300 kỹ sư và nhà khoa học toàn thời gian đang tích cực làm việc với mục tiêu đưa ra được những công nghệ trí tuệ nhân tạo hấp dẫn của tương lai. Các văn phòng của FAIR được đặt tại Seattle, Pittsburgh, Montreal, Boston, London, và Tel Aviv, Israel - với đội ngũ nhân viên gồm toàn những nhà nghiên cứu hàng đầu trong lĩnh vực này.

Tim ra phương pháp để hiểu rõ hơn nội dung các bức ảnh là một trọng tâm lớn đối với Facebook. Kể từ năm 2017, Facebook đã sử dụng các mạng thần kinh nhân tạo để tự động tag tên người dùng trong các bức ảnh, kể cả khi họ không được người khác tag. Từ đó đến nay, công nghệ nhận dạng hình ảnh của gã khổng lồ truyền thông xã hội đã trở nên tinh vi hơn rất nhiều.', CAST(N'2020-08-26' AS Date), N'ai2d.jpeg', 1)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (17, 3, N'Trung Quốc đang tự tạo cho mình một GitHub riêng mang tên Gitee', N'Liệu nền tảng của Gitee có thể thuyết phục được các nhà phát triển Trung Quốc “hồi hương” từ GitHub.', N'Xung đột Mỹ - Trung đang khiến ngành công nghệ của hai quốc gia này chia rẽ sâu sắc, đồng thời mở ra những cơ hội để các công ty Trung Quốc - từ các nhà sản xuất chip smartphone và xe hơi điện đến phần mềm, vốn là xương sống của hoạt động thường ngày của hàng triệu doanh nghiệp.

Các công ty Trung Quốc hiện đang kiểm soát hầu như toàn bộ các dịch vụ dành cho người tiêu dùng trên internet, nhưng nhiều công nghệ nền tảng chống đỡ các phần cứng và phần mềm doanh nghiệp vẫn nằm trong tay các công ty phương Tây. Khi mà ngành công nghệ ngày càng bị cuốn vào vòng xoáy xung đột địa chính trị trên quy mô lớn, người dùng và các khách hàng của họ chính là những đối tượng chịu ảnh hưởng nhiều nhất. Kế hoạch của Huawei nhằm từ bỏ những con chip nhập khẩu chỉ là một trong rất nhiều ví dụ điển hình cho thấy sự nguy hiểm khi lệ thuộc vào công nghệ nước ngoài của các công ty Trung Quốc.

Một lĩnh vực khác đã và đang khiến cộng đồng công nghệ nước này lo lắng là lưu trữ mã nguồn. Các nhà phát triển Trung Quốc phụ thuộc rất lớn vào GitHub, bằng chứng là khi chính phủ Trung Quốc ban hành lệnh cấm website này hồi năm 2013, cựu giám đốc Google China là Kaifu Lee đã phải lên tiếng. Và nay, Trung Quốc tiếp tục lo sợ rằng xung đột chính trị với Mỹ sẽ gây ảnh hưởng đến GitHub.

Tình huống này không phải chưa từng có tiền lệ. Tháng 7 năm ngoái, GitHub (thuộc sở hữu của Microsoft) đã cắt giảm một số dịch vụ nhất định đối với người dùng tại các quốc gia bị Mỹ cấm vận bao gồm Iran, Syria, và Crimea, gây nên làn sóng phẫn nộ và hoảng loạn trong cộng đồng nhà phát triển toàn cầu.

Gitee, một nền tảng đã 7 năm tuổi, là trung tâm của nỗ lực nhằm đưa mã nguồn của các doanh nghiệp "hồi hương" mà phía Trung Quốc đang thực hiện. Bộ Công nghiệp và Công nghệ Thông tin (MIIT), một trong những cơ quan hoạch định chính sách công nghệ hàng đầu của Trung Quốc, mới đây đã chọn Gitee để đảm nhận việc xây dựng nên một "nền tảng lưu trữ mã nguồn mở, độc lập dành cho Trung Quốc".

Dự án này sẽ được tiến hành bởi một liên minh dẫn đầu bởi Open Source China, công ty trụ sở tại Thượng Hải, vốn điều hành cộng đồng mã nguồn mở cùng tên và Gitee. Dịch vụ lưu trữ này sẽ là một dự án do chính phủ đề xuất, với sự hỗ trợ từ các trường đại học nghiên cứu và các tổ chức đến từ khu vực tư nhân - một nhóm 10 tổ chức bao gồm Huawei, công ty đang đứng trước vô vàn khó khăn vì chuỗi cung ứng bị gián đoạn giữa cơn bão chính trị.

Trung Quốc đang tự tạo cho mình một GitHub riêng mang tên Gitee - Ảnh 1.

"Nếu Trung Quốc không có cộng đồng mã nguồn mở của chính mình để duy trì và quản lý mã nguồn, ngành công nghiệp phần mềm nội địa của chúng ta sẽ rất dễ bị ảnh hưởng bởi các yếu tố không thể kiểm soát được" - giám đốc Huawei Wang Chenglu nói trong một sự kiện vào tháng 8 năm ngoái, chỉ một thời gian ngắn sau khi GitHub buộc phải tuân thủ các điều luật cấm vận của Mỹ.

Gitee cho biết đến nay đã lưu trư hơn 10 triệu kho mã nguồn mở và cung cấp dịch vụ đến hơn 5 triệu nhà phát triển. Để so sánh, thì GitHub được cho là có 100 triệu kho và khoảng 31 triệu nhà phát triển trên toàn thế giới tính đến tháng 11 năm ngoái.

Câu hỏi đặt ra ở đây là liệu nền tảng của Gitee có thể thuyết phục được các nhà phát triển Trung Quốc "hồi hương" từ GitHub - hay từ đối thủ trong nước là Coding.net của Tencent - hay không, khi mà họ đã nhận được sự chống lưng từ nhiều gã khổng lồ công nghiệp. Ngoài ra, chưa rõ GitHub sẽ phản ứng ra sao nhằm hạn chế hành động "xuất" mã nguồn, bởi một lãnh đạo của họ từng gợi ý về khả năng sẽ mở một công ty con tại Trung Quốc.

Về phía Gitee, họ rõ ràng tự tin rằng có một thị trường đang rộng mở cho một sản phẩm thay thế GitHub thuộc sở hữu của người Trung Quốc.

"Thế giới là nơi hàng trăm bông hoa có thể nở rộ. Thị trường nước ngoài thì có GitHub và các nền tảng khác. Ở Trung Quốc, cũng có nhiều tổ chức đề cao phần mềm mã nguồn mở, như Gitee" - nhà sáng lập Open Source China với nickname "Hongshu" viết như vậy.

"Một hệ sinh thái mã nguồn mở không thể qua một đêm đã xây dựng xong. Nó là một quá trình giống như xây một toà tháp từ nền móng. Chúng tôi có niềm tin vào sức mạnh cách tân của các nhà phát triển Trung Quốc. Chúng tôi cũng tin vào lòng kiên nhẫn và sức mạnh của chính mình".', CAST(N'2020-08-26' AS Date), N'gitee.jpeg', 2)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (18, 3, N'Cùng điểm lại những sự cố ngớ ngẩn nhất của các ông lớn công nghệ', N'Chúng ta không nói đến những thảm kịch thực sự như những vụ nổ của Note7, Antennagate của iPhone 4 hay Flickergate của Surface Pro 4. Trái lại, đây là những sự cố tai hại mà các hãng đều có thể dễ dàng tránh được, nếu như họ đi chậm hơn và suy nghĩ thấu đáo hơn - dù chỉ một chút mà thôi.', N' Trước hết, cần phải nhắc lại một điều ít người nhận ra: Apple thực sự đã có ý tốt khi giảm hiệu năng iPhone! Những chiếc iPhone càng cũ thì sẽ càng dễ bị chai pin, và việc giảm xung nhịp vừa giúp gia tăng tuổi thọ pin, vừa tránh được tình trạng treo máy trong quá trình sử dụng.

Nhưng Apple lẽ ra đã có thể cung cấp TÙY CHỌN cho người dùng bật hoặc tắt tính năng này. Apple lẽ ra đã có thể thông báo về tính năng giảm hiệu năng này rõ ràng hơn trên màn hình iOS 12, hoặc qua mô tả bản cập nhật. Nhưng Apple KHÔNG làm cả 2 điều ấy, và dụng ý tốt trở thành một scandal có lẽ là tai tiếng nhất trong lịch sử nhà Táo.

Để xoa dịu cộng đồng, công ty của Tim Cook đã phải mở chương trình thay pin giá 30 USD cho người dùng tại nhiều quốc gia. Song, tòa án Mỹ vẫn buộc Apple phải thực hiện khoản dàn xếp giá 500 triệu USD. Tuy chỉ là "muối bỏ bể" so với lợi nhuận khổng lồ của nhà Táo, rõ ràng Apple đã có thể tránh được tất cả những thiệt hại này chỉ bằng một dòng chữ thông báo rõ ràng hơn khi cập nhật.

Cùng điểm lại những sự cố ngớ ngẩn nhất của các ông lớn công nghệ - Ảnh 3.

Cùng điểm lại những sự cố ngớ ngẩn nhất của các ông lớn công nghệ - Ảnh 4.

Nhắc đến Galaxy Note là nhắc đến chiếc điện thoại tiên phong cho trào lưu màn hình lớn. Nhưng nếu chỉ có màn hình 5.5 inch trở lên thôi thì chưa đủ: thứ khiến trải nghiệm Note trở nên thực sự hấp dẫn là những cây bút có trang bị nhiều tính năng, giúp tận dụng tối đa diện tích hiển thị để làm những tác vụ hữu ích cho công việc.

Năm 2014, cây bút này bỗng dưng lại khiến Samsung đau đầu. Chỉ vài tuần lễ sau khi sản phẩm lên kệ, một vài người dùng và nhiều trang tin công nghệ lên tiếng phàn nàn rằng bút của Note 5 sẽ bị kẹt trong thân máy nếu đút nhầm hướng. Cộng đồng Internet chia làm hai nửa tranh cãi kịch liệt. Một phía cho rằng Samsung đã mắc phải một lỗi thiết kế căn bản. Nửa còn lại cho rằng lỗi thuộc về người dùng khi không sử dụng cẩn thận.

Mỗi bên đều có lý của mình, nhưng điều đáng nói là cả 4 thế hệ Note trước đó đều KHÔNG gặp phải tình trạng này. Tất cả các thế hệ bút S Pen trước đó đều có đầu bút phía sau to hơn và do đó sẽ không thể nhét ngược vào khe cắm bút.

Cùng điểm lại những sự cố ngớ ngẩn nhất của các ông lớn công nghệ - Ảnh 5.

Sau khi ra thông báo thanh minh, và sau khi sửa lại tài liệu hướng dẫn sử dụng, Samsung cuối cùng cũng đã phải nhận phần sai. Toàn bộ các mẫu Note5 xuất xưởng về sau, và tất cả các thế hệ Note sau đó đều sử dụng bút S Pen có phần sau dày hơn phần trước. Cắm ngược bút trở thành câu chuyện của dĩ vãng xa xôi.

Cùng điểm lại những sự cố ngớ ngẩn nhất của các ông lớn công nghệ - Ảnh 6.

Tại thời điểm hiện tại, chống nước đã không còn là thế mạnh của riêng bất cứ thương hiệu smartphone nào khi mọi chiếc smartphone cao cấp đều đã có chứng nhận IP. Nhưng vào năm 2012, chống nước (và bụi) lại là thế mạnh của riêng Sony mà thôi.

Vấn đề là ở chỗ những chiếc Xperia Z dù có chống nước theo tiêu chuẩn IP nhưng lại không thể… chống nước hoàn toàn. Ví dụ, tiêu chuẩn IP68 chỉ đảm bảo thiết bị có thể "sống sót" được 30 phút ở độ sâu 1,5 mét trong phòng thí nghiệm. Khi quảng bá sản phẩm, Sony đã tung ra vô số hình ảnh người dùng đang sử dụng Xperia dưới bể bơi để chụp ảnh.

Cùng điểm lại những sự cố ngớ ngẩn nhất của các ông lớn công nghệ - Ảnh 7.

Hệ quả tất yếu là vô số những chiếc Xperia bị hư hỏng khi nước vào. Giọt nước tràn ly khi hãng smartphone Nhật Bản từ chối bảo hành cho tất cả các sản phẩm này, bao gồm cả những sản phẩm vẫn trong thời hạn. Các vụ kiện bắt đầu nổ ra, các tài liệu marketing của Sony được thay đổi để nói điện thoại Sony… không chống được nước, và đến 2016 thì công ty Nhật Bản phải chấp nhận bồi thường 50% giá bán cho những chiếc Xperia hư hỏng do nước vào.

Những thiệt hại do vụ kiện này gây ra có thể là một phần lý do khiến Sony dần "bốc hơi" khỏi thị trường smartphone. Sony và các nhà sản xuất khác phải học một bài học đơn giản, nhưng đắt giá: đừng sử dụng hình ảnh bể bơi hay bãi biển để quảng bá cho smartphone. Chỉ có một mình Samsung là phá lệ, và không mấy ngạc nhiên, năm 2019 nhà sản xuất Hàn Quốc cũng bị Ủy ban Cạnh tranh và Bảo vệ Người tiêu dùng tại Australia lôi ra tòa do những bức ảnh chụp smartphone Galaxy tại bể bơi và bãi biển.

Cùng điểm lại những sự cố ngớ ngẩn nhất của các ông lớn công nghệ - Ảnh 8.

Từ rất lâu trước khi Apple chuyển Mac sang ARM, Microsoft đã nhận thấy tiềm năng của loại chip vốn được coi là dành riêng cho di động thay vì Windows. Năm 2012, bên cạnh Windows 8, gã khổng lồ phần mềm ra mắt một bản Windows riêng chạy trên ARM với tên gọi "Windows RT". Một chiếc tablet biểu trưng cho Windows RT mang tên Surface RT cũng được ra mắt, bên cạnh chiếc Surface Pro chạy Windows 8 (chạy trên x86 của Intel/ARM).

Đáng tiếc rằng ARM rất khác biệt với x86, và Windows RT cũng chẳng thể chạy các ứng dụng exe quen thuộc với người dùng Windows. Mọi chuyện càng thêm rối loạn khi Microsoft sử dụng giao diện Windows đầy đủ cho Windows RT: người dùng phổ thông không có cách nào để phân biệt giữa 2 phiên bản cực kỳ khác biệt này.', CAST(N'2020-08-26' AS Date), N'suco.jpg', 2)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (19, 2, N'TikTok đứng trước bài toán bản quyền âm nhạc không thể phớt lờ', N'Khi các nền tảng mạng xã hội càng lớn thì càng phải để ý đến vấn đề bản quyền âm nhạc. Vụ kiện của VNG khiến nhiều người đặt ra câu hỏi, về việc từ trước đến nay TikTok sử dụng âm nhạc có bản quyền như thế nào.', N'Đầu năm nay, TikTok đã ký hợp đồng bản quyền với 3 nhà phát hành lớn nhất trong ngành công nghiệp âm nhạc, đó là Universal Music Group, Warner Music Group và Sony Music. TikTok là nền tảng dành cho các clip ngắn lồng ghép nhạc, chưa kể âm thanh từ clip hài, nên bản quyền sẽ là vấn đề trọng điểm trong quá trình phát triển.

 TikTok đứng trước bài toán bản quyền âm nhạc không thể phớt lờ - Ảnh 1.

Khi Universal đạt được thỏa thuận bản quyền với TikTok, đồng nghĩa các nghệ sĩ như Billie Eilish, Lady Gaga, Elton John, hay Taylor Swift sẽ được trả phí mỗi lần tác phẩm của họ được lồng vào clip người dùng. Được biết, theo thông lệ, Universal sẽ còn đề nghị “truy thu” phí bản quyền với tác phẩm trước đây từng bị sử dụng không phép.

Theo tạp chí Billboard, TikTok hiện có hơn 8.000 hợp đồng bản quyền, hầu hết trong số đó được thừa hưởng từ thương vụ mua Musical.ly. ByteDance, công ty sở hữu TikTok, đã mua Musical.ly với giá 800 triệu USD vào năm 2017. Sau đó Musical.ly được hợp nhất với TikTok, tạo nên ứng dụng TikTok trên quy mô toàn cầu như hiện nay.

Trước đó, Hiệp hội các nhà phát hành âm nhạc của Mỹ (NMPA) bao gồm thành viên là Universal, từng đe dọa sẽ kiện TikTok vì vấn đề bản quyền. David Israelite, Giám đốc của NMPA khi ấy chia sẻ với Financial Times rằng, ông ước tính hơn 50% âm nhạc trên TikTok chưa được cấp phép.

Vào thời điểm đó, nhiều người đã so sánh cách sử dụng nhạc không phép của TikTok giống với Napster, nền tảng chia sẻ file nhạc nổi tiếng một thời. Napster phải đóng cửa vào năm 2001, sau khi gặp hàng loạt vụ kiện vi phạm bản quyền.

Nhìn chung bản quyền âm nhạc thường là vấn đề làm khó các mạng xã hội. Như YouTube và Facebook, khi các nền tảng này càng lớn thì càng phải để ý đến vấn đề bản quyền nhạc. Vụ kiện ở Việt Nam một phần cho thấy điều này.

Trong nỗ lực trở nên chuyên nghiệp hơn, vào đầu tháng 5, TikTok đã ban hành giới hạn nghiêm ngặt đối với các tài khoản tổ chức và doanh nghiệp. Theo Business Insider, các tài khoản được xác thực này sẽ chỉ có quyền truy cập vào Commercial Music Library, bộ sưu tập nhạc mà TikTok được cấp phép sử dụng cho mục đích thương mại.

Điều này cũng có nghĩa là, tài khoản TikTok được xác thực sẽ không thể sử dụng các bài hát theo trào lưu như trước. Đôi khi sẽ có những bài hát họ cần có giấy cấp phép. Chính sách như vậy đã được áp dụng từ lâu trên YouTube, người dùng phải tuân thủ nếu không muốn video bị gỡ xuống, hoặc nếu muốn chạy quảng cáo cho video.

Ngay cả với tài khoản người dùng, trong 6 tháng qua, TikTok đã gỡ khoảng 1.300 video vì lỗi vi phạm bản quyền. Sự chỉnh đốn này cũng có thể nhằm hướng đến việc tạo cơ sở cho chính sách trả tiền nhà sáng tạo nội dung.

Thực tế các hợp đồng bản quyền của TikTok với Universal, Warner và Sony có thời hạn ngắn hơn đáng kể so với các hợp đồng khác, thông thường kéo dài 18 hoặc 24 tháng. Nguồn tin của Billboard cho biết, nguyên là do TikTok chưa có kế hoạch cụ thể để người dùng kiếm tiền từ nội dung.', CAST(N'2020-08-26' AS Date), N'tiktok.jpg', 2)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (20, 2, N'Tưởng nhỏ con hóa ra hãng gaming Corsair cũng là một doanh nghiệp tỷ USD', N'Báo cáo trước thềm IPO của Corsair cho thấy, doanh thu trong năm 2019 của hãng này đã vượt mốc 1 tỷ USD.', N'Nổi tiếng vì cung cấp các linh kiện và thiết bị ngoại vi hàng đầu cho game thủ, nhưng chỉ đến khi hãng Corsair nộp hồ sơ để chuẩn bị cho việc niêm yết cổ phiếu ra công chúng, người ta mới thấy bất ngờ về quy mô hoạt động kinh doanh của hãng này.

Trong hồ sơ của mình, công ty cho biết, năm ngoái họ đã đạt được doanh thu trên 1 tỷ USD và giờ đang chiếm đến 18% thị phần thiết bị ngoại vi gaming và gần 42% thị phần linh kiện PC Gaming, (tuy nhiên công ty không cho biết, quy mô thị trường này trên toàn cầu).

Tưởng nhỏ con hóa ra hãng gaming Corsair cũng là một doanh nghiệp tỷ USD - Ảnh 1.

Corsair còn cho biết họ đang là nhà cung cấp số một trong các lĩnh vực bộ nhớ máy tính hiệu năng cao, case, nguồn, bộ tản nhiệt và bàn phím gaming, cũng như đứng thứ hai trong lĩnh vực "tay chơi game hiệu năng cao" và "thiết bị streaming". Nhưng đáng chú ý nhất vẫn là dòng sản phẩm mang lại danh tiếng cho Corsair từ năm 1998 đến nay: các thanh RAM cho máy tính PC. Mảng linh kiện này đã mang lại 429 triệu USD trong tổng số 1,097 tỷ USD doanh thu năm 2019.

Điều thú vị là bên cạnh việc tìm kiếm nguồn cung chip nhớ từ những hãng như Samsung và Hynix, Corsair cũng có mảng sản xuất RAM riêng tại Đài Loan, cũng như hầu hết các linh kiện khác của Corsair cũng được sản xuất bởi các nhà cung cấp bên thứ ba tại châu Á.

Dường như các sản phẩm duy nhất mà họ tự làm là đến từ các công ty được mua lại trong thời gian gần đây: ví dụ như tay cầm chơi game tùy chỉnh của Scuf Gaming và các dàn gaming của hãng Origin PC. Bên cạnh đó, còn có các thiết bị streaming của Elgato được Corsair mua lại vào năm 2018.

Tưởng nhỏ con hóa ra hãng gaming Corsair cũng là một doanh nghiệp tỷ USD - Ảnh 2.


Và trong khi những năm trước, Corsair đang rơi vào cảnh thua lỗ liên tiếp hai năm liền – lỗ 13,7 triệu USD trong năm 2018 và lỗ 8,4 triệu USD trong năm 2019 – đại dịch Covid-19 lại là điều may mắn cho Corsair. Chỉ riêng từ tháng Một đến tháng Sáu năm 2020, công ty đã có lợi nhuận khoảng 23,8 triệu USD.

Trong khi Corsair cho biết, họ nhận thấy lượng xuất xưởng gia tăng trong đợt nghỉ lễ, công ty cũng tin rằng Covid-19 đã mang lại cho họ "tăng trưởng doanh thu 2 con số" trên mọi lĩnh vực kinh doanh. Đây không phải là điều quá khó tin nếu nhìn vào báo cáo thu nhập của Logitech cũng như tình trạng thiếu hụt webcam và tay cầm điều khiển máy bay diễn ra trong thời gian qua.

Trong khi đó, các công nghệ game mới như game di động, game đám mây cùng thực tế ảo và thực tế tăng cường được Corsair xem như rủi ro cho hoạt động kinh doanh của mình. Công ty cho biết, họ "không có kế hoạch phát triển thiết bị dành riêng cho game thủ trên các thiết bị di động hoặc tablet," cũng như cả các thiết bị VR và AR. Ngoài ra, công ty cũng lo ngại rằng cloud gaming sẽ làm giảm nhu cầu về các sản phẩm console và thiết bị gaming PC trong thời gian tới.

Điều thú vị là chính đối thủ của họ, hãng Razer lại đang quan tâm đến việc sản xuất thiết bị ngoại vi hỗ trợ các loại hình game mới kể trên. Tuy nhiên, cho dù Corsair không phải người đi đầu trong lĩnh vực này, chắc chắn họ sẽ không để mình quá tụt hậu so với các đối thủ khác.', CAST(N'2020-08-26' AS Date), N'corsair.jpeg', 2)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (21, 2, N'Unreal Engine tạm thoát khỏi đòn trừng phạt của Apple, nhưng Fortnite vẫn chưa được trở lại App Store', N'Phán quyết mới đây của tòa án đã tạm thời ngăn Apple giáng đòn trả đũa lên công cụ phát triển Unreal Engine của Epic, nhưng tựa game ăn khách Fortnite của họ vẫn chưa thể quay lại App Store.', N'Epic Games vừa giành được một lệnh hạn chế tạm thời đối với Apple. Theo phán quyết của tòa, Apple không được trả đũa Epic Games bằng cách loại bỏ tài khoản nhà phát triển của công ty này hay hạn chế các nhà phát triển sử dụng Unreal Engine của Epic trên các nền tảng của Apple.

Mặc dù vậy, cũng trong phán quyết này, thẩm phán Yvonne Gonzalez Rogers đã quyết định rằng Apple sẽ không bị buộc phải đưa ứng dụng Fortnite quay trở lại App Store.

"Tòa án nhận thấy, trong kiến nghị của Epic Games về tựa game của họ, bao gồm Fortnite, Epic Games vẫn chưa cho thấy các tác hại không thể khắc phục. Tình trạng khó khăn hiện tại là do quyết định của họ." Thẩm phán Rogers cho biết.

Unreal Engine tạm thoát khỏi đòn trừng phạt của Apple, nhưng Fortnite vẫn chưa được trở lại App Store - Ảnh 1.

Tuy nhiên, bà Rogers cũng lập luận về lý do tại sao Apple không thể cắt quyền truy cập của Unreal Engine ngay hiện tại. Đó là vì khi làm vậy, Apple đã "chọn cách hành động nghiêm khắc" khi tác động đến cả các nhà phát triển bên thứ ba, cũng như danh tiếng của Epic Games, khi đe dọa đến Unreal Engine.

"Epic và Apple có quyền kiện tụng nhau, nhưng tranh chấp của họ không được gây nên tác hại cho những người ngoài cuộc." Bà Rogers cho biết.


Có thể xem phán quyết hôm nay như tạm thời cứu Epic Games cùng cộng đồng nhà phát triển game sử dụng Unreal Engine của họ khỏi lưỡi hái tử thần của Apple, khi đe dọa sẽ cắt quyền truy cập của engine này vào các nền tảng của họ trong ngày 28 tháng Tám tới đây.

Tuy vậy, phán quyết hôm nay chỉ có phạm vi rất giới hạn, chủ yếu nhằm giữ nguyên hiện trạng trong khi tòa án có thể lắng nghe thêm các lập luận chi tiết khác liên quan đến phán quyết sơ bộ của vụ kiện. Phán quyết sơ bộ đó sẽ quyết định liệu Apple có được hành động chống lại Fortnite, Unreal Engine hay các sản phẩm khác của Epic cho đến khi xét xử hay không. Dự kiến hai bên sẽ đệ trình các lập luận của mình trong những tuần sắp tới, với phiên điều trần đầy đủ về vụ kiện diễn ra vào ngày 28 tháng 9 tới đây.

Tòa án vẫn chưa cho biết khi nào họ sẽ nghe các tranh luận trong tuyên bố của Epic, nhưng nhiều khả năng nó khó có thể diễn ra trong năm nay. Khi được hỏi họ dự định sẽ mất bao lâu để chuẩn bị cho buổi xử án, cố vấn pháp lý của Epic từng cho biết họ có thể chuẩn bị trong vòng từ 4 đến 6 tháng, Apple còn đề xuất thời gian dài hơn, với thời gian chuẩn bị xét xử lên đến 10 tháng.

', CAST(N'2020-08-26' AS Date), N'fortnite.jpg', 1)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (22, 1, N'Asus Zenfone 7 lộ ảnh thực tế với cụm 3 camera xoay lật, cảm biến vân tay dưới màn hình', N'Asus Zenfone 7 sẽ được ra mắt vào ngày 26 tháng 8.', N'Asus Zenfone 7 đang chuẩn bị được ra mắt, tuy nhiên chiếc smartphone này đã bị lộ khá nhiều thông số kỹ thuật và cả hình ảnh thiết kế. Một số hình ảnh thực tế của Zenfone 7 vừa bị rò rỉ trên Weibo, cho thấy chiếc smartphone này sẽ tiếp tục kế thừa Zenfone 6.

Asus Zenfone 7 lộ ảnh thực tế với cụm 3 camera xoay lật, cảm biến vân tay dưới màn hình - Ảnh 1.
Camera xoay lật độc đáo trên Asus Zenfone 6.


Điểm đặc biệt nhất chính là cụm camera xoay lật 180 độ, đã được Asus trang bị trên Zenfone 6 trước đây. Tuy nhiên trên Zenfone 7, cụm camera đã được nâng cấp lên 3 cảm biến, 64MP + 12MP + 8MP.


Asus Zenfone 7 lộ ảnh thực tế với cụm 3 camera xoay lật, cảm biến vân tay dưới màn hình - Ảnh 2.
Hình ảnh thực tế của Asus Zenfone 7.


Hình ảnh cũng cho thấy cảm biến vân tay ở mặt lưng đã không còn nữa, gợi ý rằng cảm biến này sẽ được tích hợp dưới màn hình cảm ứng. Zenfone 7 sẽ được trang bị màn hình AMOLED 6,67 inch.

Theo những thông tin rò rỉ trước đây, Zenfone 7 sẽ được trang bị chip xử lý Snapdragon 865, RAM 8GB, dung lượng lưu trữ 128GB, pin 5.000 mAh, có hỗ trợ 5G. Điều đặc biệt là giá bán của Zenfone 7 sẽ rất thấp, chỉ từ 499 USD (tương đương với giá mở bán của Zenfone 6).

', CAST(N'2020-08-26' AS Date), N'zenphone.jpg', 2)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (24, 1, N'Snapdragon 732G ra mắt, hiệu năng cải thiện 15% so với 730G', N'Dự kiến POCO X3 sẽ là chiếc smartphone đầu tiên trang bị con chip Snapdragon 732G mới.', N'Qualcomm mới đây đã cho ra mắt một con chip tầm trung mới có tên Snapdragon 732G. Đây là một phiên bản nâng cấp nhẹ của con bộ đôi Snapdragon 730/730G đã hơn 1 năm tuổi.

Con chip Snapdragon 732G mang tới 2 nâng cấp lớn so với Snapdragon 730G, bao gồm có xung nhịp 2.3GHz cao hơn so với 2.2GHz và GPU nâng cấp lên Adreno 618 giúp cải thiện khả năng xử lý đồ họa lên 15% so với thế hệ tiền nhiệm. Ngoài 2 nâng cấp này, các thông số còn lại của Snapdragon 732G đều giống hệt với Snapdragon 730G.

Snapdragon 732G ra mắt, hiệu năng cải thiện 15% so với 730G 

Con chip mới được trang bị một nhân Kryo 470 cơ bản chạy ở xung nhịp 2.3GHz và một nhân Kryo 470 hiệu suất chạy ở xung nhịp 2.2GHz, kèm theo đó là 6 nhân Kryo 470 tiết kiệm điện năng chạy ở xung nhịp 1.8GHz. Snapdragon 732G được xây dựng trên tiến trình 8nm LPP của Samsung.

Về khả năng hỗ trợ đồ họa, Snapdragon 732G sẽ hỗ trợ các tính năng và công nghệ xử lý như Qualcomm Game Jank Reducer, Vulkan 1.1 Graphics Driver, True HDR, anti-cheat... Con chip này cũng đi kèm với một bộ xử lý hình ảnh riêng biệt Spectra 350 cho phép quay và xử lý video 4K HDR, hỗ trợ Engine AI của Qualcomm với hiệu suất đạt 3.6 TOPS (Tensor Operations Per Second), bộ xử lý tín hiệu Hexagon 688 và công nghệ sạc nhanh Quick Charge 4+. Với modem X15 LTE đi kèm thì máy sẽ chỉ hỗ trợ mạng 4G LTE và không hỗ trợ 5G.

Các nguồn tin rò rỉ cho biết trong thời gian tới, con chip Snapdragon 732G sẽ sớm xuất hiện trên chiếc POCO X3 của Xiaomi, một phiên bản nâng cấp của POCO X2 ra mắt hồi đầu năm nay.', CAST(N'2020-09-01' AS Date), N'sna732.jpg', 2)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (25, 2, N'TikTok tuân thủ quy định xuất khẩu mới của Trung Quốc', N'ByteDance, công ty mẹ của TikTok, cho biết sẽ tuân thủ quy định hạn chế xuất khẩu mới của Trung Quốc.', N'Ngày 28/8, Trung Quốc cập nhật danh sách công nghệ bị hạn chế xuất khẩu, bao gồm một số lĩnh vực từ nhận diện giọng nói đến thiết kế chip. Danh sách chưa được cập nhật từ năm 2008. Những công ty muốn xuất khẩu công nghệ có tên trong danh sách phải xin giấy phép từ chính phủ.

 TikTok tuân thủ quy định xuất khẩu mới của Trung Quốc 

Một trong số các công nghệ được bổ sung là công nghệ "gợi ý dịch vụ thông tin cá nhân hóa dựa trên phân tích dữ liệu", theo CNBC. TikTok thường nhắc tới thuật toán gợi ý video dựa trên nhiều yếu tố như video người dùng xem trong quá khứ hay vị trí địa lý. Sau khi Bắc Kinh làm mới danh sách, Tân Hoa Xã đã đăng bài phỏng vấn với Cui Fan, Giáo sư Đại học Kinh doanh và Kinh tế quốc tế Trung Quốc, một cố vấn thương mại của chính phủ. Trong đó, ông nói ByteDance sẽ phải xin giấy phép. Bất kể chủ nhân mới của TikTok là ai, ByteDance phải chuyển mã phần mềm từ Trung Quốc ra nước ngoài và có thể cần hỗ trợ kỹ thuật. Nó khiến cho việc bán TikTok trở nên phức tạp hơn.

Hôm 30/8, ByteDance cho biết đã lưu ý quy định xuất khẩu mới và sẽ tuân thủ nghiêm túc. Ngày 6/8, Tổng thống Trump ký sắc lệnh hành pháp tuyên bố cấm bất kỳ giao dịch nào đến ByteDance, có hiệu lực sau 45 ngày. Tuy nhiên, lệnh cấm không rõ ràng. Sau đó, ông Trump ký thêm sắc lệnh khác yêu cầu ByteDance phải thoái vốn khỏi TikTok tại Mỹ trong vòng 90 ngày kể từ 14/8. Microsoft và Walmart đang hợp tác mua TikTok, đối đầu với Oracle.

Tuần trước, TikTok chính thức khởi kiện Mỹ vì sắc lệnh hành pháp ngày 6/8, cáo buộc vi phạm Bản sửa đổi thứ 5 Tu chính án Hiến pháp. Washington vẫn duy trì quan điểm TikTok đại diện cho nguy cơ an ninh quốc gia Mỹ.', CAST(N'2020-09-01' AS Date), N'tiktoktuanthu.jpg', 2)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (26, 3, N'Giá trị vốn hóa Apple vượt mốc 2000 tỷ USD: Giới đầu tư thích thú nhưng iFan thì không, vì Apple của ngày xưa đã chết rồi', N'Để đạt được mức giá trị vốn hóa kỷ lục này, Apple đã phải đánh đổi bằng cách lựa chọn chiến lược kinh doanh ổn định, an toàn hơn, và vô tình trở nên nhàm chán hơn trong mắt người hâm mộ.', N'Tròn 1 tuần trước, Apple đã đi vào lịch sử với tư cách là công ty đại chúng Mỹ đầu tiên có giá trị vốn hóa vượt mức 2 nghìn tỷ USD. Dưới sự chèo lái của CEO Tim Cook cùng các cộng sự, nhà Táo đang trở thành một cỗ máy in tiền khủng khiếp khi mà họ mới đạt mốc 1 nghìn tỉ USD cách đây 2 năm mà thôi. Đây rõ ràng là 1 tin rất đáng mừng đối với các cổ đông cũng như giới đầu tư, nhưng liệu với iFan hay người dùng đại chúng, liệu thành tích mới của Apple có thực sự ấn tượng đến vậy hay không?

Là công ty đại chúng Mỹ đầu tiên đạt được thành tựu này, Apple đã tự biến mình từ 1 trong những cái tên năng động nhất thế giới thành 1 công ty… khá là nhàm chán. Lý do: Rất có thể chính chiến lược giúp họ có được thành công chưa từng thấy này sẽ là nguyên nhân khiến chúng ta không còn được thấy những sản phẩm sáng tạo đến mức đột phá trong tương lai nữa.

Giá trị vốn hóa Apple vượt mốc 2000 tỷ USD: Giới đầu tư thích thú nhưng iFan thì không, vì Apple của ngày xưa đã chết rồi - Ảnh 1.
Để có được thành công như ngày hôm nay, Apple đã lựa chọn 1 chiến lược kinh doanh an toàn, ổn định, và vô tình "giết chết" tính sáng tạo đột phá của mình.


Đó là 1 điểm mâu thuẫn trong thành công của Apple. Theo bất kì nguồn số liệu, thống kê nào, nhà Táo giờ đây đang là 1 doanh nghiệp có lợi nhuận khổng lồ. Và với bất cứ ai đang nắm giữ trong tay cổ phiếu AAPL, sự tăng giá vượt bậc của mã cổ phiếu này giữa bối cảnh nền kinh tế thế giới đang có nhiều biến động vì dịch bệnh, rõ ràng sẽ khiến họ phải phấn khích.

iPhone hiện vẫn là quân bài chủ lực của Apple. Thành công của dòng smartphone này là 1 hiện tượng hiếm gặp, có thể chỉ xảy ra 1 lần trong nhiều thập kỷ. Là 1 fan trung thành lâu năm, tôi thực sự rất vui với những gì Apple đã đạt được hiện nay. Thế nhưng, liệu còn ai trong chúng ta dám tự tin khẳng định rằng Apple vẫn thú vị như những ngày xưa cũ hay không? Cá nhân tôi thì dám cá là không đâu!

Apple có còn thú vị như trước đây?

Ý tưởng về máy Mac tích hợp chip Apple Silicon là 1 dự án rất thú vị và đầy hứa hẹn, nhưng dòng máy tính của nhà Táo, những sản phẩm đã tạo dựng nên thương hiệu cho họ, lại không có nhiều thay đổi trong vài năm qua.

Đồng ý là chúng ta có iMac Pro, nhưng nó lại chẳng phải sự đột phá gì quá to tát, đặc biệt là nếu so với đối thủ Microsoft Surface Studio. Về cơ bản, đây chẳng khác nào 1 chiếc iMac của Microsoft, nhưng lại có màn hình cảm ứng và có thể biến desktop của bạn trở thành 1 sản phẩm tablet khổng lồ. Vào thời điểm mới ra mắt, Surface Studio có thể coi chính là tương lai công nghệ năm 2016, trong khi Apple khi ấy vẫn đang mắc kẹt tại năm 2012 với dòng máy tính của mình. Thay đổi lớn nhất mà MacBook nhận được trong những năm gần đây là bàn phím cánh bướm mà đại đa số người dùng đều không có thiện cảm.

Giá trị vốn hóa Apple vượt mốc 2000 tỷ USD: Giới đầu tư thích thú nhưng iFan thì không, vì Apple của ngày xưa đã chết rồi - Ảnh 2.
Các sản phẩm của Apple không còn duy trì được sự đột phá của mình.


Tệ hơn nữa, tình trạng tương tự cũng đang xảy ra với những mảng sản phẩm lớn nhất của Apple. iPhone vẫn rất tuyệt, nhưng nó chẳng thể độc chiếm ngôi vị smartphone hàng đầu thế giới như trước đây nữa. Trong khi đó, rất nhiều nhà sản xuất khác đã và đang cho ra mắt loạt sản phẩm với nhiều tính năng hấp dẫn hơn rất nhiều. Họ mới là những nhà sáng tạo đại tài, những người tiên phong trong việc tạo ra thiết kế và chức năng mới.

Mặt khác, Apple luôn quan sát và chờ đợi xem người dùng thích gì, rồi một vài năm sau, họ mới chậm chạp đưa những điều đó lên smartphone của mình. Bạn có thể cho rằng đây vốn đã là chiến lược lâu năm của họ, nhưng những con số không biết nói dối: iPhone dù vẫn bán chạy, nhưng mức doanh số cao nhất mà nó từng đạt được thì đã xảy ra vào nửa thập kỷ trước - 2015.

Về máy tính bảng, iPad của Apple liên tục có những sự thay đổi về kích thước, kèm theo vài chỉnh sửa về thiết kế. Thế nhưng, dù là những đời máy mới nhất, nó vẫn không có nhiều khác biệt (về ngoại hình) so với trước đây.

Nói đi cũng phải nói lại, Apple vẫn sở hữu rất nhiều điểm sáng trong nhiều năm vừa qua. Ví dụ như Apple Watch đang ngày 1 hoàn thiện hơn và cũng dần trở nên phổ biến hơn, hay tai nghe không dây AirPods cũng là 1 sản phẩm thành công cả về mặt chuyên môn lẫn thương mại. Thế nhưng, những sản phẩm này hiện vẫn chỉ đóng 1 vai trò rất nhỏ trong bộ máy chung của Apple.

Giá trị vốn hóa Apple vượt mốc 2000 tỷ USD: Giới đầu tư thích thú nhưng iFan thì không, vì Apple của ngày xưa đã chết rồi - Ảnh 3.
iPhone vẫn rất tuyệt, nhưng không thể tự tin tuyên bố độc chiếm vị trí số 1 trong làng smartphone thế giới nữa.


Thà chọn chiến lược nhàm chán mà an toàn, ổn định chứ không còn dám phiêu lưu, mạo hiểm như trước...


Hiện tại, Apple đã bắt đầu chuyển hướng tập trung sang các sản phẩm dịch vụ giống như IBM hay Microsoft, và nhận được không ít những khoản doanh thu khổng lồ. Nó giống như khi bạn chơi cờ tỉ phú vậy: Ban đầu, bạn sẽ dùng tiền để mua sắm những lô đất, những khu nhà mà bạn thích. Tuy nhiên, đến nửa sau của trò chơi, bạn sẽ chỉ tập trung vào việc nâng cấp những bất động sản mà mình đang có, và hy vọng người chơi khác xui xẻo dừng chân đúng tại khu đất của bạn và phải nộp tiền cho bạn. Nếu bạn nâng cấp càng nhiều, giá trị khu đất đó càng cao, đồng nghĩa với việc doanh thu càng lớn.

Hãy nhìn vào những gói đăng ký dịch vụ mà Apple đang nắm trong tay: Apple Card, Apple TV+, Apple Music, 2TB iCloud, hay iPhone Upgrade Plan. Nếu 1 khách hàng lựa chọn sử dụng tất cả những dịch vụ này, mỗi tháng họ sẽ phải trả cho nhà Táo một khoản phí không hề nhỏ chút nào. (Tin vui 1 chút là nếu chọn gói Apple One, chúng ta có thể sẽ tiết kiệm được vài USD).

Giá trị vốn hóa Apple vượt mốc 2000 tỷ USD: Giới đầu tư thích thú nhưng iFan thì không, vì Apple của ngày xưa đã chết rồi - Ảnh 4.
Apple đang dần tập trung vào mô hình dịch vụ - 1 chiến lược an toàn và ổn định hơn về mặt tài chính.


Từ góc nhìn của Apple, có thể dễ dàng nhận thấy sự chuyển giao trong chiến lược kinh doanh này là nước đi tốt nhất cho đại cuộc. Tập trung phát triển dịch vụ có thể rất nhàm chán, nhưng đó là sự nhàm chán ổn định, và sự ổn định thì luôn có sức hút với các cổ đông. Nếu Apple bạo dạn hơn, dám nắm bắt nhiều cơ hội hơn, họ có thể sẽ thành công hơn nhưng cũng không loại trừ khả năng thất bại thảm hại. Và khi đó, chưa chắc giá trị vốn hóa của gã khổng lồ công nghệ này dễ dàng vượt mốc 1 nghìn tỉ USD (2018) và 2 nghìn tỉ USD (2020) như vậy.

Trong “triều đại” của Steve Jobs - những năm tháng mà Apple trở nên khó lường nhất, sự thành bại của nhà Táo phụ thuộc phần lớn vào những sản phẩm át chủ bài của họ. Ví dụ như chiếc iMac G3 là lời tuyên bố hùng hồn nhất cho việc Apple đã trở lại, và tương tự như iBook, iPod, MacBook Air hay iPhone sau này. Apple khi đó là 1 tập đoàn công nghệ lớn nhưng lại vận hành như 1 start-up. Bạn sẽ không bao giờ đoán được bước tiếp theo trong kế hoạch phát triển của họ.

…bởi không phải lúc nào bạn cũng có thể chiến thắng trong những lần mạo hiểm của mình.

Đúng là Steve Jobs từng đạt được nhiều thành công vang dội mà bất cứ ai cũng phải ngưỡng mộ, nhưng điều đó không có nghĩa là ông chưa từng phạm phải sai lầm nào. Trong đó phải kể đến 2 chiếc máy tính đầy hứa hẹn nhất mà Jobs từng cho ra mắt, NeXT Computer và Power Mac G4 Cube - đều là những thất bại thảm hại dù rất tiềm năng.

Thất bại này cũng chỉ ra điểm yếu chí mạng đối với chiến lược đặt cược vào 1 sản phẩm át chủ bài của Apple khi ấy: Nếu thành công, chúng sẽ mang về 1 khoản lợi nhuận khổng lồ, đồng thời cũng chứng minh vị thế, tầm nhìn hàng đầu của họ trên thị trường công nghệ. Thế nhưng, chúng phải thực sự khác biệt, nổi bật và quan trọng nhất là có sức hút với số đông người dùng phổ thông. Chỉ có những thiên tài, những người dám nắm bắt cơ hội mới có thể thực hiện thành công chiến lược này. Và đáng buồn thay, khi mà bạn phải điều hành 1 công ty lớn với giá trị vốn hóa hơn 2 nghìn tỷ USD, những cơ hội như vậy chẳng còn nhiều, và cũng ít ai dám “liều 1 canh bạc” nữa.

Giá trị vốn hóa Apple vượt mốc 2000 tỷ USD: Giới đầu tư thích thú nhưng iFan thì không, vì Apple của ngày xưa đã chết rồi - Ảnh 5.
Apple dưới thời Tim Cook đã trở nên điềm đạm, dè dặt hơn chứ không còn những phút giây mạo hiểm, ngông cuồng như thời Steve Jobs.


Đặt cược vào chiến lược “the next big thing” là 1 nước đi tuyệt vời khi bạn còn trẻ. Nhưng đã là “đặt cược” thì sẽ chẳng bao giờ có được “ổn định”, “đáng tin cậy”. 1 nhà đầu tư, dù có giỏi thế nào, cũng không thể đoán được Apple sẽ ra sao sau khi ra mắt iMac G3 vào năm 1998. Tuy nhiên, hiện tại, khi nhìn vào chiến lược kinh doanh của nhà Táo (và nếu họ cứ tiếp tục bám sát vào chiến lược này), ai cũng có thể gật gù đồng tình họ vẫn sẽ phát triển ổn định trong 1 thập kỷ tới.

Apple không cần phải mạo hiểm nếu không thực sự cần thiết.

Apple vẫn hoàn toàn có thể duy trì đà tăng trưởng của mình trong 10 năm tới, bởi họ đang dần tập trung hơn vào các sản phẩm dịch vụ để có thể kiếm tiền 1 cách an toàn hơn, ít rủi ro hơn. iPhone, iPad và Mac vốn đã có quy trình ổn định, lại sẽ càng phát triển ổn định hơn, nhưng đừng mong rằng nhà Táo sẽ tạo ra đột phá công nghệ hay thiết kế nào cả. Lúc này, những nguy cơ lớn nhất mà họ có thể gặp phải chỉ nằm ở dây chuyền sản xuất, với những thiết bị nhỏ hơn như AirPods mà thôi.

Nói vậy không có nghĩa là Apple sẽ không mang đến thế giới công nghệ những sáng kiến mới. Trong 1 vài năm tới, rất có thể mảng xe hơi của họ sẽ được nâng lên 1 tầm cao mới với chiếc Apple Car đầu hứa hẹn; hay bộ kính Apple Glass tích hợp AR cũng là 1 kế hoạch rất đáng chú ý.

Giá trị vốn hóa Apple vượt mốc 2000 tỷ USD: Giới đầu tư thích thú nhưng iFan thì không, vì Apple của ngày xưa đã chết rồi - Ảnh 6.
Apple vẫn có thể sáng tạo công nghệ mà không nhất thiết phải mạo hiểm như trước đây.


Chiến lược không mạo hiểm vào 1 sản phẩm theo kiểu “được ăn cả ngã về không” đã giúp Apple khỏi phải quá đau đầu về vấn đề tài chính trong thập kỷ vừa qua. Có ai mà không thích thị trường chứng khoán luôn mở rộng và ổn định. Và giờ đây, Apple không cần thiết phải đưa ra 1 sản phẩm mới đột phá hay đao to búa lớn gì cả mà vẫn có thể duy trì được đà tăng trưởng của mình.

Thế nhưng, với góc nhìn của 1 fanboy, người đã phải lòng Apple vì sự khó lường, “chịu chơi”, vì chính những sản phẩm phần cứng đột phá mà dù nhiều năm sau vẫn khiến người ta phải nhắc đến, những ngày tháng tươi đẹp với nhà Táo có lẽ đã chấm dứt rồi.

', CAST(N'2020-09-01' AS Date), N'applevon.jpg', 2)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (27, 3, N'Oracle sắp thỏa thuận mua lại TikTok với giá 20 tỷ USD nhờ sự hỗ trợ của Nhà Trắng', N'Động thái diễn ra trong bối cảnh Giám đốc điều hành Kevin Mayer vừa từ chức, CEO công ty mẹ ByteDance thì xung đột với các nhà đầu tư, còn giá bỏ thầu của Microsoft thì vẫn đang lấp lửng.', N'Oracle, tập đoàn công nghệ khổng lồ do Larry Ellison lãnh đạo, đã vươn lên đứng đầu trong cuộc đua mua lại ứng dụng mạng xã hội TikTok với một thỏa thuận đề xuất trị giá 20 tỷ USD tiền mặt và cổ phiếu, theo TheWrap.

Thỏa thuận được đề xuất sẽ bao gồm 10 tỷ USD tiền mặt, 10 tỷ USD cổ phiếu Oracle và 50% lợi nhuận hàng năm của TikTok sẽ chuyển về cho công ty mẹ ByteDance có trụ sở tại Trung Quốc trong vòng hai năm, theo một số cá nhân có hiểu biết về thỏa thuận này.

Trước đó vào hôm qua 27/8, Walmart cũng thông báo rằng họ đã hợp tác với Microsoft để đấu thầu cho các hoạt động kinh doanh của TikTok tại Mỹ, Canada, Úc và New Zealand. Các điều khoản của thỏa thuận đó vẫn chưa được tiết lộ nhưng gã khổng lồ bán lẻ quan tâm đến khía cạnh thương mại điện tử của ứng dụng xã hội này.

Động thái đưa ra sau khi Kevin Mayer, Giám đốc điều hành của TikTok trong gần 4 tháng, đã từ chức vào đêm 26/8. Trong bức thư gửi lại trước khi rời đi, ông viết: "Trước hoàn cảnh này, và trong lúc tất cả chúng ta đều mong sớm đạt được hướng giải quyết, tôi đành phải thông báo rằng, mình đã quyết định rời công ty".

Các đại diện của TikTok và Oracle từ chối bình luận về vấn đề này.

 Oracle sắp thỏa thuận mua lại TikTok với giá 20 tỷ USD nhờ sự hỗ trợ của Nhà Trắng - Ảnh 1.
Walmart cũng tỏ ra "thèm thuồng" với miếng bánh TikTok.


Nhưng thỏa thuận được đề xuất đang trở nên phức tạp bởi sự chia rẽ giữa CEO ByteDance là Zhang Yiming với General Atlantic và Sequoia Capital, hai nhà đầu tư của ByteDance có trụ sở tại Mỹ. Đây là những tổ chức có quan hệ lâu dài với chính quyền Trump cùng các nhân vật thuộc Đảng Cộng hòa, những người đều muốn thấy thương vụ mua bán sớm diễn ra.

"Họ đã tiếp cận CEO Oracle để đề xuất hãng này mua TikTok và đã liên hệ với Nhà Trắng để chốt thương vụ", theo hai cá nhân có hiểu biết về vấn đề này.

Tuy nhiên, ông Zhang đã từ chối bất kỳ cuộc mua bán nào và không thông báo cho các nhà đầu tư của mình trước khi đưa đơn kiện chính phủ Mỹ vào hôm thứ Hai (24/8) để ngăn chặn bất kỳ cuộc mua bán nào diễn ra.

Hơn nữa, căng thẳng đã nổ ra giữa cố vấn kinh tế của ông Trump, Peter Navarro, người đã ủng hộ việc đóng cửa hoàn toàn TikTok vì lo ngại về an ninh và Bộ trưởng Tài chính Steven Mnuchin, người đang cố gắng tìm kiếm một công ty ở Mỹ để mua lại các hoạt động trong nước của ứng dụng này.

"Mnuchin thích thỏa thuận với Oracle", một trong những người trong cuộc cho biết hôm thứ Tư, một ngày trước những diễn biến nhanh chóng và bất ngờ diễn ra vào thứ Năm.

Các quỹ đầu tư mạo hiểm và các nhà đầu tư tư nhân cũng từ chối bình luận. Người phát ngôn của Bộ Tài chính Mỹ và Nhà Trắng cũng không trả lời các yêu cầu bình luận.

 Oracle sắp thỏa thuận mua lại TikTok với giá 20 tỷ USD nhờ sự hỗ trợ của Nhà Trắng - Ảnh 2.
Một loạt các công ty Mỹ đang nhòm ngó TikTok và ai sẽ là người trả giá cao nhất?


Microsoft, một nhà thầu hàng đầu khác trong thương vụ này, cũng đang cạnh tranh gay gắt để có được một thỏa thuận, theo ba cá nhân có hiểu biết về các cuộc thảo luận. Ban đầu Microsoft quan tâm đến việc mua lại phần lớn cổ phần của ByteDance, công ty mẹ của TikTok, do nó sở hữu công nghệ nền tảng để thúc đẩy sự phát triển phi thường của ứng dụng xã hội này. Mục tiêu của hãng là tập trung vào việc mua lại các hoạt động của TikTok tại Mỹ, Canada, Úc và New Zealand.

Nhưng ByteDance, công ty đang chịu áp lực từ Tổng thống Trump để buộc phải bán mình trong vòng 90 ngày kể từ giữa tháng 8, lại không có xu hướng bán bất kỳ phần nào của nó liên quan tới công nghệ nền tảng. Các cá nhân nói trên cũng cho biết cựu CEO Kevin Mayer đứng ngoài các cuộc đàm phán này. Một người quen thuộc với các vấn đề phủ định việc Mayer đã nói chuyện với một trong những CEO của một nhà thầu tiềm năng.

Về phần mình, Microsoft đã chia sẻ trên một blog vào đầu tháng 8 rằng họ có khả năng quan tâm đến việc mua lại các hoạt động của TikTok tại Mỹ, Canada, Úc và New Zealand. Đây được xem là một thỏa thuận đàm phán tương đối thoải mái với ông Zhang Yiming, người từng có thời gian làm việc cho Microsoft trong một thời gian ngắn vào năm 2008.

 Oracle sắp thỏa thuận mua lại TikTok với giá 20 tỷ USD nhờ sự hỗ trợ của Nhà Trắng - Ảnh 3.
Microsoft được cho là đối tác phù hợp nhất để mua TikTok, nhưng trong bối cảnh hiện tại rất khó để nói trước điều gì.


Với khả năng tiếp cận toàn cầu, TikTok hiện được cho là có giá trị 100 tỷ USD - lớn hơn khoảng ba lần so với các công ty truyền thông xã hội được giao dịch công khai như Twitter hay Snap. Công ty đã báo cáo doanh thu 17 tỷ USD vào năm ngoái và hiện có 800 triệu người dùng tích cực trên toàn thế giới.

ByteDance đã huy động được 7,45 tỷ USD kể từ năm 2012. General Atlantic đã đầu tư vào ByteDance hai lần, lần đầu là một phần trong đợt huy động vốn 2 tỷ USD của công ty vào tháng 12/2017 và một lần nữa vào tháng 10/2018 với giá 3 tỷ USD, theo Pitchbook.com.

Còn Sequoia Capital đã đầu tư vào ByteDance thông qua bộ phận tại Trung Quốc, Seqouia Capital China, trong vòng tài trợ Series C trị giá 100 triệu USD vào tháng 6/2014 và huy động vốn 1 tỷ USD vào tháng 4/2017.

Và Doug Leone, một trong những đối tác của Sequoia Capital, là nhà tài trợ chính cho chiến dịch tái tranh cử của ông Trump và Đảng Cộng hòa, theo hồ sơ của Ủy ban Bầu cử Liên bang. Ông Leone cùng với Bill Ford, giám đốc điều hành của General Atlantic, đã đứng ra làm việc với Nhà Trắng trong thời điểm đồng hồ đang lùi dần về thời hạn chót mà ông Trump đã đưa ra.', CAST(N'2020-09-01' AS Date), N'bytedance.jpg', 2)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (28, 3, N'Chủ tịch Redmi xin lỗi người dùng vì smartphone của công ty ''bán quá chạy''', N'Phiên bản đặc biệt của Redmi K30 kỷ niệm 10 năm thành lập Xiaomi đang cháy hàng trên mọi mặt trận ở thị trường Trung Quốc.', N'Redmi K30 Extreme Commemorative Edition hay Redmi K30 Ultra đang là chiếc smartphone được săn đón nhất tại thị trường Trung Quốc. Khi ra mắt vào ngày 14/8, chỉ sau 1 phút bán trực tuyến, 100.000 sản phẩm đã được người dùng mua hết sạch.

Chẳng phải ngẫu nhiên mà chiếc smartphone này lại được săn đón tới như vậy. Thiết bị này sử dụng vi xử lý Dimensity 1000+ rất mạnh của MediaTek, sở hữu màn hình tần số quét 120Hz, camera chính 64MP, camera selfie thò thụt, pin 4500mAh, tùy chọn RAM từ 6GB, ROM từ 128 GB và được bán ra với giá khởi điểm chỉ từ 1.999 NDT (khoảng 6,7 triệu đồng).

Mức giá quá rẻ cho một mẫu điện thoại cấu hình cao đã khiến người dùng ở Trung Quốc lùng sục chiếc smartphone này ráo riết. Thiết bị được săn lùng tới mức sau ba lần mở bán trực tuyến liên tiếp nó vẫn chưa có dấu hiệu hạ nhiệt.

 Chủ tịch Redmi xin lỗi người dùng vì smartphone của công ty bán quá chạy - Ảnh 1.
Độ "hot" của Redmi K30 Ultra khiến công ty đối thủ cũng phải "mượn hơi" để nổi tiếng.


Xu Qi, Phó Chủ tịch công ty kiêm Chủ tịch Tiếp thị toàn cầu của hãng điện thoại Realme, cũng phải lên tiếng cảm thán và châm chọc về độ "hot" của Redmi K30 Ultra: "Giao ngay, vẫn còn hàng".

Thông điệp này là động thái mượn "hào quang" của Redmi K30 Ultra để tiếp thị. Bởi vì Redmi K30 Ultra đang "cháy hàng" còn dòng điện thoại Realme X7 của công ty ông sẽ đảm bảo số lượng để đưa tới tay người dùng khi phát hành vào ngày 1/9 tới.

Trên thực tế, đối thủ mục tiêu của dòng Realme X7 chính là Redmi K30 Ultra. Mẫu điện thoại này cũng được trang bị vi xử lý MediaTek Dimensity 1000+, màn hình OLED tốc độ làm tươi 120Hz, camera chính phía sau 64 MP. Tuy nhiên, vì sử dụng màn hình "đục lỗ" nên thân máy nhẹ và mỏng hơn.

 Chủ tịch Redmi xin lỗi người dùng vì smartphone của công ty bán quá chạy - Ảnh 2.
Chủ tịch Redmi đã lên tiếng xin lỗi người dùng.


Cũng trong ngày 25/8, sau khi Xu Qi đưa ra tuyên bố của mình, ông Lu Weibing - Phó chủ tịch Xiaomi kiêm tổng giám đốc thương hiệu Redmi - đã đích thân đưa ra lời xin lỗi gửi tới khách hàng.

"Chúng tôi đã tạo ra Redmi K30 Ultra với sự chân thành tuyệt đối. Mặc dù chúng tôi biết rằng sản phẩm này chắc chắn sẽ được yêu thích bởi người hâm mộ, nhưng mức độ phổ biến của nó đã thực sự vượt quá mong đợi của chúng tôi", ông Lu Weibing cho biết.

Vị chủ tịch này cũng đề ra phương án để cải thiện tình trạng hiện tại, cũng là lời đáp trả đối thủ Realme một cách đanh thép. Đó là cũng vào ngày 1/9 tới, Redmi K30 Ultra sẽ bắt đầu bán trước phiên bản đầy đủ RAM 8GB và ROM 512 GB, hai phiên bản còn lại cũng đồng thời được bán trở lại vào ngày 1/9 và 8/9. Tuy nhiên, công ty yêu cầu khách hàng thanh toán trước và chờ nhận hàng sau 14 ngày.

Lưu ý rằng lần mở bán này thì phiên bản đầy đủ sẽ có mức giá chỉ khoảng 8,3 triệu đồng, nên chắc chắn sức nóng của nó sẽ còn lớn hơn các đợt mở bán trước. Và rõ ràng, Realme X7 đã có một đối thủ nặng ký trong ngày mở bán của chính mình.

Có một điều đáng tiếc tới thời điểm hiện tại vẫn chưa có thông tin cho thấy Redmi có ý định bán phiên bản K30 Ultra ngoài lãnh thổ Trung Quốc.', CAST(N'2020-09-01' AS Date), N'redmi.jpg', 2)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (29, 2, N'Panasonic mở thưởng 1001 giải tiền mặt lên tới hơn 5.7 tỷ đồng', N'Tưng bừng quà tặng, Panasonic mở đợt quay thưởng lớn nhất năm, tổng trị giá tới hơn 5.7 tỷ đồng với 1001 quà tặng TIỀN MẶT hấp dẫn. Cơ hội cực lớn dành tặng cho khách hàng khi mua Tủ lạnh, Máy giặt Panasonic tại gần 4000 cửa hàng điện máy.', N'Chương trình khuyến mại "Tưng Bừng Quà Tặng" của Panasonic diễn ra từ ngày 22/8/2020 đến 11/10/2020 với 7 đợt livestream quay thưởng diễn ra hàng tuần. Tổng số lượng giải thưởng lên tới 1001 giải, 100% là tiền mặt trị giá 5.750.000 VNĐ, tương đương 01 chỉ vàng.

Chương trình áp dụng cho tất cả khách hàng khi mua Tủ lạnh, Máy giặt Panasonic bao gồm nhiều sản phẩm ở tầm giá khác nhau, phù hợp với nhiều đối tượng và mục đích sử dụng tại gần 4000 cửa hàng điện máy trên toàn quốc.

Panasonic mở thưởng 1001 giải tiền mặt lên tới hơn 5.7 tỷ đồng - Ảnh 1.

Ông Shunsuke Takahashi - Giám đốc Marketing ngành hàng Điện máy Panasonic cho biết: "Bên cạnh việc mang đến cho người tiêu dùng những sản phẩm chất lượng chuẩn Nhật Bản cùng các giải pháp sức khỏe toàn diện, thông qua chương trình, chúng tôi mong muốn gửi đến cho khách hàng món quà thiết thực nhất, đặc biệt phù hợp trong thời điểm kinh tế mùa dịch. Đó là lý do chúng tôi lựa chọn giải thưởng tiền mặt để trao tặng trong chương trình. Ngoài việc gia tăng giá trị giá trị giải thưởng tới hơn 5.7 tỷ đồng với 1001 cơ hội, Panasonic còn chủ trương đem lại may mắn bằng hình thức quay thưởng ngẫu nhiên."

Panasonic mở thưởng 1001 giải tiền mặt lên tới hơn 5.7 tỷ đồng - Ảnh 2.

Để tham gia chương trình khuyến mại, khách hàng chỉ cần mua sắm tại các cửa hàng điện máy có trong danh sách và kích hoạt bảo hành điện tử trong thời gian diễn ra chương trình. Ngay khi kích hoạt thành công, khách hàng sẽ nhận được tin nhắn thông báo mã số quay số trúng thưởng. Mỗi mã dự thưởng là duy nhất và không trùng nhau. 20h tối thứ 6 hàng tuần, Panasonic sẽ tiến hành livestream bốc thăm trúng thưởng trên fanpage, khách hàng chỉ cần theo dõi livestream và đón chờ may mắn gõ cửa.', CAST(N'2020-09-01' AS Date), N'panasoic.jpg', 1)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (30, 2, N'Hàng chục nghìn kỹ sư Trung Quốc mất việc tại Thung lũng Silicon', N'Làn sóng sa thải nhân viên như một cơn bão, quét qua nước Mỹ, bao gồm cả Thung lũng Silicon, nơi quy tụ những nhân tài và công nghệ tiên tiến nhất thế giới.', N'Cho đến tháng 8, các kỹ sư Trung Quốc ở Thung lũng Silicon đã phải chứng kiến ​​hết đợt sa thải này đến đợt khác, để rồi phát hiện ra rằng thất nghiệp không phải là "thảm họa" cuối cùng mà họ phải trải qua.

Hàng chục nghìn kỹ sư Trung Quốc mất việc tại Thung lũng Silicon - Ảnh 1.

Từ đầu mùa dịch vào tháng 3 đến cuối tháng 5, số người nộp đơn xin trợ cấp thất nghiệp ở Mỹ lên tới 41 triệu người. Thung lũng Silicon, nơi được coi là thánh địa Internet toàn cầu, cũng không thoát khỏi vòng xoáy này. Tính đến tháng 6, số công ty ở Thung lũng Silicon thông báo sa thải đã lên tới 117 và tổng số nhân viên bị sa thải vượt quá 17.000.

Đây là cơn sóng gió mà Thung lũng Silicon chưa từng trải qua trong hơn một thập kỷ qua. Hàng chục nghìn kỹ sư Trung Quốc đã mất công việc lương cao chỉ sau một đêm, và trong số đó, một số lượng đáng kể cần thị thực lao động để duy trì cuộc sống tại đây.

California, nơi có Thung lũng Silicon, là tiểu bang đông dân nhất Hoa Kỳ, lên tới hơn 40 triệu người. Đây cũng là khu vực đầu tiên ở Mỹ thực hiện kiểm soát nhà, sắc lệnh nhập cư tạm thời mới ban hành vào ngày 16/3.

Các chính sách liên quan cũng thay đổi do dịch bệnh. Sau khi đại dịch gây ra số lượng lớn người thất nghiệp, chính phủ Mỹ đã đưa ra thông báo vào tháng 6 năm nay, từ 24/6 đến 31/12/2020 sẽ hạn chế việc cấp bốn loại visa lao động không định cư trong đó có H-1B.

Điều này có nghĩa là thị thực lao động H-1B sẽ bị đình chỉ, những người thuộc diện này buộc phải rời Mỹ. Trong khi đó, để vào Thung lũng Silicon, nhiều người phải đi đường vòng ít nhất 2 năm.

Giữa phong ba, các kỹ sư và học giả khoa học công nghệ Trung Quốc ở Thung lũng Silicon đã đưa ra những lựa chọn và kế hoạch khác nhau. Còn số phận sẽ đưa họ đến đâu thì chỉ có thời gian mới có thể cho câu trả lời.

', CAST(N'2020-09-01' AS Date), N'silicon.jpg', 2)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (31, 1, N'VinSmart tuyên bố có smartphone với camera ẩn dưới màn hình "đầu tiên trên thế giới", liệu có vượt qua ZTE?', N'ZTE cũng tuyên bố sẽ ra mắt smartphone với camera ẩn dưới màn hình ngay trong ngày hôm nay (1/9) - vậy ZTE hay Vsmart sẽ đạt được danh hiệu "đầu tiên"?', N'Vào hồi đầu tháng 8 vừa qua, VinSmart đã đăng tải hình ảnh "nhá hàng" đầu tiên về việc hãng này sắp tung ra smartphone Vsmart với camera ẩn dưới màn hình. Đây được coi là một cột mốc lớn của không chỉ giới công nghệ trong nước, mà còn là giới công nghệ trên toàn thế giới, bởi lẽ camera ẩn dưới màn hình được coi là bước tiến hóa cuối cùng của công nghệ camera trên smartphone, và cũng là mục tiêu đang được rất nhiều hãng hướng tới.

VinSmart tuyên bố có smartphone với camera ẩn dưới màn hình đầu tiên trên thế giới, liệu có vượt qua ZTE? - Ảnh 1.

Mới đây, VinSmart đã đăng tải một video chi tiết hơn về công nghệ này. Qua đoạn video, VinSmart một lần nữa khẳng định đã thành công trong việc phát triển smartphone với camera ẩn dưới màn hình. Không chỉ có vậy, VinSmart sẽ sớm đưa công nghệ này vào một dòng sản phẩm thương mại, cụ thể là dòng máy Aris.

Vsmart hé lộ về smartphone với camera ẩn dưới màn hình

Trước đây, Vsmart từng trưng bày mẫu Aris 5G tại một sự kiện triễn lãm. Tuy nhiên, chiếc Aris 5G này lại không có camera ẩn dưới màn hình, thay vào đó là thiết kế dạng "giọt nước" truyền thống. Có thể, mẫu Aris với camera ẩn dưới màn hình sẽ là phiên bản cấp cao hơn của Aris 5G, không loại trừ khả năng là mẫu "Aris 5G Pro" từng rò rỉ trước đó.

VinSmart tuyên bố có smartphone với camera ẩn dưới màn hình đầu tiên trên thế giới, liệu có vượt qua ZTE? - Ảnh 3.

VinSmart tuyên bố có smartphone với camera ẩn dưới màn hình đầu tiên trên thế giới, liệu có vượt qua ZTE? - Ảnh 4.

VinSmart tuyên bố có smartphone với camera ẩn dưới màn hình đầu tiên trên thế giới, liệu có vượt qua ZTE? - Ảnh 5.

VinSmart tuyên bố có smartphone với camera ẩn dưới màn hình đầu tiên trên thế giới, liệu có vượt qua ZTE? - Ảnh 6.

Thế nhưng, điều đáng chú ý hơn cả là VinSmart còn khẳng định sản phẩm của hãng sẽ là "đầu tiên trên thế giới" với công nghệ camera ẩn dưới màn hình. Sẽ là một thử thách không hề nhỏ nếu như Vsmart muốn có được danh hiệu này. Bởi lẽ, ngay trong ngày hôm nay (1/9), ZTE sẽ công bố Axon 20 5G, và hãng smartphone Trung Quốc này cũng hứa hẹn rằng đây sẽ là smartphone đầu tiên trên thế giới với camera ẩn dưới màn hình.

VinSmart tuyên bố có smartphone với camera ẩn dưới màn hình đầu tiên trên thế giới, liệu có vượt qua ZTE? - Ảnh 7.
ZTE Axon 20 5G với camera ẩn dưới màn hình sẽ ra mắt vào ngày hôm nay (1/9)


Vậy, liệu Vsmart hay ZTE sẽ chiến thắng trong "cuộc đua" này? Chúng ta sẽ sớm có được câu trả lời trong vòng 24 giờ tới.', CAST(N'2020-09-01' AS Date), N'vmastdautien.png', 2)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (32, 1, N'iPhone 12 vẫn sẽ chỉ sử dụng camera chính 12MP, nhưng cảm biến kích thước lớn hơn', N'Camera của iPhone 12 có độ phân giải giống với iPhone 11.', N'Cho đến nay đã có khá nhiều thông tin rò rỉ về iPhone 12, từ thiết kế, bộ vi xử lý cho đến màn hình và cả dung lượng pin. Tuy nhiên, cụm camera của iPhone 12 vẫn còn khá bí ẩn. Chúng ta chỉ mới biết rằng iPhone 12 sẽ được trang bị thêm một cảm biến LiDAR mới, giống iPad Pro, nhưng thông số kỹ thuật của camera lại chưa được tiết lộ.

Hôm nay, một nguồn tin rò rỉ đã xác nhận rằng iPhone 12 vẫn sẽ chỉ được trang bị camera chính 12MP. Chúng ta sẽ phải đợi đến năm sau, khi chiếc iPhone 13 ra mắt mới được nâng cấp lên cảm biến camera 48MP.

iPhone 12 vẫn sẽ chỉ sử dụng camera chính 12MP, nhưng cảm biến kích thước lớn hơn - Ảnh 1.

Tuy nhiên không có nghĩa là camera chính của iPhone 12 sẽ vẫn giống với iPhone 11. Nguồn tin trên cho biết, cảm biến camera của iPhone 12 sẽ có kích thước lớn hơn, đồng nghĩa với việc có thể tiếp nhận nhiều ánh sáng hơn và chụp ảnh trong điều kiện thiếu sáng tốt hơn.

iPhone 12 và iPhone 12 Max sẽ được trang bị 2 camera sau. iPhone 12 Pro và iPhone 12 Pro Max được trang bị 3 camera sau, đi kèm với cảm biến LiDAR giống iPad Pro 2020. Cảm biến LiDAR giúp đo khoảng cách chính xác, hỗ trợ chụp chân dung xóa phông và ứng dụng thực tế tăng cường AR.

iPhone 12 vẫn sẽ chỉ sử dụng camera chính 12MP, nhưng cảm biến kích thước lớn hơn - Ảnh 2.

Hai phiên bản Pro cũng sẽ có tính năng chụp ảnh Smart HDR được cải tiến. Bên cạnh đó có khả năng zoom quang 3x, đây là một nâng cấp khác so với zoom quang 2x trên iPhone 11. Camera tele trên iPhone 12 Pro và 12 Pro Max có độ phân giải 12MP.

Cả 4 mẫu iPhone 12 đều sẽ được trang bị camera góc siêu rộng 12MP, ít biến dạng hình ảnh hơn. Camera selfie 12MP. Ngoài ra, hai phiên bản Pro sẽ có chống rung OIS mới.

Chúng ta cũng sẽ thấy bộ vi xử lý A14 Bionic mang đến sức mạnh xử lý hình ảnh tốt hơn. Mà nhờ đó, iPhone 12 sẽ có khả năng quay video 4K ở tốc độ 120 fps, và video 4K slow-motion ở tốc độ 240 fps.', CAST(N'2020-09-01' AS Date), N'iphone12.jpg', 2)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (33, 1, N'Trên tay OnePlus Nord 5G chính hãng: Snapdragon 765G, màn hình 90Hz, giá 14 triệu', N'OnePlus Nord 5G là smartphone chính hãng duy nhất trong phân khúc giá 14 triệu đồng được trang bị con chip Snapdragon 765G và có hỗ trợ mạng 5G.', N'Tối ngày hôm nay, OnePlus chính thức giới thiệu bộ đôi OnePlus 8 Pro 5G và OnePlus Nord 5G tại thị trường Việt Nam. Trong khi 8 Pro thuộc phân khúc flagship cao cấp thì bản thân OnePlus Nord lại là chiếc máy ở phân khúc cận cao cấp thấp hơn. Đây cũng là chiếc smartphone đầu tiên tại Việt Nam có hỗ trợ mạng 5G trong phân khúc giá dưới 14 triệu.

Trên tay OnePlus Nord 5G chính hãng: Snapdragon 765G, màn hình 90Hz, giá 14 triệu - Ảnh 1.
OnePlus Nord và toàn bộ phụ kiện đi kèm: Củ sạc nhanh Warp Charge 30W, cáp sạc USB-C và ốp lưng silicon


Trên tay OnePlus Nord 5G chính hãng: Snapdragon 765G, màn hình 90Hz, giá 14 triệu - Ảnh 2.
Mặt lưng của OnePlus Nord là mặt lưng kính bóng, được làm cong sang hai cạnh bên. Khác với OnePlus 8 Pro, cụm camera của máy đã được di chuyển sang góc trái. Thiết kế mặt lưng cùng vị trí camera khiến người dùng liên tưởng đôi chút tới các dòng sản phẩm của OPPO


Trên tay OnePlus Nord 5G chính hãng: Snapdragon 765G, màn hình 90Hz, giá 14 triệu - Ảnh 3.
Cụm camera chính của máy bao gồm: camera góc rộng 48 MP f/1.8, camera góc siêu rộng 8 MP f/2.3, camera đo chiều sâu 5 MP f/2.4, camera macro 2 MP f/2.4. Chính giữa mặt lưng là logo "1+" quen thuộc


Trên tay OnePlus Nord 5G chính hãng: Snapdragon 765G, màn hình 90Hz, giá 14 triệu - Ảnh 4.
Dòng chữ "OnePlus" ở dưới cùng. Giống với OnePlus 8 Pro, khu vực này có khá nhiều chữ


Trên tay OnePlus Nord 5G chính hãng: Snapdragon 765G, màn hình 90Hz, giá 14 triệu - Ảnh 5.
Cần gạt chuyển nhanh chế độ (bình thường, rung, yên lặng) và phím nguồn đặt ở cạnh phải


Trên tay OnePlus Nord 5G chính hãng: Snapdragon 765G, màn hình 90Hz, giá 14 triệu - Ảnh 6.
Cụm phím volume đặt ở cạnh trái


Trên tay OnePlus Nord 5G chính hãng: Snapdragon 765G, màn hình 90Hz, giá 14 triệu - Ảnh 7.
Phía dưới là khe sim, cổng sạc, mic thoại và dải loa


Trên tay OnePlus Nord 5G chính hãng: Snapdragon 765G, màn hình 90Hz, giá 14 triệu - Ảnh 8.
Sang tới mặt trước, OnePlus Nord được trang bị màn hình phẳng, kích thước 6.44 inch, vẫn sử dụng tấm nền Fluid AMOLED cao cấp, đồng thời có tần số quét 90Hz và độ phân giải Full HD+. Màn hình này được bảo vệ bởi kính cường lực Gorilla Glass 5


Trên tay OnePlus Nord 5G chính hãng: Snapdragon 765G, màn hình 90Hz, giá 14 triệu - Ảnh 9.
Màn hình này có thiết kế "nốt ruồi" với camera selfie kép 32MP (góc rộng) và 8MP (góc siêu rộng)


Trên tay OnePlus Nord 5G chính hãng: Snapdragon 765G, màn hình 90Hz, giá 14 triệu - Ảnh 10.
Cạnh dưới của máy dày hơn các cạnh còn lại, đặc điểm chung của smartphone Android


Trên tay OnePlus Nord 5G chính hãng: Snapdragon 765G, màn hình 90Hz, giá 14 triệu - Ảnh 11.
OnePlus Nord vẫn được trang bị cảm biến vân tay trong màn hình có tốc độ mở khóa tương đối nhanh


Trên tay OnePlus Nord 5G chính hãng: Snapdragon 765G, màn hình 90Hz, giá 14 triệu - Ảnh 12.
OnePlus Nord được trang bị con chip Snapdragon 765G. Ở phân khúc giá này thì OnePlus Nord là chiếc smartphone đầu tiên hỗ trợ mạng 5G tại thị trường Việt Nam. Máy cũng sẽ chỉ có tùy chọn bộ nhớ duy nhất là RAM 12GB + ROM 256GB (phiên bản chính hãng). Viên pin đi kèm có dung lượng 4115mAh


Trên tay OnePlus Nord 5G chính hãng: Snapdragon 765G, màn hình 90Hz, giá 14 triệu - Ảnh 13.
Không thể không nhắc tới đặc sản của OnePlus là hệ điều hành OxygenOS được tối ưu hóa cực kỳ mượt mà. Đây được cho là điểm "ăn tiền" của các máy OnePlus từ trước tới nay, không tùy biến quá nhiều, nhưng vẫn đáp ứng đủ nhu cầu sử dụng của người dùng


Trên tay OnePlus Nord 5G chính hãng: Snapdragon 765G, màn hình 90Hz, giá 14 triệu - Ảnh 14.
Mức giá của OnePlus Nord 5G tại thị trường Việt Nam là 13.99 triệu đồng

OnePlus Nord bên cạnh OnePlus 8 Pro', CAST(N'2020-09-01' AS Date), N'onplusnore.jpg', 1)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (34, 2, N'Covid-19 đã ảnh hưởng đến doanh số smartphone như thế nào?', N'Theo số liệu mới nhất do hãng phân tích thị trường Gartner công bố, doanh số smartphone đã ghi nhận mức giảm hơn 20% trong Q2/2020.', N' Giống như những ngành công nghiệp khác, thị trường smartphone vẫn đang phải gánh chịu sự ảnh hưởng trong Q2/2020 do tác động của đại dịch Covid-19.

Covid-19 đã ảnh hưởng nghiêm trọng đến doanh số smartphone trên toàn cầu như thế nào? - Ảnh 1.

Đại dịch hoành hành trên khắp thế giới, đe dọa sức khỏe của tất cả mọi người và gián tiếp làm giảm nhu cầu mua sắm smartphone mới. Điều này nằm ngoài dự tính của hầu hết các nhà sản xuất smartphone trong năm 2020 này.

Theo số liệu mới nhất vừa được Gartner công bố, doanh số bán smartphone trong Q2/2020 đã giảm xuống không dưới 20% so với cùng kỳ năm trước.

Dưới đây là một số thông tin quan trọng trong báo cáo của Gartner:

- Ấn Độ ghi nhận tình trạng sụt giảm doanh số bán smartphone cao nhất, giảm tới 46%.

- Huawei và Samsung bán được số lượng smartphone gần bằng nhau trong Q2.

- Trung Quốc vẫn là động lực tăng trưởng doanh số smartphone chính nhờ ít các hạn chế hơn.

- Samsung ghi nhận mức sụt giảm lớn nhất với doanh số bán smartphone giảm 27,1% trong Q2.

- Apple là công ty ít chịu ảnh hưởng nhất từ cuộc khủng hoảng Covid-19.

- Doanh số bán smartphone trong Q2 đạt gần 295 triệu máy.

Gartner cho biết, doanh số bán smartphone trong Q2/2020 bị giảm một phần do nhiều nhà máy sản xuất và lắp ráp buộc phải đóng cửa ở nhiều quốc gia.


Covid-19 đã ảnh hưởng nghiêm trọng đến doanh số smartphone trên toàn cầu như thế nào? - Ảnh 2.

Báo cáo có đoạn viết: "Doanh số bán smartphone ở Trung Quốc đã giảm 7% trong Q2/2020 với gần 94 triệu chiếc smartphone được bán ra. Ấn Độ, quốc gia đã áp dụng các biện pháp phong tỏa nghiêm ngặt (thậm chí hạn chế thương mại điện tử) đã ghi nhận mức sụt giảm doanh số smartphone tồi tệ nhất (-46%) trong số 5 quốc gia có doanh số bán smartphone sụt giảm mạnh nhất trên thế giới ".

Ba công ty dẫn đầu thị trường vẫn là Samsung, Huawei và Apple

Cụ thể Samsung đã bán được tổng cộng 54,7 triệu máy trong Q2, chiếm 18,6% thị phần smartphone trên toàn cầu, giảm 27,1% so với cùng kỳ năm trước.

Trong khi Huawei chỉ ghi nhận mức giảm 6,8% và bán được khoảng 54,1 triệu máy, qua đó giúp nhà sản xuất này có đuộc 18,4% thị phần.

Apple cũng bán được khoảng 38,3 triệu chiếc iPhone trong quý vừa qua và chiếm 13% thị phần. Mức doanh số này của Apple chỉ giảm khoảng 0,4% so với năm ngoái.

Covid-19 đã ảnh hưởng nghiêm trọng đến doanh số smartphone trên toàn cầu như thế nào? - Ảnh 3.

Annette Zimmermann, phó chủ tịch nghiên cứu của Gartner cho biết: "Doanh số bán iPhone của Apple trong quý tốt hơn so với hầu hết các hãng smartphone khác trên thị trường và doanh số hàng quý cũng tăng so với quý trước. Môi trường kinh doanh được cải thiện ở Trung Quốc đã giúp Apple đạt được mức tăng trưởng tại nước này. Ngoài ra, sự ra đời của iPhone SE mới đã kích thích người dùng smartphone cũ nâng cấp lên".

Thoạt nhìn Huawei có vẻ là công ty được hưởng lợi nhiều nhất từ thị trường nội địa nhưng khoảng cách giữa Huawei và Samsung có thể sẽ thay đổi khi thị trường cầu dần hồi phục.

Covid-19 đã ảnh hưởng nghiêm trọng đến doanh số smartphone trên toàn cầu như thế nào? - Ảnh 4.

Anshul Gupta, giám đốc nghiên cứu cấp cao tại Gartner cho biết: "Hiệu suất bán hàng của Huawei tại Trung Quốc đã giúp hãng tránh được tình hình kinh doanh tồi tệ. Huawei đang ngày càng gia tăng khoảng cách dẫn đầu tại thị trường Trung Quốc, nơi họ chiếm tới 42,6% thị phần ở đây trong Q2".

Mặt khác, Apple được dự báo sẽ có mức tăng trưởng doanh số tốt hơn trong quý tới khi hãng chuẩn bị ra mắt dòng iPhone mới thế hệ mới. Tuy nhiên dòng iPhone 12 mới có thể sẽ lên kệ muộn hơn vào tháng 10 hoặc tháng 11 vì ảnh hưởng của đại dịch lên chuỗi cung ứng.', CAST(N'2020-09-01' AS Date), N'haweeei.jpg', 2)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (35, 3, N'Trong khi nhiều quốc gia đạt tốc độ 5G hàng trăm megabits, Mỹ chỉ đạt trung bình 51Mbps', N'Rõ ràng là cao hơn 4G, nhưng không hơn nhiều bởi những hạn chế trong việc sử dụng dải tần sóng ngắn.', N'Tốc độ tải về trung bình trên mạng 5G ở Mỹ là 50,9Mbps, một bước tiến đáng khen ngợi so với tốc độ trung bình trên mạng 4G, nhưng vẫn tụt hậu khá xa so với nhiều quốc gia khác, nơi mà tốc độ 5G dao động trong khoảng từ 200Mbps đến 400Mbps. Đó là dữ liệu thống kê từ OpenSignal, thu thập được từ 12 quốc gia dựa trên các bài test tốc độ do người dùng thực hiện từ 16/5 đến 14/8 năm nay. Mỹ xếp bét bảng trong top 12 quốc gia xét về tốc độ 5G, với 10/11 quốc gia còn lại có tốc độ 5G ít nhất cũng gấp đôi so với Mỹ.

Tốc độ 5G trung bình tại Mỹ cao hơn 1,8 lần so với tốc độ tải về trung bình trên mạng 4G của nước này (là 28,9Mbps). Các bài test do người dùng thực hiện tại quốc gia láng giềng Canada cho thấy tốc độ 4G trung bình đạt 59,4Mbps và 5G đạt 178,1Mbps. Đài Loan và Úc đều đạt tốc độ 5G trung bình trên 200Mbps, trong khi Hàn Quốc và Ả-rập Saudi cho tốc độ 5G cao nhất, lần lượt là 312,7Mbps và 414,2Mbps.

Tại Mỹ, tốc độ tải về trung bình đối với người dùng thỉnh thoảng truy cập 5G là 33,4Mbps - con số này bao gồm cả tốc độ mà họ đạt được với cả 4G và 5G. Kết quả này khiến Mỹ xếp áp chót trong số 12 quốc gia được khảo sát bởi OpenSignal, với tốc độ cao nhất thuộc về Ả-rập Saudi (144,5Mbps) và Canada (90,4Mbps). Mỹ gỡ gạc được đôi chút khi xét về tính hiệu dụng của 5G, tức phần trăm thời gian mà người dùng được kết nối đến 5G; cụ thể, họ đạt 19,3%, xếp thứ 5, trong khi Ả-rập Saudi xếp đầu tiên với 34,4% và Anh xếp chót với 4,5%.

Những biểu đồ dưới đây cho chúng ta thấy xếp hạng của 12 quốc gia xét về tốc độ tải về trên mạng 4G và 5G, phần trăm thời gian người dùng được kết nối đến 5G, và tốc độ tải về tổng thể:

Trong khi nhiều quốc gia đạt tốc độ 5G hàng trăm megabits, Mỹ chỉ đạt trung bình 51Mbps - Ảnh 1.
Tốc độ tải về trung bình của mạng 5G so với mạng 4G tại các quốc gia


Trong khi nhiều quốc gia đạt tốc độ 5G hàng trăm megabits, Mỹ chỉ đạt trung bình 51Mbps - Ảnh 2.
Tần suất người dùng 5G được kết nối đến mạng 5G tại các quốc gia


Trong khi nhiều quốc gia đạt tốc độ 5G hàng trăm megabits, Mỹ chỉ đạt trung bình 51Mbps - Ảnh 3.
Tốc độ tải về tổng thể của người dùng 5G tại các quốc gia


OpenSignal cho biết họ thu thập "hàng tỷ lượt đo đạc mỗi ngày từ hơn 100 triệu thiết bị trên toàn cầu", và 12 quốc gia trong bản báo cáo này là những quốc gia có dữ liệu chất lượng cao nhất mà họ thu thập được.

Tốc độ chỉ cải thiện một cách khiêm tốn trong dải tần sóng ngắn

Khoảng cách tương đối nhỏ giữa tốc độ 4G và 5G tại Mỹ (28,9Mbps vs 50,9Mbps) phản ánh tình hình dải tần sóng ngắn được sử dụng rộng rãi cho cả các mạng cũ và mới. Cụ thể, T-Mobile đã nâng cấp một phần lớn mạng 4G dải tần sóng ngắn thành 5G, giúp tốc độ được cải thiện nhưng không phải cải thiện lớn như những hứa hẹn của mạng 5G, vốn hoạt động tốt nhất trên dải tần sóng dài. OpenSignal giải thích rằng:

"Tốc độ tải về khá khiêm tốn trên mạng 5G tại Mỹ là vì số lượng dải tần sóng trung mới dành cho 5G bị hạn chế và sự phổ biển của dải tần sóng ngắn - 600MHz của T-Mobile và 850MHz của AT&T - điều này mang lại mức hiệu dụng và phạm vi phủ sóng xuất sắc nhưng tốc độ trung bình lại thấp hơn so với dải tần sóng trung 3,5GHz vốn là dải tần sóng 5G chính tại mọi quốc gia ngoài Mỹ".

Một nghiên cứu trước đó của OpenSignal hồi tháng 6, dựa trên các bài test từ 16/3 đến 13/6, cho thấy Verizon hiện là "nhà vô địch" về tốc độ tải về trung bình trên mạng 5G, đạt 494,7Mbps. T-Mobile và công ty con mới thâu tóm của mình (Sprint) đều có tốc độ 5G trung bình chỉ hơn 49Mbps, trong khi AT&T đạt 60,8Mbps.

Nhưng mạng 5G của Verizon lại có độ phủ sóng rất nhỏ, chủ yếu bởi sự lệ thuộc của Verizon vào tần số sóng millimet vốn dễ dàng bị chặn bởi những bức tường và không thể đi xa được, do đó tốc độ tải về trên mạng 5G của Verizon dù cao nhưng không có tác động thực tế nào lên tốc độ trung bình tại Mỹ tính trên toàn bộ các nhà mạng. Người dùng ứng dụng test tốc độ của OpenSignal chỉ bắt được tín hiệu 5G của Verizon với tần suất 0,4% trong tổng số thời gian sử dụng, so với 22,5% của T-Mobile, 14,1% của Sprint, và 10,3% của AT&T. Những biểu đồ dưới đây từ báo cáo tháng 6 của OpenSignal cho thấy tốc độ tải về trung bình trên mạng 5G của từng nhà mạng, độ hiệu dụng mạng 5G của các nhà mạng đó, và tốc độ tổng thể mà người dùng 5G có được.

Trong khi nhiều quốc gia đạt tốc độ 5G hàng trăm megabits, Mỹ chỉ đạt trung bình 51Mbps - Ảnh 4.
Tốc độ tải về trên mạng 5G


Trong khi nhiều quốc gia đạt tốc độ 5G hàng trăm megabits, Mỹ chỉ đạt trung bình 51Mbps - Ảnh 5.
Độ hiệu dụng của mạng 5G


Trong khi nhiều quốc gia đạt tốc độ 5G hàng trăm megabits, Mỹ chỉ đạt trung bình 51Mbps - Ảnh 6.
Tốc độ tải về tổng thể của người dùng 5G


Dù cho mạng 5G quy mô nhỏ của Verizon, nước Mỹ vẫn xếp cao hơn khi xét về tính hiệu dụng 5G so với khi xét về tốc độ 5G, bởi dải tần sóng ngắn mà các nhà mạng khác sử dụng "là lý tưởng để đạt được phạm vi phủ sóng 5G rộng rãi và cho phép ngừoi dùng kết nối được với 5G nhiều hơn so với các quốc gia sử dụng dải tần 5G cao hơn". OpenSignal còn cho biết, "tại Mỹ, các dịch vụ 5G băng tần thấp của T-Mobile và AT&T đã giúp mang lại kết quả khá cao khi xét về tính hiệu dụng 5G. Việc T-Mobile gần đây vừa tung ra gói dịch vụ chỉ truy cập 5G - tức điện thoại sẽ không cần kết nôi đến 4G trước để 5G có thể hoạt động được nữa - có thể giúp các dịch vụ 5G phát triển mạnh hơn trong tương lai."

Sự chuyển dịch dần dần từ 4G lên 5G có thể khá tương đồng với từ 3G lên 4G, vốn đã bắt đầu từ khoảng 1 thập kỷ trước. Thị trường 5G hiện nay, theo quan điểm của OpenSignal, là "chưa chín muồi". "Chúng ta vẫn đang ở những giai đoạn sơ khởi của thời đại 5G, một thời đại sẽ tồn tại ít nhất một thập kỷ bởi các dịch vụ 5G đầu tiên mới chỉ được tung ra năm 2019, và tại nhiều quốc gia, chúng tôi tiếp tục thấy các dịch vụ 5G hướng đến người dùng smartphone mới bắt đầu được triển khai lần đầu" - báo cáo của OpenSignal nói.', CAST(N'2020-09-01' AS Date), N'máº¡ng5g.jpeg', 2)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (36, 3, N'TOTOLINK T6_V2 - Giải pháp WIFI Mesh hoàn hảo cho mùa dịch', N'TOTOLINK là thương hiệu thiết bị mạng của Công ty TNHH Công Nghệ Zioncom có trụ sở chính đặt tại Hồng Kông.', N'Trong suốt thời gian hoạt động, TOTOLINK đã ra mắt thị trường các loại thiết bị mạng như Router Wi-Fi, Mesh Router Wi-Fi, Thiết bị phát Wi-Fi 4G LTE, thiết bị mở rộng sóng Wi-Fi, ...

Giải pháp Wi-Fi Mesh cho mùa dịch

Vừa được ra mắt tại Việt Nam vào cuối tháng 7 năm 2020, nhưng không thể phủ nhận lợi ích mà TOTOLINK T6_V2 mang lại khá tốt. Nhất là phục vụ tốt nhu cầu làm việc của người dùng tại nhà trong đợt bùng phát dịch Sars-Covid-2 vừa qua. Vậy cụ thể, giải pháp Wi-Fi Mesh Roaming này ra sao?

Về nhu cầu lắp đặt

Một ngôi nhà ba tầng lầu có diện tích rộng 300m2 với nhiều phòng ốc nhưng phải đảm bảo mạng Wi-Fi ổn định ở bất cứ vị trí nào trong ngôi nhà. Đặc biệt lại cần chú trọng đến tính đơn giản và thẩm mỹ trong không gian sử dụng - không muốn sử dụng quá nhiều thiết bị con như mở rộng sóng Wi-Fi, Router Wi-Fi, AP, .....Nhu cầu số lượng kết nối là 40 thiết bị.

Thực hiện lắp đặt

TOTOLINK T6_V2 - Giải pháp WIFI Mesh hoàn hảo cho mùa dịch - Ảnh 2.

 Các tính năng nổi bật của T6_V2  

Sau đó, sử dụng App TOTOLINK ROUTER để đặt tên và mật khẩu Wi-Fi cho hệ thống Mesh Wi-Fi T6_V2. Cuối cùng, người dùng di chuyển vị trí của 2 thiết bị T6_V2 phụ tới vị trí ở tầng 1 và 3 (T6 chính thì đặt tại tầng 2). Vậy là sóng Wi-Fi đã phủ rộng toàn bộ ngôi nhà!

Các tính năng nổi bật của T6_V2

Chuyển vùng liền mạch với công nghệ Seamless Roaming

Với công nghệ Seamless Roaming, T6_V2 sẽ tự động điều chỉnh hướng tín hiệu giúp thiết bị như điện thoại, laptop, tablet,... kết nối đến thiết bị T6_V2 gần nhất khi di chuyển giữa các tầng lầu - từ khu vực T6_V2 chính đến khu vực có T6_V2 phụ, đảm bảo cho việc chơi game trên di động, nghe nhạc online, làm việc, nhận tin nhắn, nhận file không bị gián đoạn.

TOTOLINK T6_V2 - Giải pháp WIFI Mesh hoàn hảo cho mùa dịch - Ảnh 3.

Wi-Fi băng tần kép tốc độ cao phù hợp với mọi nhu cầu

Ngoài là một thiết bị Mesh Wi-Fi, T6_V2 còn được tích hợp băng tần kép dựa trên chuẩn Wi-Fi AC có tốc độ truyền tải Wi-Fi lên đến 1200Mbps. Với tốc độ này, T6_V2 có thể mang đến cho người dùng trải nghiệm tuyệt vời cho các hoạt động internet như họp online qua video call, xem video 4K, stream game hay live stream bán hàng, ….

Mạng khách (Guest Network)

T6_V2 có chức năng tạo Mạng khách (Guest Network) dành riêng cho khách đến nhà sử dụng Wi-Fi, đảm bảo bảo mật tài nguyên và dữ liệu cho chủ nhà.

Cài đặt và quản lý dễ dàng với App TOTOLINK ROUTER

Quá trình cài đặt trên T6_V2 vô cùng nhanh gọn. Người dùng chỉ cần tải app TOTOLINK ROUTER và tiến hành cài đặt các thông số cần thiết cho thiết bị. Vậy là người dùng đã có thể sử dụng thiết bị ngay lập tức. Ngoài ra, ứng dụng TOTOLINK ROUTER còn có thể giúp người dùng quản lý thiết bị T6_V2 từ xa kể cả khi đi chợ, ăn sáng, ....hay du lịch cùng bạn bè.

TOTOLINK T6_V2 - Giải pháp WIFI Mesh hoàn hảo cho mùa dịch - Ảnh 4.

Với giải pháp Wi-Fi trong mùa dịch của Mesh T6_V2, hy vọng quý độc giả sẽ biết thêm các thông tin hữu ích về mạng Mesh Wi-Fi T6_V2 cũng như tìm cho mình một sản phẩm phù hợp đáp ứng nhu cầu sử dụng. Nếu cảm thấy phù hợp thì đừng chần chờ gì mà hãy thử áp dụng ngay giải pháp Wi-Fi Mesh từ TOTOLINK T6_V2 đã giới thiệu ở phía trên nhé!', CAST(N'2020-09-02' AS Date), N'tocolink.jpg', 2)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (37, 2, N'Hé lộ mức lương tại Facebook: Thấp nhất 1 USD, cao nhất lên tới hơn nửa triệu USD!', N'Công ty do Mark Zuckerberg đồng sáng lập chỉ trả cho anh vỏn vẹn 1 USD/năm.', N'Tuy là nhà đồng sáng lập và CEO của Facebook với khối tài sản trị giá 107 tỷ USD, Mark Zuckerberg lại là một trong những người có mức lương thấp nhất tại đây. Không kể chi phí đi lại bằng máy bay và bảo đảm an ninh, công ty này chỉ trả lương cơ bản cho Zuckerberg vỏn vẹn 1 USD/năm.

Trở lại năm 2012, Zuckerberg từng nhận mức lương và thưởng lên tới 770.000 USD/năm nhưng giờ đây tỷ phú trẻ tuổi này đã trở thành nhân viên được trả lương thấp nhất công ty.

 Hé lộ mức lương tại Facebook: Thấp nhất 1 USD, cao nhất lên tới hơn nửa triệu USD! - Ảnh 1.
Đồng sáng lập và CEO của Facebook.


Trong khi đó, rất nhiều nhân viên khác của Facebook, từ kỹ sư phần mềm đến giám đốc sản phẩm, copywriter và luật sư có thể nhận mức lương khá thoải mái với 6 con số.

Nhưng cụ thể là bao nhiêu? Mới đây, Business Insider đã tiếp cận được với dữ liệu tiền lương do chính phủ Mỹ công bố để tìm hiểu rõ hơn mức lương cụ thể của nhân viên Facebook tại Mỹ.

Dữ liệu trên được lấy từ đơn xin thị thực do các công ty nộp lên hàng năm, theo đó những công ty này được yêu cầu cho biết chính xác số tiền họ định trả cho mỗi người lao động nếu đơn xin được chấp thuận.

Mặc dù vậy, dữ liệu này vẫn có những hạn chế nhất định như chỉ cho biết mức lương cơ bản của người lao động và không bao gồm khoản thưởng hay trợ cấp cổ phiếu. Ngoài ra, nó cũng chỉ cho thấy mức lương của một vị trí cụ thể tại công ty. Ví dụ, nếu Facebook không có ý định thuê một nhà phân tích thuế về thị thực, họ sẽ không cung cấp bất cứ thông tin chi tiết nào về số tiền họ được trả.

Về mặt pháp lý, các công ty bắt buộc phải trả cho nhân viên là người nước ngoài mức lương tương đương với lao động trong nước. Dưới đây là mức lương cụ thể của nhân viên Facebook tại Mỹ:

Dữ liệu và kỹ thuật

Nhà khoa học dữ liệu: Từ 110.659 USD đến 216.331 USD

Kỹ sư phần mềm: Từ 110.000 USD đến 280.000 USD

Kỹ sư dữ liệu: Từ 110.000 đến 195.424 USD

Nhà khoa học nghiên cứu: Từ 135.000 USD đến 250.527 USD

Giám đốc kỹ thuật: Từ 171.000 USD đến 280.000 USD

Quản lý chương trình kỹ thuật: Từ 111.636 USD đến 225.000 USD

Kỹ sư sản xuất: Từ 110.000 đến 221.597 USD

Quản lý, kỹ thuật: Từ 284.200 đến 345.221 USD

Thiết kế sản phẩm: Từ 105.000 USD đến 199.355 USD

Kỹ sư phát triển giao diện người dùng: Từ 110.000 USD đến 225.000 USD

Giám đốc sản phẩm: Từ 110.000 USD đến 240.000 USD

Kỹ sư bảo mật: Từ 115.000 USD đến 215.000 USD

Phần cứng và mạng

Kỹ sư ASIC & FPGA: Từ 145.000 USD đến 205.000 USD

Kỹ sư điện: Từ 125.000 USD đến 205.000 USD

Nhà khoa học về quang học: Từ 140.000 USD đến 180.359 USD

Kỹ sư phần cứng: Từ 155.000 USD đến 208.192 USD

Kỹ sư mạng: Từ 78.499 USD đến 180.000 USD

Chính sách, nội dung, nghiên cứu

Phó Chủ tịch phụ trách các vấn đề toàn cầu và truyền thông: 665.500 USD

Nhà chiến lược nội dung: Từ 115.000 USD đến 180.000 USD

Giám đốc chương trình chính sách: 150.000 USD

Chuyên gia sáng tạo: 112.172 USD

Nghiên cứu trải nghiệm khách hàng: Từ 120.000 USD đến 162.000 USD

Kinh doanh, quản lý, và các vị trí khác

Giám đốc tiếp thị sản phẩm: Từ 110.779 đến 205.680 USD

Giám đốc tài chính: Từ 145.000 USD đến 180.000 USD

Đối tác kinh doanh nhân sự: Từ 153.000 USD đến 220.500 USD

Nhà phân tích kinh doanh: Từ 130.000 USD đến 201.676 USD

Nhà phân tích bảo mật: 145.089 USD

Quản lý sự kiện: 143.343 USD

Cố vấn chính: 210.000 USD', CAST(N'2020-09-02' AS Date), N'ceoface.jpg', 2)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (38, 1, N'Smartphone đầu tiên có camera selfie ẩn dưới màn hình ra mắt, nhưng không phải Vsmart Aris', N'ZTE chính thức trở thành nhà sản xuất đầu tiên thương mại hóa công nghệ camera ẩn dưới màn hình trên chiếc Axon 20 5G.', N'Sau một thời gian "nhá hàng" công nghệ camera ẩn dưới màn hình thì hôm nay (1/9), ZTE, thương hiệu smartphone tới từ Trung Quốc, đã chính thức cho ra mắt chiếc smartphone đầu tiên trên thế giới được trang bị công nghệ này: ZTE Axon 20 5G.

Smartphone đầu tiên có camera selfie ẩn dưới màn hình ra mắt, nhưng không phải Vsmart Aris - Ảnh 1.

Công nghệ camera ẩn dưới màn hình từ lâu đã được coi là một bước đi đột phá mới trong kỷ nguyên công nghệ đang dần trở nên bão hòa. Trước đó OPPO cũng đã từng thử nghiệm và trình diễn công nghệ này, tuy nhiên do thời điểm đó OPPO chưa thể hoàn thiện công nghệ này do một số hạn chế nhất định. Tới hôm nay, ZTE đã chính thức triển khai công nghệ camera ẩn trong màn hình trên một chiếc smartphone được thương mại hóa, trở thành nhà sản xuất đầu tiên trên thế giới đạt được cột mốc đáng chú ý này.

Smartphone đầu tiên có camera selfie ẩn dưới màn hình ra mắt, nhưng không phải Vsmart Aris - Ảnh 2.

ZTE Axon 20 5G thực chất không phải là một chiếc smartphone thuộc dòng sản phẩm cao cấp, thay vào đó máy thuộc phân khúc tầm trung. Máy được trang bị một màn hình kích thước 6.92 inch, sử dụng tấm nền OLED với độ phân giải Full HD+, hỗ trợ hiển thị 10-bit màu và 100% không gian màu DCI-P3. Do sử dụng công nghệ camera ẩn dưới màn hình nên màn hình của máy là màn hình không khiếm khuyết, mặc dù ở vị trí đặt camera, chúng ta có thể nhìn thấy rõ phần cảm biến của camera này. Camera selfie của Axon 20 5G có độ phân giải 32MP.

Smartphone đầu tiên có camera selfie ẩn dưới màn hình ra mắt, nhưng không phải Vsmart Aris - Ảnh 3.

ZTE cho biết hãng đã sử dụng giải pháp camera ẩn dưới màn hình có tên "InV See" do Visionox, một công ty công nghệ Trung Quốc phát triển, đồng thời cũng tuyên bố công nghệ camera dưới màn hình này được thực hiện thông qua sự tương tác giữa 5 công nghệ cốt lõi: vật liệu hiển thị đặc biệt, chip điều khiển, trình điều khiển riêng biệt, một ma trận điểm ảnh đặc biệt và thuật toán chụp ảnh do chính ZTE phát triển.

Video thực tế cho thấy camera selfie ẩn dưới màn hình trên Axon 20 5G

Vật liệu hiển thị mới cho phép ánh sáng có thể đi vào cảm biến camera selfie, trong khi chip và mạch điều khiển sẽ xử lý các phần còn lại về hiển thị. Bản thân giám đốc sản phẩm của ZTE cũng chia sẻ một hình ảnh được chụp từ camera selfie ẩn dưới màn hình của chiếc Axon 20 5G để chứng minh chất lượng camera sử dụng công nghệ này là không hề tệ.



Chất lượng từ camera selfie này cũng không hề tệ chút nào

Về mặt cấu hình, máy được trang bị con chip Snapdragon 765G, RAM 6GB/8GB, bộ nhớ 128GB/256GB. Cụm camera bao gồm 4 ống kính với cảm biến chính có độ phân giải 64MP. Máy có viên pin dung lượng pin 4220mAh, hỗ trợ sạc nhanh 30W.

Smartphone đầu tiên có camera selfie ẩn dưới màn hình ra mắt, nhưng không phải Vsmart Aris - Ảnh 6.

ZTE Axon 20 5G sẽ được bán ra tại thị trường Trung Quốc vào ngày 10/9 tới đây với các tùy chọn màu sắc như đen, xanh, tím và cam. Mức giá cho các phiên bản như sau:

- 6GB + 128GB: 2198 tệ, tương đương 7.4 triệu đồng
- 8GB + 128GB: 2498 tệ, tương đương 8.5 triệu đồng
- 8GB + 256GB: 2798 tệ, tương đương 9.5 triệu đồng', CAST(N'2020-09-02' AS Date), N'zte.jpg', 2)
INSERT [dbo].[NEWS] ([newsid], [categoryid], [tieude], [mota], [noidung], [date], [img], [usersid]) VALUES (39, 1, N'Realme ra mắt smartphone 5G rẻ nhất thế giới: RAM 6GB, pin 5000mAh, giá chỉ 3.4 triệu', N'Chỉ với hơn 3 triệu đồng, người dùng đã có thể sở hữu một chiếc smartphone có hỗ trợ mạng 5G.', N'Ở thời điểm hiện tại, công nghệ mạng 5G mới chỉ được trang bị lên các dòng sản phẩm tầm trung hoặc cao cấp có mức giá cao. Tuy nhiên, Realme mới đây đã cho ra mắt một chiếc smartphone mới có tên Realme V3, mức giá của sản phẩm này chỉ hơn 3 triệu đồng, nhưng lại hỗ trợ cả mạng 5G và có thông số cấu hình tương đối hấp dẫn.

Realme ra mắt smartphone 5G rẻ nhất thế giới: RAM 6GB, pin 5000mAh, giá chỉ 3.4 triệu - Ảnh 1.

Realme V3 có thiết kế bằng nhựa khá quen thuộc với các dòng sản phẩm Realme gần đây. Máy được trang bị một màn hình "giọt nước" kích thước lớn 6.5 inch, sử dụng tấm nền LCD IPS và có độ phân giải dừng ở mức HD+ (720 x 1600). Realme cho biết màn hình này có diện tích hiển thị so với mặt trước chiếm 88.7%.

Mặt lưng của máy nổi bật với cụm 3 camera chính được đặt trong một mô-đun hình vuông. Cụm camera này bao gồm một camera góc rộng 13MP f/2.2, một camera macro 2MP (khoảng cách lấy nét 4cm) và một camera 2MP đo chiều sâu, không có camera tele và camera góc siêu rộng. Cụm camera này có khả năng quay 1080p ở 60fps và 720p ở 120fps (chuyển động chậm). Ngoài ra, Realme V3 cũng có thêm một camera selfie 8MP ở mặt trước.

Realme ra mắt smartphone 5G rẻ nhất thế giới: RAM 6GB, pin 5000mAh, giá chỉ 3.4 triệu - Ảnh 2.

Về mặt hiệu năng, Realme V3 được trang bị con chip MediaTek Dimensity 720, một con chip cho hiệu năng gần tương đương với Snapdragon 720G của Qualcomm. Máy có dung lượng RAM 6GB/8GB, bộ nhớ lưu trữ 64GB/128GB và có viên pin dung lượng 5000mAh.

Điểm nhấn của chiếc smartphone này như đã đề cập ở trên là khả năng hỗ trợ mạng 5G kép (độc lập và không độc lập) dựa trên băng tần sub-6GHz. Trước đó, Realme V5 được ra mắt với danh hiệu là smartphone 5G rẻ nhất thế giới, tuy nhiên với Realme V3, Realme một lần nữa phá kỷ lục này của chính mình, góp phần phổ cập mạng 5G tới mọi nhà.

Realme V3 sẽ được bán ra tại thị trường Trung Quốc vào ngày 9/9 tới đây với hai tùy chọn màu sắc là xanh dương và trắng cùng mức giá như sau:

- 6GB + 64GB: 999 tệ, tương đương 3.4 triệu đồng
- 6GB + 128GB: 1399 tệ, tương đương 4.7 triệu đồng

- 8GB + 128GB: 1599 tệ, tương đương 5.4 triệu đồng', CAST(N'2020-09-02' AS Date), N'realmee.jpg', 2)
SET IDENTITY_INSERT [dbo].[NEWS] OFF
GO
SET IDENTITY_INSERT [dbo].[USER] ON 

INSERT [dbo].[USER] ([usersid], [username], [password], [fullname], [adminid]) VALUES (1, N'Admin', N'thanh123', N'Nguyễn Hữu Thành', 1)
INSERT [dbo].[USER] ([usersid], [username], [password], [fullname], [adminid]) VALUES (2, N'thanh', N'123456', N'Nguyễn Hữu Thanh', 2)
INSERT [dbo].[USER] ([usersid], [username], [password], [fullname], [adminid]) VALUES (3, N'kiet', N'1234567', N'Nguyễn Duy Thanh', 2)
INSERT [dbo].[USER] ([usersid], [username], [password], [fullname], [adminid]) VALUES (6, N'hoangduc', N'12345678', N'Mai Hoàng Đức', 2)
SET IDENTITY_INSERT [dbo].[USER] OFF
GO
ALTER TABLE [dbo].[NEWS]  WITH CHECK ADD  CONSTRAINT [FK_NEWS_DANHMUC] FOREIGN KEY([categoryid])
REFERENCES [dbo].[DANHMUC] ([categoryid])
GO
ALTER TABLE [dbo].[NEWS] CHECK CONSTRAINT [FK_NEWS_DANHMUC]
GO
ALTER TABLE [dbo].[NEWS]  WITH CHECK ADD  CONSTRAINT [FK_NEWS_USER] FOREIGN KEY([usersid])
REFERENCES [dbo].[USER] ([usersid])
GO
ALTER TABLE [dbo].[NEWS] CHECK CONSTRAINT [FK_NEWS_USER]
GO
ALTER TABLE [dbo].[USER]  WITH CHECK ADD  CONSTRAINT [FK_USER_DANHMUCADMIN] FOREIGN KEY([adminid])
REFERENCES [dbo].[DANHMUCADMIN] ([adminid])
GO
ALTER TABLE [dbo].[USER] CHECK CONSTRAINT [FK_USER_DANHMUCADMIN]
GO
USE [master]
GO
ALTER DATABASE [Webnews] SET  READ_WRITE 
GO
