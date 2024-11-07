

# QR Code Food Menu App

A Flutter app that allows hotel or restaurant staff to generate and share food menus as QR codes. Customers can scan the QR code to view the menu, which is displayed in a user-friendly format. This app is ideal for hotels, cafes, or restaurants looking to create digital menus without needing customers to install the app.

## Features

- **Menu Management**: Staff can easily create and edit menu items with name, description, and price fields.
- **QR Code Generation**: The app generates a QR code containing the menu data in JSON format.
- **QR Code Scanning**: Customers can scan the QR code to view the menu without needing the app.
- **Menu Display**: After scanning, the menu is displayed in a clean, structured format in the customer’s browser.
- **Local Storage**: The app saves the latest version of the menu for easy editing.

## Getting Started

### Prerequisites

To build and run this app, you need to have:
- **Flutter** installed on your machine. [Install Flutter](https://flutter.dev/docs/get-started/install).
- A **code editor** like Visual Studio Code or Android Studio.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/qr-food-menu-app.git
   ```
2. Navigate to the project directory:
   ```bash
   cd qr-food-menu-app
   ```
3. Get all dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

### Folder Structure

```plaintext
lib/
├── main.dart                    # Main entry point of the app
└── screens/
    ├── qr_generator_screen.dart # Screen for generating QR code
    ├── menu_display_screen.dart # Screen for displaying menu after scanning QR code
    └── qr_scanner_screen.dart   # Screen for scanning QR code
```

## Usage

1. **Generate a Menu QR Code**:
   - Launch the app, navigate to the **QR Code Generator** screen, and enter the food items (name, description, and price).
   - Tap "Generate QR Code" to create a QR code containing the menu data.
   
2. **Scan QR Code**:
   - The customer scans the QR code using a smartphone or a dedicated scanner. 
   - The QR code redirects to a web page that displays the menu in a table format.

3. **Edit Menu**:
   - The hotel or restaurant staff can edit the menu items and regenerate the QR code as needed.

## QR Data Encoding

- The QR code contains JSON-encoded menu data, including item name, description, and price.
- The app uses `qr_flutter` for generating QR codes and `qr_code_scanner` for scanning.

## Dependencies

- `qr_flutter`: For generating QR codes.
- `qr_code_scanner`: For scanning QR codes.

Add these to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  qr_flutter: ^4.0.0
  qr_code_scanner: ^0.6.1
```

## Contributing

Contributions are welcome! If you have ideas for new features or improvements, feel free to create a pull request or open an issue.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

--- 

This text can be directly copied into your `README.md` file on GitHub. Let me know if you need any adjustments!