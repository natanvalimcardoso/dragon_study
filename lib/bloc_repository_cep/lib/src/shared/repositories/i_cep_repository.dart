import 'package:flutter_getx/src/shared/model/cep_model.dart';

abstract class ICepRepository {
  Future<CepModel> receberCep(String cep);
}