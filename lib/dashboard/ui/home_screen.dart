import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashion_hub/core/widgets.dart';
import 'package:fashion_hub/dashboard/list/image_lists.dart';
import 'package:fashion_hub/dashboard/ui/cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  int currentIndex = 0;
  final List<Widget> screens = [
    HomeScreen(),
    CartScreen(),
  ];
  List<int> favoritedItems = [];

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currentIndex == 0
          ? AppBar(
     actions: [
       Icon(Icons.favorite_rounded,color: Colors.red,),
       SizedBox(width: 10,),
       Icon(Icons.notifications,color: Colors.blue,),
       SizedBox(width: 10,),
       Padding(
         padding: const EdgeInsets.only(right: 16),
         child: Icon(Icons.shopping_cart_rounded,color: Colors.purple,),
       )
     ],

      )
          : null,
      body: currentIndex == 0
          ? Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFiled(
                hintText: 'Search...',
                controller: searchController,
                keyboardType: TextInputType.name,
                obscured: false,
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: List.generate(
                      (categoryImageList.length / 2).ceil(),
                          (index) {
                        if (index < catogeryStringList.length) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(categoryImageList[index]),
                                  radius: 24,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  catogeryStringList[index],
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    (categoryImageList.length / 2).floor(),
                        (index) {
                      if (index + (categoryImageList.length / 2).ceil() < catogeryStringList.length) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(categoryImageList[
                                index + (categoryImageList.length / 2).ceil()]),
                                radius: 24,
                              ),
                              SizedBox(height: 8),
                              Text(
                                catogeryStringList[index + (categoryImageList.length / 2).ceil()],
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 28),
              CarouselSlider(
                options: CarouselOptions(
                  height: 120,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayCurve: Curves.easeInOut,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
                items: AddImageList.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: double.infinity,
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 18),
              Text(
                'All',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 400,
                child: GridView.builder(
                  itemCount: categoryImageList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    bool isFavorited = favoritedItems.contains(index);

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
                              children: [
                                Image.asset(
                                  categoryImageList[index],
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.contain,
                                ),
                                const Text('Name'),
                                const Text('Price'),
                              ],
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (isFavorited) {
                                      favoritedItems.remove(index);
                                    } else {
                                      favoritedItems.add(index);
                                    }
                                  });
                                  Future.delayed(Duration(seconds: 3), () {
                                    setState(() {
                                      favoritedItems.remove(index);
                                    });
                                  });
                                },
                                child: Icon(
                                  isFavorited
                                      ? Icons.favorite
                                      : Icons.favorite_outline_sharp,
                                  color: isFavorited ? Colors.red : Colors.grey,
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
      )
          : screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: onItemTapped,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outline_blank_outlined),
            label: 'My Order',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
