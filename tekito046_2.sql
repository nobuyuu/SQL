create database shop;
-- 
create table product (
	pcode char(5),
	pname varchar(50) not null,
	unitprice int not null,
	pcategory char(1) not null,
	relatepcode char(5),
	primary key(pcode)
);
create table discontinued (
	pcode char(5),
	pname varchar(50) not null,
	unitprice int not null,
	pcategory char(1) not null,
	disdate date,
	soldnum int,
	primary key(pcode)
);
create table ordered (
	orderdate date,
	ordernum char(12),
	orderbranch int,
	pcode char(5) not null,
	number int not null,
	discount int,
	primary key(orderdate,ordernum,orderbranch)
);
alter table ordered change numberber numberber int not null;
-- ■問題(レベル1)
-- 01.商品テーブルのすべてのデータを抽出する。ただし、「*」表記を用いないこと。
select pcode, pname, unitprice, pcategory, relatepcode
from product ;

-- 02.商品テーブルのすべての商品名を抽出する。

select pname
from product;

-- 03.注文テーブルのすべてのデータを抽出する。「*」表記を用いること。

select *
from ordered ;

-- 04.注文テーブルのすべての注文番号、注文枝番、商品コードを抽出する。

select ordernum, orderbranch, pcode
from ordered ;

-- 05.商品テーブルに次の3つのデータを登録する。SQL文はデータごとに１つずつ作成すること。
-- --------------------------------------------
-- 商品コード|      商品名          | 単価 |商品区分
-- --------------------------------------------
-- W0461     |冬のあったかコート|12800|1
-- S0331     |春のさわやかコート| 6800|1
-- A0582     |秋のシックなコート| 9800|1

insert into product  (
	pcode, pname, unitprice, pcategory
)
values (
	'W0461', '冬のあったかコート', 12800, '1'
);
insert into product  (
	pcode, pname, unitprice, pcategory
)
values (
	'S0331', '春のさわやかコート', 6800, '1'
);
insert into product  (
	pcode, pname, unitprice, pcategory
)
values (
	'A0582', '秋のシックなコート', 9800, '1'
);
-- ■問題(レベル2)…tekito046_1.xlsxをもとに各テーブルの全レコードを修正してください。
-- 06.商品テーブルから、商品コード「W1252」のデータを抽出する。

select *
from product 
where pcode = 'W1252';

-- 07.商品コード「S0023」の商品について、商品テーブルの単価を500円に変更する。

update product 
set unitprice = 500
where pcode = 'S0023';

-- 08.商品テーブルから、単価が千円以下の商品データを抽出する。

select *
from product 
where unitprice <= 1000;

-- 09.商品テーブルから、単価が五万円以上の商品データを抽出する。

select *
from product 
where unitprice >= 50000;

-- 10.注文テーブルから、2013年以降の注文データを抽出する。

select *
from ordered 
where orderdate >= '2013-01-01';

-- 11.注文テーブルから、2012年11月以前の注文データを抽出する。

select *
from ordered 
where orderdate < '2012-12-01';

-- 12.商品テーブルから、「衣類」でない商品データを抽出する。

select *
from product 
where pcategory <> '1';

-- 13.注文テーブルから、クーポン割引を利用していない注文データを抽出する。

select *
from ordered 
where discount is null;

-- 14.商品テーブルから、商品コードが「Ｎ」で始まる商品を削除する。

delete 
from product 
where pcode like 'N%';

-- 15.商品テーブルから、商品名に「コート」が含まれる商品について、商品コード、商品名、単価を抽出する。

select pcode , pname , unitprice 
from product 
where pname like '%コート%';

-- 16.「靴」または「雑貨」もしくは「未分類」の商品について、商品コード、商品区分を抽出する。
-- ただし、記述する条件式は1つであること。

select pcode, pcategory
from product 
where pcategory <> '1'; 

-- 17.商品テーブルから、商品コードが「A0100」～「A0500」に当てはまる商品データを抽出する。
-- 記述する条件式は1つであること。

select *
from product 
where pcode between 'A0100' and 'A0500';

-- 18.注文テーブルから、商品コードが「N0501」「N1021」「N0223」のいずれかを注文した注文データを抽出する。

select *
from ordered 
where pcode in ('N0501', 'N1021', 'N0223');

