This is a modified version of AndroidHive's GCM example android application. This is here to provide a  working example. Eventually we should integrate this style push notifications into android XMPP clients.



--INSTALLATION

In CommonUtilities.java
-Put the address of your webAPI in SERVER_URL

Visit the Google API Console (https://cloud.google.com/console).
- Create a project if you have not already
- Under APIs & auth -> Credentials, copy your client ID and take everything to the left of the first period (EX: if your id is 123456789.apps.googleusercontent.com, your Client ID is 123456789)


In CommonUtilities.java
-Paste your Client ID in SENDER_ID
-Put the address of your webAPI in SERVER_URL

You are done with the example Android application!

--USAGE

When first opening the application, use your XMPP address in the email field. 