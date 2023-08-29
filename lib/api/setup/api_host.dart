class ApiHost {
  ApiHost._();

  static String get baseURL {
    return 'https://pokeapi.co/api$apiVersion';
  }

  static String get apiVersion => '/v2';
}
