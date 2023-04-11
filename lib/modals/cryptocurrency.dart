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
        ath: map["ath"],
        atl: map["atl"],
        circulatingsupply: map["circulating_supply"],
        currentprice: map["current_price"],
        high24: map["high_24h"],
        id: map["id"],
        image: map["image"],
        low24: map["low_24h"],
        marketcap: map["market_cap"],
        marketcaprank: map["market_cap_rank"],
        name: map["name"],
        pricechange24: map["price_change_24h"],
        pricechangepercentage24: map["price_change_percentage_24h"],
        symbol: map["symbol"]);
  }
}
