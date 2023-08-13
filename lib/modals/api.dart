import 'dart:convert';

import 'package:http/http.dart' as http;

class api {
  static Future<List<dynamic>> getmarkets() async {
    try {
      //it parses the data string type to uri
      Uri requestpath = Uri.parse(
          "https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=20&page=1&sparkline=false");

      var response = await http.get(requestpath);
      
      var decoderesponse = jsonDecode(response.body);

      List<dynamic> markets = decoderesponse as List<dynamic>;
      return markets;
    } catch (ex) {
      return [];
    }
  }
}
