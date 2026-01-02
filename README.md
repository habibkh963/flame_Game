# Flame Game Wow

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Flame](https://img.shields.io/badge/Flame-FF6B35?style=for-the-badge&logo=fire&logoColor=white)

A thrilling dodge game built with Flutter and the Flame game engine. Navigate your spaceship through an endless barrage of falling meteors, testing your reflexes and strategy in this fast-paced arcade experience.

## 🎮 Features

- **Intuitive Controls**: Tap to move left or right, swipe to dash
- **Progressive Difficulty**: Game speed increases over time for endless challenge
- **Smooth Gameplay**: 60 FPS performance with Flame's optimized rendering
- **Cross-Platform**: Runs on Android, iOS, Web, Windows, macOS, and Linux
- **Score Tracking**: Compete with yourself to achieve higher scores
- **Responsive Design**: Adapts to different screen sizes

## 📸 Screenshots

*Add screenshots of your game here*

## 🚀 Installation

### Prerequisites

- Flutter SDK (version 3.9.0 or higher)
- Dart SDK (version 3.9.0 or higher)

### Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/habibkh963/flame_Game.git
   cd game_wow
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## 🛠️ Building

### For Android APK

To build a release APK:

```bash
flutter build apk --release
```

The APK will be generated at `build/app/outputs/flutter-apk/app-release.apk`.

### Automated Builds

This project includes GitHub Actions workflow that automatically builds and releases APK files when you create a version tag (e.g., `v1.0.0`).

To create a new release:

1. Update the version in `pubspec.yaml`
2. Commit your changes
3. Create a git tag: `git tag v1.0.0`
4. Push the tag: `git push origin v1.0.0`

The workflow will automatically build the APK and create a GitHub release.

## 🎯 How to Play

- **Move**: Tap the left or right side of the screen to move your spaceship
- **Dash**: Swipe left or right to perform a quick dash
- **Objective**: Avoid the falling meteors for as long as possible
- **Scoring**: Your score increases based on survival time

## 🏗️ Architecture

The game is built using the Flame game engine and follows a component-based architecture:

- `lib/game/`: Core game logic and components
  - `dodge_game.dart`: Main game class
  - `player.dart`: Player spaceship component
  - `rocket.dart`: Falling meteor component
  - `background.dart`: Scrolling background
- `lib/models/`: Game state management
- `lib/ui/`: User interface overlays

## 📦 Dependencies

- [Flame](https://flame-engine.org/): 2D game engine for Flutter
- Flutter SDK: UI framework

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Built with [Flame Engine](https://flame-engine.org/)
- Inspired by classic arcade dodge games
- Flutter community for excellent documentation and support

---

**Enjoy the game! 🚀**
