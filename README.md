# TMDb

# Setup instruction:
To get an API key: 

  -> need to create an account on https://www.themoviedb.org/
  
  -> Then go to Settings -> API -> Choose between professional and developer as per your need
  
  -> Then fill in all the details about your application and save it you will get an API Key

Dependency:
  -> SDWebImageSwiftUI -> https://github.com/SDWebImage/SDWebImageSwiftUI for image loading
  
# Features:
  minimum support version: iOS 16
  
  device support: iPhone and iPad
  
  support both Dark and Light mode
  
  language used: SwiftUI
  
  IDE used: Xcode 16.0
  
  architecture used: MVVM
  
  package manager: SPM
  
# Functionality
  -> fetching popular movies using URLSession and showing in List. This list has the movie poster, title, rating, and release date.
  
      API used: 
          https://api.themoviedb.org/3/movie/popular?api_key=API_KEY to fetch movies
          https://image.tmdb.org/t/p/w154/POSTER_PATH to show an image using SDWebImageSwiftUI (used w154 as poster size, suitable for compact views like list items)
          
        
  -> fetching movie data using URLSession when clicking on the list cell. This detail page has the movie title, duration, rating, trailer, plot, cast, and genre(s)
  
      API used:
          https://api.themoviedb.org/3/movie/MOVIE_ID?api_key=API_KEY for movie details
          https://api.themoviedb.org/3/movie/MOVIE_ID?api_key=API_KEY&append_to_response=credits for movie cast
          https://api.themoviedb.org/3/movie/MOVIE_ID?api_key=API_KEY&append_to_response=videos for movie trailer
          
  -> WebView is used to show the trailer. And if there are multiple trailers associated with a movie then it is shown in a TabView. To show cast and genre, a horizontal scroll view is used

  -> Custom star view is used to show movie ratings on the detail page.
  
  -> API key is stored in plist file.
  

