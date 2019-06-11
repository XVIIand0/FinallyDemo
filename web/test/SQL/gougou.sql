DROP DATABASE IF EXISTS `gougou`;
CREATE DATABASE `gougou` CHARACTER SET utf8;
USE `gougou`;

DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`
	(
		m_id int NOT NULL auto_increment,
        m_ac VARCHAR(8) NOT NULL,
		m_pw VARCHAR(16) NOT NULL,
        m_name VARCHAR(30) NOT NULL,
		m_mail VARCHAR(30),
		m_phone VARCHAR(10),
        m_ad VARCHAR(50),
		m_photo VARCHAR(50),
        m_level VARCHAR(255),
        m_st int,
        m_stnumb VARCHAR(255),
		PRIMARY KEY (m_id)
	);
INSERT INTO `member` (`m_id`,`m_ac`,`m_pw`,`m_name`,`m_mail`,`m_phone`,`m_photo`,`m_level`) VALUES (1,'ayen','1234','yeniscute','tracy87601@gmail.com','0912',NULL,'0');
INSERT INTO `member` (`m_id`,`m_ac`,`m_pw`,`m_name`,`m_mail`,`m_phone`,`m_photo`,`m_level`) VALUES (2,'vicky','000','vicky',NULL,NULL,NULL,'1');
   

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`
	(
		o_id int NOT NULL auto_increment,
        m_name VARCHAR(45) NOT NULL,
		m_phone VARCHAR(45) NOT NULL,
        m_ad VARCHAR(60) NOT NULL,
		o_content VARCHAR(60),
		rdate datetime,
        bought VARCHAR(45),
		deal VARCHAR(45),
        sent timestamp,
		PRIMARY KEY (o_id)
	);
    
    
DROP TABLE IF EXISTS `goods`; 
 CREATE TABLE `goods` 
	(
		g_id int NOT NULL auto_increment,
		g_type VARCHAR(10) NOT NULL,
		g_place VARCHAR(10) NOT NULL,
        g_price int,
        g_sales int,
        g_tag VARCHAR(50),
		g_storage int NOT NULL,
		g_photo VARCHAR(50),
		g_like VARCHAR(50),
        g_eff VARCHAR(100),
        g_farm VARCHAR(50),
		PRIMARY KEY (g_id)
	);
