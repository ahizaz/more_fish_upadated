import 'dart:async';
import 'package:get/get.dart';
import '../../cattle_index/controllers/cattle_header_controller.dart';

/// PoultryHeaderController now acts as a proxy for the unified CattleHeaderController.
/// This ensures consistent date, time, and weather data across all modules.
class PoultryHeaderController extends GetxController {
  final _master = Get.find<CattleHeaderController>();

  // Expose observables from master
  RxString get formattedDate => _master.formattedDate;
  RxString get formattedTime => _master.formattedTime;
  RxString get tempText => _master.tempText;
  RxString get humidityText => _master.humidityText;

  @override
  void onInit() {
    super.onInit();
    // Ensure master is refreshing for the current Poultry route
    _master.refreshWeather();
  }

  /// Trigger a refresh on the master controller
  Future<void> refreshWeather() async {
    await _master.refreshWeather();
  }
}
