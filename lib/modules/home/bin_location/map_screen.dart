import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/widgets/default_app_bar.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        title: const Text("Map"),
        context: context,
      ),
    );
  }
}
