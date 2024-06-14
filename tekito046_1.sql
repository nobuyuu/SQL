
create table account (
	account char(7),
	name varchar(40) not null,
	kinds char(1) not null,
	balance int not null,
	updatedate date,
	primary key(account)
);
create table canaccount (
	account char(7),
	name varchar(40) not null,
	kinds char(1) not null,
	canbalance int not null,
	candate date,
	primary key(account)
);
create table trans (
	transnumber int,
	transid int,
	datedate date not null,
	account char(7) not null,
	depoamount int,
	withdamount int,
	primary key(transnumber),
	foreign key(transid) references transreason (transid)
);
create table transreason(
	transid int,
	transname varchar(20) not null,
	primary key(transid)
);







-- ■問題(レベル1)
-- 01.口座テーブルのすべてのデータを抽出する。ただし、「*」表記を使わないこと。
select account, name, kinds, balance, updatedate
from account;
-- 02.口座テーブルのすべての口座番号を抽出する。
select account
from account ;
-- 03.口座テーブルのすべての口座番号と残高を抽出する。
select account, balance
from account;
-- 04.口座テーブルのすべてのデータを抽出する。ただし、「*」表記を使うこと。
select * 
from account;
-- 05.口座テーブルのすべての名義を「ⅩⅩⅩⅩⅩ」に更新する。
update account  
set name = 'xxxxx';
-- 06.口座テーブルのすべての残高を99999999、更新日を「2021-08-30」に更新する。
update account 
set balance = 99999999, updatedate = '2021-08-30';
-- 07.口座テーブルに次の3つのデータを登録する。SQL文はデータごとに１つずつ作成すること。
insert into account (
	account, name ,kinds ,balance , updatedate 
)
values (
	'0642191','アオキ　ハルカ','1',3640551,'2022-03-13'
);
insert into account (
	account, name ,kinds ,balance , updatedate 
)
values (
	'1039410','キノシタ　リュウジ','1',259017,'2021-11-30'
);
insert into account (
	account, name ,kinds ,balance
)
values (
	'1239855','タカシナ　ミツル','2',6509773
);
-- ■問題(レベル2)…tekito046_1.xlsxをもとに各テーブルの全レコードを修正してください。
-- 08.口座テーブルから、口座番号「0037651」のデータを抽出する。
select account, name ,kinds ,balance ,updatedate 
from account
where account = '0037651';
-- 09.口座テーブルから、残高が0より大きいデータを抽出する。
select account, name ,kinds ,balance ,updatedate 
from account
where balance > 0;
-- 10.口座テーブルから、口座番号が「1000000」番より前のデータを抽出する。
select account, name ,kinds ,balance ,updatedate 
from account
where account < '1000000';
-- 11.口座テーブルから、更新日が2021年以前のデータを抽出する。
select account, name ,kinds ,balance ,updatedate 
from account
where updatedate <= '2021-12-31';
-- 12.口座テーブルから、残高が100万円以上のデータを抽出する。
select account, name ,kinds ,balance ,updatedate  
from account
where balance >= 1000000;
-- 13.口座テーブルから、種別が「普通」ではないデータを抽出する。
select account, name ,kinds ,balance ,updatedate 
from account
where kinds <> '1';
-- 14.口座テーブルから、更新日が登録されていないデータを抽出する。
select account, name ,kinds ,balance ,updatedate 
from account
where updatedate is null ;
-- 15.口座テーブルから、「ハシ」を含む名義のデータを抽出する。
select account, name ,kinds ,balance ,updatedate 
from account
where name like '%ハシ%';
-- 16.口座テーブルから、更新日が2022年1月の日付であるデータを抽出する。ただし、記述する条件式は1つであること。
select account, name ,kinds ,balance ,updatedate 
from account
where updatedate like '2022-01%';
-- 17.口座テーブルから、種別が「当座」または「別段」のデータを抽出する。ただし、記述する条件式は1つであること。
select account, name ,kinds ,balance ,updatedate 
from account 
where kinds in (2,3);
-- 18.口座テーブルから、名義が「サカタ　リョウヘイ」「マツモト　ミワコ」「ハマダ　サトシ」のデータを抽出する。
select account, name ,kinds ,balance ,updatedate 
from account
where name in ('サカタ　リョウヘイ','マツモト　ミワコ','ハマダ　サトシ');
-- 19.口座テーブルから、更新日2022年12年30日から2023年1月4日であるデータを抽出する。
select account, name ,kinds ,balance ,updatedate 
from account
where updatedate between '2022-12-30' and '2023-01-04';
-- 20.口座テーブルから、残高が1万円未満で、更新日が登録されているデータを抽出する。
select account, name ,kinds ,balance ,updatedate 
from account
where balance < 10000 and updatedate is not null;
-- 21.口座テーブルから、次の条件のいずれかに当てはまるデータを抽出する。
-- ・口座番号が「2000000」番台
-- ・名義の姓が「エ」から始まる3文字で、名が「コ」で終わる
select account,name ,kinds ,balance ,updatedate 
from account
where account like '2%' or name like 'エ＿＿　%コ';
-- 22.口座テーブル、取引テーブル、取引事由テーブルにおいて主キーの役割を果たしている列名を日本語で解答する。
-- 口座番号、取引番号、取引事由ID
-- レベル3
-- ■問題(レベル3)
-- 23.口座テーブルから、口座番号順にすべてのデータを抽出する。ただし、並び替えには列名を指定し、昇順にすること。
select account,name ,kinds ,balance ,updatedate 
from account
order by account asc ;
-- 24.口座テーブルから、名義の一覧を取得する。データの重複を除外し、名義を昇順とすること。
select distinct name 
from account 
order by name asc ;
-- 25.口座テーブルから、残高の大きい順にすべてのデータを抽出する。残高が同額の場合には口座番号を昇順とすること。
select account,name ,kinds ,balance ,updatedate 
from account
order by balance desc , account asc;
-- 26.口座テーブルから、更新日を過去の日付順に10件抽出する。ただし、更新日の設定がないデータは除くこと。
select account,name ,kinds ,balance ,updatedate 
from account
where updatedate is not null
order by updatedate asc , updatedate limit 10;