-- 19.商品テーブルから、「雑貨」で商品名に「水玉」が含まれる商品データを抽出する。

select *
from product 
where pcategory = '3' and pname like '%水玉%';

-- 20.商品テーブルから、商品名に「軽い」または「ゆるふわ」のどちらかが含まれる商品データを抽出する。

select *
from product 
where pname like '%軽い%' or pname like '%ゆるふわ%';

-- 21.商品テーブルから、「衣類」で単価が三千円以下、または「雑貨」で単価が一万円以上の商品データを抽出する。

select *
from product 
where pcategory = '1' and unitprice <= 3000 or pcategory = '3' and unitprice >= 10000;

-- 22.注文テーブルから、2013年3月中に、一度の注文で数量3個以上の注文が合った商品コードを抽出する。

select pcode 
from ordered 
where orderdate between '2013-03-01' and '2013-03-31' and numberber >= 3;

-- 23.注文テーブルから、一度の注文で数量10個以上注文したか、クーポン割引を利用した注文データを抽出する。

select *
from ordered 
where numberber >= 10 or discount is not null;

-- 24.商品テーブルと注文テーブルそれぞれについて、主キーの役割を果たしている列名を日本語で解答する。

-- 商品ターブル：商品コード
-- 注文テーブル；注文日、注文番号、注文枝番

-- ■問題(レベル3)
-- 25.商品区分「衣類」の商品について、商品コードの降順に商品コードと商品名の一覧を取得する。

select pcode , pname 
from product
where pcategory = '1'
order by pcode desc;

-- 26.注文テーブルから、主キーの昇順に2013年3月以降の注文一覧を取得する。
-- 取得する項目は、注文日、注文番号、注文枝番、商品コード、数量とする。

select orderdate , ordernum ,orderbranch ,pcode , numberber 
from ordered 
where orderdate > '2013-03-31'
order by orderdate ,ordernum ,orderbranch ;

-- 27.注文テーブルから、これまでに注文のあった商品コードを抽出する。重複は除外し、商品コードの昇順に抽出すること。

select distinct  pcode 
from ordered
order by pcode ;

-- 28.注文テーブルから、注文のあった日付を新しい順に10行抽出する。同一日付が複数回登場してもよい。

select orderdate 
from ordered 
order by orderdate desc
limit 5;

-- 29.商品テーブルから、単価の低い順に並べて6～20行目に当たる商品データを抽出する。
-- 同一の単価の場合は、商品区分、商品コードの昇順に並ぶように抽出すること。

select *
from product 
order by unitprice 
limit 5,15;

-- 30.廃番商品テーブルから、2011年12月の廃番されたものと売上個数が100を超えるものを併せて抽出する。
-- 一覧は、売上個数の多い順に並べること。

select *
from discontinued 
where disdate between '2011-12-01' and '2011-12-31' or soldnum > 100
order by soldnum desc;

-- 31.商品テーブルから、これまでに注文されたことのない商品コードを商品コードの昇順に抽出する。

select p.pcode 
from product p
left outer join ordered o
on p.pcode = o.pcode
where o.pcode is null
order by p.pcode;

select pcode
from product 
where pcode not in (select pcode from ordered );

-- 32.商品テーブルから、これまでに注文された実績のある商品コードを商品コードの降順に抽出する。

select pcode
from product 
where pcode in (select pcode from ordered )
order by pcode desc ;

-- 33.商品区分が「未分類」で、単価が千円以下と一万円を超える商品について、商品コード、商品名、単価を取得する。

select pcode , pname , unitprice 
from product 
where pcategory = '9' and (unitprice <= 1000 or unitprice > 10000);

-- ■問題(レベル4)
-- 34.商品テーブルの商品区分「未分類」の商品について、商品コード、単価、キャンペーン価格の一覧を取得する。
-- キャンペーン価格は単価の5％引きであり、1円未満の端数は考慮しなくてよい。一覧は商品コード順に並べること。

select pcode as '商品コード',
unitprice as '単価',
floor(unitprice / 1.05) as 'キャンペーン価格'
from product 
order by pcode ;

-- 35.注文日が2013年3月12日～14日で、同じ商品を2個以上注文し、既にクーポン割引を利用している注文について、
-- さらに300円割引することになった。該当データのクーポン割引料を更新する。

