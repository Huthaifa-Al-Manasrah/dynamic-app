import 'package:dynamic_layouts/providers/dynamic_provider.dart';
import 'package:dynamic_layouts/providers/insurance_provider.dart';
import 'package:dynamic_layouts/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DynamicProvider()),
        ChangeNotifierProvider(create: (_) => InsuranceProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Form',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green)
          )
        )
      ),
      home: HomeScreen(),
    );
  }
}
