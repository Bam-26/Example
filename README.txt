================================================================================
                        LOGIN SYSTEM - PORTABLE EDITION
================================================================================

Thank you for downloading the Login System. 
This package includes a portable server, so you do not need to install Apache Tomcat.

--------------------------------------------------------------------------------
1. PREREQUISITES (REQUIRED SOFTWARE)
--------------------------------------------------------------------------------
Please ensure the following are installed on your computer:

[1] Java Development Kit (JDK) - Version 11 or higher
    - Download: https://adoptium.net/temurin/releases/?version=11
    - Note: Select the ".msi" installer for Windows.

[2] MySQL Community Server
    - Download: https://dev.mysql.com/downloads/installer/
    - CRITICAL NOTE: During installation, you MUST set the "Root Password" to: root
      (The system is pre-configured to use 'root' as the password).

--------------------------------------------------------------------------------
2. SETUP (DO THIS ONCE)
--------------------------------------------------------------------------------
1.  Open this folder.
2.  Right-click "run.bat" and select "Edit".
3.  Update the top section to match the specific settings below:

    set MYSQL_PASS=root
    set MYSQL_BIN_PATH=C:\Program Files\MySQL\MySQL Server 8.0\bin

    (If you don't know your bin path, open File Explorer and search for "mysql.exe")

4.  Save and close the file.

--------------------------------------------------------------------------------
3. HOW TO RUN
--------------------------------------------------------------------------------
1.  Double-click "run.bat".
2.  Two terminals will appear (this is the server).
3.  The system will automatically:
    - Connect to your database.
    - Create the necessary tables (if they don't exist).
    - Launch your web browser to the login page.

To stop the system, simply close the terminals.

--------------------------------------------------------------------------------
4. VIEWING THE SOURCE CODE
--------------------------------------------------------------------------------
The full source code is provided in the 'Source Code/LoginV' folder. To view it:

1.  Ensure you have Eclipse IDE (with Java EE support) installed.
2.  In Eclipse, go to **File** → **Import**.
3.  Select **General** → **Existing Projects into Workspace**.
4.  For the "Select root directory" prompt, browse to the **Source Code/LoginV** folder.
5.  Click **Finish**.

The entire project structure, including all Java files (Servlets, DAO, etc.) and JSPs, will be visible in the Project Explorer.

--------------------------------------------------------------------------------
5. TOOLS & TROUBLESHOOTING
--------------------------------------------------------------------------------
* reset_db.bat:
  - Run this if you want to DELETE ALL ACCOUNTS and reset the database to fresh.
  - MUST run the "run.bat" file again after resetting the db.
  - WARNING: This cannot be undone.

* "Access Denied" Error:
  - This means your MySQL password is not "root". 
  - TO FIX THIS: Open the "MySQL Command Line Client", enter the password you 
    created during installation, and run this exact command:
    
    ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';

* "mysql.exe not found":
  - You need to install MySQL, or correct the "MYSQL_BIN_PATH" in the script.