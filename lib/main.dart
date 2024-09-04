import 'package:fashion_hub/core/storage_helper.dart';
import 'package:fashion_hub/dashboard/ui/home_screen.dart';
import 'package:fashion_hub/provider/auth_provider.dart';
import 'package:fashion_hub/service/auth_service.dart';
import 'package:fashion_hub/ui/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();
  runApp(const WeTubeApp());
  Get.put(AuthService());
}

Future<void> initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class WeTubeApp extends StatefulWidget {
  const WeTubeApp({super.key});

  @override
  _WeTubeAppState createState() => _WeTubeAppState();
}

class _WeTubeAppState extends State<WeTubeApp> {
  late StorageHelper storageHelper;
  bool isLanguageSelected = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    storageHelper = StorageHelper();
    _checkLanguageSelected();
  }

  Future<void> _checkLanguageSelected() async {
    isLanguageSelected = await storageHelper.isLanguageSelected();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthenticationProvider(storageHelper),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Demo",
        theme: ThemeData(),
        home: Consumer<AuthenticationProvider>(
          builder: (context, provider, child) {
            return const HomeScreen();
          },
        ),
      ),
    );
  }
}
