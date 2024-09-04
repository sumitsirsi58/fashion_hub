import 'package:fashion_hub/dashboard/ui/cart_screen.dart';
import 'package:flutter/material.dart';

class OrderFullScreen extends StatefulWidget {
  const OrderFullScreen({super.key});

  @override
  State<OrderFullScreen> createState() => _OrderFullScreenState();
}

class _OrderFullScreenState extends State<OrderFullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.share, color: Colors.pink),
          SizedBox(width: 16),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartScreen()));
                },
                child: Icon(Icons.shopping_cart, color: Colors.purple)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Id',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Divider(color: Colors.grey.shade300),
                ],
              ),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _buildListTile('Product Name', 'Fashion Shirt'),
                  _buildListTile('Price', '100'),
                  Divider(color: Colors.grey.shade300,),
                  _buildListTile('Total Price', '100'),
                ],
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(String leadingText, String trailingText) {
    return ListTile(
      leading: Text(leadingText, style: TextStyle(fontSize: 14)),
      trailing: Text(trailingText, style: TextStyle(fontSize: 14)),
      dense: true,
    );
  }
}
