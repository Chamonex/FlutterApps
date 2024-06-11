import 'dart:ui';

import 'package:api_consume_app/controller/product_repository.dart';
import 'package:api_consume_app/http/http_client.dart';
import 'package:flutter/material.dart';
import 'stores/product_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductStore store = ProductStore(
    repository: ProductRepository(
      client: HttpClient(),
    ),
  );

  @override
  void initState() {
    super.initState();
    store.getProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Center(
          child: Text(
            "Consumo de APIs",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: AnimatedBuilder(
        animation: Listenable.merge([
          store.isLoading,
          store.erro,
          store.state,
        ]),
        builder: (context, child) {
          if (store.isLoading.value = true) {
            return const CircularProgressIndicator();
          }
          if (store.erro.value.isNotEmpty) {
            return Center(
              child: Text(store.erro.value),
            );
          }
          if (store.state.value.isEmpty) {
            return Center(
              child: Text("Nenhum item encontrado na lista"),
            );
          }
          else {
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 32,
              ),
              padding: EdgeInsets.all(16),
              itemCount: store.state.value.length,
              itemBuilder: (_, index) {
                final item = store.state.value[index];
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        item.thumbnail,
                        fit: BoxFit.cover,
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        item.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 24,
                        )
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "R\$ ${item.price}",
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.description,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
