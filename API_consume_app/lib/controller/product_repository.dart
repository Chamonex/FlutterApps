import 'dart:convert';
import 'package:api_consume_app/http/exceptions.dart';
import 'package:api_consume_app/http/http_client.dart';
import '../models/product.dart';

abstract class IProductRepository {
  Future<List<Product>> getProducts();
}

class ProductRepository implements IProductRepository {
  final IHttpClient client;

  ProductRepository({required this.client});

  @override
  Future<List<Product>> getProducts() async {
    final response = await client.get(url: 'https://dummyjson.com/products');

    if (response.statusCode == 200) {
      final List<Product> produtos = [];

      final decoded = jsonDecode(response.body);

      decoded['products'].map((item) {
        final Product product = Product.fromMap(item);
        produtos.add(product);
      }).toList();

      return produtos;
    }
    else if (response.statusCode == 404) {
      throw NotFoundException("A url informada nao e valida");
    }
    else {
      throw Exception("Nao foi possivel carregar os produtos");
    }
  }
}