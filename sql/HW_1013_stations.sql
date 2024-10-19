/*全省各站點2022年進站總人數*/
SELECT *
FROM station_in_out;

SELECT *
FROM station_in_out in_out JOIN stations s ON in_out.staCode = s.stationcode;/*幫表格取名*/

SELECT date AS 日期,
       gateincomingcnt AS 進站人數,
	   gateoutgoingcnt AS 出站人數,
	   stationname AS 站名,
	   stationaddress AS 站址,
	   stationtel AS 電話
FROM station_in_out in_out JOIN stations s ON in_out.staCode = s.stationcode;

SELECT 
    stationname AS 站名, 
    SUM(gateincomingcnt) AS 進站人數
FROM 
    stations,station_in_out
WHERE 
    date >= '2022-01-01' AND date < '2023-01-01'
GROUP BY 
    stationname
ORDER BY 
    stationname;

/*全省各站點2022年進站總人數大於5佰萬人的站點*/
SELECT 
    s.stationname AS 站名, 
    SUM(sio.gateincomingcnt) AS 進站人數
FROM 
    station_in_out sio
JOIN 
    stations s ON sio.stacode = s.stationcode
WHERE 
    sio.date >= '2022-01-01' AND sio.date < '2023-01-01'
GROUP BY 
    s.stationname
HAVING 
    SUM(sio.gateincomingcnt) > 5000000
ORDER BY 
    進站人數 DESC;


/*基隆火車站2020年,每月份進站人數*/
SELECT 
    DATE_TRUNC('month', sio.date) AS month, 
    SUM(sio.gateincomingcnt) AS total_gateincomingcnt
FROM 
    station_in_out sio
JOIN 
    stations s ON sio.stacode = s.stationcode
WHERE 
    s.stationname = '基隆' 
    AND sio.date >= '2020-01-01' 
    AND sio.date < '2021-01-01'
GROUP BY 
    month
ORDER BY 
    month;

/*基隆火車站2020年,每月份進站人數,由多至少*/
SELECT 
    DATE_TRUNC('month', sio.date) AS month, 
    SUM(sio.gateincomingcnt) AS total_gateincomingcnt
FROM 
    station_in_out sio
JOIN 
    stations s ON sio.stacode = s.stationcode
WHERE 
    s.stationname = '基隆' 
    AND sio.date >= '2020-01-01' 
    AND sio.date < '2021-01-01'
GROUP BY 
    month
ORDER BY 
    total_gateincomingcnt DESC;


/*基隆火車站2020,2021,2022,每年進站人數*/
SELECT 
    EXTRACT(YEAR FROM sio.date) AS year, 
    SUM(sio.gateincomingcnt) AS total_gateincomingcnt
FROM 
    station_in_out sio
JOIN 
    stations s ON sio.stacode = s.stationcode
WHERE 
    s.stationname = '基隆' 
    AND sio.date >= '2020-01-01' 
    AND sio.date < '2023-01-01'
GROUP BY 
    year
ORDER BY 
    year;

/*基隆火車站,臺北火車站2020,2021,2022,每年進站人數*/
SELECT 
    EXTRACT(YEAR FROM sio.date) AS year, 
    s.stationname, 
    SUM(sio.gateincomingcnt) AS total_gateincomingcnt
FROM 
    station_in_out sio
JOIN 
    stations s ON sio.stacode = s.stationcode
WHERE 
    s.stationname IN ('基隆', '臺北') 
    AND sio.date >= '2020-01-01' 
    AND sio.date < '2023-01-01'
GROUP BY 
    year, s.stationname
ORDER BY 
    year, s.stationname;

/*請使用SubQuery 進站人數最多的一筆*/
SELECT 
    s.stationname, 
    sio.gateincomingcnt
FROM 
    station_in_out sio
JOIN 
    stations s ON sio.stacode = s.stationcode
WHERE 
    sio.gateincomingcnt = (
        SELECT MAX(gateincomingcnt) 
        FROM station_in_out
    )
LIMIT 1;
/*請使用SubQuery 各站點進站人數最多的一筆*/
SELECT 
    s.stationname, 
    sio.gateincomingcnt
FROM 
    station_in_out sio
JOIN 
    stations s ON sio.stacode = s.stationcode
WHERE 
    sio.gateincomingcnt IN (
        SELECT MAX(gateincomingcnt)
        FROM station_in_out
        WHERE stacode = sio.stacode
        GROUP BY stacode
    );


