import 'dart:convert';

/// todo-03-upload-01: create a UploadResponse file
class UploadResponse {
  final bool error;
  final String message;

  UploadResponse({
    required this.error,
    required this.message,
  });

  factory UploadResponse.fromMap(Map<String, dynamic> map) {
    return UploadResponse(
      error: map['error'] ?? false,
      message: map['message'] ?? '',
    );
  }

  factory UploadResponse.fromJson(String source) =>
      UploadResponse.fromMap(json.decode(source));
}
