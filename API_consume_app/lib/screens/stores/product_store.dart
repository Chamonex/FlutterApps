import 'package:api_consume_app/controller/product_repository.dart';
import 'package:flutter/cupertino.dart';
import '../../http/exceptions.dart';
import '../../models/product.dart';

class ProductStore {
  final IProductRepository repository;
  // loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  // carregou
  final ValueNotifier<List<Product>> state =
      ValueNotifier<List<Product>>([]);
  // erro
  final ValueNotifier<String> erro =
      ValueNotifier<String>("");

  ProductStore({required this.repository});


  Future getProdutos() async {
    isLoading.value = true;

    try {
      final result = await repository.getProducts();
      state.value = result;
    }
    on NotFoundException catch(e) {
      erro.value = e.messege;
    }
    catch (e) {
      erro.value = e.toString();
    }

    isLoading.value = false;
  }

}