import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modules/cattle_index/controllers/cattle_header_controller.dart';
import '../service/local_storage.dart';
import 'common_text.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({
    super.key,
    required this.title,
    required this.cityName,
    this.logoAssetPath,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.date,
    this.time,
    this.humidity,
    this.temp,
    this.actions,
    this.leading,
    this.tempLabel,
    this.humidityLabel,
  });

  final String title;
  final String cityName;
  final String? logoAssetPath;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final String? date;
  final String? time;
  final String? temp;
  final String? humidity;
  final String? tempLabel;
  final String? humidityLabel;
  final List<Widget>? actions;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final storage = Get.find<LoginTokenStorage>();

    return Obx(() {
      final bool loggedIn = storage.isCattleLoggedIn.value;

      String finalCityName = cityName;
      String? finalTemp = temp;
      String? finalHumidity = humidity;
      String? finalDescription;
      String? finalSunlight;

      if (loggedIn && Get.isRegistered<CattleHeaderController>()) {
        final cattleHeader = Get.find<CattleHeaderController>();
        if (cattleHeader.isUsingBackendData.value) {
          finalCityName = cattleHeader.district.value;
          finalTemp = cattleHeader.tempText.value;
          finalHumidity = cattleHeader.humidityText.value;
          finalDescription = cattleHeader.description.value;
          finalSunlight = cattleHeader.sunlight.value;
        }
      }

      // Consistent height to prevent UI jumping
      const double appBarHeight = 128;

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: appBarHeight,
        decoration: BoxDecoration(
          color: backgroundColor ?? const Color(0xffd4fcfd),
        ),
        child: SafeArea(
          bottom: false,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 🔹 Left side: Logo + Title + Date/Time + Language button
              Expanded(
                flex: 12,
                child: Row(
                  children: [
                    leading ??
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            logoAssetPath ?? "assets/icons/logo_trade_mark.jpg",
                            height: 50,
                            width: 50,
                            fit: BoxFit.contain,
                          ),
                        ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                          const SizedBox(height: 2),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      date ?? "",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: textColor,
                                      ),
                                    ),
                                    Text(
                                      time ?? "",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: textColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 8),
                                PopupMenuButton<String>(
                                  onSelected: (value) {
                                    if (value == 'bn') {
                                      Get.updateLocale(const Locale('bn', 'BD'));
                                      return;
                                    }
                                    Get.updateLocale(const Locale('en', 'US'));
                                  },
                                  itemBuilder: (context) => const [
                                    PopupMenuItem<String>(
                                      value: 'en',
                                      child: Text('Eng'),
                                    ),
                                    PopupMenuItem<String>(
                                      value: 'bn',
                                      child: Text('বাংলা'),
                                    ),
                                  ],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  offset: const Offset(0, 34),
                                  child: Container(
                                    height: 26,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff8beeef),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Center(
                                      child: Text(
                                        (Get.locale?.languageCode ?? 'en') == 'bn'
                                            ? 'বাংলা'
                                            : 'Eng',
                                        style: const TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 5),

              // 🔹 Right side: Weather info
              Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: iconColor ?? Colors.green,
                          size: 16,
                        ),
                        const SizedBox(width: 2),
                        Flexible(
                          child: Text(
                            finalCityName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            CommonText(
                              tempLabel ?? 'Air Temp',
                              fontSize: 9,
                              fontWeight: FontWeight.w500,
                              color: textColor,
                            ),
                            CommonText(
                              finalTemp ?? '',
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ],
                        ),
                        const SizedBox(width: 8),
                        Column(
                          children: [
                            CommonText(
                              humidityLabel ?? 'Humidity',
                              fontSize: 9,
                              fontWeight: FontWeight.w500,
                              color: textColor,
                            ),
                            CommonText(
                              finalHumidity ?? '',
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    CommonText(
                      finalDescription ?? '',
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                      maxLines: 1,
                    ),
                    if (finalSunlight != null && finalSunlight!.isNotEmpty)
                      CommonText(
                        "Sunlight: $finalSunlight",
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.orange,
                        maxLines: 1,
                      )
                    else
                      const SizedBox(height: 12),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
