import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/api/api_service.dart';
import 'provider/home_provider.dart';
import 'provider/upload_provider.dart';
import 'screen/home_screen.dart';

void main() {
  /// todo-03-upload-06: inject a UploadProvider to main widget
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UploadProvider(
            ApiService(),
          ),
        ),
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    ),
  );
}
