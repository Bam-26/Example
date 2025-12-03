@echo off
setlocal

:: ============================================================
::  USER CONFIGURATION (YOU MUST EDIT THIS)
:: ============================================================
:: 1. Your MySQL Root Password
set "MYSQL_PASS=root"

:: 2. Your MySQL Bin Path (Where mysql.exe is located)
:: Common default: C:\Program Files\MySQL\MySQL Server 9.1\bin
set "MYSQL_BIN_PATH=C:\Program Files\MySQL\MySQL Server 9.1\bin"

:: ============================================================
::  SYSTEM CONFIGURATION (DO NOT TOUCH)
:: ============================================================
:: This sets the Tomcat path to the "Tomcat" folder right next to this script
set "CATALINA_HOME=%~dp0Tomcat"
set "MYSQL_CMD=%MYSQL_BIN_PATH%\mysql.exe"
set APP_NAME=Login_V
set DB_NAME=LoginVV
set SQL_FILE="LoginVVQuery.sql"
set APP_URL=http://localhost:8080/%APP_NAME%/Login

echo.
echo [STEP 1/3] Checking Database...

:: Check if MySQL path is valid
if not exist "%MYSQL_CMD%" (
    echo [CRITICAL ERROR] mysql.exe not found!
    echo Path checked: "%MYSQL_BIN_PATH%"
    echo Please edit this script and fix the MYSQL_BIN_PATH.
    pause
    exit /b
)

:: Check Connection & Create DB if missing
"%MYSQL_CMD%" -u root -p%MYSQL_PASS% -e "USE %DB_NAME%" >nul 2>&1

if %errorlevel% neq 0 (
    echo    - Database '%DB_NAME%' not found. Creating it...
    
    if exist %SQL_FILE% (
        "%MYSQL_CMD%" -u root -p%MYSQL_PASS% < %SQL_FILE%
        if %errorlevel% neq 0 (
            echo    [ERROR] Failed to create database. Wrong password?
            pause
            exit /b
        )
        echo    - Database created successfully.
    ) else (
        echo    [ERROR] SQL file missing: %SQL_FILE%
        pause
        exit /b
    )
) else (
    echo    - Database exists. Skipping setup.
)

echo.
echo [STEP 2/3] Preparing Server...

if not exist "%CATALINA_HOME%\webapps" (
    echo [ERROR] Portable Tomcat folder is missing or corrupt!
    echo Expected at: "%CATALINA_HOME%"
    pause
    exit /b
)

:: Copy WAR to the portable Tomcat
copy /Y "%~dp0%APP_NAME%.war" "%CATALINA_HOME%\webapps\" >nul
echo    - Application deployed to portable server.

echo.
echo [STEP 3/3] Launching System...

if exist "%CATALINA_HOME%\bin\startup.bat" (
    call "%CATALINA_HOME%\bin\startup.bat"
) else (
    echo [ERROR] Tomcat startup script not found!
    pause
    exit /b
)

echo    - Waiting 15 seconds for server startup...
timeout /t 15 /nobreak >nul

echo    - Opening Browser...
start "" "%APP_URL%"

echo.
echo ==========================================
echo        SYSTEM RUNNING
echo ==========================================
echo To stop the system, close the black Tomcat window.
pause