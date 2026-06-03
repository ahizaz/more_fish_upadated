import 'package:get/get.dart';
import '../../water_quality_device/controllers/water_quality_device_controller.dart';

class NanoBubbleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaterQualityDeviceController>(
      () => WaterQualityDeviceController(),
    );
  }
}