update ordered 
set discount = discount + 300
where orderdate between '2013-03-12' and '2013-03-14' and numberber >= 2 and discount is not null;

-- 36.注文番号「201302250126」について、商品コード「W0156」の注文数を1つ減らすよう更新する。

update ordered 
set numberber = numberber - 1
where ordernum = '201302250126' and pcode = 'W0156';

-- 37.注文テーブルから、注文番号「201210010001」～「201210319999」の注文データを抽出する。
-- 注文番号と枝番は、「-」（ハイフン)でつなげて1つの項目として抽出する。

select concat(ordernum, '-', orderbranch) as 注文番号と枝番
from ordered 
where ordernum between '201210010001' and '201210319999';

-- 38.商品テーブルから、商品区分の一覧を取得する。見出しは「区分」と「区分名」とし、区分名には日本語を表記する。

select pcategory as '区分', (case when (pcategory = '1') then '衣類'
													when (pcategory = '2') then '靴'
													when (pcategory = '3') then '雑貨'
													else '未分類' end ) as '区分名' 
from product ;

-- 39.商品テーブルから、商品コード、商品名、単価、販売価格ランク、商品区分を抽出する。
-- 販売価格ランクは、三千円未満を「S」、三千円以上一万円未満を「M」、一万円以上を「L」とする。
-- また、商品区分はコードと日本語名称を「:」(コロン)で連結して表記する。
-- 一覧は、単価の昇順に並べ、同額の場合は商品コードの昇順に並べること。

select pcode as '商品コード' ,
pname as '商品名' ,
unitprice as '単価' ,
(case when (unitprice < 3000) then 'S'
			when (unitprice >= 10000) then 'L'
			else 'M' end) as '販売価格ランク',
concat(pcategory, ':',(case when (pcategory = '1') then '衣類'
										when (pcategory = '2') then '靴'
										when (pcategory = '3') then '雑貨'
										else '未分類' end )) as '商品区分' 
from product 
order by unitprice ,pcode ;

-- 40.商品テーブルから、商品名が10文字を超過する商品名とその文字数を抽出する。文字数の昇順に並べること。

select pname as '商品名',
char_length(pname)  as '商品文字数'
from product 
order by char_length(pname);

-- 41.注文テーブルから、注文日と注文番号の一覧を抽出する。
-- 注文番号は日付の部分を取り除き、4桁の連番部分だけを表記すること。

select orderdate as '注文日' ,
substring(ordernum, 9, 12) as '注文番号4桁'
from ordered ;

-- 42.商品テーブルについて、商品コードの1文字目が「M」の商品の商品コードを「E」で始まるよう更新する。

update product 
set pcode = replace (pcode , 'M', 'E')
where pcode like 'M%';

-- 43.注文番号の連番部分が「1000」～「2000」の注文番号を抽出する。連番部分4桁を昇順で抽出すること。

select substring(ordernum, 9, 12) as '注文連番4桁' 
from ordered 
where substring(ordernum, 9, 12) between '1000' and '2000'
order by substring(ordernum, 9, 12); 

-- 44.商品コード「S1990」の廃番日を、関数を使って本日の日付に修正する。

update discontinued 
set disdate = now()
where pcode = 'S1990';

-- 45.一万円以上の商品の一覧を取得する。ただし、30％値下げした時の単価を、商品コード、商品名、現在の単価と併せて取得する。
-- 値下げ後の単価の見出しは「値下げした単価」とし、1円未満は切り捨てること。
 
select 
pcode as '商品コード',
pname as '商品名',
unitprice as '単価',
floor(unitprice / 1.3) as '値下げ単価'
from product ;

-- ■問題(レベル5)
-- 46.これまでに注文された数量の合計を求める。

select 
sum(numberber) 
from ordered ;

-- 47.注文日順に、注文日ごとの数量の合計を求める。

select 
orderdate , 
sum(numberber) 
from ordered 
group by orderdate ;

-- 48.商品区分順に、商品区分ごとの単価の最少額と最高額を求める。

select 
pcategory as '商品区分' ,
min(unitprice) as '最少額' ,
max(unitprice) as '最高額'  
from product 
group by pcategory ;

-- 49.商品コード順に、商品コードごとにこれまで注文された数量の合計を求める。

