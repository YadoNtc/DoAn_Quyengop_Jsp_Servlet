CREATE DATABASE Quyengop
GO

USE Quyengop
GO

/****** Object:  Table [dbo].[users]    Script Date: 12/10/2021 6:53:58 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[users](
	[id] [INT] IDENTITY(1,1) NOT NULL,
	[password] [VARCHAR](100) NULL,
	[fullname] [NVARCHAR](100) NULL,
	[email] [VARCHAR](255) NULL,
	[phonenumber] [VARCHAR](50) NULL,
	[status] [BIT] NULL,
	[createddate] [DATETIME] NULL,
	[createdby] [NVARCHAR](100) NULL,
	[modifieddate] [DATETIME] NULL,
	[modifiedby] [NVARCHAR](100) NULL,
	[avatar] [VARCHAR](100) NULL,
	[admin] [BIT] NULL,
	[address] [NVARCHAR](255) NULL,
	[rolescode] [VARCHAR](50) NULL,
	[hash] [VARCHAR](255) NULL,
	[idgg] [VARCHAR](100) NULL,
	[idfb] [VARCHAR](100) NULL,
 CONSTRAINT [PK_userId] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [email_unique] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** Object:  Table [dbo].[chuongtrinhquyengop]    Script Date: 12/10/2021 5:13:16 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[chuongtrinhquyengop](
	[id] [INT] IDENTITY(1,1) NOT NULL,
	[name] [NVARCHAR](255) NULL,
	[description] [NTEXT] NULL,
	[image] [VARCHAR](255) NULL,
	[detail] [NTEXT] NULL,
	[targetmoney] [BIGINT] NULL,
	[currentmoney] [BIGINT] NULL,
	[createddate] [DATETIME] NULL,
	[createdby] [NVARCHAR](100) NULL,
	[modifieddate] [DATETIME] NULL,
	[modifiedby] [NVARCHAR](100) NULL,
	[status] [VARCHAR](50) NULL,
 CONSTRAINT [PK_CTQG] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[dotquyengop]    Script Date: 12/10/2021 5:13:53 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[dotquyengop](
	[id] [INT] IDENTITY(1,1) NOT NULL,
	[amoutmoney] [BIGINT] NULL,
	[createddate] [DATETIME] NULL,
	[campaginId] [INT] NULL,
	[userId] [INT] NULL,
	[status] [VARCHAR](20) NULL,
	[fullname] [NVARCHAR](50) NULL,
	[email] [VARCHAR](100) NULL,
	[mobile] [VARCHAR](20) NULL,
	[modifiedby] [NVARCHAR](50) NULL,
	[modifieddate] [DATETIME] NULL,
 CONSTRAINT [PK_ttqg] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[dotquyengop]  WITH CHECK ADD  CONSTRAINT [FK_campaginId] FOREIGN KEY([campaginId])
REFERENCES [dbo].[chuongtrinhquyengop] ([id])
GO

ALTER TABLE [dbo].[dotquyengop] CHECK CONSTRAINT [FK_campaginId]
GO

ALTER TABLE [dbo].[dotquyengop]  WITH CHECK ADD  CONSTRAINT [FK_user_dqg] FOREIGN KEY([userId])
REFERENCES [dbo].[users] ([id])
GO

ALTER TABLE [dbo].[dotquyengop] CHECK CONSTRAINT [FK_user_dqg]
GO

--===============================INSERT TABLE================================================================

INSERT INTO dbo.users
(password, fullname, email, address, phonenumber, status, admin, createddate) VALUES
('827CCB0EEA8A706C4C34A16891F84E7B', N'Nguyễn Thành Công', 'ntcongyamaha@gmail.com', N'HCM', '0329738149', 1, 1, CAST('2021-10-01 00:00:00' AS DATETIME)),
('827CCB0EEA8A706C4C34A16891F84E7B', N'User 1', 'user01@gmail.com', N'HCM', '0329738149', 1, 0, CAST('2021-10-01 00:00:00' AS DATETIME))
GO

INSERT INTO dbo.chuongtrinhquyengop
(name, description, image, detail, createddate, status, targetmoney, currentmoney)VALUES
(N'Hỗ trợ nghiên cứu và sản xuất cho phòng chống dịch bệnh', N'Nghiên cứu và phát triển công nghệ (sản xuất vắc xin, trang thiết bị chống dịch,...) để phục vụ phát triển kinh tế-xã hội và đặc biệt là phòng chống dịch trong thời điểm hiện nay.', 
'/CKFinderJava/userfiles/images/momo-upload-api-210628163600-637604949601374115.jpg', N'<h2>C&acirc;u chuyện</h2>

<p>Thời gian qua, t&igrave;nh h&igrave;nh diễn biến phức tạp của đại dịch đ&atilde; ảnh hưởng rất nhiều đến nguồn nh&acirc;n lực, điều kiện kinh tế, cơ sở vật chất của cả nước nhưng ng&agrave;nh khoa học c&ocirc;ng nghệ đ&atilde; c&oacute; nhiều nỗ lực, vượt qua kh&oacute; khăn, thử th&aacute;ch v&agrave; đ&atilde; đạt được nhiều th&agrave;nh t&iacute;ch c&oacute; &yacute; nghĩa, g&oacute;p phần đ&aacute;ng kể v&agrave;o th&agrave;nh t&iacute;ch chung của cả nước.</p>

<p><img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-210625183355-637602428357754371.jpg" style="height:340px; width:640px" /></p>

<p><em>Trang thiết bị y tế được sản xuất t&iacute;ch cực để phục vụ nhu cầu kịp thời trong giai đoạn dịch bệnh n&agrave;y</em></p>

<p>Ngay từ khi dịch bắt đầu b&ugrave;ng ph&aacute;t, Bộ KH&amp;CN đ&atilde; khẩn trương huy động lực lượng l&agrave; c&aacute;c chuy&ecirc;n gia, nh&agrave; khoa học h&agrave;ng đầu Việt Nam trong lĩnh vực truyền nhiễm, dịch tễ, sinh học ph&acirc;n tử, vaccine, y học thảm họa... v&agrave; doanh nghiệp triển khai c&aacute;c nhiệm vụ KHCN cấp quốc gia nghi&ecirc;n cứu về đặc điểm dịch tễ học, chế tạo bộ KIT ph&aacute;t hiện virus, x&acirc;y dựng ph&aacute;c đồ điều trị, sản xuất kh&aacute;ng thể đơn d&ograve;ng, robot v&agrave; m&aacute;y thở phục vụ t&igrave;nh huống, ứng ph&oacute; với c&aacute;c cấp độ dịch b&ugrave;ng ph&aacute;t, sản xuất vaccine ph&ograve;ng dịch.</p>

<p><img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-210625183427-637602428676489779.jpg" style="height:340px; width:640px" /></p>

<p><em>C&aacute;c m&aacute;y thở lu&ocirc;n sẵn s&agrave;ng để đưa v&agrave;o phục vụ c&aacute;c t&igrave;nh huống khẩn cấp</em></p>

<p>Trước diễn biến t&igrave;nh h&igrave;nh dịch bệnh nguy cấp, V&iacute; MoMo đồng h&agrave;nh c&ugrave;ng Ủy ban Mặt Trận Tổ Quốc Việt Nam mong muốn được tiếp sức cho c&aacute;c nh&agrave; khoa học trong việc nghi&ecirc;n cứu ph&ograve;ng v&agrave; chống bệnh bằng việc g&acirc;y quỹ 1 tỷ đồng. Chương tr&igrave;nh nhằm hỗ trợ kinh ph&iacute; nghi&ecirc;n cứu v&agrave; ph&aacute;t triển c&ocirc;ng nghệ (sản xuất vắc xin, trang thiết bị chống dịch,...) để phục vụ ph&aacute;t triển kinh tế - x&atilde; hội v&agrave; đặc biệt l&agrave; ph&ograve;ng chống dịch trong thời điểm hiện nay. Đồng thời đẩy mạnh c&aacute;c biện ph&aacute;p khẩn cấp ph&ograve;ng chống sự l&acirc;y lan của dịch bệnh, cung cấp th&ocirc;ng tin hỗ trợ cảnh b&aacute;o sớm, hướng tới chăm s&oacute;c, điều trị v&agrave; bảo vệ sức khỏe cộng đồng.</p>

<p><img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-210625183456-637602428969064598.jpg" style="height:340px; width:640px" /></p>

<p><em>V&iacute; MoMo phối hợp c&ugrave;ng Ủy ban Mặt Trận Tổ Quốc Việt Nam mong muốn được tiếp sức cho c&aacute;c nh&agrave; khoa học trong việc nghi&ecirc;n cứu ph&ograve;ng v&agrave; chống bệnh</em></p>

<p>Ngay l&uacute;c n&agrave;y đ&acirc;y, bất kể số tiền n&agrave;o đều l&agrave; đ&aacute;ng qu&yacute;, bất cứ đ&oacute;ng g&oacute;p n&agrave;o cũng đều v&ocirc; c&ugrave;ng qu&yacute; gi&aacute;. Mọi sự đ&oacute;ng g&oacute;p của bạn sẽ tiếp th&ecirc;m sức mạnh gi&uacute;p đất nước của ch&uacute;ng ta mạnh mẽ hơn nữa, quyết liệt hơn nữa để chiến đấu v&agrave; sớm chiến thắng đại dịch.</p>

<p><em>Ch&uacute;ng t&ocirc;i sẽ cập nhật th&ecirc;m th&ocirc;ng tin về tiến độ dự &aacute;n đến qu&yacute; vị trong thời gian sớm nhất.</em></p>

<table>
	<tbody>
		<tr>
			<td>
			<p><u><strong>Về Mặt trận Tổ Quốc Việt Nam:</strong></u><br />
			Mặt trận Tổ quốc Việt Nam l&agrave; h&igrave;nh thức tổ chức của Mặt trận D&acirc;n tộc Thống nhất Việt nam với mục ti&ecirc;u tập hợp v&agrave; ph&aacute;t huy sức mạnh của khối Đại đo&agrave;n kết to&agrave;n d&acirc;n phấn đấu cho một nước Việt Nam độc lập, tự do, hạnh ph&uacute;c, d&acirc;n gi&agrave;u, nước mạnh, x&atilde; hội c&ocirc;ng bằng văn minh. Sau khi cả nước đ&atilde; được độc lập, sự thống nhất v&agrave; to&agrave;n vẹn của một quốc gia đ&ograve;i hỏi hợp nhất 3 tổ chức mặt trận. Nhằm đ&aacute;p ứng y&ecirc;u cầu của giai đoạn c&aacute;ch mạng mới, Đại hội Mặt trận D&acirc;n tộc thống nhất họp từ 31/1 đến 4/2/1977 tại th&agrave;nh phố Hồ Ch&iacute; Minh đ&atilde; thống nhất ba tổ chức Mặt trận ở hai miền Nam Bắc nước ta th&agrave;nh một tổ chức Mặt trận D&acirc;n tộc thống nhất duy nhất lấy t&ecirc;n l&agrave; Mặt trận Tổ quốc Việt Nam</p>

			<p style="text-align:justify">Mặt trận Tổ quốc Việt Nam với sự l&atilde;nh đạo của Đảng Cộng sản Việt Nam, sự thống nhất &yacute; ch&iacute; của tất cả c&aacute;c tổ chức của c&aacute;c giai tầng trong x&atilde; hội, c&aacute;c c&aacute; nh&acirc;n ti&ecirc;u biểu của c&aacute;c d&acirc;n tộc, t&ocirc;n gi&aacute;o, tầng lớp, c&aacute;c vị l&atilde;nh đạo ti&ecirc;u biểu cho &yacute; ch&iacute; đo&agrave;n kết của d&acirc;n tộc, lu&ocirc;n phấn đấu x&acirc;y dựng khối Đại đo&agrave;n kết d&acirc;n tộc vững mạnh thực hiện lời dạy của Hồ Ch&iacute; Minh vị l&atilde;nh tụ của to&agrave;n d&acirc;n tộc: &quot;Mục đ&iacute;ch phấn đấu của Mặt trận D&acirc;n tộc thống nhất l&agrave; x&acirc;y dựng một nước Việt Nam ho&agrave; b&igrave;nh, thống nhất, độc lập, d&acirc;n chủ v&agrave; gi&agrave;u mạnh&quot;.</p>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</tbody>
</table>',
CAST('2021-09-08 00:00:00.000' AS DATETIME), 'completed', 1000000000 , 0),
(N'Xây quỹ tài trợ học bổng cho 2 em học sinh nghèo vượt khó', N'Gây quỹ tài trợ học bổng cho 2 em là Trần Văn Huy và Bùi Thị Uyên Trang có ý chí vượt khó vươn lên trong học tập trong chương trình “CẶP LÁ YÊU THƯƠNG”. Chung tay ngay!',
'/CKFinderJava/userfiles/images/momo-upload-api-210615105628-637593513883880685.jpg', N'<h2>C&acirc;u chuyện</h2>

<p><strong>Chuyện của hai tr&ograve; ngh&egrave;o vượt kh&oacute;, học giỏi</strong></p>

<p>Đặt ch&acirc;n đến v&ugrave;ng đất hiếu học H&agrave; Tĩnh tại trường Trường Tiểu học Đức Y&ecirc;n, Huyện Đức Thọ, kh&ocirc;ng ai l&agrave; kh&ocirc;ng biết cậu học tr&ograve; ngh&egrave;o Trần Văn Huy vượt kh&oacute;, học giỏi. Sinh ra v&agrave; lớn l&ecirc;n trong gia đ&igrave;nh kh&ocirc;ng đủ nguy&ecirc;n vẹn tại qu&ecirc; ngh&egrave;o. Bố Huy bị mất bởi căn bệnh ung thư qu&aacute;i &aacute;c, để lại mẹ em v&agrave; 3 chị em c&ocirc;i c&uacute;t mồ c&ocirc;i cha. Huy c&oacute; hai em g&aacute;i, 1 em 5 tuổi v&agrave; 1 em 4 tuổi. Bốn mẹ con hiện tại kh&ocirc;ng c&oacute; nh&agrave; để ở phải nương nhờ nh&agrave; &ocirc;ng b&agrave; ngoại, 2 em của Huy đều mắc bệnh khe hở v&ograve;m miệng v&agrave; rất cần được phẫu thuật chữa trị.&nbsp;</p>

<p>G&aacute;nh nặng cơm, &aacute;o, gạo, tiền cộng th&ecirc;m tiền thuốc men cho chị g&aacute;i đang bệnh khiến cuộc sống gia đ&igrave;nh Huy trở n&ecirc;n chật vật, t&uacute;ng thiếu. Mặc d&ugrave; cuộc sống thiếu thốn l&agrave; thế nhưng em kh&ocirc;ng mặc cảm, tự ti m&agrave; ngược lại em c&ograve;n lấy điều đ&oacute; l&agrave;m động lực để phấn đấu. Bằng &yacute; nghĩ đ&oacute;, Đắc Lộc đ&atilde; trở th&agrave;nh tấm gương s&aacute;ng về tinh thần hiếu học v&agrave; &yacute; ch&iacute;, nghị lực vươn l&ecirc;n trong cuộc sống.&nbsp;</p>

<p><img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-210615104825-637593509052696803.jpg" style="height:340px; width:640px" /></p>

<p><em>Em Trần Văn Huy v&agrave; mẹ trước di ảnh của bố em</em></p>

<p>X&oacute;t thương hơn l&agrave; ho&agrave;n cảnh của em B&ugrave;i Thị Uy&ecirc;n Trang, học sinh học sinh lớp 6C Trường THCS L&ecirc; Ninh, Huyện Đức Thọ, Tỉnh H&agrave; Tĩnh. Tưởng chừng em c&oacute; được gia đ&igrave;nh vi&ecirc;n m&atilde;n, đầy đủ. Nhưng cuộc sống của gia đ&igrave;nh em rơi v&agrave;o kh&oacute; khăn khi kh&ocirc;ng may bố em bị tai nạn giao th&ocirc;ng kh&ocirc;ng c&ograve;n khả năng lao động, mẹ em thường xuy&ecirc;n đau ốm cũng kh&ocirc;ng thể lao động nặng được.</p>

<p>Sớm l&agrave;m quen với cuộc sống tự lập, bản th&acirc;n Trang sức khỏe yếu nhưng đ&atilde; tự phải chăm s&oacute;c bản th&acirc;n v&agrave; phụ gi&uacute;p mẹ c&ocirc;ng việc gia đ&igrave;nh. Tuy ho&agrave;n cảnh thiếu thốn, nhưng Trang lu&ocirc;n phấn đấu để đạt kết quả tốt trong học tập. Bởi, trong suy nghĩ của em, học ch&iacute;nh l&agrave; c&aacute;ch để em phụ gi&uacute;p gia đ&igrave;nh tho&aacute;t cảnh ngh&egrave;o v&agrave; hơn hết ch&iacute;nh l&agrave; mơ ước cho một tương lai tươi s&aacute;ng hơn.</p>

<p><img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-210615104913-637593509531857833.jpg" style="height:340px; width:640px" /></p>

<p><em>Ho&agrave;n cảnh gia đ&igrave;nh ngh&egrave;o kh&oacute; của em rất đ&aacute;ng thương nhưng em lu&ocirc;n chăm ngoan, học giỏi</em></p>

<p><strong>Chung tay t&agrave;i trợ học bổng cho 2 em học sinh c&oacute; &yacute; ch&iacute; vượt kh&oacute; vươn l&ecirc;n trong học tập</strong></p>

<p>Với mong muốn tiếp th&ecirc;m nghị lực vượt l&ecirc;n số phận, gi&uacute;p c&aacute;c Huy v&agrave; Trang chuy&ecirc;n t&acirc;m học tập. V&iacute; MoMo phối hợp c&ugrave;ng Quỹ X&atilde; Hội Phan Anh k&ecirc;u gọi g&acirc;y quỹ - x&acirc;y quỹ học bổng trong chương tr&igrave;nh &ldquo;Cặp l&aacute; y&ecirc;u thương&rdquo; cho hai em với số tiền l&agrave; 48,000,000 đồng. Số tiền học bổng cho mỗi em học sinh l&agrave; 24,000,000/năm (24tr/năm) nhằm hỗ trợ t&agrave;i ch&iacute;nh v&agrave; t&igrave;nh th&acirc;n cho c&aacute;c em trong c&aacute;c năm học.&nbsp;</p>

<p>&nbsp;</p>

<p><img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-210615105009-637593510096849495.jpg" style="height:340px; width:640px" /></p>

<p><em>H&atilde;y c&ugrave;ng chung tay hỗ trợ học bổng gi&uacute;p 2 em vượt qua kh&oacute; khăn!</em></p>

<p>Ch&uacute;ng t&ocirc;i rất mong muốn nhận được sự t&agrave;i trợ quy&ecirc;n g&oacute;p của qu&yacute; nh&agrave; hảo t&acirc;m tới c&aacute;c em được xuy&ecirc;n suốt v&agrave; đầy đủ trong từng năm học. Chung tay thắp s&aacute;ng ước mơ tri thức cho c&aacute;c em ngay!</p>

<p><em>*Sau khi ho&agrave;n th&agrave;nh chiến dịch k&ecirc;u gọi quy&ecirc;n g&oacute;p, MoMo sẽ tiến h&agrave;nh gửi to&agrave;n bộ số tiền 48,000,000 đồng g&acirc;y quỹ gửi tới Quỹ X&atilde; hội Phan Anh để trao tặng học bổng cho 2 em. Ch&uacute;ng t&ocirc;i sẽ cập nhật th&ecirc;m th&ocirc;ng tin về tiến độ dự &aacute;n đến qu&yacute; vị trong thời gian sớm nhất.&nbsp; &nbsp;</em></p>

<table>
	<tbody>
		<tr>
			<td>
			<p><u><strong>Về Qũy X&atilde; Hội Phan Anh:&nbsp;</strong></u><br />
			Quỹ X&atilde; hội Phan Anh được h&igrave;nh th&agrave;nh từ nguồn t&agrave;i sản, t&agrave;i ch&iacute;nh đ&oacute;ng g&oacute;p ban đầu của c&aacute;c&nbsp;S&aacute;ng lập vi&ecirc;n v&agrave; tiếp nhận nguồn&nbsp;t&agrave;i trợ, hỗ trợ từ c&aacute;c tổ chức, c&aacute;c nh&agrave; hảo t&acirc;m trong nước v&agrave; quốc tế tự nguyện đ&oacute;ng g&oacute;p t&agrave;i sản, t&agrave;i ch&iacute;nh để thực hiện c&aacute;c hoạt động hỗ trợ theo t&ocirc;n chỉ mục đ&iacute;ch của Quỹ. Quỹ X&atilde; hội Phan Anh hoạt động kh&ocirc;ng v&igrave; lợi nhuận, nhằm hỗ trợ, khuyến kh&iacute;ch ph&aacute;t triển văn h&oacute;a gi&aacute;o dục, khoa học v&igrave; cộng đồng; Trước mắt tập trung hỗ trợ khuyến kh&iacute;ch ph&aacute;t triển văn h&oacute;a gi&aacute;o dục phục vụ x&atilde; hội.</p>
			</td>
		</tr>
	</tbody>
</table>
',
CAST('2021-09-08 00:00:00.000' AS DATETIME), 'completed', 100000000, 0),
(N'Xây dựng Quán trọ Vu Lan - Thay nhân gian báo hiếu các cụ già neo đơn', N'Quán trọ Vu Lan dành cho các cụ già neo đơn có nơi chăm sóc và an dưỡng tuổi xế chiều.', '/CKFinderJava/userfiles/images/momo-upload-api-210901142514-637661031148941918.jpg',
N'<h2>C&acirc;u chuyện</h2>

<p><strong>Những ng&agrave;y b&igrave;nh lặng c&ograve;n lại của c&aacute;c cụ gi&agrave; neo đơn trong m&aacute;i ấm</strong></p>

<p>&ldquo;C&oacute; c&aacute;ch n&agrave;o ra đi m&aacute;t mẻ hơn kh&ocirc;ng?&rdquo; - Đ&oacute; ch&iacute;nh l&agrave; c&acirc;u hỏi của những cụ gi&agrave; đang dần bước về đ&iacute;ch đến trong h&agrave;nh tr&igrave;nh l&agrave;m người. V&igrave; điều kiện cơ sở vật chất ở m&aacute;i ấm c&oacute; hạn, cho n&ecirc;n những cụ gi&agrave; đang khỏe mạnh v&agrave; đang ở giai đoạn yếu sức phải chung sống c&ugrave;ng nhau. Những hơi thở nặng nhọc, những tiếng r&ecirc;n rỉ, những giọt nước mắt của những cụ trước khi l&igrave;a xa ảnh hưởng đến những người ở lại. D&ugrave; c&aacute;c cụ kh&aacute;c c&ograve;n khỏe mạnh cũng phải tr&ugrave;ng l&ograve;ng, mất tinh thần theo.&nbsp;</p>

<p><img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-210901142603-637661031631060616.jpg" style="height:340px; width:640px" /><em>X&oacute;t thương trước ho&agrave;n cảnh khốn khổ của c&aacute;c cụ gi&agrave; neo đơn ở độ tuổi gần đất xa trời</em></p>

<p>B&ecirc;n cạnh đ&oacute;, c&aacute;c cụ kh&ocirc;ng c&ograve;n khả năng tự vệ sinh bản th&acirc;n đi tiểu, ti&ecirc;u tại chỗ. Hoặc c&oacute; cụ đ&atilde; bị liệt, phải nằm một chỗ trong m&ocirc;i trường n&oacute;ng nực, h&ocirc;i thối v&agrave; ruồi nhặng. Nh&acirc;n lực chăm s&oacute;c, vệ sinh chỗ ở m&aacute;i ấm kh&ocirc;ng đủ n&ecirc;n cũng kh&oacute; đ&aacute;nh bay m&ugrave;i đặc trưng n&agrave;y.&nbsp;</p>

<p><img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-210901142632-637661031925893615.jpg" style="height:340px; width:640px" /><em>C&aacute;c cụ cần lắm một m&ocirc;i trường sống m&aacute;t mẻ, sạch sẽ v&agrave; &ecirc;m ả hơn</em></p>

<p><strong>Chung tay g&acirc;y quỹ c&ugrave;ng&nbsp; Qũy Trăng Khuyết x&acirc;y dựng Qu&aacute;n trọ Vu Lan - Thay nh&acirc;n gian b&aacute;o hiếu c&aacute;c cụ gi&agrave; neo đơn</strong>&nbsp;</p>

<p>Qu&aacute;n trọ Vu Lan ch&iacute;nh l&agrave; dự &aacute;n x&acirc;y dựng trung t&acirc;m chăm s&oacute;c đặc biệt tại m&aacute;i ấm M&acirc;y Ng&agrave;n ở T&acirc;y Ninh. M&ugrave;a Vu Lan lu&ocirc;n nhắc nhở ch&uacute;ng ta kh&ocirc;ng chỉ b&aacute;o hiếu cho &ocirc;ng b&agrave;, cha mẹ m&agrave; c&ograve;n l&agrave;m thật nhiều điều thiện, gi&uacute;p &iacute;ch cho mọi người. Ri&ecirc;ng những người gi&agrave; trong qu&aacute;n trọ Vu Lan lại thiếu bao nhi&ecirc;u m&ugrave;a Vu Lan kh&ocirc;ng c&oacute; con c&aacute;i kề cận chăm s&oacute;c. Thậm ch&iacute; đến l&uacute;c rời xa c&otilde;i đời, c&aacute;c cụ vẫn đơn độc.</p>

<p><img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-210901142747-637661032672443696.jpg" style="height:340px; width:640px" /><em>Thay nh&acirc;n gian b&aacute;o hiếu c&aacute;c cụ gi&agrave; neo đơn bằng c&aacute;ch g&acirc;y quỹ x&acirc;y dựng Qu&aacute;n trọ Vu Lan&nbsp;</em></p>

<p>Dự &aacute;n Qu&aacute;n trọ Vu Lan với diện t&iacute;ch 60m2, c&oacute; sức chứa 12 giường, được chia l&agrave;m 2 khu ri&ecirc;ng biệt cho cụ &ocirc;ng v&agrave; cụ b&agrave;. Mỗi khu vực đều c&oacute; m&aacute;y lạnh, m&aacute;y quạt, ph&ograve;ng vệ sinh ri&ecirc;ng. Đặc biệt nhất ch&iacute;nh l&agrave; thiết kế giường đ&aacute; ph&ugrave; hợp với thể trạng v&agrave; t&igrave;nh h&igrave;nh sức khỏe của người gi&agrave;. Giường đ&aacute; c&oacute; họng nước bốc m&ugrave;i ngược, cho ph&eacute;p việc vệ sinh, tắm rửa tại chỗ cho c&aacute;c cụ. Sau khi tắm xong, chỉ cần trải chiếu, nệm th&igrave; c&aacute;c cụ c&oacute; thể sử dụng như giường ngủ b&igrave;nh thường. Giường được l&oacute;t lớp đ&aacute; m&aacute;t lạnh gi&uacute;p lưng m&aacute;t mẻ tr&aacute;nh hầm b&iacute; lở lo&eacute;t, &iacute;t nhiễm tr&ugrave;ng.</p>

<p><strong>Một v&agrave;i h&igrave;nh ảnh bản vẽ thiết kế dự kiến của Qu&aacute;n Trọ Vu Lan:</strong></p>

<p><img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-210901142825-637661033052371533.jpg" style="height:340px; width:640px" /></p>

<p><img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-210901142852-637661033326398638.jpg" style="height:340px; width:640px" /></p>

<p><img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-210901142915-637661033555410389.jpg" style="height:340px; width:640px" /></p>

<p><img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-210901142938-637661033783622002.jpg" style="height:340px; width:640px" /><em>Bản thiết kế của qu&aacute;n trọ Vu Lan</em></p>

<p>Để thực hiện t&acirc;m nguyện cuối c&ugrave;ng trong đời của c&aacute;c cụ, Heo Đất MoMo hợp t&aacute;c c&ugrave;ng Quỹ Từ Thiện &amp; BTXH Trăng Khuyết c&ugrave;ng chung tay xin l&agrave;m cầu nối bắc hai nhịp y&ecirc;u thương đem tấm l&ograve;ng của c&aacute;c nh&agrave; hảo t&acirc;m x&acirc;y l&ecirc;n Qu&aacute;n trọ Vu Lan. Ch&uacute;ng ta c&ugrave;ng cố gắng tạo n&ecirc;n một điều l&agrave;nh cho c&aacute;c cụ v&agrave; cho ch&iacute;nh bản th&acirc;n m&igrave;nh.</p>

<p>Để l&agrave;m được điều n&agrave;y, ch&uacute;ng t&ocirc;i hy vọng sẽ g&acirc;y quỹ cộng đồng 120,000,000 VNĐ th&ocirc;ng qua Tr&aacute;i Tim MoMo. C&ugrave;ng với 362,000,000 đồng được&nbsp;quy đổi từ chiến dịch của Heo Đất MoMo. Tổng gi&aacute; trị dự &aacute;n lần n&agrave;y dự kiến sẽ đạt 482,000,000 đồng, v&agrave;&nbsp;sẽ được d&ugrave;ng cho&nbsp;chi ph&iacute; x&acirc;y dựng cơ bản, mua sắm vật dụng v&agrave; vận h&agrave;nh.</p>

<p>H&atilde;y trở th&agrave;nh người đồng h&agrave;nh c&ugrave;ng Quỹ Trăng Khuyết v&agrave; Heo Đất MoMo g&acirc;y quỹ để x&acirc;y dựng một Qu&aacute;n trọ Vu Lan d&agrave;nh cho những cụ gi&agrave; tại m&aacute;i ấm M&acirc;y Ng&agrave;n. Một h&agrave;nh động &yacute; nghĩa nh&acirc;n đ&ocirc;i v&agrave; đặc biệt trong th&aacute;ng 7 &acirc;m lịch n&agrave;y. Bất kể số tiền n&agrave;o đều l&agrave; đ&aacute;ng qu&yacute;, bất cứ đ&oacute;ng g&oacute;p n&agrave;o cũng đều l&agrave; đ&aacute;ng tr&acirc;n trọng v&agrave; g&oacute;p phần mang lại hạnh ph&uacute;c cho người nhận lẫn người cho.</p>

<p><em>*Sau khi ho&agrave;n th&agrave;nh chiến dịch k&ecirc;u gọi quy&ecirc;n g&oacute;p, MoMo sẽ tiến h&agrave;nh gửi to&agrave;n bộ số tiền 120 triệu đồng g&acirc;y quỹ tới Quỹ Trăng khuyết triển khai dự &aacute;n. Ch&uacute;ng t&ocirc;i sẽ cập nhật th&ecirc;m th&ocirc;ng tin về tiến độ dự &aacute;n đến qu&yacute; vị trong thời gian sớm nhất.&nbsp;&nbsp;</em></p>

<table border="1" cellpadding="5" cellspacing="0">
	<tbody>
		<tr>
			<td>
			<p><u><strong>Về Quỹ Từ Thiện &amp; BTXH Trăng Khuyết:</strong></u><br />
			Trăng Khuyết l&agrave; một tổ chức từ thiện về nh&acirc;n đạo v&agrave; sự sống, nhằm kết nối cộng đồng v&agrave; thực hiện c&aacute;c hoạt động trợ gi&uacute;p trực tiếp cho c&aacute;c cụ gi&agrave; kh&ocirc;ng nơi nương tựa v&agrave; trẻ em bị bỏ rơi. Th&ocirc;ng qua c&aacute;c hoạt động: cứu trợ khẩn cấp, cung cấp bữa ăn, chỗ ở v&agrave; cải thiện cuộc sống. Ch&uacute;ng t&ocirc;i hoạt động độc lập, phi t&ocirc;n gi&aacute;o v&agrave; phi lợi nhuận tr&ecirc;n to&agrave;n l&atilde;nh thổ Việt Nam. Th&ocirc;ng qua ph&aacute;p nh&acirc;n l&agrave; Quỹ Từ Thiện &amp; BTXH Trăng Khuyết, một doanh nghiệp x&atilde; hội, hoạt động 100% v&igrave; cộng đồng.</p>
			</td>
		</tr>
	</tbody>
</table>
',
CAST('2021-09-08 00:00:00.000' AS DATETIME), 'completed', 500000000, 0),
(N'Xây dựng mới ngôi trường 20 tuổi tặng 110 em học sinh thôn Giàng Sì Tủng', N'Ngôi trường cho các em học sinh thôn Giàng Sì Tủng để các em có nơi học tập khang trang, chuyên tâm học hành',
'/CKFinderJava/userfiles/images/momo-upload-api-210817104512-637647939120915782.jpg',
N'<h2>C&acirc;u chuyện</h2>

<p><strong>X&oacute;t xa lớp học đắp bằng đất của c&aacute;c em học sinh th&ocirc;n Gi&agrave;ng S&igrave; Tủng</strong><br />
<br />
&ldquo;Em ơi! Lớp học của c&aacute;c con xuống cấp qu&aacute;, tường đất nứt nhiều lắm c&ograve;n c&aacute;c cột nh&agrave; cũng mối mọt lung lay, bọn chị sợ sập mất&rdquo; - C&ocirc; hiệu trưởng n&oacute;i vội v&agrave;ng trong cuộc điện thoại trao đổi với ch&uacute;ng t&ocirc;i về điểm trường Gi&agrave;ng S&igrave; Tủng. Ng&ocirc;i trường nằm cheo leo tại xã Thài Phìn Tủng, huyện Đồng Văn, tỉnh Hà Giang. Nơi đ&acirc;y c&oacute; hơn 100 hộ d&acirc;n người M&ocirc;ng, chủ yếu dựa v&agrave;o việc l&agrave;m nương kiếm sống n&ecirc;n d&acirc;n tr&iacute; c&ograve;n thấp, c&oacute; đến 96% hộ d&acirc;n thuộc hộ ngh&egrave;o v&agrave; cận ngh&egrave;o.&nbsp;</p>

<p><img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-210817103025-637647930252203011.jpg" style="height:340px; width:640px" /><em>Điểm trường Gi&agrave;ng S&igrave; Tủng tại xã Thài Phìn Tủng, huyện Đồng Văn, tỉnh Hà Giang</em></p>

<p>Điểm trường được ch&iacute;nh quyền v&agrave; người d&acirc;n g&oacute;p c&ocirc;ng d&acirc;n dựng hơn 20 năm nay. Nh&agrave; lớp học được l&agrave;m bằng loại nh&agrave; tr&igrave;nh tường bằng đất nhưng nay đ&atilde; xuống cấp nghi&ecirc;m trọng. Dẫu vậy, điểm trường ng&agrave;y ng&agrave;y vẫn vang tiếng l&iacute;u lo của 110 học sinh gồm 05 lớp từ lớp 1 đến lớp 2 bi b&ocirc; học h&aacute;t, học n&oacute;i mỗi ng&agrave;y.&nbsp;</p>

<p><img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-210817103054-637647930547426433.jpg" style="height:340px; width:640px" /><em>Tường của lớp học đ&atilde; nứt v&otilde; rất nhiều</em></p>

<p>C&aacute;c lớp học đ&atilde; xuống cấp nặng nề, tường nứt nẻ, ẩm thấp, c&aacute;c cột nh&agrave; mối mọt, c&oacute; cột mối ăn gần hết ph&iacute;a ch&acirc;n. Cửa lớp cũng lung lay như sắp rời ra. M&aacute;i proximang chỗ vỡ chỗ l&agrave;nh, chỗ n&agrave;o vỡ nh&agrave; trường chỉ c&ograve;n biết gia cố bằng tấm nhựa trong th&agrave;nh &ocirc; lấy s&aacute;ng cho c&aacute;c ch&aacute;u ngồi học. M&atilde;i rồi cả phần m&aacute;i cũng chi ch&iacute;t những &ocirc; lấy s&aacute;ng to nhỏ. Cứ hễ mưa xuống l&agrave; ướt nhẹp hết cả, thầy tr&ograve; khổ v&ocirc; c&ugrave;ng.</p>

<p><img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-210817103114-637647930742974835.jpg" style="height:340px; width:640px" /><em>M&aacute;i nh&agrave; đ&atilde; thủng, vỡ tan t&agrave;nh n&ecirc;n trời mua l&agrave; thầy tr&ograve; ướt nhẹp; c&ograve;n nền nh&agrave; ẩm thấp</em></p>

<p><strong>Chung tay g&acirc;y quỹ dựng mới ng&ocirc;i trường 20 tuổi tặng 110 em học sinh th&ocirc;n Gi&agrave;ng S&igrave; Tủng</strong></p>

<p>Mơ ước c&oacute; được 1 lớp học tho&aacute;ng m&aacute;t v&agrave;o m&agrave;u h&egrave; v&agrave; kh&ocirc;ng c&ograve;n bị ướt mỗi khi trời mưa l&agrave; điều m&agrave; c&ocirc; tr&ograve; điểm trường Gi&agrave;ng S&igrave; Tủng đ&atilde; ấp ủ suốt 20 năm qua nhưng chưa thực hiện được. Ngh&egrave;o, đ&oacute;i v&agrave; khổ đến tận c&ugrave;ng nhưng với người th&ocirc;n kh&ocirc;ng ngăn được bước ch&acirc;n họ c&otilde;ng con đến trường d&ugrave; trời mưa, hay trời nắng.&nbsp;</p>

<p><img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-210817103150-637647931107125695.jpg" style="height:340px; width:640px" /><em>C&aacute;c em học sinh v&agrave; thầy c&ocirc; nơi đ&acirc;y rất cần một điểm trường khang trang, ki&ecirc;n cố</em></p>

<p>Thấu hiểu mong muốn của thầy tr&ograve; nơi đ&acirc;y, V&iacute; MoMo phối hợp c&ugrave;ng Trung t&acirc;m T&igrave;nh nguyện Quốc gia, dự &aacute;n Sức Mạnh 2000 v&agrave; Quỹ hỗ trợ bảo vệ sức khỏe cộng đồng (Hopecom) l&ecirc;n kế hoạch x&acirc;y dựng 01 ph&ograve;ng học ki&ecirc;n cố, 01 nh&agrave; c&ocirc;ng vụ v&agrave; 01 nh&agrave; vệ sinh cho thầy tr&ograve; nơi đ&acirc;y.</p>

<p>Tổng kinh ph&iacute; dự kiến cho dự &aacute;n x&acirc;y trường l&agrave; 280.000.000 đồng. Hiện nay, Quỹ hỗ trợ bảo vệ sức khỏe cộng đồng (Hopecom) đ&atilde; cam kết t&agrave;i trợ 50.000.000 đồng cho dự &aacute;n. Ch&uacute;ng t&ocirc;i mong muốn c&oacute; thể g&acirc;y quỹ th&ecirc;m 230.000.000 đồng tr&ecirc;n Tr&aacute;i tim Momo để m&aacute;i trường mới sớm được khởi c&ocirc;ng x&acirc;y dựng.</p>

<p><img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-210817103226-637647931465691448.jpg" style="height:340px; width:640px" /><em>H&atilde;y chung tay g&acirc;y quỹ để đem lại ng&ocirc;i trường mới cho c&aacute;c em học sinh th&ocirc;n Gi&agrave;ng S&igrave; Tủng</em></p>

<p>Biết bao b&agrave;n ch&acirc;n đ&atilde; rớm m&aacute;u tr&ecirc;n đường xa v&agrave; biết bao nhi&ecirc;u giọt mồ h&ocirc;i đ&atilde; đổ d&ugrave; l&agrave; giữa m&ugrave;a đ&ocirc;ng&hellip; nhưng gương thầy tr&ograve; Gi&agrave;ng S&igrave; Tủng vẫn lấp l&aacute;nh niềm vui khi nghe xa xa tiếng trống trường gọi, v&agrave; trong &aacute;nh mắt ấy, họ vẫn đang ấp ủ v&agrave; mơ ước về 1 ng&agrave;y kh&ocirc;ng xa trường lớp sẽ khang trang, sạch đẹp v&agrave; chắc chắn hơn giờ. H&atilde;y chung tay ngay gi&uacute;p thầy tr&ograve; c&oacute; một m&aacute;i trường ki&ecirc;n cố, y&ecirc;n tập học h&agrave;nh</p>

<p><em>*Sau khi ho&agrave;n th&agrave;nh chiến dịch k&ecirc;u gọi quy&ecirc;n g&oacute;p, MoMo sẽ tiến h&agrave;nh gửi to&agrave;n bộ số tiền 230 triệu đồng g&acirc;y quỹ tới Trung t&acirc;m T&igrave;nh nguyện Quốc gia để triển khai kế hoạch. Ch&uacute;ng t&ocirc;i sẽ cập nhật th&ecirc;m th&ocirc;ng tin về tiến độ dự &aacute;n đến qu&yacute; vị trong thời gian sớm nhất.&nbsp;&nbsp;</em></p>

<table border="1" cellpadding="5" cellspacing="0">
	<tbody>
		<tr>
			<td>
			<p><u><strong>Về Trung t&acirc;m T&igrave;nh nguyện Quốc gia:</strong></u><br />
			Trung t&acirc;m T&igrave;nh nguyện Quốc gia (VVC) do TW Đo&agrave;n TNCS Hồ Ch&iacute; Minh th&agrave;nh lập, l&agrave; tổ chức cấp Quốc gia nhằm mục ti&ecirc;u th&uacute;c đẩy, hỗ trợ v&agrave; điều phối hoạt động t&igrave;nh nguyện v&igrave; sự ph&aacute;t triển ở Việt Nam. VVC Cung cấp đầy đủ th&ocirc;ng tin về mọi hoạt động t&igrave;nh nguyện, tập huấn, hội thảo, hội nghị, diễn đ&agrave;n thanh ni&ecirc;n về c&aacute;c vấn đề x&atilde; hội trong nước v&agrave; quốc tế. L&agrave; cầu nối giữa những tổ chức x&atilde; hội v&agrave; những người đam m&ecirc; t&igrave;nh nguyện.&nbsp;</p>

			<p><u><strong>Về dự &aacute;n Sức mạnh 2000 - &Aacute;nh S&aacute;ng N&uacute;i Rừng:</strong></u><br />
			L&agrave; một dự &aacute;n g&acirc;y quỹ x&acirc;y trường được khởi xướng v&agrave; điều h&agrave;nh bởi anh Ho&agrave;ng Hoa Trung - Forbes 30 Under 30 2020, Gương mặt trẻ Việt Nam Ti&ecirc;u biểu 2019. T&iacute;nh tới th&aacute;ng 2/2021, dự &aacute;n đ&atilde; x&acirc;y dựng th&agrave;nh c&ocirc;ng gần 130 điểm trường, nh&agrave; nội tr&uacute;, nh&agrave; hạnh ph&uacute;c, cầu d&acirc;n sinh ở c&aacute;c tỉnh v&ugrave;ng cao, gi&uacute;p hơn 7000 trẻ em được đến trường. T&igrave;m hiểu về dự &aacute;n th&ecirc;m tại:&nbsp;http://sucmanh2000.com</p>
			</td>
		</tr>
	</tbody>
</table>', 
CAST('2021-09-08 00:00:00.000' AS DATETIME), 'inprogress', 200000000, 0),
(N'Cùng Tuổi Trẻ trao tặng học bổng “Tiếp sức đến trường” cho tân sinh viên khó khăn', N'Học bổng có trị giá 15 triệu đồng cho suất đặc biệt, 10 triệu đồng suất chung được báo Tuổi Trẻ trao hàng năm cho tân sinh viên có hoàn cảnh khó khăn đậu Đại học – Cao đẳng.', 
'/CKFinderJava/userfiles/images/momo-upload-api-210521142813-637572040930102140.jpg',
N'<h2>C&acirc;u chuyện</h2>

<p><strong>C&agrave;ng kh&oacute; mới c&agrave;ng &yacute; nghĩa</strong></p>

<p>Dưới c&aacute;i nắng ch&oacute;i chang, Đặng Đức Ba (18 tuổi, x&atilde; B&igrave;nh Ch&aacute;nh, huyện Thăng B&igrave;nh) c&ugrave;ng người d&igrave; lom khom thu hoạch sắn ở c&aacute;nh đồng trước nh&agrave;.&nbsp;<em>&quot;Ba em mất sớm. Mẹ bị lao m&agrave;ng n&atilde;o nằm ở bệnh viện đa khoa Đ&agrave; Nẵng chữa trị mấy th&aacute;ng nay, chưa về nh&agrave;. D&igrave; bị tật nguyền n&ecirc;n mọi c&ocirc;ng việc nh&agrave;, ruộng vườn em phải l&agrave;m hết&quot;</em>, Ba quệt mồ h&ocirc;i, n&oacute;i.</p>

<p>12 năm liền Ba l&agrave; học sinh giỏi. Ba năm cấp ba em đều dẫn đầu lớp, điểm trung b&igrave;nh năm lớp 12 l&agrave; 9,1, dẫn đầu khối 12 to&agrave;n trường. Say kỳ thi đại học, Ba đạt tổng điểm 27,7, em đăng k&yacute; x&eacute;t tuyển v&agrave;o ng&agrave;nh Khoa học m&aacute;y t&iacute;nh trường ĐH B&aacute;ch khoa - Đại học quốc gia TP. HCM. Nhận được kết quả, Ba cứ ph&acirc;n v&acirc;n dừng lại hay bước tiếp. Đến giờ, gia đ&igrave;nh đ&atilde; phải chạy vạy lo tiền điều trị cho mẹ, giờ lấy tiền đ&acirc;u cho em nhập học, trang trải cuộc sống xa qu&ecirc;.</p>

<p><img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-210521143013-637572042138563362.jpg" style="height:340px; width:640px" /></p>

<p><em>Đặng Đức Ba (18 tuổi, x&atilde; B&igrave;nh Ch&aacute;nh, huyện Thăng B&igrave;nh) bỏ ngỏ ước mơ đại học v&igrave; nh&agrave; ngh&egrave;o</em></p>

<p><em>&quot;Cả ng&agrave;y h&ocirc;m nay hai mẹ con dệt được hai tấm chiếu, mỗi tấm thương l&aacute;i v&ocirc; tận nh&agrave; mua từ 30.000 - 35.000 đồng. Nếu ng&agrave;y n&agrave;o l&agrave;m năng suất, hai mẹ con cũng kiếm được hơn 100.000 đồng&quot;</em>, Ch&iacute;nh &quot;c&oacute;i&quot; kể về c&ocirc;ng việc m&agrave; mấy h&ocirc;m nay cậu đang t&iacute;ch cực l&agrave;m trước khi v&ocirc; đại học.</p>

<p>Ch&iacute;nh đ&atilde; đi học trong ngh&egrave;o kh&oacute; v&agrave; đạt điểm thi cao ch&oacute;t v&oacute;t bằng nghị lực hơn người. Nhận được giấy b&aacute;o tr&uacute;ng tuyển, cậu mừng lắm, nhưng chỉ d&aacute;m cất đi, ng&agrave;y ng&agrave;y tỉ mỉ dệt chiếu, neo nghề cũ của tổ ti&ecirc;n để d&agrave;nh tiền đi đại học.</p>

<p>Thấu hiểu sự kh&oacute; khăn của c&aacute;c bạn t&acirc;n sinh vi&ecirc;n ngh&egrave;o, hy vọng chắp c&aacute;nh cho c&aacute;c bạn được tiếp tục con đường tri thức, b&aacute;o Tuổi Trẻ đ&atilde; s&aacute;ng lập quỹ học bổng &ldquo;Tiếp sức đến trường&rdquo; bổng&nbsp;thuộc chương tr&igrave;nh &ldquo;V&igrave; ng&agrave;y mai ph&aacute;t triển&rdquo; v&agrave;o năm 2013. C&aacute;c suất học bổng sẽ được trao tặng c&aacute;c bạn t&acirc;n sinh vi&ecirc;n c&oacute; ho&agrave;n cảnh đặc biệt, c&oacute; trị gi&aacute; 15&nbsp;triệu đồng cho suất đặc biệt, v&agrave; 10 triệu đồng cho c&aacute;c học bổng c&ograve;n lại. Trải qua gần 8 năm hoạt động, quỹ học bổng &ldquo;Tiếp sức đến trường&rdquo; đ&atilde; hỗ trợ kinh ph&iacute; cho hơn 100 bạn mỗi năm được đi học Đại học, g&oacute;p phần đ&agrave;o tạo nh&acirc;n t&agrave;i cho đất nước.</p>

<p><img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-210521143110-637572042703025616.jpg" style="height:340px; width:640px" /></p>

<p><em>C&aacute;c bạn t&acirc;n sinh vi&ecirc;n miền Nam Trung Bộ được b&aacute;o Tuổi Trẻ trao tặng học bổng</em></p>

<p><strong>Học bổng &ldquo;Tiếp sức đến trường&rdquo; - Kh&ocirc;ng thể dừng lại</strong><br />
<br />
Mỗi t&acirc;n sinh vi&ecirc;n đến với học bổng &ldquo;Tiếp sức đến trường&rdquo; đều l&agrave; những c&acirc;u chuyện cảm động về l&ograve;ng hiếu thảo, nghị lực vượt kh&oacute;, niềm đam m&ecirc; học tập, kh&aacute;t khao được bước v&agrave;o giảng đường cao đẳng, đại học c&ugrave;ng với biết bao nỗi niềm trăn trở, lo &acirc;u khi cầm giấy b&aacute;o tr&uacute;ng tuyển trong tay.</p>

<p>Trong chiến dịch g&acirc;y quỹ lần n&agrave;y, V&iacute; MoMo đ&atilde; phối hợp c&ugrave;ng b&aacute;o Tuổi Trẻ g&acirc;y quỹ 200,000,000 x&acirc;y dựng học bổng &ldquo;Tiếp sức đến trường&rdquo; nhằm duy tr&igrave; trong thời gian tới v&agrave; tiếp tục trao đi những suất học bổng &yacute; nghĩa tới c&aacute;c bạn sinh vi&ecirc;n vượt kh&oacute;, những mảnh tương lai tươi s&aacute;ng của đất nước.&nbsp;</p>

<p>Ch&uacute;ng t&ocirc;i tin rằng, học bổng n&agrave;y sẽ gi&uacute;p c&aacute;c bạn ấy vượt qua gian nan, hướng về tương lai, chinh phục c&aacute;nh cổng Đại học. Để thực hiện được điều n&agrave;y, V&iacute; MoMo rất cần sự chung tay của c&aacute;c nh&agrave; hảo t&acirc;m hỗ trợ, mọi sự đ&oacute;ng g&oacute;p của c&aacute;c bạn sẽ gi&uacute;p c&aacute;c t&acirc;n sinh vi&ecirc;n kh&ocirc;ng phải từ bỏ con chữ, từ bỏ giấc mộng đổi đời bằng sự học v&igrave; c&aacute;i ngh&egrave;o!</p>',
CAST('2021-09-08 00:00:00.000' AS DATETIME), 'inprogress', 150000000, 0),
(N'Xây dựng “Quỹ Chia Sẻ” - Sẵn sàng đối mặt với thử thách', N'Sau sự xuất hiện bất ngờ và khó đoán của đại dịch Covid-19, trận lũ lụt miền Trung, chúng ta cần phải cùng nhau xây dựng “Quỹ chia sẻ” để cứu trợ kịp thời cho bà con vùng khó khăn trong tương lai. Chung tay giúp đỡ ngay!',
'/CKFinderJava/userfiles/files/momo-upload-api-210521150000-637572060002341240.jpg',
N'<h2>C&acirc;u chuyện</h2>

<p>Năm 2020 l&agrave; một năm kh&ocirc;ng thể n&agrave;o qu&ecirc;n được với sự xuất hiện của đại dịch Covid-19 v&agrave; trận lũ lụt kinh ho&agrave;ng tại miền Trung. Tất cả đến qu&aacute; bất ngờ, khiến cuộc sống của mọi người bị đảo lộn ho&agrave;n to&agrave;n, người d&acirc;n kh&ocirc;ng thể lao động, kiếm ra thu nhập v&igrave; phải c&aacute;ch ly x&atilde; hội hay ảnh hưởng của thi&ecirc;n tai. Trước những t&igrave;nh h&igrave;nh nguy cấp tr&ecirc;n, b&aacute;o Tuổi Trẻ đ&atilde; k&ecirc;u gọi cộng đồng x&acirc;y dựng &ldquo;Quỹ chia sẻ&rdquo; hỗ trợ b&agrave; con kh&oacute; khăn.</p>

<p><strong>Hỗ trợ &ldquo;khẩn cấp&rdquo; d&acirc;n v&ugrave;ng &ldquo;rốn&rdquo; lũ Đại Cường</strong></p>

<p>Sau đợt mưa lũ g&acirc;y thiệt hại nặng nề tại miền Trung, b&aacute;o Tuổi Trẻ đ&atilde; trao 100 suất qu&agrave;, mỗi suất trị gi&aacute; 300.000 đồng (bao gồm gạo, m&igrave; t&ocirc;m, nước đ&oacute;ng chai) từ bạn đọc b&aacute;o hỗ trợ cho 100 hộ d&acirc;n bị thiệt hại nặng nề do lũ tại x&atilde; Đại Cường, huyện Đại Lộc. Những suất qu&agrave; n&agrave;y tuy kh&ocirc;ng lớn về mặt vật chất, tuy nhi&ecirc;n đ&atilde; động vi&ecirc;n, chia sẻ phần n&agrave;o những kh&oacute; khăn, mất m&aacute;t của người d&acirc;n v&ugrave;ng rốn lũ.</p>

<p><img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-210521150047-637572060477776206.jpg" style="height:340px; width:640px" /><br />
<br />
<em>Người d&acirc;n x&atilde; Đại Cường nhận qu&agrave;</em></p>

<p><strong>Hỗ trợ khẩn cấp cho b&agrave; con Vĩnh Linh sau cơn b&atilde;o số 10</strong></p>

<p>Huyện Vĩnh Linh, địa phương bị ảnh hưởng nặng nhất bởi cơn b&atilde;o số 10 của tỉnh Quảng Trị, b&aacute;o Tuổi Trẻ đ&atilde; hỗ trợ khẩn cấp hơn 100 triệu đồng, tặng qu&agrave; cứu trợ khẩn cấp cho c&aacute;c gia đ&igrave;nh bị thiệt hại. Số qu&agrave; gồm 50 triệu đồng tiền mặt cho 50 hộ gia đ&igrave;nh (mỗi hộ 1 triệu đồng) ở c&aacute;c x&atilde; Vĩnh Thạch, Vĩnh Hiền, Vĩnh Th&agrave;nh v&agrave; Vĩnh Thụy kịp thời mua t&ocirc;n để lợp lại m&aacute;i nh&agrave; bị tốc trong trận b&atilde;o.</p>

<p><img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-210521150131-637572060919288729.jpg" style="height:340px; width:640px" /></p>

<p><em>B&aacute;o Tuổi Trẻ tại Huế trao tiền v&agrave; qu&agrave; cho c&aacute;c gia đ&igrave;nh bị thiệt hại do b&atilde;o số 10 g&acirc;y ra tại x&atilde; Vĩnh Thủy</em></p>

<p><strong>Chung tay x&acirc;y dựng &ldquo;Quỹ chia sẻ&rdquo; để đảm bảo tương lai</strong></p>

<p>Hiện tại, c&aacute;c &ldquo;Quỹ chia sẻ&rdquo; cũng kh&ocirc;ng c&ograve;n đủ nguồn lực đương đầu với những t&igrave;nh huống bất ngờ, nguy cấp nữa, người d&acirc;n v&ugrave;ng kh&oacute; khăn sẽ kh&oacute; m&agrave; vượt qua những ảnh hưởng nặng nề ấy.&nbsp;</p>

<p>Để &ldquo;Quỹ chia sẻ&rdquo; lu&ocirc;n được duy tr&igrave;, dự trữ đủ, kịp thời cứu gi&uacute;p b&agrave; con trong thời gian sớm nhất, B&aacute;o Tuổi Trẻ đ&atilde; phối hợp c&ugrave;ng V&iacute; MoMo k&ecirc;u gọi quy&ecirc;n g&oacute;p 500,000,000 VNĐ x&acirc;y dựng quỹ. Số tiền n&agrave;y sẽ được phục vụ cho c&aacute;c hoạt động cứu trợ b&agrave; con bị ảnh hưởng thi&ecirc;n tai, hỗ trợ c&aacute;c nh&agrave; ở m&aacute;i ấm, x&acirc;y cầu b&ecirc; t&ocirc;ng, nh&agrave; t&igrave;nh nghĩa t&igrave;nh thương, hỗ trợ người tốt việc tốt&hellip;</p>

<p>V&iacute; MoMo rất mong nhận được sự quan t&acirc;m của c&ocirc;ng đồng, chung tay đ&oacute;ng g&oacute;p v&agrave;o &ldquo;Qũy chia sẻ&rdquo;, gi&uacute;p người d&acirc;n Việt Nam được đảm bảo sự hỗ trợ khẩn cấp trong tương lai.</p>',
CAST('2021-09-08 00:00:00.000' AS DATETIME), 'inprogress', 150000000, 0)
GO

