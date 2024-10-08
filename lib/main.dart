import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_track/themes/theme_provider.dart';
import 'package:stock_track/views/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.themeData,
          home: HomePage(),
        );
      },
    );
  }
}