-- 27.口座テーブルから、更新日と残高を、残高の小さい順に11～20件目のみを抽出する。
-- ただし、残高が0円または更新日の設定がないデータは除外し、残高が同額の場合には更新日の新しい順(降順)とする。
select account,name ,kinds ,balance ,updatedate 
from account
where balance <> 0 and updatedate is not null
order by balance asc , updatedate desc, balance limit 11,20;
-- 28.口座テーブルと廃止口座テーブルに登録されている口座番号を口座番号順(昇順)に抽出する。
select account
from account 
union
select account 
from canaccount 
order by account  asc ;
-- 29.口座テーブルに登録されている名義のうち、廃止口座テーブルには存在しない名義を抽出する。重複したデータは除き、降順で並べること。
select distinct name
from account 
where name not in (select name from canaccount )
order by name desc ;
-- 30.口座テーブルと廃止口座テーブルの両方に登録されている名義を抽出する。昇順で並べること。
select name
from account
where name in (select name from canaccount)
order by name asc;
-- 31.口座テーブルと廃止口座テーブルに登録されている口座番号と残高の一覧を取得する。ただし、口座テーブルは残高がゼロのもの、
-- 廃止口座テーブルは解約時残高がゼロでないものを抽出の対象とする。一覧は口座番号順とする。
select account, balance
from account 
where balance = 0
union 
select account ,canbalance
from canaccount 
where canbalance <> 0
order by account asc;
-- 32.口座テーブルと廃止口座テーブルに登録されている口座番号と名義の一覧を取得する。一覧は名義順とし、
-- その口座の状況がわかるように、有効な口座には「○」を、廃止した口座には「×」を一覧に付記すること。
select '○'as num, account, name
from account 
union 
select '✕'as num,account , name 
from canaccount
order by name asc;
-- ■問題(レベル4)
-- 33.口座テーブルから、残高が100万以上の口座番号と残高を抽出する。ただし、残高は千円単位の切り捨てで表記し、見出しを「千円単位の残高」とする。
select account, round(balance,-3) as 千円単位の残高 
from account 
where balance >= 1000000;
-- 34.口座テーブルに次の3つのデータを登録する。ただし、キャンペーンによりSQL文にて残高に3,000円をプラスして登録すること。SQL文はデータごとに1つずつ作成すること。
insert  into account (
	account, name , kinds ,balance ,updatedate 
)
values (
	'0652281', 'タカギ　ノブオ', '1', 100000 + 3000, '2022-04-01'
);