INSERT INTO `goods` (`g_id`,`g_type`,`g_place`,`g_price`,`g_sales`,`g_tag`,`g_storage`,`g_photo`,`g_like`,`g_eff`,`g_farm`) VALUES (1,'阿囉哈~海洋風情菇','南方熱帶夏威夷島',199,1,'魔力',40,'good/1.png','長相如同夏威夷的椰子樹，葉大根粗','讓人心曠神怡、活潑開朗，大喊「阿囉哈!!」','從大王椰子樹掉下的葉片，落地之後長成');
INSERT INTO `goods` (`g_id`,`g_type`,`g_place`,`g_price`,`g_sales`,`g_tag`,`g_storage`,`g_photo`,`g_like`,`g_eff`,`g_farm`) VALUES (2,'生雞蛋菇菇','老王母雞場',199,1,'養生',16,'good/2.png','外觀如荷包蛋，營養美味','養顏美容、富含膠原蛋白，使肌膚光滑透亮','由母雞孵蛋時的母愛灌溉自然生成');
INSERT INTO `goods` (`g_id`,`g_type`,`g_place`,`g_price`,`g_sales`,`g_tag`,`g_storage`,`g_photo`,`g_like`,`g_eff`,`g_farm`) VALUES (3,'年少無知帽子菇菇','雙葉幼稚園',199,1,'魔力',21,'good/3.png','頭頂頂著幼稚園帽帽，觸碰時會有「咿呀~」的聲音','瞬間返老還童，且保留原本心智','每個雙葉幼稚園小朋友的園藝課精心栽種而成');
INSERT INTO `goods` (`g_id`,`g_type`,`g_place`,`g_price`,`g_sales`,`g_tag`,`g_storage`,`g_photo`,`g_like`,`g_eff`,`g_farm`) VALUES (4,'有益健康菇','心理作用',199,1,'務實',12,'good/4.png','茄子的配色看起來就很健康','吃的時候會覺得很健康','Seafood信眾凝集的信仰之力');
INSERT INTO `goods` (`g_id`,`g_type`,`g_place`,`g_price`,`g_sales`,`g_tag`,`g_storage`,`g_photo`,`g_like`,`g_eff`,`g_farm`) VALUES (5,'花邊教主菇','VOGUE雜誌扉頁',199,1,'魔力',19,'good/5.png','兩層的蕾絲邊，帶著點點圓帽','77 49天後變成時尚教主','聚光燈的強力照射下');
INSERT INTO `goods` (`g_id`,`g_type`,`g_place`,`g_price`,`g_sales`,`g_tag`,`g_storage`,`g_photo`,`g_like`,`g_eff`,`g_farm`) VALUES (6,'金針菇菇','花蓮六十石山',199,1,'務實',12,'good/6.png','一般的金針菇','填飽肚子','好山好水的陶冶');
INSERT INTO `goods` (`g_id`,`g_type`,`g_place`,`g_price`,`g_sales`,`g_tag`,`g_storage`,`g_photo`,`g_like`,`g_eff`,`g_farm`) VALUES (7,'益生菌','養樂多的培養皿',199,1,'養生',50,'good/7.png','像便當會附的養樂多','促進腸胃蠕動、排便順暢','經過低溫發酵法所栽培出來的');
INSERT INTO `goods` (`g_id`,`g_type`,`g_place`,`g_price`,`g_sales`,`g_tag`,`g_storage`,`g_photo`,`g_like`,`g_eff`,`g_farm`) VALUES (8,'神奇海參菇','深海的大鳳梨',199,1,'魔力',33,'good/8.png','像海參','變成軟體動物','海綿寶寶的笑聲');
INSERT INTO `goods` (`g_id`,`g_type`,`g_place`,`g_price`,`g_sales`,`g_tag`,`g_storage`,`g_photo`,`g_like`,`g_eff`,`g_farm`) VALUES (9,'神奇魔力菇','MAGIC',199,1,'魔力',42,'good/9.png','全身如神秘魔法般的藍紫色','搓一搓就有精靈跑出來','經由偉大的魔法師梅林所提煉');
INSERT INTO `goods` (`g_id`,`g_type`,`g_place`,`g_price`,`g_sales`,`g_tag`,`g_storage`,`g_photo`,`g_like`,`g_eff`,`g_farm`) VALUES (10,'粉色圓點點菇','青春少女的幻想',199,1,'魔力',23,'good/10.png','粉嫩透亮，帶有少女的香氣','回憶起少女時期的稚嫩','少女看到帥哥姿樣時所迸發出來的');
INSERT INTO `goods` (`g_id`,`g_type`,`g_place`,`g_price`,`g_sales`,`g_tag`,`g_storage`,`g_photo`,`g_like`,`g_eff`,`g_farm`) VALUES (11,'粉嫩少女菇','肥宅的房間內',399,1,'魔力',18,'good/11.png','像剛蒸好包子一樣的外觀','不論男女老少都可以變身成高中JK一小時','長期累積肥宅閱讀少女漫畫的宅力');
INSERT INTO `goods` (`g_id`,`g_type`,`g_place`,`g_price`,`g_sales`,`g_tag`,`g_storage`,`g_photo`,`g_like`,`g_eff`,`g_farm`) VALUES (12,'雪花牛肉菇','青青草原的牛背上',399,1,'務實',22,'good/12.png','帶有均勻分布的油花','感到奢侈的美味','吸取牛隻的日月精華');
INSERT INTO `goods` (`g_id`,`g_type`,`g_place`,`g_price`,`g_sales`,`g_tag`,`g_storage`,`g_photo`,`g_like`,`g_eff`,`g_farm`) VALUES (13,'冬季限定-雪寶菇','極寒之地',399,1,'超能力',3,'good/13.png','雪寶樣','瘋狂邀請人打雪仗都不累','在酷寒環境的洗禮');
INSERT INTO `goods` (`g_id`,`g_type`,`g_place`,`g_price`,`g_sales`,`g_tag`,`g_storage`,`g_photo`,`g_like`,`g_eff`,`g_farm`) VALUES (14,'萬丹紅豆血球菇','人體血管內',399,1,'養生',101,'good/14.png','雙凹圓盤狀','加鐵補血','喝入萬丹紅豆水時會異常增生在體內');
INSERT INTO `goods` (`g_id`,`g_type`,`g_place`,`g_price`,`g_sales`,`g_tag`,`g_storage`,`g_photo`,`g_like`,`g_eff`,`g_farm`) VALUES (15,'慘淡人生菇','地下道的排水管旁',99,1,'魔力',20,'good/15.png','黑白無光如同你的人生','眼睛閃過人生跑馬燈，多慘澹感受就多強烈','吸取上班族的聲聲嘆息');
INSERT INTO `goods` (`g_id`,`g_type`,`g_place`,`g_price`,`g_sales`,`g_tag`,`g_storage`,`g_photo`,`g_like`,`g_eff`,`g_farm`) VALUES (16,'豬耳朵餅乾菇','雜貨店的零食櫃上',199,1,'魔力',12,'good/16.png','像古早味餅乾','懷舊兒時回憶','兒童歡笑栽植');
INSERT INTO `goods` (`g_id`,`g_type`,`g_place`,`g_price`,`g_sales`,`g_tag`,`g_storage`,`g_photo`,`g_like`,`g_eff`,`g_farm`) VALUES (17,'醍醐灌頂菇','孔子的頭上',999,1,'超能力',1,'good/17.png','注滿水藍色的液態','博學多聞，考試都考一百分','孔子學識的集大成');
INSERT INTO `goods` (`g_id`,`g_type`,`g_place`,`g_price`,`g_sales`,`g_tag`,`g_storage`,`g_photo`,`g_like`,`g_eff`,`g_farm`) VALUES (18,'黏黏阿凡達菇','潘朵拉星球',799,1,'超能力',50,'good/18.png','有著納美星人的膚色','讀心術GET','以人類的忌妒心養殖');
INSERT INTO `goods` (`g_id`,`g_type`,`g_place`,`g_price`,`g_sales`,`g_tag`,`g_storage`,`g_photo`,`g_like`,`g_eff`,`g_farm`) VALUES (19,'藤蔓毒菇菇','南美洲的熱帶雨林',1099,1,'邪惡',87,'good/19.png','攀滿藤蔓，顏色鮮豔誘惑','致人於死地','世間的愛恨情仇');


