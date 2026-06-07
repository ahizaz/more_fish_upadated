import 'package:get/get.dart';
import '../controllers/automation_settings_controller.dart';

class AutomationSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AutomationSettingsController>(
      () => AutomationSettingsController(),
    );
  }
}
