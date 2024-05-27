# Yes No App

Yes No App is a chat application that answers yes or no questions using the YesNo API. This application is built with Flutter and uses the `dio` package for HTTP requests.

## Contents

1. [Description](#description)
2. [Installation](#installation)
3. [Usage](#usage)
4. [Project Structure](#project-structure)
5. [Contribution](#contribution)
6. [License](#license)
7. [Contact](#contact)

## Description

Yes No App is an interactive application where users can ask questions and get yes or no answers. The app uses the YesNo API to generate responses and display related images.

## Installation

### Prerequisites

- Flutter SDK: [Installation instructions](https://flutter.dev/docs/get-started/install)
- Android Studio or Xcode (for emulation)

### Installation Steps

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/yes_no_app.git
   cd yes_no_app
   ```
2. Install the dependencies:
   ```bash
   flutter pub get
   ```
3. Run the application:
   ```bash
   flutter run
   ```

## Usage

To use the application, simply start the app on your emulator or physical device. The user can type a question and send the message. If the question ends with a question mark, the app will respond with a yes or no answer, along with a related image.

## Project Structure

The project is organized as follows:

- **lib/**: Contains the source code of the application.
  - **config/**: Theme configuration and other settings.
    - **theme/**: Application theme file (`app_theme.dart`).
  - **domain/**: Domain entities and models.
    - **entities/**: Contains the `Message` entity.
  - **infraestructure/**: Infrastructure models and services.
    - **models/**: Contains the `YesNoModel`.
    - **helpers/**: Contains the helper `get_yes_no_answer.dart`.
  - **src/**: Contains screens and providers.
    - **providers/**: Contains `ChatProvider` and `UserProvider`.
    - **screens/**: Contains the application screens (`chat_screen.dart`).
    - **widgets/**: Contains reusable widgets.
      - **chat/**: Contains the widgets `HerMessageBubble`, `MyMessageBubble`.
      - **shared/**: Contains the widget `MessageFieldBox`.

## Contribution

1. Fork this repository.
2. Create a new branch (`git checkout -b feature/new-feature`).
3. Make your changes and commit them (`git commit -m 'Add new feature'`).
4. Push your changes (`git push origin feature/new-feature`).
5. Open a pull request on GitHub.

Please make sure to follow the existing coding style and add tests for your changes.

## License

This project is licensed under the MIT License. For more details, see the [LICENSE](LICENSE) file.

## Contact

- GitHub: [Fredy002](https://github.com/Fredy002)
- LinkedIn: [Fredy Antonio Almeyda Alania](https://www.linkedin.com/in/fredy-antonio-almeyda-alania/)

Feel free to explore the code to understand how the styling is achieved and maybe tweak some values to see how the design changes. Happy coding!