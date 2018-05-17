# Setup Scripts

These scripts are very simple and can be run with a single command. They are broken up into two parts, one script to download the data and enter it into the database. And a second to run a series of sql scripts that will process all the raw tables of wikipedia data into three tables: page, link, and request.

## Download Scripts
First, edit  `urls.txt` and for every file you'd like to import into the database, add a new line containing the url and the name of the database table separated by a space.

After that, run the script by using the following command, replacing the sql parameters with what's relevant to your mysql database:

`source import.sh "-u root -ppassword -P 3306 -h myhost.website.com" wikiworld < urls.txt` 

The first argument is your mysql parameters and your second argument is the name of the database you'd like to import to.

After this your database will have a new table for each line in urls.txt

## SQL Process Scripts
First, edit `tables.txt` and for each table you'd like to process (likely all the ones from part 1) add a new line containing the name of the table and the data in the form of 'yyyy-mm-dd' for the date given to all entries of that table. 

After that, run the script by using the following command, replacing the sql parameters with what's relevant to your mysql database: 

`source process.sh "-u root -ppassword -P 3306 -h myhost.website.com" wikiworld < tables.txt` 

The first argument is your mysql parameters and your second argument is the name of the database you'd like to import to.
**Warning**: This statement will drop any existing page, link, and request tables in your database. If you already have valid data in there, edit the script first!!

This will create 3 indexed tables that relate to eachother where you can start making awesome queries!

**Notes**
- All database tables must start with a letter, not a number
- This download script assumes the columns  of all downloaded files are of the form (src: text, dest: text, type: text, count: integer). If any files don't follow this format, either edit the script or simply create the tables in your database beforehand. 
- The SQL process script also assumes that all tables are of form listed above. 
