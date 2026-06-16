import 'package:flutter/material.dart';

import '../controllers/weather_controller.dart';
import '../models/city.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  String filtro = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos"),
      ),
      body: ValueListenableBuilder<List<City>>(
        valueListenable: controller.favorites,
        builder: (context, favorites, child) {
          final favoritosFiltrados = favorites.where((city) {
            final texto = filtro.toLowerCase();

            return city.name.toLowerCase().contains(texto) ||
                city.country.toLowerCase().contains(texto);
          }).toList();

          if (favorites.isEmpty) {
            return const Center(
              child: Text("Nenhuma cidade favoritada"),
            );
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: "Filtrar por cidade ou país",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    setState(() {
                      filtro = value;
                    });
                  },
                ),
              ),

              Expanded(
                child: favoritosFiltrados.isEmpty
                    ? const Center(
                        child: Text("Nenhum favorito encontrado"),
                      )
                    : ListView.builder(
                        itemCount: favoritosFiltrados.length,
                        itemBuilder: (context, index) {
                          final city = favoritosFiltrados[index];

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
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}