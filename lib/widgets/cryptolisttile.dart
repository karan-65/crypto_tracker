import 'package:crypto_tracker/modals/cryptocurrency.dart';
import 'package:crypto_tracker/providers/market_povider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/Detailspage.dart';

class Listtile extends StatelessWidget {
  final cryptocurrency currentcrypto;
  const Listtile({Key? key, required this.currentcrypto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    marketprovider marketProvider =
        Provider.of<marketprovider>(context, listen: false);
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
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
      title: Row(
        children: [
          Flexible(
              child: Text(
            currentcrypto.name!,
            overflow: TextOverflow.ellipsis,
          )),
          SizedBox(
            width: 10,
          ),
          (currentcrypto.isfav == false)
              ? GestureDetector(
                  onTap: () {
                    marketProvider.addfavorites(currentcrypto);
                  },
                  child: Icon(
                    CupertinoIcons.heart,
                    size: 18,
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    marketProvider.removefav(currentcrypto);
                  },
                  child: Icon(
                    CupertinoIcons.heart_fill,
                    color: Colors.red,
                    size: 18,
                  ),
                )
        ],
      ),
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
  }
}
