class RequestExceptionCatcher {
  static checkRequestResponse(int statusCode) {
    if (statusCode >= 400) {
      switch (statusCode) {
        case 400:
          throw BadRequestError();
        case 401:
          throw UnauthorizedError();
        case 404:
          throw NotFoundError();
        case 405:
          throw MethodNotAllowedError();
        case 500:
          throw InternalError();
        default:
          throw RequestError();
      }
    }
  }
}

class RequestError implements Exception {
  final String message = "Algo deu errado durante a requisição...";
}

class WrongPasswordError implements RequestError {
  @override
  final String message = "Senha inválida!";
}

class TimeoutError implements RequestError {
  @override
  final String message = "O servidor falhou em responder a requisição a tempo.";
}

class UnauthorizedError implements RequestError {
  @override
  final String message = "Senha inválida!";
}

class BadRequestError implements RequestError {
  @override
  final String message = "Não foi possível concluir a ação.";
}

class NotFoundError implements RequestError {
  @override
  final String message = "Rota não encontrada.";
}

class MethodNotAllowedError implements RequestError {
  @override
  final String message = "Método não permitido.";
}

class InternalError implements RequestError {
  @override
  final String message = "O servidor falhou em processar sua requisição.";
}

class ModelError implements RequestError {
  @override
  final String message = "Não foi possível carregar os dados.";
}

class CustomError implements RequestError {
  @override
  final String message;

  CustomError(this.message);
}
