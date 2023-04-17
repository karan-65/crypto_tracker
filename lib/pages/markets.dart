import 'package:crypto_tracker/widgets/cryptolisttile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modals/cryptocurrency.dart';
import '../providers/market_povider.dart';
import 'Detailspage.dart';

class markets extends StatefulWidget {
  const markets({Key? key}) : super(key: key);

  @override
  State<markets> createState() => _marketsState();
}

class _marketsState extends State<markets> {
  @override
  Widget build(BuildContext context) {
    return Consumer<marketprovider>(builder: (context, marketProvider, child) {
      if (marketProvider.isloading == true) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        if (marketProvider.markets.length > 0) {
          return RefreshIndicator(
            onRefresh: () async {
              await marketProvider.fetchdata();
            },
            child: ListView.builder(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: marketProvider.markets.length,
              itemBuilder: ((context, index) {
                cryptocurrency currentcrypto = marketProvider.markets[index];
                return Listtile(currentcrypto: currentcrypto);
              }),
            ),
          );
        } else {
          return Text("data not found");
        }
      }
    });
  }
}