insert  into account (
	account, name , kinds ,balance ,updatedate 
)
values (
	'1026413', 'マツモト　サワコ', '1', 300000 + 3000, '2022-04-02'
);

insert  into account (
	account, name , kinds ,balance ,updatedate 
)
values (
	'2239710', 'ササキ　シゲノリ', '1', 1000000 + 3000, '2022-04-03'
);
-- 35.34の問題で登録したデータについて、キャンペーンの価格が間違っていたことが判明した。該当するデータの残高それぞれから3,000円を差し引き、
-- あらためて残高の0.3％を上乗せした金額になるよう更新する。
update account 
set balance =  (balance - 3000) * 1.003
where account='0652281';

update account 
set balance =  (balance - 3000) * 1.003
where account='1026413';

update account 
set balance =  (balance - 3000) * 1.003
where account='2239710';
-- 36.口座テーブルから、更新日が2021年以前のデータを対象に、口座番号、更新日、通帳期限日を抽出する。通帳期限日は、更新日の180日後とする。
select account, updatedate, date_add(updatedate,interval 180 day) as '通帳期限日'
from account
where updatedate <= '2021-12-31';

-- 37.口座テーブルから、種別が「別段」のデータについて、口座番号と名義を抽出する。ただし、名義の前に「カ)」を付記すること。
select account, concat('カ)',name) 
from account
where kinds = '3';
-- 38.口座テーブルから、登録されている種別の一覧を取得する。見出しは「種別コード」と「種別名」とし、種別名には日本語名を表記する。
select kinds as '種別コード',(case when (kinds = '1') then '普通'
								when (kinds = '2') then '当座'
								else '別段' end ) as '種別名'
from account ;
-- 39.口座テーブルから、口座番号、名義、残高ランクを抽出する。残高ランクは、残高が10万円未満を「C」、10万円以上100万円未満を「B」、それ以外を「A」とする。
select account , name , (case when (balance < 100000) then 'C'
								when (balance >= 100000 && balance < 1000000) then 'B'
								else 'A' end ) as '残高ランク'
from account;
-- 40.口座テーブルから、口座番号、名義、残高の文字数を抽出する。ただし、名義の姓名の間の全角スペースは除外すること。
select char_length(account) as account,
char_length(replace (name,' ','')) as name ,
char_length(balance) as balance 
from account;

-- 41.口座テーブルから、名義の1～5文字目に「カワ」が含まれるデータを抽出する。
select  account, name , kinds, balance,updatedate 
from account 
where substring(name,1,5) like '%カワ%';
-- 42.口座テーブルから、残高の桁数が4桁以上で、1,000円未満の端数がないデータを抽出する。ただし、どちらの条件も文字数を求める関数を使って判定すること。
select account, name , kinds ,balance ,updatedate 
from account 
where 4 <= char_length(balance) and balance like '%000';
-- 43.口座テーブルから、口座番号、残高、利息を残高の降順に抽出する。利息は、残高に普通預金利息0.02％を掛けて求め、1円未満を切り捨てること。
select account, balance ,floor(balance * 0.0002) as risoku
from account 
order by balance desc ;
-- 44.口座テーブルから、口座番号、残高、残高別利息を抽出する。残高別利息は、残高が50万円未満を0.01％、50万円以上200万円未満を0.02％、
-- 200万円以上を0.03％として計算し、1円未満を切り捨てる。一覧は、残高利息の降順、口座番号の昇順に並べること。
select account, balance ,floor(balance * 0.0002) as zanrisoku
from account 
order by balance desc ;
-- 45.口座テーブルに以下にある3つのデータを登録する。ただし、更新日は現在の日付を求める関数を利用して指定すること。SQL文はデータごとに1つずつ作成する。
insert  into account (
	account, name , kinds ,balance ,updatedate 
)
values (
	'0351262', 'イトカワ　ダイ', '2', 635110, now()
);
insert  into account (
	account, name , kinds ,balance ,updatedate 
)
values (
	'1015513', 'アキツ　ジュンジ', '1', 88463, now()
);
insert  into account (
	account, name , kinds ,balance ,updatedate 
)
values (
	'1739298', 'ホシノ　サトミ', '1', 704610, now()
);
-- 46.口座テーブルから、更新日が2022年以降のデータを抽出する。その際、更新日は「2022年01月01日」のような形式で抽出すること。
select account, name , kinds ,balance ,date_format(updatedate, '%Y年%m月%d日')  
from account 
where updatedate >= '2021-01-01';
-- 47.口座テーブルから、更新日を抽出する。更新日が登録されていない場合は、「設定なし」と表記すること。
select (case when (updatedate is null) then '設定なし'
			else updatedate  end ) as '更新日'
