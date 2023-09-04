
# My Weather App

My Weather App is a Flutter-based mobile application that provides users with up-to-date weather information for Islamabad city and a five-day weather forecast. It leverages two free APIs, OpenWeather for daily forecasts and AccuWeather for extended forecasts, to deliver accurate and detailed weather data. This README file will guide you through the project structure, how to set up the app, and any additional information you need to know.

## Features

- Current weather information for Islamabad, including temperature, weather condition, wind speed, and more.
- Display of sunrise and sunset times, humidity, and visibility.
- A dynamic, rotating sun icon on the starting screen to add visual appeal.
- Daily forecasts for Islamabad with details such as date, day of the week, and maximum temperature.
- A sleek and user-friendly interface with dark mode support.

## Getting Started

Before you can run the app, follow these steps to set up your development environment:

1. **Flutter Installation:** Ensure you have Flutter installed on your system. You can follow the installation instructions on the [official Flutter website](https://flutter.dev/docs/get-started/install).

2. **Clone the Repository:** Clone this GitHub repository to your local machine using Git:

   ```bash
   git clone https://github.com/your-username/my_weather_app.git
   ```

3. **API Keys:**
   - You need to obtain API keys from both OpenWeather and AccuWeather to fetch weather data. Follow these links to sign up for free API access:
     - [OpenWeather](https://openweathermap.org/api)
     - [AccuWeather](https://developer.accuweather.com/apis)

4. **Configure API Keys:**
   - Once you have obtained the API keys, create a file named `secrets.dart` inside the `lib` directory of the app.
   - In `secrets.dart`, define your API keys as constants:

   ```dart
   const String openWeatherApiKey = 'YOUR_OPENWEATHER_API_KEY';
   const String accuWeatherApiKey = 'YOUR_ACCUWEATHER_API_KEY';
   ```

5. **Dependencies:** Install the required dependencies using the following command inside the project directory:

   ```bash
   flutter pub get
   ```

6. **Run the App:** Start the app using the following command:

   ```bash
   flutter run
   ```

The app should now be running on your emulator or physical device, providing weather details specifically for Islamabad city.

## Project Structure

The project is structured as follows:

- `lib/`: Contains the source code for the app.
  - `Screen/`: Screens of the app, including the starting screen, home screen, and forecast screen.
  - `api/`: API-related functions and classes for fetching weather data.
  - `common/`: Reusable widgets and utility functions for styling and layout.
  - `secrets.dart`: File for storing API keys (remember to add your keys here).
- `assets/`: Contains image assets used in the app.

## Dependencies

- `flutter/material.dart`: Core Flutter library for building the UI.
- `animated_text_kit`: A package for adding animated text effects.
- `shimmer`: A package for creating shimmering loading animations.

## Contributions and Issues

Feel free to contribute to this project by opening pull requests or reporting any issues you encounter. We welcome your feedback and contributions to make My Weather App even better.


Enjoy using My Weather App! If you have any questions or need assistance, don't hesitate to reach out. Stay informed about the weather in Islamabad and have a great day!
```

This update makes it clear that the app is designed specifically to provide weather details for Islamabad city.
