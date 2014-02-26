This is a modified version of AndroidHive's GCM example web backend. This is here to provide a (very) insecure working demostration. Eventually we will replace this with our own web backed or have Prosody send the GCM request on its own. :)

--INSTALLATION

Upload these files to your webserver. 

Import the SQL file into a MySQL database.

Put the MySQL credentials for the database in config.php

Visit the Google API Console (https://cloud.google.com/console).
- Create a project if you have not already
- Under APIs & auth, click on APIs and turn on Google Cloud Messaging for Android
- Under Credentials, click on Create New Key, choose Server Key, copy this key and put in into config.php

You are done with the web API!