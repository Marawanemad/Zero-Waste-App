import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/assets.dart';

class SplashScreen extends StatefulWidget {
  final Widget screenName;
  const SplashScreen({super.key, required this.screenName});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
          seconds: 2), // You can adjust the duration of the animation here
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);

    // Start the animation when the state is initialized
    _controller.forward();

    // Navigate to the next screen after the animation completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => widget.screenName));
      }
    });
  }

  @override
  void dispose() {
    // Dispose the controller when not needed to prevent memory leaks
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: const Image(
            width: double.infinity,
            image: AssetImage(Assets.imagesApp),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
