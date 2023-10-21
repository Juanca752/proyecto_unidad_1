import 'package:flutter/material.dart';
import 'package:proyecto_unidad1/screens/screens.dart';
import 'package:provider/provider.dart';
import 'providers/movies_providers.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, //quitar la madre del debug pq me estorbaba
      title: 'peliculas',
      initialRoute: 'home',
      routes: {'home': (_) => HomeScreen(), 'details': (_) => DetailsScreen()},
    );
  }
}
