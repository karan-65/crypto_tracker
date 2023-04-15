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
    return Expanded(child:
        Consumer<marketprovider>(builder: (context, marketprovider, child) {
      if (marketprovider.isloading == true) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        if (marketprovider.markets.length > 0) {
          return RefreshIndicator(
            onRefresh: () async {
              await marketprovider.fetchdata();
            },
            child: ListView.builder(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: marketprovider.markets.length,
              itemBuilder: ((context, index) {
                cryptocurrency currentcrypto = marketprovider.markets[index];

                return ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return detailpage(
                        id: currentcrypto.id!,
                      );
                    }));
                  },
                  contentPadding: EdgeInsets.all(0),
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(currentcrypto.image!),
                  ),
                  title: Text(currentcrypto.name!),
                  subtitle: Text(currentcrypto.symbol!.toUpperCase()),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "₹ " + currentcrypto.currentprice!.toStringAsFixed(4),
                        style: TextStyle(
                            color: Color(0xff0395eb),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Builder(builder: (context) {
                        double pricechange = currentcrypto.pricechange24!;
                        double pricechangepercentage =
                            currentcrypto.pricechangepercentage24!;

                        if (pricechange < 0) {
                          return Text(
                            "${pricechangepercentage.toStringAsFixed(2)}%(${pricechange.toStringAsFixed(4)})",
                            style: TextStyle(color: Colors.red),
                          );
                        } else {
                          return Text(
                            "+${pricechangepercentage.toStringAsFixed(2)}%(+${pricechange.toStringAsFixed(4)})",
                            style: TextStyle(color: Colors.green),
                          );
                        }
                      })
                    ],
                  ),
                );
              }),
            ),
          );
        } else {
          return Text("data not found");
        }
      }
    }));
  }
}
