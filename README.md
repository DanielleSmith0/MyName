_MyName_ is a mobile iOS app, made with XCode/Swift. The views are made entirely with UIKit. The purpose of the app is so the user can research the meaning and history behind their first, middle, and last name all at once. 
This app has 2 views. The initial, main view comes with 4 optional input text fields, so up to 4 names (the user's full name if they have two middle names) can be looked up simultaniously.
When the "Submit" button is pressed, the user is immediately taken to the second view, a scroll view of the individual names' definitions and histories. In this view, there is also a “back” button that will return to the user to the first view with cleared text fields to fill again.
If an obscure or made up name is submitted, the user will be given this message in the second view: “(Name)! A mystery to discover. Perhaps check your family history.” 

This app is a great conversation starter and fun way to connect with friends, and even understand a little more about yourself and your background. 
Because there are no APIs to a name dictionary, which is needed for the name data, Python was used to web scrape for the meanings and histories, which were converted into a Swift core database. 

Idea for future expansion: adding a dictionary API to be accessed for people whose names are not typical names, but are still words, such as “Sunshine” for a middle name. 
