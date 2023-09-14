import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';

import '../model/api_exception.dart';
import '../model/stock_scan_model.dart';

class StockScanRepository {
  // Function to make the API call
  static const String apiUrl =
      "http://coding-assignment.bombayrunning.com/data.json";

  // Function to make the API call
  Future<dynamic> getHomeData() async {
    // Create a Dio instance
    final Dio dio = Dio();
    try {
      final response = await dio.get(apiUrl);

      if (response.statusCode == 200) {
        return List<StockScanModel>.from(
          response.data.map(
            (x) => StockScanModel.fromJson(x),
          ),
        );
        // return List.from(StockScanModel.fromJson(response.data));
      } else {
        // If the server did not return a 200 OK response, throw an exception.
        debugPrint("Status Code | ${response.statusCode}");

        return ApiException(data: response.statusMessage, error: null);
      }
    } catch (e) {
      // Handle Dio errors, if any
      debugPrint("Error in Fetching Data | ${e.toString()}");
      return ApiException(data: null, error: e.toString());
    }
  }
}
