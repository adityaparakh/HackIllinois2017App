#HEAL
‘Uber for people in need of care’
Inspiration:
We inspire to improve the life of people everywhere in the world with the help of compassionate caregivers. We feel, we can make this a world a better place for seniors to live and be respected in. Whenever a person is in need, a caregiver is there to heed.
 
#Purpose:
Our goal is to create a uber-service for caregivers to reach out to people.
Seniors, who fail to receive support from their family or live privately in an isolated place, but require extreme need and care during their feeble age, can use and benefit from this app extensively. Through this iOS app, whenever a person is experiencing moderate to strong symptoms, by typing in the symptoms, he/she is experiencing, into the app; the nearest available caregiver, of the specialized skill set to alleviate the urgent problem, would be contacted and sent to the person immediately . The caregiver would be provided specific information regarding the symptoms the respective person is facing and the possible category of health disease the symptoms may possibly fall into. 
   
#Documentation

#Swift 3 and iOS 10 dependency

All View Controllers are in Views Group in Xcode
There is only one target that is healapp
Use pod file to update dependencies
Run pod update to update your local forked repository to install dependencies
Use xcsworkspace file to open project

 

#How it was built
The caregiver would be provided specific information regarding the symptoms the respective person is facing and the possible category of health disease the symptoms may possibly fall into. For this hack, the information provided to the caregiver, was retrieved from IMO’s database through the use of their API. Using the api key provided by IMO, we were able to request authorization to access data from IMO’s database using specific health-tem keywords. The data obtained, was in the form of JSON (JavaScript Object Notation), and was infused into a REST API. This API was deployed in order to transmit data from the front-end to the back-end and vice versa. Our front-end was built in an iOS platform which is the User Interface for the customers and caregivers that use this app. The database and server for which the caregivers contacts and the customers accounts are stored is in: Firebase.     

#Challenges faced
Requesting authorization from IMO to access their data in their database using the api key and api secret (IPL)
Implementing the REST API in flask
iOS?

#Features

#What we learned
Hackathons involve no sleep
Hackathons are events for beginners to learn and developers to invent and explore
A team can win through teamwork, hardwork and determination


#Future for HEAL
We hope to bring this app into the IOS/ANDROID/WINDOWS OS. We aim to bring this app globally into the market. We are planning on bringing in investors into our team, mainly for funding purposes for advertisement, purchasing servers, expanding the team and business of Heal, and for salaries.

#Technologies used

IMO API
Firebase
Auth
Real Time Database
iOS 10
Mapkit
CoreLocation
Python
Django
REST API
Links
Swift Docuementation: https://developer.apple.com/library/prerelease/content/documentation/Swift/Conceptual/Swift_Programming_Language/

IMO Documentation (IPL):
https://ipldevelopers.e-imo.com/api/

Firebase Documentation:
https://firebase.google.com/docs/

Python Documentation:
https://docs.python.org/3/

To Do List:

Maps
Integrate IMO
Profile Images
Presentation
Preparing Devpost
CS Home Work


