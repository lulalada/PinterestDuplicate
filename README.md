# PinterestDuplicate
Pinterest Duplicate App

This app is a Pinterest duplicate that allows users to view and save their favorite images. The app is built using Swift and it reads from the open source image API Picsum. User favorites are saved using UserDefaults.

Features

* View images from Picsum API
* Save and remove images as favorites
* View and manage favorites list

Installation

* Clone the repository to your local machine
* Open the project in Xcode
* Build and run the app on a simulator or a physical device

Dependencies

This project relies on the following third-party libraries:

* Alamofire: Used for making network requests to the Picsum API
* SwiftyJSON: Used for parsing JSON data received from the Picsum API
* SDImage: Used for downloading and caching images from the Picsum API

These dependencies are managed using Cocoapods. To install the dependencies, run the following command in Terminal from the project directory:

Copy code
pod install

Usage

* Upon opening the app, the user is presented with a grid of images fetched from the Picsum API where they can also save it as a favorite.
* The user can tap on an image to view it in full screen,
* To view saved favorites, the user can navigate to the "Favorites" tab.
* To remove a favorite, the user can click on heart button again
