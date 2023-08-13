import 'package:crypto_tracker/modals/cryptocurrency.dart';
import 'package:crypto_tracker/pages/Detailspage.dart';
import 'package:crypto_tracker/pages/favorites.dart';
import 'package:crypto_tracker/pages/markets.dart';
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

class _homepageState extends State<homepage> with TickerProviderStateMixin {
  late TabController viewcontoller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewcontoller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Themeprovider themeprovider =
        Provider.of<Themeprovider>(context, listen: false);
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
                "Welcome Back",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Crypto Today",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  IconButton(
                    onPressed: () {
                      themeprovider.toggleTheme();
                    },
                    icon: (themeprovider.themeMode == ThemeMode.light)
                        ? Icon(Icons.dark_mode)
                        : Icon(Icons.light_mode),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TabBar(controller: viewcontoller, tabs: [
                Tab(
                  child: Text(
                    "Markets",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Tab(
                  child: Text("Favorites",
                      style: Theme.of(context).textTheme.bodyText1),
                ),
              ]),
              Expanded(
                child: TabBarView(
                    controller: viewcontoller,
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    children: [
                      markets(),
                      Favorites(),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
