import 'package:flutter/material.dart';
import 'package:my_app/models/pokemon.dart';
import 'package:my_app/pages/pokemon-card.dart';
import 'package:my_app/services/pokemon-service.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({
    Key? key,
    @required this.pokemons,
  }) : super(key: key);

  final List<Pokemon>? pokemons;

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  //ScrollController _controller = ScrollController();
  List<Pokemon>? _pokemons;
  bool loading = false;

  @override
  void initState() {
    _pokemons = widget.pokemons;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GridView.builder(
        //controller: _controller,
        padding: EdgeInsets.symmetric(
          horizontal: 5,
        ),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, i) {
          final Pokemon pokemon = _pokemons![i];
          return PokemonCard(pokemon: pokemon);
        },
        itemCount: widget.pokemons!.length,
      ),
      if (loading)
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: RefreshProgressIndicator(),
            ),
          ),
        )
    ]);
  }
}
