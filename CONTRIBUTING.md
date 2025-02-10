# Contributing to RoniaKit

Thank you for your interest in contributing to RoniaKit! 🎉
This document provides guidelines to help ensure a smooth contribution process.

---

## 🚀 Getting Started

### 1️⃣ Fork & Clone the Repository
1. Fork the repository on GitHub.
2. Clone your fork to your local machine:
   ```sh
   git clone https://github.com/your-username/RoniaKit.git
   cd RoniaKit
   ```
3. Add the upstream repository:
   ```sh
   git remote add upstream https://github.com/Roniasoft/RoniaKit.git
   ```
4. Fetch the latest changes:
   ```sh
   git pull upstream main
   ```

### 2️⃣ Setting Up the Development Environment

#### Prerequisites
- **Qt**: Install the latest stable version from [Qt official site](https://www.qt.io/download).
- **C++ Compiler**: Ensure you have a modern compiler (GCC, Clang, MSVC).
- **CMake**: Required for building the project (`sudo apt install cmake` or use the official installer).
- **Qt Creator (Optional)**: Recommended for development.

#### Build Instructions
1. Navigate to the project folder and create a build directory:
   ```sh
   mkdir build && cd build
   ```
2. Configure the project:
   ```sh
   cmake .. -DCMAKE_BUILD_TYPE=Debug
   ```
3. Build the project:
   ```sh
   cmake --build .
   ```

---

## 🖥️ Code Conventions

### 📝 C++ Guidelines
- **Follow C++17 or later.**
- Use **4 spaces** for indentation (no tabs).
- Class names: `PascalCase` (e.g., `MainWindow`).
- Member variables: `m_camelCase` (e.g., `m_userName`).
- Constants: `UPPER_CASE_WITH_UNDERSCORES`.
- Header guards or `#pragma once` to prevent multiple inclusions.

### 📜 QML Guidelines
- Use **camelCase** for variables and `PascalCase` for components.
- Bindings should be concise and efficient.
- Prefer **property aliases** over directly exposing child components.
- Organize QML files into folders (e.g., `Controls/`, `Pages/`, `Components/`).

### 🎨 Qt & UI Guidelines
- Use **Qt’s signal/slot mechanism** for event handling.
- Keep UI logic separate from backend logic.
- Use `Q_PROPERTY` and `Q_INVOKABLE` for exposing C++ to QML.
- Place UI-related `.qml` files inside a `qml/` directory.

---

## 📦 Git Commit & Branching Strategy

### ✅ Commit Message Format
Follow this convention:
```
[type]: Short description (max 50 chars)

[Optional: Detailed description]
```
#### **Commit Types**
- `feat:` New feature.
- `fix:` Bug fix.
- `docs:` Documentation updates.
- `style:` Code style changes (no functional changes).
- `refactor:` Code restructuring (no feature changes).
- `test:` Adding/modifying tests.

**Example Commit:**
```sh
git commit -m "feat: add CircularGauge QML component"
```

### 🌱 Branching Strategy
- **`main`** → Production-ready code.
- **`develop`** → Ongoing development.
- **Feature branches:** `feature/your-feature`
- **Bugfix branches:** `fix/issue-number`

---

## 🐛 Reporting Issues

If you find a bug:
1. Check the [issue tracker](https://github.com/Roniasoft/RoniaKit/issues) to avoid duplicates.
2. Create a new issue with:
   - **Environment**: Qt version, OS, compiler.
   - **Steps to reproduce**.
   - **Expected vs. actual behavior**.
   - **Screenshots (if applicable)**.

---

## 🔥 Submitting a Pull Request

### ✅ Steps to Submit a PR
1. Create a new branch:
   ```sh
   git checkout -b feature/new-feature
   ```
2. Implement changes and commit with proper messages.
3. Push to your fork:
   ```sh
   git push origin feature/new-feature
   ```
4. Create a pull request (PR) on GitHub.
5. Wait for review and approval.

### 🔹 PR Requirements
- The code must follow **coding conventions**.
- PR title should be **clear & concise**.
- Include a description of changes.
- Link the issue (if applicable): `Closes #123`
- At least **one reviewer must approve** before merging.

---

## ❤️ Code of Conduct
By contributing, you agree to follow our [Code of Conduct](CODE_OF_CONDUCT.md).

---

## 🎉 Thank You!
Your contributions help improve RoniaKit. We appreciate your support! 🚀

