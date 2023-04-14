import 'dart:async';

import 'package:crypto_tracker/modals/api.dart';
import 'package:crypto_tracker/modals/cryptocurrency.dart';
import 'package:flutter/cupertino.dart';

class marketprovider with ChangeNotifier {
  bool isloading = true;
  List<cryptocurrency> markets = [];

  marketprovider() {
    fetchdata();
  }

  void fetchdata() async {
    List<dynamic> _markets = await api.getmarkets();

//to remove the duplicates we made this temp list
    List<cryptocurrency> temp = [];
    for (var market in _markets) {
      cryptocurrency newcrypto = cryptocurrency.fromJson(market);
      temp.add(newcrypto);
    }
    markets = temp;
    isloading = false;
    notifyListeners();
  }
}
