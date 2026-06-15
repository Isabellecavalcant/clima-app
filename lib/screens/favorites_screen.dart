import 'package:flutter/material.dart';

import '../controllers/weather_controller.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos"),
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.favorites,
        builder: (context, favorites, child) {
          if (favorites.isEmpty) {
            return const Center(
              child: Text("Nenhuma cidade favoritada"),
            );
          }

          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final city = favorites[index];

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://picsum.photos/seed/${city.name}/200",
                  ),
                ),

                title: Text(city.name),

                subtitle: Text(
                  "${city.flag} ${city.country}\n"
                  "${city.temp?.toStringAsFixed(1) ?? '--'} °C",
                ),

                isThreeLine: true,
              );
            },
          );
        },
      ),
    );
  }
}