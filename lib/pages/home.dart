import 'package:crypto_tracker/modals/cryptocurrency.dart';
import 'package:crypto_tracker/providers/market_povider.dart';
import 'package:crypto_tracker/providers/themeprovider.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: 0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Crypto today",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  IconButton(
                    onPressed: () {
                      Provider.of<Themeprovider>(context, listen: false)
                          .toggleTheme();
                    },
                    icon: Icon(Icons.dark_mode),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(child: Consumer<marketprovider>(
                  builder: (context, marketprovider, child) {
                if (marketprovider.isloading == true) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (marketprovider.markets.length > 0) {
                    return ListView.builder(
                      physics: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: marketprovider.markets.length,
                      itemBuilder: ((context, index) {
                        cryptocurrency currentcrypto =
                            marketprovider.markets[index];

                        return ListTile(
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
                                "₹ " +
                                    currentcrypto.currentprice!
                                        .toStringAsFixed(4),
                                style: TextStyle(
                                    color: Color(0xff0395eb),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              Builder(builder: (context) {
                                double pricechange =
                                    currentcrypto.pricechange24!;
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
                    );
                  } else {
                    return Text("data not found");
                  }
                }
              })),
            ],
          ),
        ),
      ),
    );
  }
}
