import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/upload_response.dart';

class ApiService {
  /// todo-03-upload-02: create a function to upload file
  Future<UploadResponse> uploadDocument(
    List<int> bytes,
    String fileName,
    String description,
  ) async {
    const String url = "https://story-api.dicoding.dev/v1/stories/guest";

    final uri = Uri.parse(url);
    var request = http.MultipartRequest('POST', uri);

    final multiPartFile = http.MultipartFile.fromBytes(
      "photo",
      bytes,
      filename: fileName,
    );
    final Map<String, String> fields = {
      "description": description,
    };
    final Map<String, String> headers = {
      "Content-type": "multipart/form-data",
    };

    request.files.add(multiPartFile);
    request.fields.addAll(fields);
    request.headers.addAll(headers);

    final http.StreamedResponse streamedResponse = await request.send();
    final int statusCode = streamedResponse.statusCode;

    final Uint8List responseList = await streamedResponse.stream.toBytes();
    final String responseData = String.fromCharCodes(responseList);

    if (statusCode == 201) {
      final UploadResponse uploadResponse = UploadResponse.fromJson(
        responseData,
      );
      return uploadResponse;
    } else {
      throw Exception("Upload file error");
    }
  }
}