from account ;
-- ■問題(レベル5)
-- 48.口座テーブルから、残高の合計、最大、最小、平均、および登録されているデータ件数を求める。
select sum(balance) as '合計',
max(balance) as '最大',
min(balance) as '最小',
avg(balance) as '平均',
count(balance) as 'データ件数' 
from account ;
-- 49.口座テーブルから、種別が「普通」以外、残高が100万円以上、更新日が2022年以前のデータ件数を求める。
select count(kinds <> 1 or null) as '普通以外',
count(balance >= 1000000 or null) as '100万以上',
count(updatedate < '2022-01-01' or null) as '普通以外'
from account ;
-- 50.口座テーブルから、更新日が登録されていないデータ件数を求める。ただし、条件式は用いないこと。
select count(updatedate) 
from account ;
-- 51.口座テーブルから、名義の最大値と最小値をそれぞれ求める。
select max(name) as '名義最大値', min(name) as '名義最小値' 
from account ;
-- 52.口座テーブルから、更新日の最大値と最小値をそれぞれ求める。
select max(updatedate) as '更新日最大値', min(updatedate) as '更新日最小値'
from account ;
-- 53.口座テーブルから、種別ごとの残高の合計、最大、最小、平均、および登録されているデータ件数を求める。
select kinds ,
sum(balance) as '合計',
max(balance) as '最大',
min(balance) as '最小',
avg(balance) as '平均',
count(balance) as 'データ件数' 
from account 
group by kinds ;
-- 54.口座テーブルから、口座番号の下1桁目が同じ数字であるものをグループとし、それごとにデータ件数を求める。ただし、件数の多い順に並べること。
select (case when (account like '%0') then '0'
			when (account like '%1') then '1'
			when (account like '%2') then '2'
			when (account like '%3') then '3'
			when (account like '%4') then '4'
			when (account like '%5') then '5'
			when (account like '%6') then '6'
			when (account like '%7') then '7'
			when (account like '%8') then '8'
			else '9' end ) as '口座番号の下一桁',
			count(updatedate) as 'データ件数'
from account 
group by account like '%0',
account like '%1' ,
account like '%2' ,
account like '%3' ,
account like '%4' ,
account like '%5' ,
account like '%6' ,
account like '%7' ,
account like '%8' ,
account like '%9' 
order by count(updatedate)  desc  ;
-- 55.口座テーブルから、更新日の年ごとの残高の合計、最大、最小、平均、および登録されているデータ件数を求める。ただし、更新日の登録がないデータは「XXXX年」として集計する。 
select ifnull(updatedate,'xxxx年') as '更新日の年',
sum(balance) as '合計',
max(balance) as '最大',
min(balance) as '最小',
avg(balance) as '平均',
count(updatedate) as 'データ件数' 
from account 
group by 
updatedate like '2021%',
updatedate like '2022%' ,
updatedate like '2022%' ,
updatedate like  null ;
-- 56.口座テーブルから、種別ごとの残高の合計とデータ件数を求める。ただし、合計が300万円以下のものは一覧から取り除く。
select kinds as '種別',
sum(balance) as '残高合計',
count(balance) as 'データ件数'
from account
group by kinds 
having sum(balance) > 3000000;
-- 57.口座テーブルから、名義の1文字目が同じグループごとに、データ件数と名義文字数の平均を求める。ただし、
-- 件数が3件以上、または文字数の平均が7文字以上のものを抽出の対象とし、名義の全角スペースは除外すること。

