SELECT *
FROM stations;

SELECT *
FROM station_in_out;

/*全省各站點2022年進站總人數*/
SELECT stationname as 站名
/* 兩個表格的欄位名不一樣，可以省略表格名稱"stations."和"station_in_out."
FROM stations JOIN station_in_out ON stations.stationcode = station_in_out.stacode;*/
FROM stations JOIN station_in_out ON stationcode = stacode
/*WHERE date BETWEEN '2022-01-01' AND '2022-12-31';*/
WHERE EXTRACT (YEAR FROM date) = 2022;


/*全省各站點2022年進站總人數大於5佰萬人的站點*/



/*基隆火車站2020年,每月份進站人數*/


/*基隆火車站2020年,每月份進站人數,由多至少*/



/*基隆火車站2020,2021,2022,每年進站人數*/


/*基隆火車站,臺北火車站2020,2021,2022,每年進站人數*/


/*請使用SubQuery 進站人數最多的一筆*/

/*請使用SubQuery 各站點進站人數最多的一筆*/

