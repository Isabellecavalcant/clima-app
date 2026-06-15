import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/detail_screen.dart';
import 'screens/favorites_screen.dart';

import 'screens/home_screen.dart';
import 'screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clima Mundial',
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: '/search',
          page: () => const SearchScreen(),
        ),
        GetPage(
          name: '/details',
          page: () => DetailScreen(
            city: Get.arguments,
          ),
        ),
        GetPage(
          name: '/favorites',
          page: () => const FavoritesScreen(),
        ),
      ],
    );
  }
}