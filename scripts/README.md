# Download scripts

These scripts are very simple and can be run with a single command.

First, edit  `urls.txt` and for every file you'd like to import into the database, add a new line where the first line is the url and the name of the database table separated by a space.

After that, run the script by using the following command:

`source import.sh "-u root -ppassword -P 3306 -h myhost.website.com" wikiworld < urls.txt` 

The first argument is your mysql parameters and your second argument is the name of the database you'd like to import to.


**Notes**
- All database tables must start with a letter, not a number
- This script assumes the columns  of all downloaded files are of the form (src: text, dest: text, type: text, count: integer). If any files don't follow this format, either edit the script or simply create the tables in your database beforehand.
