import 'package:crypto_tracker/modals/cryptocurrency.dart';
import 'package:crypto_tracker/providers/market_povider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class detailpage extends StatefulWidget {
  final String id;
  detailpage({Key? key, required this.id}) : super(key: key);

  @override
  State<detailpage> createState() => _detailpageState();
}

class _detailpageState extends State<detailpage> {
  Widget titleanddetail(
      String title, String detail, CrossAxisAlignment crossAxisAlignment) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        Text(
          detail,
          style: TextStyle(fontSize: 17),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Consumer<marketprovider>(
            builder: ((context, marketProvider, child) {
          cryptocurrency currentcrypto =
              marketProvider.fetchcryptobyid(widget.id);
          return RefreshIndicator(
            onRefresh: () async {
              await marketProvider.fetchdata();
            },
            child: ListView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(currentcrypto.image!),
                  ),
                  title: Text(
                    currentcrypto.name! +
                        "(${currentcrypto.symbol!.toUpperCase()})",
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    "₹ " + currentcrypto.currentprice!.toStringAsFixed(4),
                    style: TextStyle(color: Color(0xff0395eb), fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Price Change (24h)",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Builder(builder: (context) {
                      double pricechange = currentcrypto.pricechange24!;
                      double pricechangepercentage =
                          currentcrypto.pricechangepercentage24!;

                      if (pricechange < 0) {
                        return Text(
                          "${pricechangepercentage.toStringAsFixed(2)}%(${pricechange.toStringAsFixed(4)})",
                          style: TextStyle(color: Colors.red, fontSize: 23),
                        );
                      } else {
                        return Text(
                          "+${pricechangepercentage.toStringAsFixed(2)}%(+${pricechange.toStringAsFixed(4)})",
                          style: TextStyle(color: Colors.green, fontSize: 23),
                        );
                      }
                    })
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    titleanddetail(
                        "Market Cap",
                        "₹ " + currentcrypto.marketcap!.toStringAsFixed(4),
                        CrossAxisAlignment.start),
                    titleanddetail(
                        "MarketCap Rank",
                        "# " + currentcrypto.marketcaprank!.toString(),
                        CrossAxisAlignment.end),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    titleanddetail(
                        "Low 24h",
                        "₹ " + currentcrypto.low24!.toStringAsFixed(4),
                        CrossAxisAlignment.start),
                    titleanddetail(
                        "High 24h",
                        "₹ " + currentcrypto.high24!.toStringAsFixed(4),
                        CrossAxisAlignment.end),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    titleanddetail(
                        "Circulating Supply",
                        currentcrypto.circulatingsupply!.toInt().toString(),
                        CrossAxisAlignment.start),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    titleanddetail(
                        "All Time Low",
                        currentcrypto.atl!.toInt().toStringAsFixed(4),
                        CrossAxisAlignment.start),
                    titleanddetail(
                        "All Time High",
                        currentcrypto.ath!.toInt().toStringAsFixed(4),
                        CrossAxisAlignment.start),
                  ],
                ),
              ],
            ),
          );
        })),
      )),
    );
  }
}
