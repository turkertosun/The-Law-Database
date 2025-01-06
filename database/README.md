

## Installation and Setup

### Step 1: Install and Launch MAMP
1. Launch MAMP and click **Start Servers**.

### Step 2: Verify MySQL Port and Credentials
1. In MAMP, navigate to **Preferences > Ports**.
   - Default MySQL Port: `3306`
2. Note the default MySQL credentials:
   - **Username:** `root`
   - **Password:** `root`

---

## Creating and Importing the Database

### Step 1: Open MySQL Workbench
1. Launch MySQL Workbench and connect to your server:
   - **Host:** `localhost`
   - **Port:** `3306` (or the port from MAMP)
   - **Username:** `root`
   - **Password:** `root`

### Step 2: Create a New Database
1. In MySQL Workbench, go to **Navigator > Administration > Schemas**.
2. Click the **Create Schema** icon (cylinder with a `+` symbol).
3. Name the schema (e.g., `project_db`) and click **Apply**.

### Step 3: Import the SQL Dump File
1. Download the provided SQL file (`lawdb.sql`).
2. In MySQL Workbench:
   - Go to **File > Open SQL Script**.
   - Select the `lawdb.sql` file.
   - Execute the script by clicking the **lightning bolt** icon.
3. Verify that the tables and data have been imported successfully:
   - Refresh the schemas panel by right-clicking and selecting **Refresh All**.


