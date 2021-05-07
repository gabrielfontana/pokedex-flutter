class PokemonModel {
  final String name;
  final String url;

  PokemonModel({
    this.name,
    this.url,
  });

  factory PokemonModel.fromMap(Map<String, dynamic> json) {
    return PokemonModel(
      name: json['name'],
      url: json['url'],
    );
  }
}
