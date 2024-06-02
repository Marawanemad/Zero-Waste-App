import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zero_waste_app/bloc_observer.dart';
import 'package:zero_waste_app/modules/authentication/auth_screen.dart';
import 'package:zero_waste_app/modules/home/home_screen.dart';
import 'package:zero_waste_app/modules/onboarding/on_boarding_screen.dart';
import 'package:zero_waste_app/modules/splash_screen.dart';
import 'package:zero_waste_app/shared/data/local/cache_helper.dart';
import 'package:zero_waste_app/shared/data/local/shared_pref_keys_enum.dart';
import 'package:zero_waste_app/shared/data/online/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  // CacheHelper._loadPreferences();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  final Widget startWidget =
      CacheHelper.cachedData[SharedPrefKeys.onBoarding.key]
          ? const OnBoardingScreen()
          : CacheHelper.cachedData[SharedPrefKeys.userToken.key].isEmpty
              ? const AuthScreen()
              : const HomeScreen();
  // const Widget startWidget = OnBoardingScreen();

  runApp(MyApp(startWidget));
}

class MyApp extends StatelessWidget {
  const MyApp(this.startWidget, {super.key});
  final Widget startWidget;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zero Waste',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: SplashScreen(screenName: startWidget),
    );
  }
}
