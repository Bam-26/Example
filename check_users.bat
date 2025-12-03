@echo off
setlocal

:: ============================================================
:: CONFIGURATION (COPY THIS FROM YOUR RUN.BAT)
:: ============================================================
set MYSQL_PASS=root
set MYSQL_BIN_PATH=C:\Program Files\MySQL\MySQL Server 8.0\bin
:: ============================================================

set MYSQL_USER=root
set DB_NAME=LoginVV
set MYSQL_CMD="%MYSQL_BIN_PATH%\mysql.exe"

:: Check if mysql exists
if not exist %MYSQL_CMD% (
    echo [ERROR] mysql.exe not found at: %MYSQL_BIN_PATH%
    pause
    exit /b
)

echo.
echo ========================================================
echo        REGISTERED ACCOUNTS IN DATABASE: %DB_NAME%
echo ========================================================
echo.

:: Run the SELECT command
:: The '-t' flag formats the output as a nice table
%MYSQL_CMD% -u%MYSQL_USER% -p%MYSQL_PASS% -e "USE %DB_NAME%; SELECT userId, username, email, fullName, created_at FROM users;" -t

echo.
echo ========================================================
pause