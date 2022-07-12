import 'package:flutter/material.dart';

// import '../models/product.dart';
import '../model/products.dart';
import '../services/api_service.dart';
// import 'all_category.dart';
// import 'cart_screen.dart';
// import 'product_detail.dart';

class HomeScreen extends StatelessWidget {
  final ApiService apiService;
  const HomeScreen({Key? key, required this.apiService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.view_list),
          //   onPressed: () =>
          //    Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (_) => const AllCategoryScreen()),
          //   ),
          // ),
          // IconButton(
          //   icon: const Icon(Icons.shopping_cart),
          //   onPressed: () => Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (_) => const CartScreen(),
          //     ),
          //   ),
          // ),
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
              print(products[0].title);
              return ListView.separated(
                separatorBuilder: (_, __) => const Divider(thickness: 1),
                itemCount: products.length,
                itemBuilder: ((context, index) {
                  final product = snapshot.data![index];
                  return ListTile(
                    title: Text('[title]'),
                    leading: Image.network(
                      '[image]',
                      height: 50,
                      width: 50,
                    ),
                    subtitle: Text('\$price}'),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (_) => ProductDetailScreen(),
                      //   ),
                      // );
                    },
                  );
                }),
              );
            }),
      ),
    );
  }
}
