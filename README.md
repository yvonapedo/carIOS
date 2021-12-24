# carIOS

CST 2018

IOS Development Technology
Final project examination



1. Project description
1.1 Project purpose (why do you do this project)

My iOS project is a “KOMI.” application that is purposed to link people all over the world. It’s a Car selling app. That allows users to post cars for sale and allow other users to buy or borrow it.
First, you need to sign up(register) using your username and a password. Then you can login using your USERID and the PASSWORD you just created. If it’s correct, Login will be successful.
Second, you see all the available cars on the homepage. You also view details of every car posted. You can also add new cars for other users to see. 
Third, you also see all the cars you’ve rented before. You can also cancel them.
In addition, you can see all your friend’s users in your contacts. 

1.2	Introduction to the technology used (what technology is used)
MYSQL

JSP- INTELLIJ
Xcode -MACOS
  

2. Development process:
MAIN STORYBOARD
 
SET-UP
Create an iOS project dubbed “carHttp”
Import Alamofire into the project
Add the framework to the project then build the project to load the framework into the project.
NB The URL connecting the iOS app to the server is in the “rootAddress” class.





2.1 First UI : FIRST 
（1）Screenshot of operation interface：
 
（2）Implementation code or implementation process description：
Add 1 Image view element and 2 buttons to the view on the storyboard.
Reference all the 3 elements on the viewController as shown below. 
Add “triggered Segues” to the login button and the register button.
 

2.2 Second UI: LOGIN
（1）Screenshot of operation interface：
  
（2）Implementation code or implementation process description：
Add 2 text fields, 1 image view, 1 label and 1 button
Reference the outlets in the viewController. Add the touch_down action to the login button.
When the user click on the login button, the system get all the users records in to the userArray. Then later check through the array if the userid and the password match using the filter function.
  


2.3 Third UI: REGISTER
（1）Screenshot of operation interface：
  
（2）Implementation code or implementation process description：
Add all the necessary element to the storyboard, text fields, labels and buttons. Reference the outlets on the view controller. And add touch_down action to the button. To register the user, we Alamofire Request function that includes the servlet url, the method and the parameter user.
After success, the user info can be found in the list of the users on the Users tab.
 

Upload picture function contains Alamofire upload function
  
2.4	Fourth UI:
(1)	Screenshot of operation interface：
   

(2)	Implementation code or implementation process description：
Add a carsViewCollection to the UI, and one segmented control with 4 segments
Reference the segmented control on the view controller.
Data is retrieved from the database through the intermediary of the servlet. Alamofile is also used to access thet server.
 
The sorting is done based on the index of the selected segment. I have a function “selectEngine” that sort the data and saves it in a new array. Then on the value_change action of the segmented control we call the selectEngine according to the index.
 
To display the details UI, we need to add a new carDetailTableViewController. Then add the relevant items on the table. Later reference the outlets in the viewController
 
 2.5 Fifth UI: ADD CAR
(1)  Screenshot of operation interface：
  
(2)  Implementation code or implementation process description：
When you click the “+” button on the CarViewController, the AddCarrTableViewControl will appear. It is for adding new car to the collection
Alamofire is use to implement the save Car just like the register 
  




 2.6 Sixth UI: RENTALS
(1)  Screenshot of operation interface：
   
(2)  Implementation code or implementation process description：
To display the list of all the rentals we use tableViewController. 
The data is from the server using AF.request(..)
To delete the row we need to implement another function that will delete it the server.
  

 2.7 Seventh UI:
(1)  Screenshot of operation interface：
   
(2)  Implementation code or implementation process description：
To display the list of all the rentals we use tableViewController. The data is from the server using AF.request(..). To View the details of a user, we need to to add another table view UserTableViewController. Then implement view Detail we need “Segue” to the new viewcontroller, then in the select function we pass sender value to the other controller.
The search is based on the valueDidChange action of the search bar. Function down bellow.
   

