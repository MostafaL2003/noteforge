# 📝 Noteforge: Offline-First Architecture Demo

A high-performance, offline-first note-taking application built to demonstrate **Clean Architecture** principles in Flutter.

This project serves as a reference implementation for separating **Business Logic** (Cubit), **Data Persistence** (Hive), and **UI Layers**.

---

## 🚀 Architecture & Tech Stack

### 1. State Management: `flutter_bloc` (Cubit)
* **Separation of Concerns:** The UI is purely reactive (`StatelessWidget`) and contains no business logic.
* **Reactive State:** Uses `BlocBuilder` to listen for state changes and `context.read` to dispatch events.
* **Zero `setState`:** All app-wide state is managed centrally in the `NotesCubit`, creating a predictable and testable state flow.

### 2. Local Database: `Hive` (NoSQL)
* **Offline-First:** Data is persisted locally using Hive, ensuring the app works perfectly without an internet connection.
* **TypeAdapters:** Uses generated TypeAdapters (`build_runner`) to store custom `Note` objects directly as binary data, optimizing performance and memory usage.
* **Repository Pattern:** Direct database access is abstracted via a `DatabaseService`, decoupling the data layer from the application logic.

### 3. Memory Management
* Implements strict lifecycle management for `TextEditingController`s and database connections to ensure zero memory leaks.

---

## 🛠️ Technical Highlights

* **Immutability:** State classes are built using `Equatable` to ensure efficient UI rebuilds only when data actually changes.
* **Dependency Injection:** Uses `BlocProvider` to inject dependencies at the root of the widget tree.
* **Asynchronous Logic:** Correctly handles `Future` and `await` for database transactions without blocking the UI thread.

---

## 📱 Screenshots

<p align="center">
  <img src="screenshots/HomeScreen.png" width="250" alt="Home Screen"/>
  <img src="screenshots/AddNoteScreen.png" width="250" alt="Add Note Screen"/>
</p>

---

## 🔧 Getting Started

### Requirements
* Flutter SDK
* Android Studio or VS Code

### Installation

1. Clone the repository:
   ```bash
   git clone [https://github.com/MostafaL2003/Noteforge.git](https://github.com/MostafaL2003/Noteforge.git)
