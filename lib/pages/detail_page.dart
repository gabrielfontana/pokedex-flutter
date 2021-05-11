import 'package:flutter/material.dart';
import '../helpers/pokemon_helper.dart';
import '../models/pokemon_model.dart';
import '../widgets/metric_tile.dart';
import '../widgets/pokemon_header.dart';
import '../widgets/pokemon_stat_bar.dart';
import '../widgets/pokemon_type_chip.dart';

class DetailPage extends StatefulWidget {
  final PokemonModel pokemon;

  const DetailPage({
    Key key,
    this.pokemon,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        widget.pokemon.name,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Pokemon',
        ),
      ),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: PokemonHelper.getColor(widget.pokemon.type1),
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        Container(
          height: 52.0,
          width: 80.0,
          child: Center(
            child: Text(
              '#${widget.pokemon.id.toString().padLeft(4, '0')}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PokemonHeader(
          backgroundColor: PokemonHelper.getColor(widget.pokemon.type1),
          imageUrl: widget.pokemon.imageUrl,
        ),
        _buildTypes(),
        _buildMetrics(),
        _buildStats(),
      ],
    );
  }

  Widget _buildTypes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PokemonTypeChip(type: widget.pokemon.type1),
        widget.pokemon.type2 != null ? SizedBox(width: 20.0) : SizedBox(),
        widget.pokemon.type2 != null
            ? PokemonTypeChip(type: widget.pokemon.type2)
            : SizedBox(),
      ],
    );
  }

  Widget _buildMetrics() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: MetricTile(
            value: widget.pokemon.weight / 10,
            label: 'Peso',
            unit: 'kg',
          ),
        ),
        Expanded(
          child: MetricTile(
              value: widget.pokemon.height / 10, label: 'Altura', unit: 'm'),
        ),
      ],
    );
  }

  Widget _buildStats() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Estatísticas',
              textAlign: TextAlign.center,
            ),
          ),
          PokemonStatBar(
            label: 'HP',
            value: widget.pokemon.health,
            foregroundColor: PokemonHelper.getColor(widget.pokemon.type1),
          ),
          PokemonStatBar(
            label: 'ATK',
            value: widget.pokemon.attack,
            foregroundColor: PokemonHelper.getColor(widget.pokemon.type1),
          ),
          PokemonStatBar(
            label: 'DEF',
            value: widget.pokemon.defense,
            foregroundColor: PokemonHelper.getColor(widget.pokemon.type1),
          ),
          PokemonStatBar(
            label: 'SPD',
            value: widget.pokemon.speed,
            foregroundColor: PokemonHelper.getColor(widget.pokemon.type1),
          ),
        ],
      ),
    );
  }
}
