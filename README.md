# CakeItApp

Build Details

Using Swift 5 for developemnt
Using XCode 12.5
Using UIKit, Storyboards, URLsession, Combine.
Architecture

This is using MVVM_C repository pattern.
Code Structure

Module layer

This contains diffent Modules of app , currenlty there are two modules, Cake Details and Cakes List.

 **View** 
 
    This has view controller and cell for needed tableviews or collection views. 
    Each view controller has its own view model and inserted as dependency from coordinator.
    
    
 **ViewModel**
 
    ViewModel object is created in coordinator and inserted as dependency to viewControllers
    ViewModel communicates to views view databindign using Combine. 
    
    
 **Model**
 
    these are structs which satisfy codable protocol to decode data from JSON. 
Networking layer

This contains Generic Network layer which supports GET and POST request. Returns completion block with data or error.

Coordinator

Using only one Main coordinator in project
This handles view navigation from start of app to next view. 
Unit Tests

Unit test are done using XCTest framework
Unit test cases are written for business logic present in ViewModel.
Mock Repository layer is created to test REST API calls and data is stubed from locally stored json file
