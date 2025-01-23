<<<<<<< HEAD
# Currency Converter App

A Flutter-based Currency Converter application that allows users to:

- Add customizable currency conversion cards.
- Set a base currency.
- Automatically update other currencies based on the selected base currency.

## Features

- **Dynamic Currency Cards**: Add or remove conversion cards for various currencies.
- **Base Currency Selection**: Choose a base currency, and the app recalculates all other currencies automatically.
- **Real-time Updates**: Automatically fetch updated exchange rates.
- **User-Friendly Interface**: Intuitive design for a seamless user experience.

## Screenshots

*(Add screenshots here to showcase the app's interface and features.)*

## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/kodisinghe2021/advance-currency-converter.git
   ```

2. **Navigate to the Project Directory**:
   ```bash
   cd currency-converter
   ```

3. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

4. **Run the App**:
   ```bash
   flutter run
   ```

## Dependencies

This project uses the following Flutter packages:

- `dio`: For fetching exchange rates.
- `getx`: For state management.

To install the dependencies, run:
```bash
flutter pub get
```

## How It Works

1. **Add Currency Cards**:
   - Tap the "+" button to add a new currency conversion card.
   - Select the desired currency from the list.

2. **Set Base Currency**:
   - Select a currency as the base.
   - All other currencies will automatically update their values based on the base currency.

3. **Fetch Exchange Rates**:
   - The app fetches real-time exchange rates to ensure accurate conversions.

## API Integration

This app uses a currency exchange API to fetch real-time rates. Replace the API URL and key in the code with your own credentials:

```dart
const String apiUrl = "https://api.exchangerate-api.com/v4/latest/";
const String apiKey = "YOUR_API_KEY";
```

## Future Enhancements

- Add support for historical exchange rates.
- Implement offline mode with cached data.
- Provide graphing features for exchange rate trends.
- Enable localization for multiple languages.

## Contributing

Contributions are welcome! If you have any ideas or improvements, feel free to fork the repository and submit a pull request.

1. Fork the project.
2. Create a new branch:
   ```bash
   git checkout -b feature/YourFeatureName
   ```
3. Commit your changes:
   ```bash
   git commit -m 'Add some feature'
   ```
4. Push to the branch:
   ```bash
   git push origin feature/YourFeatureName
   ```
5. Open a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Thanks to [ExchangeRate-API](https://www.exchangerate-api.com/) (or your API provider) for providing the exchange rate data.
- Inspiration from various currency converter apps.

---

Happy Coding! 🎉

=======
# advance_currency_converter_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
>>>>>>> f187c71 (complete commit)
