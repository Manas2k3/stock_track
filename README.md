# **Stock Track App**

## **Overview**

The Stock Track app is a Flutter-based mobile application designed to provide real-time tracking of cryptocurrency prices and market data. Leveraging a WebSocket API, the app delivers live updates and presents information in a visually engaging and user-friendly interface. Users can effortlessly switch between light and dark themes, explore detailed cryptocurrency information, and personalize their app experience.

## **Features**

1. **Real-Time Data:** Fetches and displays up-to-the-minute cryptocurrency prices, percentage changes, and other market data through a WebSocket connection.
2. **Theme Toggle:** Offers a seamless transition between light and dark modes for optimal user comfort.
3. **Responsive UI:** Adapts to different screen sizes and orientations, ensuring a consistent and enjoyable experience.
4. **Loading Indicator:** Provides visual feedback while data is being retrieved.
5. **Customizable Colors:** Enhances user experience with customizable light and dark themes.

## **Installation**

To get started with the Stock Track app, follow these steps:

### Clone the Repository

```bash
git clone https://github.com/your-username/stock-track-app.git
```

### Dependencies

Run the App:

Navigate to the project directory and run the following command:

```bash
flutter run
```

## **Usage**

1. Launch the app on your device or emulator.
2. Explore the real-time cryptocurrency data.
3. Toggle between light and dark themes using the drawer menu.
4. View detailed information for individual cryptocurrencies.

## **Code Structure**

1. **`lib/main.dart`**: Entry point of the application.
2. **`lib/home_page.dart`**: Contains the `HomePage` widget, which manages the WebSocket connection, theme toggling, and UI layout.
3. **`lib/components/items.dart`**: Defines the `Item` widget used to display cryptocurrency information.
4. **`lib/model/api_model.dart`**: Contains data models for parsing API responses.
5. **`lib/themes/theme.dart`**: Defines the light and dark themes used in the app.
6. **`lib/themes/theme_provider.dart`**: Manages theme switching and provides the current theme data to the app.

## **Technologies Used**

1. **Flutter:** Framework for building the app’s UI and managing state.
2. **WebSocket API:** Used to fetch real-time cryptocurrency data.
3. **Provider:** State management solution for managing theme changes.
4. **Google Fonts:** For custom font styling in the app.


[Watch the Working Video Clip](https://github.com/user-attachments/assets/a5872fb8-1f0d-4326-8f98-eab1b8dcf419)
