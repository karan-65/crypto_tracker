import 'package:crypto_tracker/modals/cryptocurrency.dart';
import 'package:crypto_tracker/providers/market_povider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Consumer<marketprovider>(builder: (context, marketProvider, child) {
      List<cryptocurrency> favorites = marketProvider.markets
          .where(
            (element) => element.isfav == true,
          )
          .toList();
      return Text(favorites.length.toString());
    });
  }
}
