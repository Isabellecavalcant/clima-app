import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F2FA),
      appBar: AppBar(
        title: const Text("Clima Mundial"),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.wb_sunny,
                  size: 80,
                ),

                const SizedBox(height: 16),

                const Text(
                  "Bem-vinda ao Clima Mundial",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Pesquise cidades, veja o clima atual e salve seus lugares favoritos.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 32),

                SizedBox(
                  width: 220,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.toNamed('/search');
                    },
                    icon: const Icon(Icons.search),
                    label: const Text("Pesquisar Cidades"),
                  ),
                ),

                const SizedBox(height: 12),

                SizedBox(
                  width: 220,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Get.toNamed('/favorites');
                    },
                    icon: const Icon(Icons.favorite),
                    label: const Text("Favoritos"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}