
import '../model/cep_model.dart';

abstract class ICepRepository {
  Future<CepModel> receberCep(String cep);
}