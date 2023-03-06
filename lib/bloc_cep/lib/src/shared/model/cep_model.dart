import 'dart:convert';

class CepModel {
  final String cep;
  final String logradouro;
  final String complemento;
  final String bairro;
  final String localidade;
  final String uf;
  final String ibge;
  final String gia;
  final String ddd;
  final String siafi;

  CepModel(
    this.cep,
    this.logradouro,
    this.complemento,
    this.bairro,
    this.localidade,
    this.uf,
    this.ibge,
    this.gia,
    this.ddd,
    this.siafi,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'ibge': ibge,
      'gia': gia,
      'ddd': ddd,
      'siafi': siafi,
    };
  }

  factory CepModel.fromMap(Map<String, dynamic> map) {
    return CepModel(
      map['cep'] as String,
      map['logradouro'] as String,
      map['complemento'] as String,
      map['bairro'] as String,
      map['localidade'] as String,
      map['uf'] as String,
      map['ibge'] as String,
      map['gia'] as String,
      map['ddd'] as String,
      map['siafi'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CepModel.fromJson(String source) => CepModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CepModel(cep: $cep, logradouro: $logradouro, complemento: $complemento, bairro: $bairro, localidade: $localidade, uf: $uf, ibge: $ibge, gia: $gia, ddd: $ddd, siafi: $siafi)';
  }
}