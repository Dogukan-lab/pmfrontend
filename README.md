# Pmfrontend
 
This repo is the frontend used for the application PaleMessenger

## Setup
To setup the project a couple things are needed:
 - The Flutter SDK
 - VS Code (Other editors work, however VS Code is easiest to
 use)

### Flutter
To install the Flutter SDK, follow the steps on [Flutters official website](https://docs.flutter.dev/get-started/install). After following these steps, Flutter Doctor should display the following output:

![image.png](pmfrontend\assets\readme\FlutterDoc.png)

Note that not all of these components are strictly necessary for running this web-only application.

### VS Code
After installing this project to your device, open the pmfrontend folder in VS Code. Some extensions are required and usefull for using and reading this code:
- Flutter
- Dart (Required by Flutter)
- YAML (Optional, for reading .yaml files)

Finally, it may be required to re-import the packages used in this project. For this, simply run `...\pmfrontend>flutter pub get` through VS Code's terminal. Alternatively, press the `Get Packages` button on the top right when having the pubspec.yaml file opened. This file is located in the root of the project.

![image.png](pmfrontend\assets\readme\PubGet.png)

# How to use
Once this is all set up, the project can be used. There are 2 ways a Flutter project can be ran. The easiest method is by pressing the `Run` button above the main method in main.dart.

![image.png](pmfrontend\assets\readme\Run.png)

Not that this button will only appear after installing the mentioned VS Code extensions, and after the Dart Language Server is finished indexing the project. This may take a few minutes.

Alternatively, the command `...\pmfrontend>flutter run -d chrome --release` can be executed from VS Code's command prompt.
