
import 'package:dio/dio.dart';

import '../../../shared/model/cep_model.dart';
import '../../../shared/repositories/i_cep_repository.dart';

class CepRepository implements ICepRepository {
  final Dio dio = Dio();

  @override
  Future<CepModel> receberCep(String cep) async {
    try {
      final response = await dio.get('https://viacep.com.br/ws/$cep/json/');
      final json = response.data;
      final cepModel = CepModel.fromMap(json);
      return cepModel;
    } catch (e) {
      throw(e.toString());
    }
  }
}