select 
pcode as '商品コード',
sum(numberber) as '数量合計' 
from ordered 
group by pcode ;

-- 50.これまで最もよく売れた商品を10位まで抽出する。商品コードと販売した数量を数量の多い順に抽出すること。
-- 数量が同じ商品については、商品コードを昇順にすること。

select 
pcode as '商品コード',
sum(numberber) as '販売数'
from ordered 
group by pcode
order by sum(numberber) desc , pcode ,pcode limit 10 ;

-- 51.これまでに売れた数量が5個未満の商品コードとその数量を抽出する。

select 
pcode as '商品コード',
sum(numberber) as '販売数' 
from ordered 
group by pcode 
having sum(numberber) < 5 ;

-- 52.これまでにクーポン割引をした注文件数と、その割引額の合計を求める。
-- ただし、WHERE句による絞り込み条件は指定しないこと。
-- △
select 
ordernum ,
count(ordernum)  as '割引注文件数',
sum(discount) as '割引合計'
from ordered 
group by ordernum 
having sum(discount)  is not null;

-- 53.月ごとの注文件数を求める。抽出する列の名前は「年月」と「注文件数」とし、
-- 年月列の内容は「201201」のような形式で、日付の新しい順序で抽出すること。
-- なお、1件の注文には、必ず注文枝番「1」の注文明細が含まれていることが保証されている。

select 
substring(ordernum,1 ,6) as '年月',
count(ordernum) as '注文件数' 
from ordered 
group by substring(ordernum,1 ,6)
order by ordernum desc;

-- 54.注文テーブルから、「Z」から始まる商品コードのうち、これまでに売れた数量が100個以上の商品コードを抽出する。

select 
pcode  
from ordered 
group by pcode 
having sum(numberber) >= 100 ;

-- ■問題(レベル6)
-- 55.次の商品について、商品コード、商品名、単価、これまでに販売した数量を抽出する。
-- ただし、抽出には選択列リストにて注文テーブルを副問い合わせするSELECT文を用いること。
-- 　・商品コード：S0604

select pcode as '商品コード',
pname as '商品名',
unitprice as '単価',
(select sum(numberber)  from ordered where pcode = 'S0604') as '販売数量'
from product 
where pcode = 'S0604';

-- 56.次の注文について、商品コードを間違って登録した事がわかった。
-- 商品テーブルより条件に合致する商品コードを取得し、該当の注文テーブルを更新する。
-- ただし、注文テーブルの更新にはSET句にて商品テーブルを副問い合わせするUPDATE文を用いること。
-- 　・注文日：2013-03-15
-- 　・注文番号：201303150014
-- 　・注文枝番：1
-- 　・正しい商品の条件：商品区分が「靴」で、商品名に「ブーツ」「雨」「安心」を含む。

update ordered 
set pcode = (select pcode 
					from product  
					where pcategory = '2' 
					and pname like '%ブーツ%' 
					and pname like '%雨%' 
					and pname like '%安心%' )
where orderdate = '2013-03-15'
	and ordernum = '201303150014' 
	and orderbranch = 1 ;

-- 57.商品名に「あったか」が含まれる商品が売れた日付とその商品コードを過去の日付順に抽出する。
-- ただし、WHERE句でIN演算子を利用した副問い合わせを用いること。

select orderdate ,pcode 
from ordered 
where pcode in (select pcode  from product where pname like '%あったか%' )
order by orderdate ;

-- 58.商品ごとにそれぞれ平均販売物量を求め、どの商品の平均販売数量よりも多い数が売れた商品を探し、
-- その商品コードと販売数量を抽出する。ただし、ALL演算子を利用した副問い合わせを用いること。
-- x

select pcode , sum(numberber) 
from ordered o 
group by numberber  
having max(numberber)  > all (select avg(numberber)  from ordered );

select pcode , max(numberber) 
from ordered o ;
group by pcode ;

select pcode , avg(numberber) ,sum(numberber),max(numberber)  
from ordered 
group by numberber  ;
order by pcode ;
where ;

-- 59.次の商品について、クーポン割引を利用して販売したものについて、
-- その販売数量と商品1個当たりの平均割引額を抽出する。列名は「割引による販売数」と「平均割引額」とし、
-- 1円未満は切り捨てる。また、抽出にはFROM句を副問い合わせで利用すること。
-- 　・商品コード：W0746

