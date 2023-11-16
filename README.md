#Giggle Grid

##Overview

Giggle Grid is a dynamic Flutter app that offers a rich selection of jokes sorted by categories. It delivers humor at your fingertips with intuitive navigation, quick search, and the ability to save favorites, all powered by the Chuck Norris API.

##Features

Categories List: Discover various joke categories.
Random Joke by Category: Enjoy a random joke from your chosen category.
Search: Quickly find jokes using keywords.
Favorites: Save and revisit your favorite jokes.

##Getting Started

###Prerequisites

Flutter SDK
Dart SDK
An IDE (preferably Android Studio or Visual Studio Code)
###Installation

###Clone the repository:
git clone https://github.com/sagnik150699/giggle_grid

###Navigate to the project directory:
cd giggle_grid

###Install dependencies:
flutter pub get

###Run the app:
flutter run

##Architecture
Giggle Grid uses the Model-View-ViewModel (MVVM) architecture. This architecture separates the UI (View) from the business logic and data (ViewModel), with the Model representing the data and business logic. It enhances code maintainability and testability, and it perfectly suits Flutter's reactive UI model.

##APIs Used
The app utilizes the following endpoints from the Chuck Norris Jokes API:

###Categories Endpoint: Fetches a list of joke categories.

GET https://api.chucknorris.io/jokes/categories
Random Joke by Category Endpoint: Retrieves a random joke from a specific category.

GET https://api.chucknorris.io/jokes/random?category={category}
Search Endpoint: Searches for jokes containing a specified query.

GET https://api.chucknorris.io/jokes/search?query={query}

##Packages Used

flutter_riverpod: ^2.4.6: For state management, providing a reactive way to manage the app's state.
google_fonts: ^6.1.0: To incorporate a variety of fonts easily.
riverpod: ^2.4.6: As a provider for the state management structure.
flutter_spinkit: ^5.2.0: For adding loading indicators.
logger: ^2.0.2+1: To facilitate easier debugging and logging.
hive: ^2.2.3: For local storage and persisting favorites.
google_nav_bar: ^5.0.6: To create a modern, clean navigation bar.
Folder Structure
The project is structured as follows:


giggle_grid/
├── lib/
│   ├── models/
│   ├── views/
│   ├── view_models/
│   ├── services/
│   └── common/
└── pubspec.yaml