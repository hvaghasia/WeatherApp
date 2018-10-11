# Weather App



## Overview

This is a weather app which displays weather and forecast information for given location. It uses OpenWeatherMap API to fetch relevant weather information. 
Temperature values are displayed according to current local. They are localised with MeasureFormatter.
Weather/forecast information Views are displayed according to available device space. Weather header view and forecast view are displayed vertically on Compact-Width + Regular-Height. And they are displayed horizontally on Compact-Height devices.   

- Used Cocoa Frameworks for Model layer and Common Utility classes and added into my main target.
- Swift 4.2 is used to build the application.
- Application is built using MVVM-C design pattern, Protocol oriented programming, Generic Types and functions, modular classes, responsive UI, SOLID principles.

## Design Pattern

**MVVM-C** design patterns is used to build the application. It further enhances testability of code compared to MVVM. In this pattern, **ViewModel** is used to back UIViewController for the data it needs to be displayed on its elements like UIView, CollectionView etc.
ViewModel is backed by 2 services.
First is **Interactor**. Interactor is responsible for fetching the required Model objects from DataManager and modify Model object when user action is received. Basically it directly interact with Models. Here DataManager is generic Type which easily works with Server, Database as per our need. We can switch to any type of DataSource with ease. For that, Dependency Inversion and Open/Close principles(of SOLID principles) is used to implement code which is loosely coupled and can be changed/modified without more changes. This approach is also helpful in Testing as well. Protocol based dependencies are easy to mock in our UnitTest target and we can actually focus on only functionality we want to test.
Second is **Coordinator**. Coordinator is responsible for navigation from one ViewController to another. Everything regarding navigation, passing over dependencies to next ViewController, Instantiating Dependencies are taken care by CoOrdinator.
With this approach, we can implement class which are very modular, loosely coupled and task specific small classes so they can be easily tested.

## Third party Library
- **ObserverSet**
To get notify when any property of ViewModel gets changed and update UI accordingly.
- **Perform**
To achieve dependency injection with Storyboard Segue

## Installation

Once cloned, open WeatherApp.xcodeproj\
Application works on all iOS device whether it is iPhone or iPad  
