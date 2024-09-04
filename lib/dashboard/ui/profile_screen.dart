import 'package:fashion_hub/dashboard/ui/cart_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
              child: Icon(
                Icons.shopping_cart,
                color: Colors.purple,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 38,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Nick Name',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_outlined),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.call, color: Colors.blue, size: 30),
                          SizedBox(height: 8),
                          Text(
                            'Help Centre',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.language, color: Colors.red, size: 30),
                          SizedBox(height: 8),
                          Text(
                            'Change Language',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'My Payments',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.food_bank,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Bank & UPI Details')
                ],
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.payments_rounded,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Payment & Refund')
                ],
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'My Activities',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Icon(
                    Icons.favorite_rounded,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('WishLishted Products')
                ],
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(
                    Icons.share,
                    color: Colors.pink,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Shared Products')
                ],
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              SizedBox(height: 20,),
              Text(
                'Others',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Setting')
                ],
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(
                    Icons.login_outlined,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Logout')
                ],
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
