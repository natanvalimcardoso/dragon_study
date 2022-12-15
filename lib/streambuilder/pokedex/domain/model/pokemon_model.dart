import 'dart:convert';

class PokemonModel {
  final String name;
  final String img;

  PokemonModel({
    required this.name,
    required this.img,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'img': img,
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      name: map['name'] ?? '',
      img: map['img'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) => PokemonModel.fromMap(json.decode(source));
}
