import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import the provider package
import 'package:shopping_list_mobile/widgets/left_drawer.dart';
import 'package:shopping_list_mobile/widgets/shop_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<ShopItem> items = [
    ShopItem("View Products", Icons.checklist),
    ShopItem("Add Product", Icons.add_shopping_cart),
    ShopItem("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CookieRequest(), // Provide CookieRequest using Provider
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Shopping List',
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    'PBP Shop',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GridView.count(
                  primary: true,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  children: items.map((ShopItem item) {
                    return ShopCard(item);
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
        drawer: const LeftDrawer(),
      ),
    );
  }
}

// Dummy class to represent the CookieRequest class
class CookieRequest extends ChangeNotifier {
  postJson(String s, String jsonEncode) {}

  logout(String s) {}
  // Your CookieRequest implementation goes here
}
