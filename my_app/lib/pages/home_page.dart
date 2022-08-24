//Dart
import 'dart:ui';
//Flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/pages/login-page.dart';
import 'package:my_app/pages/pokemon-list.dart';
import 'package:my_app/services/pokemon-service.dart';

import '../models/pokemon.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<ReqPokemonResponse>? _response;
  @override
  void initState() {
    super.initState();
    _response = PokemonService.getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF4FF),
      appBar: AppBar(
        backgroundColor: Color(0xff3b5ba6),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back),
        ),
        title: Text("Mi Pokedex",
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFFffcb05))),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: _response,
          builder: (context, AsyncSnapshot<ReqPokemonResponse> snapshot) {
            if (snapshot.hasData) {
              return PokemonList(pokemons: snapshot.data!.results);
            }

            return Padding(
              padding: EdgeInsets.all(5),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
