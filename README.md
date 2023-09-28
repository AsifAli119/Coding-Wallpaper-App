# Flutter Wallpaper App with Pixel API Integration and BLoC

![App Preview](images_screen_shots)

This is a Flutter-based Wallpaper App that allows users to fetch wallpapers from the Pixel API, download them to their phone, and search for different wallpapers. The app uses the BLoC (Business Logic Component) architecture to manage state and data flow.

## Features

- Browse and fetch wallpapers from the Pixel API.
- Search for wallpapers using keywords.
- Download wallpapers to your phone.
- BLoC architecture for efficient state management.

## Getting Started

Follow these steps to set up and run the Wallpaper App on your local machine.

### Prerequisites

- Make sure you have Flutter and Dart installed on your system. You can install them by following the [official Flutter installation guide](https://flutter.dev/docs/get-started/install).

### Installation

1. Clone the repository to your local machine:

   ```bash
   git clone https://github.com/AsifAli119/Coding-Wallpaper-App
   ```

2. Change your working directory to the project folder:

   ```bash
   cd Coding-Wlpaper-App
   ```

3. Install the project dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app:

   ```bash
   flutter run
   ```

### Configuration

Before running the app, you need to set up the Pixel API key. Follow these steps:

1. Obtain a Pixel API key by signing up at [https://www.pixelapi.com/](https://www.pixelapi.com/).

2. Create a file named `config.dart` in the `lib` directory of the project.

3. Add your API key to `config.dart`:

   ```dart
   class Config {
     static const String pixelApiKey = 'YOUR_PIXEL_API_KEY';
   }
   ```

4. Save the file.

## Usage

Once the app is running on your device, you can start using it to discover and download wallpapers.

### Home Screen

- The home screen displays a list of wallpapers fetched from the Pixel API.
- Scroll through the wallpapers to find one you like.

### Search Screen

- Tap on the search icon to navigate to the search screen.
- Enter keywords in the search bar to search for wallpapers related to your query.
- Tap on a search result to view and download the wallpaper.

### Wallpaper Details

- On the wallpaper details screen, you can view the selected wallpaper in full size.
- Tap the download button to save the wallpaper to your phone's gallery.

## BLoC Architecture

This app uses the BLoC architecture to manage state and data flow. Key components include:

- **Bloc**: WallpaperBloc is responsible for managing the state related to wallpapers.
- **Repository**: WallpaperRepository handles data fetching and provides data to the cubit.
- **API Service**: PixelAPIService communicates with the Pixel API to fetch wallpapers.
- **Screens**: Each screen interacts with the bloc to display data and trigger actions.

## Credits

- This app makes use of the Pixel API for fetching wallpapers. Visit [https://www.pixelapi.com/](https://www.pixelapi.com/) to learn more about their services.

## License

This Wallpaper App is open-source and available under the [MIT License](LICENSE.md). You are free to use and modify it as per your requirements.

## Contribution

We welcome contributions to enhance and improve this app. If you'd like to contribute, please fork the repository, create a new branch, and submit a pull request.

## Support

If you encounter any issues or have questions, feel free to reach out to us at [kashcoder19@Gmail.com](mailto:kashcoder19@gmail.com).

Thank you for using our Flutter Wallpaper App! Enjoy exploring and downloading beautiful wallpapers.