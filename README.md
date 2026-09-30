<p align="center">
  <img src="assets/images/app.png" alt="Zero Waste logo" width="280">
</p>

<h1 align="center">Zero Waste</h1>

<p align="center">
  A Flutter app that pays people to recycle. Drop off plastic, metal, paper or glass,
  earn points by weight, and exchange them for cash.
</p>

> Graduation project. The UI is complete, but part of the data is hard-coded and the
> backend is external. See [Project status](#project-status) before relying on anything.

## How it works

1. **Sign up** and go through a 3-page onboarding.
2. **Find a bin.** "Bins Locations" on the home screen opens Google Maps.
3. **Recycle.** Show your QR code at the bin.
4. **Earn points** by material and weight (shown in the in-app *Points Info* dialog):

   | Material | Rate               |
   | -------- | ------------------ |
   | Plastic  | 300 g = 50 points  |
   | Metal    | 100 g = 50 points  |
   | Paper    | 500 g = 50 points  |
   | Glass    | 1000 g = 50 points |

5. **Exchange points for money.** The packages are 100 points = 20 EGP, 500 = 110 EGP,
   1000 = 230 EGP and 2000 = 480 EGP. Payout goes to a debit card or a mobile wallet
   (Vodafone Cash, Etisalat, WE, Orange Money, InstaPay).
6. **Track progress** in the Statistics screen: visits, income, waste by material, and points.

## Screenshots

### Onboarding and authentication

<table>
  <tr>
    <td align="center"><img src="docs/screenshots/07-onboarding-recycle.png" width="170"><br><sub>Onboarding: recycle</sub></td>
    <td align="center"><img src="docs/screenshots/08-onboarding-earn.png" width="170"><br><sub>Onboarding: earn</sub></td>
    <td align="center"><img src="docs/screenshots/09-onboarding-start.png" width="170"><br><sub>Onboarding: start</sub></td>
    <td align="center"><img src="docs/screenshots/01-auth-welcome.png" width="170"><br><sub>Sign in / Register</sub></td>
    <td align="center"><img src="docs/screenshots/04-login.png" width="170"><br><sub>Login</sub></td>
  </tr>
  <tr>
    <td align="center"><img src="docs/screenshots/02-register.png" width="170"><br><sub>Register</sub></td>
    <td align="center"><img src="docs/screenshots/03-register-success.png" width="170"><br><sub>Sign-up success</sub></td>
    <td align="center"><img src="docs/screenshots/05-reset-password-otp.png" width="170"><br><sub>Reset: email + OTP</sub></td>
    <td align="center"><img src="docs/screenshots/06-reset-password-new.png" width="170"><br><sub>Reset: new password</sub></td>
    <td></td>
  </tr>
</table>

### Home, bins and QR

<table>
  <tr>
    <td align="center"><img src="docs/screenshots/10-home.png" width="170"><br><sub>Home: materials grid</sub></td>
    <td align="center"><img src="docs/screenshots/11-home-congrats.png" width="170"><br><sub>Points earned</sub></td>
    <td align="center"><img src="docs/screenshots/12-home-points-info.png" width="170"><br><sub>Points rates</sub></td>
    <td align="center"><img src="docs/screenshots/13-bins-map.png" width="170"><br><sub>Bins map (Google Maps)</sub></td>
    <td align="center"><img src="docs/screenshots/14-qr-code.png" width="170"><br><sub>Your QR code</sub></td>
  </tr>
</table>

### Exchange and payment

<table>
  <tr>
    <td align="center"><img src="docs/screenshots/15-exchange.png" width="170"><br><sub>Choose a package</sub></td>
    <td align="center"><img src="docs/screenshots/16-exchange-payment-method.png" width="170"><br><sub>Card or wallet</sub></td>
    <td align="center"><img src="docs/screenshots/17-debit-card.png" width="170"><br><sub>Debit cards</sub></td>
    <td align="center"><img src="docs/screenshots/18-wallets.png" width="170"><br><sub>Mobile wallets</sub></td>
  </tr>
  <tr>
    <td align="center"><img src="docs/screenshots/19-validation-wait.png" width="170"><br><sub>Validating</sub></td>
    <td align="center"><img src="docs/screenshots/20-validation-failure.png" width="170"><br><sub>Failure</sub></td>
    <td align="center"><img src="docs/screenshots/21-validation-success.png" width="170"><br><sub>Success</sub></td>
    <td></td>
  </tr>
</table>

### Account

<table>
  <tr>
    <td align="center"><img src="docs/screenshots/22-account.png" width="170"><br><sub>Account menu</sub></td>
    <td align="center"><img src="docs/screenshots/23-about-me.png" width="170"><br><sub>Profile + password</sub></td>
    <td align="center"><img src="docs/screenshots/24-address.png" width="170"><br><sub>Address</sub></td>
    <td align="center"><img src="docs/screenshots/25-transactions.png" width="170"><br><sub>Transactions</sub></td>
  </tr>
</table>

### Statistics

<table>
  <tr>
    <td align="center"><img src="docs/screenshots/26-stats-visits.png" width="170"><br><sub>Visits (bar)</sub></td>
    <td align="center"><img src="docs/screenshots/27-stats-income.png" width="170"><br><sub>Income (line)</sub></td>
    <td align="center"><img src="docs/screenshots/28-stats-waste-tracker.png" width="170"><br><sub>Waste tracker (pie)</sub></td>
    <td align="center"><img src="docs/screenshots/29-stats-points.png" width="170"><br><sub>Points, monthly</sub></td>
    <td align="center"><img src="docs/screenshots/30-stats-points-yearly.png" width="170"><br><sub>Points, yearly</sub></td>
  </tr>
</table>

## Getting started

**Requirements:** Flutter with Dart SDK `>=3.1.3 <4.0.0`, and an Android/iOS device or emulator.

```bash
git clone https://github.com/Marawanemad/Zero-Waste-App.git
cd Zero-Waste-App
flutter pub get
flutter run
```

Optional: regenerate the launcher icon after changing `assets/images/app.png`:

```bash
dart run flutter_launcher_icons
```

### Startup flow

[lib/main.dart](lib/main.dart) picks the first screen from local storage, then shows a splash screen:

- Onboarding flag set → onboarding
- Otherwise, no saved user token → auth screen
- Otherwise → home

## Project structure

```
lib/
├── main.dart                 App entry point and start-screen logic
├── bloc_observer.dart        Logs Bloc/Cubit state changes
├── models/                   Login, register and onboarding models
├── modules/                  One folder per feature, each with its own cubit
│   ├── authentication/       Login, register, forgot/reset password
│   ├── onboarding/
│   ├── splash_screen.dart
│   └── home/
│       ├── home_screen/      Materials grid, points, bottom nav
│       ├── qr_code/          QR display
│       ├── exchange/         Points → money packages
│       ├── statistics/       fl_chart bar, line, pie charts
│       └── account/          Profile, address, cards, wallets, transactions
└── shared/
    ├── data/local/           SharedPreferences wrapper (CacheHelper)
    ├── data/online/          Dio client (DioHelper)
    ├── themes/               Colors and text styles (Outfit font)
    ├── widgets/              Reusable buttons, fields, toasts
    └── assets.dart           Generated asset path constants
assets/
├── images/home/{plastics,metal,paper,glass}/   Item illustrations
├── images/home/profile/                        Payment logos, status art
├── icons/                                      SVG icons
└── fonts/Outfit/
docs/screenshots/             README screenshots
```

## Tech stack

| Purpose          | Package                                    |
| ---------------- | ------------------------------------------ |
| State management | `flutter_bloc` (Cubit)                     |
| Networking       | `dio`                                      |
| Local storage    | `shared_preferences`                       |
| Charts           | `fl_chart`                                 |
| QR code          | `qr_flutter`                               |
| Opening maps     | `url_launcher`                             |
| UI helpers       | `flutter_svg`, `smooth_page_indicator`, `carousel_slider`, `fluttertoast`, `icons_plus`, `device_preview` |
| Media            | `image_picker`                             |

## Project status

What is real and what is not, so you don't waste time:

- **Backend:** login and register call `http://zerowaste.byethost7.com/api/` (`signIn`, `signUp`),
  set in [dio_helper.dart](lib/shared/data/online/dio_helper.dart). That is an external free host
  and may be offline. The base URL is plain HTTP.
- **Hard-coded data:** exchange packages, the saved card (`8790`), the income figure and
  chart values are static sample data in the UI code, not loaded from an API.
- **Not wired up:** the "Sign in with Google / Facebook" buttons have empty handlers.
  The QR screen displays a code; it does not scan anything.
- **Bins map:** "Bins Locations" opens a fixed Google Maps URL (Alexandria, Egypt) in an
  external app rather than showing live bin data.
- **Tests:** there is no `test/` directory.

## Credits

Illustrations and 3D icons are bundled in `assets/`. Check their original licenses before any
commercial use.
