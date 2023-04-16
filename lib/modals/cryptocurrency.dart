class cryptocurrency {
  String? id;
  String? name;
  String? image;
  String? symbol;
  double? currentprice;
  double? marketcap;
  int? marketcaprank;
  double? high24;
  double? low24;
  double? pricechange24;
  double? pricechangepercentage24;
  double? circulatingsupply;
  double? atl;
  double? ath;
  bool isfav = false;

  cryptocurrency(
      {required this.ath,
      required this.atl,
      required this.circulatingsupply,
      required this.currentprice,
      required this.high24,
      required this.id,
      required this.image,
      required this.low24,
      required this.marketcap,
      required this.marketcaprank,
      required this.name,
      required this.pricechange24,
      required this.pricechangepercentage24,
      required this.symbol});

  factory cryptocurrency.fromJson(Map<String, dynamic> map) {
    return cryptocurrency(
        ath: double.parse(map["ath"].toString()),
        atl: double.parse(map["atl"].toString()),
        circulatingsupply: double.parse(map["circulating_supply"].toString()),
        currentprice: double.parse(map["current_price"].toString()),
        high24: double.parse(map["high_24h"].toString()),
        id: map["id"],
        image: map["image"],
        low24: double.parse(map["low_24h"].toString()),
        marketcap: double.parse(map["market_cap"].toString()),
        marketcaprank: map["market_cap_rank"],
        name: map["name"],
        pricechange24: double.parse(map["price_change_24h"].toString()),
        pricechangepercentage24:
            double.parse(map["price_change_percentage_24h"].toString()),
        symbol: map["symbol"]);
  }
}
