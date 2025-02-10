# RoniaKit

![GitHub license](https://img.shields.io/github/license/Roniasoft/RoniaKit)
![GitHub stars](https://img.shields.io/github/stars/Roniasoft/RoniaKit?style=social)
![GitHub forks](https://img.shields.io/github/forks/Roniasoft/RoniaKit?style=social)
![GitHub issues](https://img.shields.io/github/issues/Roniasoft/RoniaKit)
![GitHub pull requests](https://img.shields.io/github/issues-pr/Roniasoft/RoniaKit)
![GitHub contributors](https://img.shields.io/github/contributors/Roniasoft/RoniaKit)

## Introduction
RoniaKit is a versatile collection of reusable QML components designed for Qt Quick applications. It includes a variety of UI elements, such as gauges, meters, and other interactive components, that can be easily integrated into your projects.

With RoniaKit, you can create visually engaging and highly customizable interfaces, allowing you to adapt the appearance, colors, and behavior of each component to suit your application's design and functionality.

## Features
- **Customizable Components** – Easily modify appearance, colors, and behavior.
- **Lightweight & Efficient** – Optimized for performance in Qt Quick applications.
- **Modular Design** – Use only the components you need.
- **Cross-Platform Support** – Works on Linux, macOS, and Windows.

## How to Use
To add RoniaKit to your project, you can use it as a Git submodule and include it in your CMake configuration.

### Adding as a Git Submodule
```sh
git submodule add https://github.com/Roniasoft/RoniaKit.git external/RoniaKit
git submodule update --init --recursive
```

### Integrating with CMake
Modify your `CMakeLists.txt` to include RoniaKit:

```cmake
cmake_minimum_required(VERSION 3.8)
project(MyProject)

set(CMAKE_CXX_STANDARD 17)

add_subdirectory(external/RoniaKit) # <-

target_link_libraries(appTarget PRIVATE RoniaKit RoniaKitGauges) # <-
```

## Usage
To use a gauge component, simply import the library in your QML file and set its properties as needed:

```qml
import QtQuick 2.0
import RoniaKit.Gauges

CircularGauge {
    width: 200
    height: 200
    value: 50
    theme: "Light"
    rangeControl.minimumValue: 0
    rangeControl.maximumValue: 100
}
```

## Example Usage
For a full example of how to use RoniaKit components, check out [RoniaKitGallery](https://github.com/Roniasoft/RoniaKitGallery.git), which showcases various elements in action.

## Contribution Guidelines

We welcome contributions! Please read our detailed guidelines in [CONTRIBUTING.md](CONTRIBUTING.md) before submitting issues or pull requests.

### Quick Overview
- **Reporting Bugs:** Provide Qt version, OS, and clear reproduction steps.
- **Feature Requests:** Describe your idea and its use cases.
- **Pull Requests:** Follow our coding conventions, ensure your code builds, and write meaningful commit messages.
- **Code of Conduct:** Be respectful and collaborative ([Code of Conduct](CODE_OF_CONDUCT.md)).

For more details, see [CONTRIBUTING.md](CONTRIBUTING.md). 🚀

## Showcase
### RoniaKit Example (Light Theme)
![Light Theme](https://user-images.githubusercontent.com/53909162/233635754-87d08df4-5b11-4010-bf6a-479cbb1c0a8f.png)

### RoniaKit Example (Dark Theme)
![Dark Theme](https://user-images.githubusercontent.com/53909162/233635891-a4e3a6ce-2577-4e82-98ab-ed94d9fa9fbb.png)

## Citing RoniaKit
If you use RoniaKit in your project, please cite it as follows:

```bibtex
@misc{RONIA AB,
  author = {RONIA AB},
  title = {RoniaKit: QML Control Library},
  year = {2023},
  publisher = {GitHub},
  journal = {GitHub repository},
  howpublished = {\url{https://github.com/Roniasoft/RoniaKit}},
  commit = {6ba9c66cdbc8e6d00fd4a8c6b3bde05c616cfa6a}
}
```

## Contributors
Thanks to all our contributors! 💖

[![Contributors](https://contrib.rocks/image?repo=Roniasoft/RoniaKit)](https://github.com/Roniasoft/RoniaKit/graphs/contributors)
