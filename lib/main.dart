import 'package:bhagvat_geeta/controller/home_provider.dart';
import 'package:bhagvat_geeta/controller/theme_provider.dart';
import 'package:bhagvat_geeta/view/detail.dart';
import 'package:bhagvat_geeta/view/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: Provider.of<ThemeProvider>(context).theme,
          initialRoute: "/",
          routes: {
            "/": (context) => HomePage(),
            "detail": (context) => DetailPage(),
          },
        );
      },
    );
  }
}
