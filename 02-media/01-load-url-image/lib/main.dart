import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeInImage.assetNetwork(
                placeholder: 'assets/blocks.gif',
                image: 'https://picsum.photos/300/300',
                fadeOutDuration: const Duration(seconds: 2),
                fadeInDuration: const Duration(seconds: 2),
              ),
              FutureBuilder<String>(
                future: rootBundle.loadString("assets/image-base64.txt"),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return FadeInImage.memoryNetwork(
                      placeholder: base64.decode(snapshot.data!),
                      image: 'https://picsum.photos/300/300',
                    );
                  }
                  return const SizedBox();
                },
              ),
              CachedNetworkImage(
                cacheKey: "cache-key",
                imageUrl: 'https://picsum.photos/300/300',
                // placeholder: (context, url) => Image.asset("assets/blocks.gif"),
                progressIndicatorBuilder: (context, url, progress) =>
                    CircularProgressIndicator(value: progress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                cacheManager: CacheManager(
                  Config(
                    "cache-key-name",
                    stalePeriod: const Duration(seconds: 3),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