select o1.pcode ,o2.numberber as '割引による販売数', o2.discount as '平均割引額'
from (select sum(numberber) as 'numberber',
			floor(sum(discount) / sum(numberber)) as 'discount'
			from ordered where pcode = 'W0746'and discount is not null) o2 ,ordered o1
where o1.pcode = 'W0746' and o1.discount is not null
group by o1.pcode; 

select 
pcode , 
sum(numberber) as '割引による販売数',
floor(sum(discount) / sum(numberber)) as '平均割引額'
from ordered 
where pcode = 'W0746' and discount is not null;

-- 60.次の既存の注文に、内容を追加する訂正があった。追加分の注文を注文テーブルに登録する。
-- 注文枝番は同じ注文番号を副問い合わせにて参照し、1を加算した番号を採番する。
-- SQL文は注文ごとに1つずつ作成すること。
-- ---------------------------------------------------
--     注文日   |  注文番号   |商品コード|数量|クーポン割引
-- ---------------------------------------------------
-- 2013-03-21|201303210080|    S1003|   1|なし
-- 2013-03-22|201303220901|    A0052|   2|500円
-- x
select unitprice + 1
from product p ;

select orderbranch  from ordered  where ordernum = '201303210080'

insert into orderdate (
	orderdate , ordernum , orderbranch  , pcode , numberber 
)
values (
	'2013-03-21', '201303210080', (select Orderbranch + 1 from (select orderbranch as Orderbranch from ordered  where ordernum = '201303210080')  where ordernum = '201303210080') , 'S1003', 1
);
select orderdate , ordernum , orderbranch  , pcode , numberber 
from ordered;


-- ■問題(レベル7)
-- 61.次の注文番号について、注文番号、注文枝番、商品コード、商品名、数量の一覧を
-- 注文番号及び注文枝番の順に抽出する。商品名は商品テーブルより取得すること。
-- 　・注文番号：201301130115

select o.ordernum , o.orderbranch , o.pcode , p.pname , o.numberber 
from ordered o 
inner join product p 
on p.pcode = o.pcode 
where o.ordernum = '201301130115';

-- 62.次の廃番商品について、廃番日より後に注文された注文情報(注文日、注文番号、注文枝番、数量、注文金額)を抽出する。
-- 注文金額は単価と数量より算出すること。
-- 　・商品コード：A0009
-- サブクエリ
select 
orderdate as '注文日',
ordernum as '注文番号', 
orderbranch as '注文枝番', 
numberber as '数量', 
numberber * (select unitprice from discontinued  where pcode = 'A0009') as '注文金額'
from ordered o
where pcode = 'A0009' and orderdate > (select disdate from discontinued  where pcode = 'A0009') ;

-- 内部結合
select 
o.orderdate as '注文日', 
o.ordernum as '注文番号', 
o.orderbranch as '注文枝番', 
o.numberber as '数量', 
o.numberber *  d.unitprice as '注文金額'
from ordered o 
inner join discontinued d 
on d.pcode = o.pcode 
where o.pcode  = 'A0009' and o.orderdate > d.disdate ;

-- 63.次の商品について、商品情報(商品コード、商品名、単価)とこれまでの注文情報(注文日、注文番号、数量)、
-- さらに単価と数量から売上金額を一覧として抽出する。一覧は注文のあった順に表示すること。
-- 　・商品コード：S0604

select 
p.pcode as '商品コード', 
p.pname as '商品名', 
p.unitprice as '単価', 
o.orderdate as '注文日', 
o.ordernum as '注文番号', 
o.numberber as '数量', 
p.unitprice * o.numberber as '売上金額'
from product p 
inner join ordered o 
on o.pcode = p.pcode 
where p.pcode = 'S0604'
order by o.orderdate ;

-- 64.2011年8月に注文のあった商品コードの一覧を抽出する。一覧には、商品名も表示する必要がある。
-- 既に廃番となっている商品に関しては特に考慮しなくてよい(一覧に含まれなくてよい)

select o.orderdate , o.pcode , p.pname 
from ordered o
inner join product p 
on p.pcode = o.pcode 
where o.orderdate like  '2011-08%' ;

