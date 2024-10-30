abstract class BaseService {
  String apiKey = "";
  final baseUrl = "https://api.themoviedb.org/3/movie/";

  BaseService() {
    const define = String.fromEnvironment('API_KEY');
    apiKey = define;
  }
}
