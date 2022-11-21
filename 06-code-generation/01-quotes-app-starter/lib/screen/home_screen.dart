import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/loading_state.dart';
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
      appBar: AppBar(
        title: const Text("Quote List App"),
      ),
      body: Consumer<ApiProvider>(
        builder: (context, value, child) {
          final state = value.quotesState;
          if (state == LoadingState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state == LoadingState.loaded) {
            final quotes = value.quotes;
            return ListView.builder(
              itemCount: quotes.length,
              itemBuilder: (context, index) {
                final quote = quotes[index];
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
            );
          } else if (state == LoadingState.error) {
            final message = value.quotesMessage;
            return Center(
              child: Text(message),
            );
          } else {
            return const Center(
              child: Text("No data"),
            );
          }
        },
      ),
    );
  }
}
