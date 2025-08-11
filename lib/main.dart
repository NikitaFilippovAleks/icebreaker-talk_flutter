import 'package:flutter/material.dart';

import 'app/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final lightThemeData = ThemeData(brightness: Brightness.light, extensions: [lightSimpleTheme]);
    final darkThemeData = ThemeData(brightness: Brightness.dark, extensions: [darkSimpleTheme]);

    return MaterialApp(
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: ThemeMode.light,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final customTheme = context.customTheme;

    return Scaffold(
      backgroundColor: customTheme.orangeDim,
      appBar: AppBar(
        foregroundColor: customTheme.text,
        title: const Text('Title'),
        backgroundColor: customTheme.background,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text('Hello, World!', textAlign: TextAlign.center, style: customTheme.labelLarge)],
        ),
      ),
    );
  }
}