select 
substring(name, 1, 1)as '頭文字',
count(account) as 'データ件数',
char_length(replace (name,' ','')) as '名義文字数'
from account 
group by substring(name, 1, 1); 

-- ■問題(レベル6)
-- 58.次の口座について、取引日の取引結果を口座テーブルの残高に反映する。ただし、
-- 口座テーブルの更新には、SET句にて取引テーブルを副問い合わせするUPDATE文を用いること。
-- ・口座番号：0351333、取引日：2023-01-11

update account 
set balance = balance + ((select sum(depoamount) from trans where account = '0351333' and datedate = '2023-01-11') - (select sum(withdamount) from trans where account = '0351333' and datedate = '2023-01-11'))
where account = '0351333' ;

-- 59.次の口座について、現在の残高と、取引日に発生した取引による入出金額それぞれの合計金額を取得する。
-- 取得には、選択列リストにて取引テーブルを副問い合わせするSELECT文を用いること。
-- ・口座番号：1115600、取引日：2022-12-28

select a.account ,a.balance, sum(t.depoamount), sum(t.withdamount) 
from account a 
inner join trans t 
on a.account = t.account 
where a.account = '1115600' and t.datedate = '2022-12-28';

select account, balance as '残高',
(select sum(depoamount) from trans where account = '1115600' and datedate = '2022-12-28') as '入金合計',
(select sum(withdamount) from trans where account = '1115600' and datedate = '2022-12-28') as '出金合計',
(select distinct datedate from trans where datedate = '2022-12-28') as '取引日'
from account 
where account = '1115600';

-- 60.これまで1回の取引で100万円以上の入金があった口座について、口座番号、名義、残高を取得する。
-- ただし、WHERE句でIN演算子を利用した副問い合わせを用いること。
select account, name, balance
from account 
where account in (select distinct account from trans where depoamount >= '1000000');

-- 61.取引テーブルの日付よりも未来の更新日を持つ口座テーブルのデータを抽出する。ただし、
-- WHERE句のALL演算子を利用した副問い合わせを用いること。
select account, name, balance, updatedate
from account 
where updatedate > all (select datedate from trans );

-- 62.次の口座について、入金と出金の両方が発生した日付を抽出する。
-- また、これまでの入金と出金それぞれの最大額もあわせて抽出する。ただしFROM句で副問い合わせを用いること。
-- ・口座番号：3104451

select
t1.datedate as '日付',
t2.de as '入金最大額',
t2.wi as '出金最大額'
from 
trans t1 , 
(select max(t2.depoamount) as de, 
			max(t2.withdamount) as wi 
			from trans t2 
			where t2.account = '3104451' 
			group  by t2.datedate
			having  max(t2.depoamount) is not null 
			and max(t2.withdamount) is not null) as t2
where t1.account = '3104451'
group  by t1.datedate
having  max(t1.depoamount) is not null and max(t1.withdamount) is not null;

-- 63.次の口座について解約の申し出があった。副問い合わせを使って口座テーブルから廃止口座テーブルにデータを登録する。
-- また、口座テーブルの該当データを削除する。ただし、データの整合性を保つことについては考慮しなくてよい。
-- ・口座番号：2761055
 
 merge into canaccount as c 
 using (select account, name,kinds, balance, updatedate from account where account = '2761055') as a
 on (c.account = a.account)
 
 
 insert into canaccount (
 	account, name ,kinds ,canbalance , candate 
 )
 (select account, name,kinds, balance, updatedate from account where account = '2761055');


begin;
insert  into canaccount  (
	account, name , kinds ,canbalance ,candate 
)
values (
	(select account from account where account = '2761055'),
	(select name from account where account = '2761055'),
	(select kinds from account where account = '2761055'),
	(select balance from account where account = '2761055'),
	(select updatedate from account where account = '2761055')
);
delete from account 
where account  = '2761055';
commit;

