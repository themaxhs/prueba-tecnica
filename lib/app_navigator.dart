import 'package:prueba_tecnica/pokedex_view.dart';
import 'package:prueba_tecnica/pokemon_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/nav_cubit.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, int>(builder: (context, pokemonId) {
      return Navigator(
        pages: [
          const MaterialPage(child: PokedexView()),
          if (pokemonId != null) const MaterialPage(child: PokemonDetailsView())
        ],
        onPopPage: (route, result) {
          BlocProvider.of<NavCubit>(context).popToPokedex();
          return route.didPop(result);
        },
      );
    });
  }
}
