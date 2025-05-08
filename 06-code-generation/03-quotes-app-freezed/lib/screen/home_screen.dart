import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quote_list_app/model/loading_state.dart';
import '../provider/asset_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final apiProvider = context.read<ApiProvider>();

    Future.microtask(() async => apiProvider.getQuotes());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quote List App")),
      body: Consumer<ApiProvider>(
        builder: (context, value, child) {
          final state = value.quotesState;

          /// todo-04-06: change the widget based on loading state
          return switch (state) {
            LoadingStateLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            LoadingStateLoaded(:var data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final quote = data[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          quote.en,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        Text(quote.author),
                      ],
                    ),
                  ),
                );
              },
            ),
            LoadingStateError(:var message) => Center(child: Text(message)),
            LoadingStateInitial() => const Center(child: Text("No data")),
          };
        },
      ),
    );
  }
}
