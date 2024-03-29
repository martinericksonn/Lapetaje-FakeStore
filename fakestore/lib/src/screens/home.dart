import 'package:fakestore/src/screens/product_detail.dart';
import 'package:flutter/material.dart';

// import '../models/product.dart';
import '../model/products.dart';
import '../services/api_service.dart';
import 'all_category.dart';
import 'cart_screen.dart';
// import 'all_category.dart';
// import 'cart_screen.dart';
// import 'product_detail.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatelessWidget {
  final String userToken;

  ApiService get apiService => GetIt.I<ApiService>();

  const HomeScreen({Key? key, required this.userToken}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.view_list),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => AllCategoryScreen(
                        userToken: userToken,
                      )),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const CartScreen(),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder(
            future: apiService.getAllProducts(),
            builder: (_, AsyncSnapshot<List<Product>> snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              final products = snapshot.data!;

              return ListView.separated(
                separatorBuilder: (_, __) => const Divider(thickness: 1),
                itemCount: products.length,
                itemBuilder: ((context, index) {
                  final product = snapshot.data![index];
                  return ListTile(
                    title: Text(product.title),
                    leading: Image.network(
                      product.image!,
                      height: 50,
                      width: 50,
                    ),
                    subtitle: Text(product.price.toString()),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailScreen(
                            productId: product.id,
                            userId: userToken,
                          ),
                        ),
                      );
                    },
                  );
                }),
              );
            }),
      ),
    );
  }
}
