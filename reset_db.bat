@echo off
setlocal

:: ============================================================
:: CONFIGURATION (COPY THESE FROM YOUR RUN.BAT)
:: ============================================================
set MYSQL_PASS=root
set MYSQL_BIN_PATH=C:\Program Files\MySQL\MySQL Server 8.0\bin
:: ============================================================

set MYSQL_USER=root
set DB_NAME=LoginVV
set MYSQL_CMD="%MYSQL_BIN_PATH%\mysql.exe"

echo.
echo [WARNING] This will DELETE ALL ACCOUNTS and RESET the database.
echo.
pause

echo.
echo [STEP 1/2] Dropping existing database...

:: Check if mysql exists
if not exist %MYSQL_CMD% (
    echo [ERROR] mysql.exe not found at: %MYSQL_BIN_PATH%
    pause
    exit /b
)

:: Run the DROP command
%MYSQL_CMD% -u%MYSQL_USER% -p%MYSQL_PASS% -e "DROP DATABASE IF EXISTS %DB_NAME%;" 2>nul

if %errorlevel% equ 0 (
    echo    - Database '%DB_NAME%' has been deleted.
) else (
    echo    [ERROR] Could not delete database. Check your password.
    pause
    exit /b
)

echo.
echo [STEP 2/2] Recreating fresh database...

:: We simply run the SQL file again
if exist "LoginVVQuery.sql" (
    %MYSQL_CMD% -u%MYSQL_USER% -p%MYSQL_PASS%