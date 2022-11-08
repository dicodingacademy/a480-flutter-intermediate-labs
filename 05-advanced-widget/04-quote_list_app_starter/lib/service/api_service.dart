import 'package:http/http.dart' as http;

import '../model/api_response.dart';

class ApiService {
  final http.Client client;

  ApiService(this.client);

  static const String endpoint = "https://quote-api.dicoding.dev";

  Future<ApiResponse> getQuotes([int page = 1, int size = 10]) async {
    var url = Uri.parse("$endpoint/list?page=$page&size=$size");

    var response = await http.get(url);
    final statusCode = response.statusCode;

    if (statusCode == 200) {
      final ApiResponse apiResponse = ApiResponse.fromJson(
        response.body,
      );
      return apiResponse;
    } else {
      throw Exception("Get quotes error");
    }
  }
}
