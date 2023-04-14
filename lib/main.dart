import 'package:crypto_tracker/constants/themes.dart';
import 'package:crypto_tracker/pages/home.dart';
import 'package:crypto_tracker/providers/market_povider.dart';
import 'package:crypto_tracker/providers/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<marketprovider>(
          create: (context) => marketprovider(),
        ),
        ChangeNotifierProvider<Themeprovider>(
          create: (context) => Themeprovider(),
        )
      ],
      child: Consumer<Themeprovider>(builder: (context, themeprovider, child) {
        return MaterialApp(
          themeMode: themeprovider.themeMode,
          theme: lighttheme,
          darkTheme: darktheme,
          home: homepage(),
        );
      }),
      // child: MaterialApp(
      //   theme: lighttheme,
      //   darkTheme: darktheme,
      //   home: homepage(),
      // ),
    );
  }
}
