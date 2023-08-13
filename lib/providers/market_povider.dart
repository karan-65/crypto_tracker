import 'dart:async';
import 'package:crypto_tracker/modals/api.dart';
import 'package:crypto_tracker/modals/cryptocurrency.dart';
import 'package:crypto_tracker/modals/localstorage.dart';
import 'package:flutter/cupertino.dart';

class marketprovider with ChangeNotifier {
  bool isloading = true;
  List<cryptocurrency> markets = [];

  marketprovider() {
    fetchdata();
  }

  Future<void> fetchdata() async {
    List<dynamic> _markets = await api.getmarkets();
    List<String> favorites = await localstorage.fetchfav();

//to remove the duplicates we made this temp list
    List<cryptocurrency> temp = [];
    for (var market in _markets) {
      cryptocurrency newcrypto = cryptocurrency.fromJson(market);
      if (favorites.contains(newcrypto.id!)) {
        newcrypto.isfav = true;
      }
      temp.add(newcrypto);
    }
    markets = temp;
    isloading = false;
    notifyListeners();
  }

  cryptocurrency fetchcryptobyid(String id) {
    cryptocurrency crypto =
        markets.where((element) => element.id == id).toList()[0];
    return crypto;
  }

  void addfavorites(cryptocurrency crypto) async {
    int indexofcrypto = markets.indexOf(crypto);
    markets[indexofcrypto].isfav = true;
    await localstorage.addfav(crypto.id!);
    notifyListeners();
  }

  void removefav(cryptocurrency crypto) async {
    int indexofcrypto = markets.indexOf(crypto);
    markets[indexofcrypto].isfav = false;
    await localstorage.removefav(crypto.id!);
    notifyListeners();
  }
}
