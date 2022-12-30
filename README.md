# Swapiswift

This is a collection of various Swift architectural patterns to building the same app - one which reads people data from the open source Swapi (Star Wars API). This is done to explore, learn, and showcase different design patterns and technologies.

## Feature summary by points 

* From a user perspective the apps are identical
* The app main screen is a list of people from the Star Wars universe
* The list of people has pagination and can be scrolled to load more people as needed
* Each person can be tapped to present some details about that person 

## Projects 

**Classic MVC** utilises the classic Model View Controller pattern in a traditional manner. 

* IBOutlets are hooked directly up to the view controller
* Storyboards are completely ignored in favour of initialising and managing each view controller from its own xib. 

**Modern MVC** avoids the 'Massive View Controller' problem by making use of Models, Model Protocols, Views, and View Protocols. This also encapsulates the models better allowing for far greater testability.

* View Controllers do not have their own xibs. Rather, they have their main `view` property replaced by a custom `UIView` object which conforms to a corresponding view protocol
* View Controllers take a view protocol and a model protocol as their main boilerplate. All operations then take place in the model, with the only code in the View Controller to facilitate communication between the view and the model where needed.
* The Main storyboard is used to abstractly lay out the navigation flow of view controllers and to assign their main `view` to the right class. This means the Storyboard itself should not be a frequently edited object (if, for example, in a larger team) as it would only be modified when new view controllers are added or new navigation flows are defined.