import 'package:flutter/material.dart';
import 'package:emektep/router.dart';

import 'service/pocketbase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await pocketBaseService.initAuth();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'EMektep',
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
    );
  }
}
