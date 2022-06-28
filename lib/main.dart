import 'package:prueba_tecnica/bloc/pokemon_bloc.dart';
import 'package:prueba_tecnica/bloc/pokemon_event.dart';
import 'package:prueba_tecnica/pokedex_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PokemonBloc()
              ..add(
                PokemonPageRequest(page: 0),
              ),
          ),
        ],
        child: const PokedexView(),
      ),
    );
  }
}
