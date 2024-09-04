import 'package:fashion_hub/dashboard/list/image_lists.dart';
import 'package:flutter/material.dart';

class FavourateScreen extends StatefulWidget {
  const FavourateScreen({super.key});

  @override
  State<FavourateScreen> createState() => _FavourateScreenState();
}

class _FavourateScreenState extends State<FavourateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourate'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: categoryImageList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  bool isFavorited = false;

                  return Card(
                    elevation: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(8),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                categoryImageList[index],
                                height: 80,
                                width: 80,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Name',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Text('Price'),
                            ],
                          ),
                          Positioned(
                            top: 5,
                            right: 5,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isFavorited = !isFavorited;
                                });
                              },
                              child: Icon(
                                isFavorited
                                    ? Icons.favorite
                                    : Icons.favorite_outline_sharp,
                                color: isFavorited
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
