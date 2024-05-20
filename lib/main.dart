import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
<<<<<<< HEAD
import 'package:zerowasteapp/bloc_observer.dart';
import 'package:zerowasteapp/modules/authentication/login/login_screen.dart';
import 'package:zerowasteapp/modules/onboarding/on_boarding_screen.dart';
import 'package:zerowasteapp/shared/data/local/cache_helper.dart';
import 'package:zerowasteapp/shared/data/online/dio_helper.dart';
=======
import 'package:zero_waste_app/bloc_observer.dart';
import 'package:zero_waste_app/modules/Authentication/auth_screen.dart';
import 'package:zero_waste_app/modules/onboarding/on_boarding_screen.dart';
import 'package:zero_waste_app/shared/data/local/cache_helper.dart';
import 'package:zero_waste_app/shared/data/online/dio_helper.dart';
>>>>>>> 2f60f094f309108acfc56eb76ea5e0b4a53da024

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zero Waste',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
<<<<<<< HEAD
      home: LoginScreen(),
=======
      home: const OnBoardingScreen (),
>>>>>>> 2f60f094f309108acfc56eb76ea5e0b4a53da024
    );
  }
}
