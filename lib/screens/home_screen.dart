import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clima Mundial"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/search');
              },
              child: const Text("Pesquisar Cidades"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Get.toNamed('/favorites');
              },
              child: const Text("Favoritos"),
            ),
          ],
        ),
      ),
    );
  }
}