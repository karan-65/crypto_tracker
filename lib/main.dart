import 'package:crypto_tracker/constants/themes.dart';
import 'package:crypto_tracker/modals/localstorage.dart';
import 'package:crypto_tracker/pages/home.dart';
import 'package:crypto_tracker/providers/market_povider.dart';
import 'package:crypto_tracker/providers/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? currentheme = await localstorage.gettheme() ?? "light";

  runApp(MyApp(
    theme: currentheme,
  ));
}

class MyApp extends StatefulWidget {
  final String theme;
  MyApp({required this.theme});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<marketprovider>(
          create: (context) => marketprovider(),
        ),
        ChangeNotifierProvider<Themeprovider>(
          create: (context) => Themeprovider(widget.theme),
        )
      ],
      child: Consumer<Themeprovider>(builder: (context, themeprovider, child) {
        return MaterialApp(
          themeMode: themeprovider.themeMode,
          theme: lighttheme,
          darkTheme: darktheme,
          debugShowCheckedModeBanner: false,
          home: homepage(),
        );
      }),
    );
  }
}
