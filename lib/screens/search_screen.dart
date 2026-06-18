import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/weather_controller.dart';
import '../models/city.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String filtro = "";

  Widget citySubtitle(City city) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${city.flag} ${city.country}"),
        if (city.state.isNotEmpty)
          Text(
            city.state,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<City> cidadesFiltradas = controller.cities.where((cidade) {
      return cidade.name.toLowerCase().contains(filtro.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pesquisar Cidades"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: const InputDecoration(
                labelText: "Pesquisar cidade",
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ElevatedButton.icon(
              onPressed: () async {
                if (filtro.isNotEmpty) {
                  await controller.searchCity(filtro);
                }
              },
              icon: const Icon(Icons.public),
              label: const Text("Buscar na Open-Meteo"),
            ),
          ),
          ValueListenableBuilder<List<City>>(
            valueListenable: controller.searchResults,
            builder: (context, results, child) {
              if (results.isEmpty) {
                return const SizedBox();
              }

              return SizedBox(
                height: 180,
                child: ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final city = results[index];

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: ListTile(
                        title: Text(city.name),
                        subtitle: citySubtitle(city),
                        trailing: IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            final added = controller.addCity(city);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  added
                                      ? "${city.name} adicionada!"
                                      : "${city.name} já está cadastrada.",
                                ),
                              ),
                            );

                            setState(() {});
                          },
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          Expanded(
            child: ValueListenableBuilder<List<City>>(
              valueListenable: controller.favorites,
              builder: (context, favorites, child) {
                return ListView.builder(
                  itemCount: cidadesFiltradas.length,
                  itemBuilder: (context, index) {
                    final city = cidadesFiltradas[index];

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://picsum.photos/seed/${city.name}-${city.country}/200",
                          ),
                        ),
                        title: Text(city.name),
                        subtitle: citySubtitle(city),
                        onTap: () async {
                          await controller.loadWeather(city);

                          Get.toNamed(
                            '/details',
                            arguments: city,
                          );
                        },
                        trailing: IconButton(
                          icon: Icon(
                            favorites.contains(city)
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),
                          onPressed: () {
                            controller.toggleFavorite(city);
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}