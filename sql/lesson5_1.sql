SELECT *
FROM stations;

SELECT *
FROM station_in_out;

/*全省各站點2022年進站總人數*/
SELECT stationname AS 站名, SUM (gateincomingcnt) AS 總進站人數
/* 兩個表格的欄位名不一樣，可以省略表格名稱"stations."和"station_in_out."
FROM stations JOIN station_in_out ON stations.stationcode = station_in_out.stacode;*/
FROM stations JOIN station_in_out ON stationcode = stacode
/*WHERE date BETWEEN '2022-01-01' AND '2022-12-31';*/
/*WHERE EXTRACT (YEAR FROM date) = 2022 AND stationname = '基隆'
基隆有365筆，要合并一起計算總數要用GROUP BY
*/
WHERE EXTRACT (YEAR FROM date) = 2022
GROUP BY 站名/*SELECT要用聚合函數SUM (gateincomingcnt) AS 總進站人數，沒有用的話會出錯*/
ORDER BY 總進站人數 DESC;


/*全省各站點2022年進站總人數大於5佰萬人的站點*/
SELECT stationname AS 站名, SUM (gateincomingcnt) AS 總進站人數
FROM stations JOIN station_in_out ON stationcode = stacode
WHERE EXTRACT (YEAR FROM date) = 2022
GROUP BY 站名
/*HAVING 總進站人數 >=5000000 - 不能這樣用，要用聚合函數*/
HAVING SUM (gateincomingcnt) >=5000000
ORDER BY 總進站人數 DESC;


/*基隆火車站2020年,每月份進站人數*/
SELECT stationname AS 站名,
	   /*date AS 日期, 加日期才看得到每日進站人數*/
	   TO_CHAR(date, 'YYYY-MM') AS 日期,
	   SUM(gateincomingcnt) AS 當月總進站人數
FROM stations JOIN station_in_out ON stationcode = stacode
WHERE EXTRACT (YEAR FROM date) = 2020 AND stationname = '基隆'
GROUP BY 站名, 日期; /*要先把gateincomingcnt AS 每日進站人數用聚合函數才不會出錯*/


/*基隆火車站2020年,每月份進站人數,由多至少*/
SELECT stationname AS 站名,
	   TO_CHAR(date, 'YYYY-MM') AS 日期,
	   SUM(gateincomingcnt) AS 當月總進站人數
FROM stations JOIN station_in_out ON stationcode = stacode
WHERE EXTRACT (YEAR FROM date) = 2020 AND stationname = '基隆'
GROUP BY 站名, 日期
ORDER BY SUM(gateincomingcnt) DESC;


/*基隆火車站2020,2021,2022,每年進站人數*/
SELECT stationname AS 站名, 
	   EXTRACT (YEAR FROM date) AS 年份,
	   SUM(gateincomingcnt) AS 每年進站人數
FROM stations JOIN station_in_out ON stationcode = stacode
WHERE EXTRACT (YEAR FROM date) IN (2020, 2021, 2022) AND stationname = '基隆'
/*IN()後面可以加多個年份*/
GROUP BY 站名,年份; /*只有GROUP BY 年份沒有站名會出錯*/

/*基隆火車站,臺北火車站2020,2021,2022,每年進站人數*/
SELECT stationname AS 站名, 
	   EXTRACT (YEAR FROM date) AS 年份,
	   SUM(gateincomingcnt) AS 每年進站人數
FROM stations JOIN station_in_out ON stationcode = stacode
WHERE EXTRACT (YEAR FROM date) IN (2020, 2021, 2022) AND stationname IN ('基隆', '臺北')
GROUP BY 站名,年份;

/*請使用SubQuery 進站人數最多的一筆*/
SELECT stationname AS 站名, gateincomingcnt AS 進站人數
FROM stations JOIN station_in_out ON stationcode = stacode
WHERE gateincomingcnt = (
	SELECT MAX(gateincomingcnt)
	FROM station_in_out
);


/*請使用SubQuery 各站點進站人數最多的一筆*/
SELECT name, date, gateincomingcnt
FROM stations JOIN station_in_out ON stationcode = stacode
/*一筆資料用"="; 有多筆的話用IN; 多筆對多筆用IN()*/
WHERE (stationname, gateincomingcnt) IN (
	SELECT stationname AS 站名, MAX(gateincomingcnt) AS 最多人數
	FROM stations JOIN station_in_out ON stationcode = stacode
	GROUP BY 站名
)
ORDER BY gateincomingcnt;

/*先按照正常程序寫出來後再用SubQuery*/
SELECT stationname AS 站名, MAX(gateincomingcnt) AS 最多人數
FROM stations JOIN station_in_out ON stationcode = stacode
GROUP BY 站名;

SELECT * /*用*看所有欄位再決定要用哪些欄位*/
FROM stations JOIN station_in_out ON stationcode = stacode
/*一筆資料用"="; 有多筆的話用IN; 多筆對多筆用IN()*/
WHERE (stationname, gateincomingcnt) IN (
	SELECT stationname AS 站名, MAX(gateincomingcnt) AS 最多人數
	FROM stations JOIN station_in_out ON stationcode = stacode
	GROUP BY 站名
);


