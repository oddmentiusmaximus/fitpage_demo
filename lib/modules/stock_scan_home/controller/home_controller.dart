import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../model/stock_scan_model.dart';
import '../repository/stock_scan_repo.dart';

// Define a controller class for the Stock Scan App.
class StockScanHomeController extends GetxController {
  // Declare an instance of the StockScanRepository for making data requests.
  late StockScanRepository scanRepository;

  // Declare a list to store StockScanModel instances retrieved from the repository.
  List<StockScanModel> stockScanList = [];

  @override
  void onInit() {
    // Initialize the scanRepository by creating an instance of StockScanRepository.
    scanRepository = StockScanRepository();

    super.onInit();
  }

  // Define an asynchronous method to fetch initial data for the screen.
  Future<void> getInitData() async {
    // Call the getHomeData method from scanRepository to retrieve data.
    final response = await scanRepository.getHomeData();

    // Check the type of the response:
    if (response is List<StockScanModel>) {
      // If the response is a List of StockScanModel, assign it to stockScanList.
      stockScanList = response;
    } else if (response.data != null) {
      // If the response has a data property (assuming a specific response structure),
      // you can handle it here.
    } else {
      // Handle other cases or errors here if needed.
    }
  }

  navigateToCriteria({required int index}) {
    Get.toNamed(Routes.criteriaView, arguments: {'indexOfSection': index});
  }
}