-- 65.問題64では、既に廃番となっている商品は抽出されなかった。
-- 廃番となった商品ももれなく一覧に記載されるよう、SQL文を改善する。
-- なお、廃番商品は商品名としては「廃番」の文言を表示すること。

select o.orderdate as '注文日',
o.pcode as '商品コード', 
ifnull(p.pname, '廃番') as '商品名' 
from ordered o
left outer join product p 
on p.pcode = o.pcode 
where o.orderdate like  '2011-08%';
and o.pcode not in (select pcode  from discontinued) ;

-- 66.商品区分「雑貨」の商品について、注文日、商品コード、商品名、数量を抽出する。
-- 商品については、「商品コード：商品名」の形式で表示する。
-- ただし、注文のなかった「雑貨」商品についても、もれなく一覧に記載し、数量は0とすること。

select 
o.orderdate as '注文日',
concat(p.pcode, ':', p.pname) as '商品コード:商品名', 
(case when (o.numberber is null) then 0
			else o.numberber end) as '数量'
from product p
left outer join ordered o 
on p.pcode = o.pcode  
where p.pcategory = 3;

-- 67.問題66について、更に注文のあった「雑貨」商品が既に廃番になっている可能性も考慮し、一覧を抽出する。
-- 廃番になった商品は、「商品コード：(廃番済み)」のように表示すること。

-- パターン1
select 
o.orderdate as '注文日',
concat(p.pcode, ':', p.pname) as '商品コード:商品名', 
(case when (o.numberber is null) then 0
			else o.numberber end) as '数量'
from product p
left outer join ordered o 
on p.pcode = o.pcode 
where p.pcategory = 3
union 
select d2.disdate, concat(d2.pcode ,';' , '(廃盤済み)') ,d2.soldnum 
from discontinued d2 
where d2.pcategory = 3;

-- パターン2
select 
o.orderdate as '注文日',
concat(p.pcode, ':', (case when (o.pcode = d.pcode) then '(廃番済み)' 
										else p.pname  end )) as '商品コード:商品名', 
(case when (o.numberber is null) then 0
			else o.numberber end) as '数量'
from product p
left outer join ordered o 
on p.pcode = o.pcode 
left outer join discontinued d 
on o.pcode = d.pcode 
where p.pcategory = 3;

-- 68.次の注文番号の各明細について、注文日、注文番号、注文枝番、商品コード、商品名、単価、数量、注文金額を抽出する。
-- 注文金額は単価と数量より算出し、その総額からクーポン割引料を差し引いたものとする。
-- また、商品が廃番になっている場合は、廃番商品テーブルから必要な情報を取得すること。
-- 　・注文番号：201204030010

select 
o.orderdate as '注文日',
o.ordernum as '注文番号', 
o.orderbranch as '注文枝番', 
o.pcode as '商品コード',
(case when (o.pcode = d.pcode) then '(廃盤商品)' 
			else p.pname  end ) as '商品名', 
p.unitprice as '単価', 
o.numberber as '数量', 
p.unitprice * o.numberber - ifnull(o.discount, 0)  as '注文金額'
from product p
left outer join ordered o 
on p.pcode = o.pcode 
left outer join discontinued d 
on o.pcode = d.pcode 
where o.ordernum = '201204030010';

-- 69.商品コードが「B」で始まる商品について、商品テーブルから商品コード、商品名、単価を、
-- 注文テーブルからこれまでに売り上げた個数をそれぞれ抽出する。
-- 併せて、単価と個数からこれまでの総売上金額を計算する(クーポン割引は考慮しなくてよい)。
-- 一覧は商品コード順に表示すること。

select p.pcode , p.pname , p.unitprice , sum(o.numberber) , sum(p.unitprice * o.numberber) 
from product p 
inner join ordered o 
on p.pcode = o.pcode 
group by o.pcode 
having o.pcode like 'B%'
order by o.pcode ;

-- 70.現在販売中の商品について、関連している商品のある一覧を抽出する。
-- 一覧には、商品コード、商品名、関連商品コード、関連商品名を記載する。
select 
p1.pcode as '商品コード',
p1.pname as '商品名',
p1.relatepcode as '関連商品コード',
p2.pname as '関連商品名'
from product as p1
inner join product as p2
on p2.pcode = p1.relatepcode 
where p1.relatepcode is not null;

