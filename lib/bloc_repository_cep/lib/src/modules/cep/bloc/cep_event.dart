abstract class CepEvent {
  const CepEvent();
}

class PegarCep extends CepEvent {
  final String cep;
  PegarCep(this.cep);
}

