import 'dart:convert';

import 'package:flutter_getx/src/shared/model/cep_model.dart';
import 'package:http/http.dart' as https;
import '../../../shared/repositories/i_cep_repository.dart';

class CepRepository implements ICepRepository {
  @override
  Future<CepModel> receberCep(String cep) async {
    final response = await https.get(
      Uri.parse(
        'https://viacep.com.br/ws/$cep/json/',
      ),
    );

    try {
      final json = jsonDecode(response.body);
      final cepModel = CepModel.fromMap(json);
      return cepModel;
    } catch (e) {
      return throw (e.toString());
    }
  }
}