DROP TABLE IF EXISTS `guest`;
CREATE TABLE `guest`
	(
		g_id int NOT NULL auto_increment,
        g_mail VARCHAR(45) NOT NULL,
		g_tel VARCHAR(45) NOT NULL,
        s_type VARCHAR(45) NOT NULL,
		g_content VARCHAR(45),
		PRIMARY KEY (g_id)
	);
   

DROP TABLE IF EXISTS `receiver`; 
 CREATE TABLE `receiver`
	(
		r_id int NOT NULL auto_increment,
		m_id int NOT NULL,
		g_id int NOT NULL,
        r_content VARCHAR(100),
        r_score int,
		PRIMARY KEY (r_id)
	);
    

DROP TABLE IF EXISTS `recipe`; 
 CREATE TABLE `recipe`
	(
		re_id int NOT NULL auto_increment,
        re_time datetime,
		re_name VARCHAR(10) NOT NULL,
		re_use VARCHAR(30) NOT NULL,
        re_am int,
        re_ct int,
        re_content VARCHAR(255),
        re_author VARCHAR(10),
        re_photo VARCHAR(50),
		PRIMARY KEY (re_id)
	);
    

DROP TABLE IF EXISTS `recipe_re`; 
 CREATE TABLE `recipe_re`
	(
		rr_id int NOT NULL auto_increment,
		m_ac VARCHAR(8) NOT NULL,
        re_id int NOT NULL,
        rr_content VARCHAR(255),
        rr_score int,
		PRIMARY KEY (rr_id)
	);
    