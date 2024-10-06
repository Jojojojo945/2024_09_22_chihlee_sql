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
           * Username: render_jo_user
           * Host name/address: dpg-crnslqm8ii6s73evgni0-a.singapore-postgres.render.com
           * PW: DEbN3GhqIMg5eM2cXJeq45XKsRHJWEB4 (Save Password)


---

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


   

