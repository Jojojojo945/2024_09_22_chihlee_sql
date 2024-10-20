# 2024_09_22_chihlee_sql
2024_09_22_Python+SQL course

---

## Course Link
https://meet.google.com/zfb-kupf-nok

---

## Before Class Start
### GitHub
1. Download [GitHub Desktop](https://desktop.github.com/download/)
2. Create GitHub Folder
3. Clone Repository
 
### VS Code
1. Download [VS Code](https://code.visualstudio.com/download)
2. Configure language (Optional)
   * Command Palette > Display (Configure display language)
3. AutoSave
   * Setting > AutoSave > AfterDelay
4. Profile
   * 啓用遠端通道存取 > 開啓此工作階段 > 利用GitHub登入
   * 利用GitHub登入

### Git
1. Download [Git](https://git-scm.com/downloads)
   * click "Next" until "Install" appear. Tik "Enable option".
2. VS Code > 開啓 GitHub資料夾 > 2024_09_22_chihlee_sql

### PG Admin
1. 插入網卡
2. Login
   * SSID: A590301
   * PW: A590301AA
3. Download [pgAdmin4](https://www.pgadmin.org/download/)  
4. Register Server
   * Local
     1. General
        * Name: RP_a27
     2. Connection
        * Host name/address: piRobert0301.local
        * Username: a27 (lower case)
        * PW: raspberry (Save password)
   * Render
     1. Login Render
     2. External Database URL (postgresql://render_jo_user:DEbN3GhqIMg5eM2cXJeq45XKsRHJWEB4@dpg-crnslqm8ii6s73evgni0-a.singapore-postgres.render.com/render_jo)
     3. Register
        1. General
           * Name: render_jo
        2. Connection
           * Host name/address: dpg-crnslqm8ii6s73evgni0-a.singapore-postgres.render.com
           * Username: render_jo_user
           * PW: DEbN3GhqIMg5eM2cXJeq45XKsRHJWEB4 (Save Password)

### MiniConda
1. Download [MiniConda] (https://docs.anaconda.com/miniconda/#miniconda-latest-installer-links)
2. Check **2nd** option for install.
3. After installation, open Anaconda Prompt
4. Open [file] (https://github.com/roberthsu2003/python/tree/master/mini_conda)
5. conda init
	* conda init --all bash
	* close window and reopen Anaconda Prompt
6. 取消terminal一開始就進入base虛擬環境
	* conda config --set auto_activate_base false
	* close window and reopen Anaconda Prompt and VS Code


---

### Backup pgAdmin4 database
* pgAdmin4 > Schemas > Table
* render_jo> right click > Backup
* Backup
	* Create file name
   	* Format > Directory
   	* Encoding > UTF8

### Restore pgAdmin4 database
Restore > RP_a27_mydatabase_a27_restore
* Format > Directory
* File > Backup folder



### CREATE TABLE
```
 CREATE TABLE IF NOT EXISTS stations (
    id SERIAL PRIMARY KEY,
    code VARCHAR(5) NOT NULL UNIQUE,
    name VARCHAR(10) NOT NULL UNIQUE,
    e_name VARCHAR(50)
	);

ALTER TABLE stations
ALTER COLUMN name 
type VARCHAR(15);

DROP TABLE IF EXISTS stations;

```
#### Import/Export Data
1.  General
    * Filename > Select File
    * Format > CSV
    * Encoding > UTF8
2. Options
    * Header > turn on
3. Columns
    * remove id


### SQL 關鍵字
順序
1. SELECT 選取
2. FROM 來源
3. WHERE 條件
4. GROUP BY 分組
5. HAVING 條件
6. ORDER BY 順序
7. LIMIT 筆數限制

---
### HW - 1006
* Restore dvdrental folder in pgAdmin4 database, then don't need to create customer table.
```
DROP TABLE IF EXISTS customer;

CREATE TABLE IF NOT EXISTS customer(
	customer_id int,
	store_id int,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	email VARCHAR(100),
	address_id int,
	activebool VARCHAR(10),
	create_date date,
	last_update timestamp,
	active boolean
	);

SELECT *
FROM customer;

/*first_name為Jamie*/
SELECT *
FROM customer
WHERE first_name = 'Jamie';

/*first_name是Jamie,同時last_name是Rice*/
SELECT *
FROM customer
WHERE first_name = 'Jamie' AND last_name = 'Rice';

/*last_name是Rodriquez 或者 first_name是Adam*/
SELECT *
FROM customer
WHERE last_name = 'Rodriquez' OR first_name = 'Adam';

/*取出first_name是Ann,Anne,Annie*/
SELECT *
FROM customer
WHERE first_name = 'Ann' OR first_name = 'Anne' OR first_name = 'Annie';

/*取出字串開頭是Ann的first_name*/
SELECT *
FROM customer
WHERE first_name LIKE 'Ann%';

/*取出first_name第1個字元是A,同時first_name的字元長度是3到5的資料*/
SELECT *
FROM customer
WHERE first_name LIKE 'A%' AND LENGTH(first_name) BETWEEN 3 AND 5;

/*取出first_name,前3字為Bra,但last_name不是Motley*/
SELECT *
FROM customer
WHERE first_name LIKE 'Bra%' AND last_name NOT LIKE 'Motley';

```


