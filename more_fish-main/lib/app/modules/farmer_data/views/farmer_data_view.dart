
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class FarmerDataView extends StatefulWidget {
//   const FarmerDataView({super.key});

//   @override
//   State<FarmerDataView> createState() => _FarmerDataViewState();
// }

// class _FarmerDataViewState extends State<FarmerDataView> {
//   static const _fields = <_FarmerField>[
//     _FarmerField(
//       'audit_date',
//       type: FieldType.date,
//       required: true,
//     ),
//     _FarmerField(
//       'auditor_name',
//       required: true,
//     ),
//     _FarmerField(
//       'farm_name',
//       required: true,
//     ),
//     _FarmerField(
//       'owner_organization_name',
//       required: true,
//     ),
//     _FarmerField('contact_person'),
//     _FarmerField('contact_designation'),
//     _FarmerField('mobile'),
//     _FarmerField(
//       'email',
//       type: FieldType.email,
//       required: true,
//     ),
//     _FarmerField(
//       'gps_location',
//       hint: 'Latitude, Longitude',
//     ),
//     _FarmerField('address'),
//     _FarmerField('village_area'),
//     _FarmerField('district'),
//     _FarmerField('union'),
//     _FarmerField('upazila'),

//     _FarmerField(
//       'farm_type',
//       emptyAsString: true,
//       options: [
//         'POND',
//         'SEMI_INTENSIVE',
//         'INTENSIVE',
//         'SUPER_INTENSIVE',
//         'BIOFLOC',
//         'IPRS',
//         'RAS',
//         'SHRIMP_VANNAMEI',
//         'HATCHERY_NURSERY',
//         'MARICULTURE',
//         'OTHER',
//       ],
//     ),

//     _FarmerField('farm_type_other'),

//     _FarmerField(
//       'farm_age',
//       emptyAsString: true,
//       options: [
//         'LESS_THAN_1',
//         '1_TO_3',
//         '3_TO_5',
//         'MORE_THAN_5',
//       ],
//     ),

//     _FarmerField(
//       'total_farm_area',
//       type: FieldType.decimal,
//     ),

//     _FarmerField(
//       'farm_area_unit',
//       options: [
//         'ACRE',
//         'HECTARE',
//       ],
//     ),

//     _FarmerField(
//       'pond_count',
//       type: FieldType.integer,
//     ),
//     _FarmerField(
//       'tank_count',
//       type: FieldType.integer,
//     ),
//     _FarmerField(
//       'iprs_cell_count',
//       type: FieldType.integer,
//     ),
//     _FarmerField(
//       'raceway_count',
//       type: FieldType.integer,
//     ),

//     _FarmerField(
//       'primary_species',
//       options: [
//         'TILAPIA',
//         'PANGAS',
//         'ROHU',
//         'CATLA',
//         'SING',
//         'MAGUR',
//         'PABDA',
//         'GULSHA',
//         'KOI',
//         'SHOL',
//         'BOAL',
//         'BAGDA',
//         'VANNAMEI',
//         'GOLDA',
//         'SEA_BASS',
//         'OTHER',
//       ],
//     ),

//     _FarmerField('primary_species_other'),

//     _FarmerField(
//       'cycle_duration_months',
//       type: FieldType.decimal,
//       maxIntegerDigits: 4,
//     ),

//     _FarmerField(
//       'average_monthly_production',
//       type: FieldType.decimal,
//     ),
//     _FarmerField(
//       'average_annual_production',
//       type: FieldType.decimal,
//     ),

//     _FarmerField(
//       'production_unit',
//       emptyAsString: true,
//       options: [
//         'KG',
//         'TON',
//       ],
//     ),

//     _FarmerField(
//       'average_selling_price',
//       type: FieldType.decimal,
//     ),

//     _FarmerField(
//       'stocking_density',
//       emptyAsString: true,
//       options: [
//         'LOW',
//         'MEDIUM',
//         'HIGH',
//       ],
//     ),

//     _FarmerField(
//       'current_live_fish_value',
//       type: FieldType.decimal,
//     ),

//     _FarmerField(
//       'monitors_do',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),
//     _FarmerField(
//       'monitors_temperature',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),
//     _FarmerField(
//       'monitors_ph',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),
//     _FarmerField(
//       'monitors_salinity',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),
//     _FarmerField(
//       'monitors_ammonia',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),
//     _FarmerField(
//       'monitors_nitrite',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),
//     _FarmerField(
//       'monitors_tds_ec',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),

//     _FarmerField('monitoring_other'),
//     _FarmerField('monitoring_method'),
//     _FarmerField('monitoring_frequency'),
//     _FarmerField('measurement_time'),

//     _FarmerField(
//       'monitoring_approach',
//       options: [
//         'NONE',
//         'VISUAL',
//         'TEST_KIT',
//         'PORTABLE_METER',
//         'STAFF_SCHEDULE',
//         'LAB',
//         'AUTOMATIC_SENSOR',
//         'IOT',
//         'OTHER',
//       ],
//     ),

//     _FarmerField('sensor_iot_brand_system'),

//     _FarmerField(
//       'night_water_monitoring',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),
//     _FarmerField(
//       'automatic_alert',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),
//     _FarmerField(
//       'mobile_realtime_data',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),
//     _FarmerField(
//       'night_do_measurement',
//       type: FieldType.boolean,
//       hint: 'DO measurement between 12 AM and 6 AM',
//       options: ['true', 'false'],
//     ),

//     _FarmerField(
//       'aerator_type',
//       options: [
//         'PADDLE_WHEEL',
//         'BLOWER',
//         'AIR_DIFFUSER',
//         'VENTURI',
//         'PUMP_CIRCULATION',
//         'OTHER',
//       ],
//     ),

//     _FarmerField('aerator_type_other'),

//     _FarmerField(
//       'total_aerators',
//       type: FieldType.integer,
//     ),

//     _FarmerField('aerator_decision_method'),

//     _FarmerField(
//       'aerator_24_hours',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),

//     _FarmerField('electricity_source'),

//     _FarmerField(
//       'backup_power_available',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),

//     _FarmerField('power_backup_types'),

//     _FarmerField(
//       'average_power_restore_time_minutes',
//       type: FieldType.integer,
//     ),

//     _FarmerField(
//       'power_aerator_failure_frequency',
//       emptyAsString: true,
//       options: [
//         'NONE',
//         '1_TO_2',
//         '3_TO_5',
//         'MORE_THAN_5',
//       ],
//     ),

//     _FarmerField(
//       'problem_low_do',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),
//     _FarmerField(
//       'problem_fish_gasping',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),
//     _FarmerField(
//       'problem_mass_mortality',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),
//     _FarmerField(
//       'problem_ph_fluctuation',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),
//     _FarmerField(
//       'problem_temperature_stress',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),
//     _FarmerField(
//       'problem_salinity_fluctuation',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),
//     _FarmerField(
//       'problem_ammonia',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),
//     _FarmerField(
//       'problem_algal_bloom_crash',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),
//     _FarmerField(
//       'problem_disease_outbreak',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),
//     _FarmerField(
//       'problem_aerator_failure',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),
//     _FarmerField(
//       'problem_pump_failure',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),
//     _FarmerField(
//       'problem_power_failure',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),
//     _FarmerField(
//       'problem_feed_related',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),
//     _FarmerField(
//       'problem_water_exchange',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),
//     _FarmerField(
//       'problem_staff_monitoring',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),

//     _FarmerField('problem_other'),
//     _FarmerField('top_problem_1'),
//     _FarmerField('top_problem_2'),
//     _FarmerField('top_problem_3'),

//     _FarmerField(
//       'major_mortality_event',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),

//     _FarmerField(
//       'estimated_loss',
//       type: FieldType.decimal,
//     ),
//     _FarmerField(
//       'mortality_event_count',
//       type: FieldType.integer,
//     ),
//     _FarmerField(
//       'total_mortality_loss',
//       type: FieldType.decimal,
//     ),

//     _FarmerField(
//       'mortality_possible_cause',
//       options: [
//         'LOW_DO',
//         'WATER_QUALITY',
//         'DISEASE',
//         'POWER_FAILURE',
//         'AERATOR_FAILURE',
//         'UNKNOWN',
//         'OTHER',
//       ],
//     ),

//     _FarmerField('mortality_cause_other'),

//     _FarmerField(
//       'water_problem_affects_growth_fcr_production',
//       type: FieldType.boolean,
//       options: ['true', 'false'],
//     ),

//     _FarmerField(
//       'impact_confidence',
//       options: [
//         'YES',
//         'NO',
//         'NOT_SURE',
//       ],
//     ),

//     _FarmerField(
//       'monitoring_staff_count',
//       type: FieldType.integer,
//     ),

//     _FarmerField(
//       'daily_monitoring_hours',
//       type: FieldType.decimal,
//       maxIntegerDigits: 4,
//     ),

//     _FarmerField(
//       'monthly_test_kit_cost',
//       type: FieldType.decimal,
//     ),
//     _FarmerField(
//       'monthly_labour_cost',
//       type: FieldType.decimal,
//     ),
//     _FarmerField(
//       'annual_lab_test_cost',
//       type: FieldType.decimal,
//     ),
//     _FarmerField(
//       'monthly_production_loss',
//       type: FieldType.decimal,
//     ),
//     _FarmerField(
//       'annual_monitoring_cost',
//       type: FieldType.decimal,
//     ),

//     _FarmerField(
//       'daily_decision_maker',
//       options: [
//         'OWNER',
//         'FARM_MANAGER',
//         'TECHNICIAN',
//         'FISHERIES_EXPERT',
//         'OTHER',
//       ],
//     ),

//     _FarmerField('daily_decision_maker_other'),
//     _FarmerField('technology_decision_maker'),
//     _FarmerField('technology_decision_maker_designation'),
//     _FarmerField('technology_decision_maker_mobile'),

//     _FarmerField(
//       'technology_adoption_attitude',
//       options: [
//         'VERY_INTERESTED',
//         'INTERESTED_ROI',
//         'INTERESTED_TRIAL',
//         'FINANCING_NEEDED',
//         'CURRENTLY_NOT_INTERESTED',
//       ],
//     ),

//     _FarmerField('additional_notes'),
//   ];

//   final _formKey = GlobalKey<FormState>();

//   final _controllers = <String, TextEditingController>{};
//   final _values = <String, String>{};
//   final _serverErrors = <String, String>{};

//   int _page = 0;
//   bool _isSubmitting = false;

//   @override
//   void initState() {
//     super.initState();

//     for (final field in _fields) {
//       _controllers[field.name] = TextEditingController();
//     }
//   }

//   @override
//   void dispose() {
//     for (final controller in _controllers.values) {
//       controller.dispose();
//     }

//     super.dispose();
//   }

//   int get _pageCount {
//     return (_fields.length / 10).ceil();
//   }

//   List<_FarmerField> get _visibleFields {
//     final start = _page * 10;
//     final end = (start + 10).clamp(
//       0,
//       _fields.length,
//     );

//     return _fields.sublist(start, end);
//   }

//   String _fieldValue(String fieldName) {
//     if (_values.containsKey(fieldName)) {
//       return _values[fieldName] ?? '';
//     }

//     return _controllers[fieldName]?.text.trim() ?? '';
//   }

//   void _next() {
//     final isValid =
//         _formKey.currentState?.validate() ?? false;

//     if (!isValid) {
//       return;
//     }

//     _formKey.currentState?.save();

//     if (_page < _pageCount - 1) {
//       setState(() {
//         _page++;
//       });
//     } else {
//       _submit();
//     }
//   }

//   String? _validateField(
//     _FarmerField field,
//     String? rawValue,
//   ) {
//     final value = rawValue?.trim() ?? '';

//     final serverError = _serverErrors[field.name];

//     if (serverError != null) {
//       return serverError;
//     }

//     if (field.required && value.isEmpty) {
//       if (field.type == FieldType.email) {
//         return 'Email address is required';
//       }

//       return 'This field is required';
//     }

//     if (value.isEmpty) {
//       return null;
//     }

//     switch (field.type) {
//       case FieldType.date:
//         final correctFormat = RegExp(
//           r'^\d{4}-\d{2}-\d{2}$',
//         ).hasMatch(value);

//         final parsedDate = DateTime.tryParse(value);

//         if (!correctFormat ||
//             parsedDate == null ||
//             _formatDate(parsedDate) != value) {
//           return 'Date must use YYYY-MM-DD format';
//         }

//         break;

//       case FieldType.email:
//         final emailPattern = RegExp(
//           r"^[A-Za-z0-9.!#$%&'*+/=?^_`{|}~-]+@[A-Za-z0-9-]+(?:\.[A-Za-z0-9-]+)+$",
//         );

//         if (!emailPattern.hasMatch(value)) {
//           return 'Enter a valid email address';
//         }

//         break;

//       case FieldType.integer:
//         final integerPattern = RegExp(
//           r'^[+-]?\d+$',
//         );

//         if (!integerPattern.hasMatch(value) ||
//             int.tryParse(value) == null) {
//           return 'Enter a valid whole number';
//         }

//         break;

//       case FieldType.decimal:
//         final decimalPattern = RegExp(
//           r'^[+-]?(?:\d+(?:\.\d+)?|\.\d+)$',
//         );

//         if (!decimalPattern.hasMatch(value) ||
//             num.tryParse(value) == null) {
//           return 'Enter a valid number';
//         }

//         if (field.maxIntegerDigits != null) {
//           final unsignedValue = value.replaceFirst(
//             RegExp(r'^[+-]'),
//             '',
//           );

//           var integerPart = unsignedValue.split('.').first;

//           integerPart = integerPart.replaceFirst(
//             RegExp(r'^0+'),
//             '',
//           );

//           final integerDigitCount =
//               integerPart.isEmpty ? 1 : integerPart.length;

//           if (integerDigitCount >
//               field.maxIntegerDigits!) {
//             return 'Maximum ${field.maxIntegerDigits} digits allowed before decimal point';
//           }
//         }

//         break;

//       case FieldType.text:
//       case FieldType.boolean:
//         break;
//     }

//     return null;
//   }

//   void _clearServerError(String fieldName) {
//     if (!_serverErrors.containsKey(fieldName)) {
//       return;
//     }

//     setState(() {
//       _serverErrors.remove(fieldName);
//     });
//   }

//   bool _showServerErrors(dynamic responseBody) {
//     if (responseBody is! Map) {
//       return false;
//     }

//     final errors = <String, String>{};

//     responseBody.forEach((key, value) {
//       final fieldName = key.toString();

//       final fieldExists = _fields.any(
//         (field) => field.name == fieldName,
//       );

//       if (!fieldExists) {
//         return;
//       }

//       if (value is List) {
//         errors[fieldName] = value.join('\n');
//       } else {
//         errors[fieldName] = value.toString();
//       }
//     });

//     if (errors.isEmpty) {
//       return false;
//     }

//     final firstInvalidFieldIndex = _fields.indexWhere(
//       (field) => errors.containsKey(field.name),
//     );

//     setState(() {
//       _serverErrors
//         ..clear()
//         ..addAll(errors);

//       if (firstInvalidFieldIndex >= 0) {
//         _page = firstInvalidFieldIndex ~/ 10;
//       }
//     });

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _formKey.currentState?.validate();
//     });

//     return true;
//   }

//   String _formatDate(DateTime date) {
//     String twoDigits(int number) {
//       return number.toString().padLeft(2, '0');
//     }

//     return '${date.year.toString().padLeft(4, '0')}-'
//         '${twoDigits(date.month)}-'
//         '${twoDigits(date.day)}';
//   }

//   Future<void> _pickDate(
//     _FarmerField field,
//   ) async {
//     final controller = _controllers[field.name]!;

//     final currentDate = DateTime.tryParse(
//       controller.text.trim(),
//     );

//     final selectedDate = await showDatePicker(
//       context: context,
//       initialDate: currentDate ?? DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime(2100),
//     );

//     if (selectedDate != null) {
//       controller.text = _formatDate(selectedDate);

//       _clearServerError(field.name);

//       setState(() {});
//     }
//   }

//   dynamic _convertFieldValue(
//     _FarmerField field,
//   ) {
//     final value = _fieldValue(field.name);

//     if (value.isEmpty) {
//       if (field.emptyAsString) {
//         return '';
//       }

//       if (field.type == FieldType.text) {
//         if (field.name == 'primary_species') {
//           return null;
//         }

//         return '';
//       }

//       return null;
//     }

//     switch (field.type) {
//       case FieldType.integer:
//         return int.tryParse(value);

//       case FieldType.decimal:
//         final parsedValue = num.tryParse(value);

//         return parsedValue?.toString();

//       case FieldType.boolean:
//         return value == 'true';

//       case FieldType.date:
//       case FieldType.email:
//       case FieldType.text:
//         return value;
//     }
//   }

//   Map<String, dynamic> _buildPayload() {
//     final payload = <String, dynamic>{};

//     for (final field in _fields) {
//       payload[field.name] = _convertFieldValue(field);
//     }

//     return payload;
//   }

//   Future<void> _submit() async {
//     if (_isSubmitting) {
//       return;
//     }

//     final isValid =
//         _formKey.currentState?.validate() ?? false;

//     if (!isValid) {
//       return;
//     }

//     _formKey.currentState?.save();

//     setState(() {
//       _isSubmitting = true;
//       _serverErrors.clear();
//     });

//     final payload = _buildPayload();

//     final uri = Uri.parse(
//       'http://66.29.151.40:8004/reports/audits/',
//     );

//     debugPrint('Farmer audit request body:');

//     debugPrint(
//       const JsonEncoder.withIndent('  ').convert(payload),
//     );

//     try {
//       final response = await http.post(
//         uri,
//         headers: const {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//         body: jsonEncode(payload),
//       );

//       debugPrint(
//         'Farmer audit response: ${response.statusCode}',
//       );

//       debugPrint(response.body);

//       if (!mounted) {
//         return;
//       }

//       if (response.statusCode >= 200 &&
//           response.statusCode < 300) {
//         Get.snackbar(
//           'Submitted',
//           'Farmer data has been submitted successfully.',
//           snackPosition: SnackPosition.BOTTOM,
//         );
//       } else {
//         var inlineErrorsShown = false;

//         String generalError =
//             'Server returned status ${response.statusCode}.';

//         try {
//           final decodedResponse = jsonDecode(
//             response.body,
//           );

//           inlineErrorsShown = _showServerErrors(
//             decodedResponse,
//           );

//           if (decodedResponse is Map) {
//             final messages = <String>[];

//             decodedResponse.forEach((key, value) {
//               if (value is List) {
//                 messages.add(
//                   '$key: ${value.join(', ')}',
//                 );
//               } else {
//                 messages.add('$key: $value');
//               }
//             });

//             if (messages.isNotEmpty) {
//               generalError = messages.join('\n');
//             }
//           }
//         } catch (_) {
//           // Server response was not valid JSON.
//         }

//         Get.snackbar(
//           'Submission failed',
//           inlineErrorsShown
//               ? 'Please correct the highlighted fields.'
//               : generalError,
//           snackPosition: SnackPosition.BOTTOM,
//           duration: const Duration(seconds: 7),
//         );
//       }
//     } catch (error) {
//       debugPrint(
//         'Farmer audit request error: $error',
//       );

//       if (mounted) {
//         Get.snackbar(
//           'Submission failed',
//           'Could not submit farmer data.',
//           snackPosition: SnackPosition.BOTTOM,
//         );
//       }
//     } finally {
//       if (mounted) {
//         setState(() {
//           _isSubmitting = false;
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffe8f6f1),
//       appBar: AppBar(
//         backgroundColor: const Color(0xffd4fcfd),
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//           ),
//           onPressed: Get.back,
//         ),
//         title: const Text(
//           "Farmer's Data",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Form(
//         key: _formKey,
//         child: Column(
//           children: [
//             const Padding(
//               padding: EdgeInsets.only(top: 10),
//               child: Column(
//                 children: [
//                   Text(
//                     'MoreFish Audit Form',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   Text(
//                     'DMA Technologies',
//                     style: TextStyle(
//                       fontSize: 10,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 padding: const EdgeInsets.fromLTRB(
//                   16,
//                   12,
//                   16,
//                   12,
//                 ),
//                 itemCount: _visibleFields.length,
//                 itemBuilder: (context, index) {
//                   return _buildField(
//                     _visibleFields[index],
//                   );
//                 },
//               ),
//             ),
//             _buildNavigation(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildField(_FarmerField field) {
//     late final Widget input;

//     if (field.options == null) {
//       input = TextFormField(
//         controller: _controllers[field.name],
//         autovalidateMode:
//             AutovalidateMode.onUserInteraction,
//         keyboardType: field.keyboardType,
//         readOnly: field.type == FieldType.date,
//         onTap: field.type == FieldType.date
//             ? () => _pickDate(field)
//             : null,
//         decoration: _decoration(field),
//         validator: (value) {
//           return _validateField(field, value);
//         },
//         onChanged: (_) {
//           _clearServerError(field.name);
//         },
//         onSaved: (value) {
//           _values[field.name] = value?.trim() ?? '';
//         },
//       );
//     } else {
//       input = DropdownButtonFormField<String>(
//         initialValue: _values[field.name],
//         autovalidateMode:
//             AutovalidateMode.onUserInteraction,
//         isExpanded: true,
//         decoration: _decoration(field),
//         items: field.options!.map((option) {
//           return DropdownMenuItem<String>(
//             value: option,
//             child: Text(
//               option,
//               overflow: TextOverflow.ellipsis,
//             ),
//           );
//         }).toList(),
//         onChanged: (value) {
//           setState(() {
//             _serverErrors.remove(field.name);
//             _values[field.name] = value ?? '';
//           });
//         },
//         onSaved: (value) {
//           _values[field.name] = value ?? '';
//         },
//         validator: (value) {
//           final serverError =
//               _serverErrors[field.name];

//           if (serverError != null) {
//             return serverError;
//           }

//           if (field.required &&
//               (value == null || value.isEmpty)) {
//             return 'Please select an option';
//           }

//           return null;
//         },
//       );
//     }

//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final label = Padding(
//           padding: EdgeInsets.only(
//             top: 8,
//             right: constraints.maxWidth < 560
//                 ? 0
//                 : 12,
//           ),
//           child: Column(
//             crossAxisAlignment:
//                 CrossAxisAlignment.start,
//             children: [
//               RichText(
//                 text: TextSpan(
//                   style: const TextStyle(
//                     color: Color(0xff233d67),
//                     fontSize: 14,
//                   ),
//                   children: [
//                     TextSpan(text: field.name),
//                     if (field.required)
//                       const TextSpan(
//                         text: ' *',
//                         style: TextStyle(
//                           color: Colors.red,
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//               Text(
//                 field.displayType,
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 11,
//                 ),
//               ),
//             ],
//           ),
//         );

//         return Padding(
//           padding: const EdgeInsets.only(
//             bottom: 14,
//           ),
//           child: constraints.maxWidth < 560
//               ? Column(
//                   crossAxisAlignment:
//                       CrossAxisAlignment.stretch,
//                   children: [
//                     label,
//                     const SizedBox(height: 4),
//                     input,
//                   ],
//                 )
//               : Row(
//                   crossAxisAlignment:
//                       CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       flex: 5,
//                       child: label,
//                     ),
//                     Expanded(
//                       flex: 7,
//                       child: input,
//                     ),
//                   ],
//                 ),
//         );
//       },
//     );
//   }

//   InputDecoration _decoration(
//     _FarmerField field,
//   ) {
//     return InputDecoration(
//       hintText: field.hint ?? field.defaultHint,
//       filled: true,
//       fillColor: Colors.white,
//       isDense: true,
//       contentPadding: const EdgeInsets.symmetric(
//         horizontal: 10,
//         vertical: 11,
//       ),
//       suffixIcon: field.type == FieldType.date
//           ? const Icon(Icons.calendar_month)
//           : null,
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(4),
//         borderSide: const BorderSide(
//           color: Color(0xffd9d9d9),
//         ),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(4),
//         borderSide: const BorderSide(
//           color: Color(0xffd9d9d9),
//         ),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(4),
//         borderSide: const BorderSide(
//           color: Color(0xff233d67),
//         ),
//       ),
//       errorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(4),
//         borderSide: const BorderSide(
//           color: Colors.red,
//         ),
//       ),
//       focusedErrorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(4),
//         borderSide: const BorderSide(
//           color: Colors.red,
//           width: 1.5,
//         ),
//       ),
//       errorStyle: const TextStyle(
//         color: Colors.red,
//         fontSize: 11,
//       ),
//     );
//   }

//   Widget _buildNavigation() {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(
//         16,
//         10,
//         16,
//         16,
//       ),
//       color: const Color(0xffd4fcfd),
//       child: Row(
//         mainAxisAlignment:
//             MainAxisAlignment.spaceBetween,
//         children: [
//           OutlinedButton(
//             onPressed: _page == 0 || _isSubmitting
//                 ? null
//                 : () {
//                     setState(() {
//                       _page--;
//                     });
//                   },
//             child: const Text('Back'),
//           ),
//           Text(
//             'Page ${_page + 1} of $_pageCount',
//           ),
//           ElevatedButton(
//             onPressed: _isSubmitting ? null : _next,
//             child: _isSubmitting
//                 ? const SizedBox(
//                     width: 16,
//                     height: 16,
//                     child: CircularProgressIndicator(
//                       strokeWidth: 2,
//                     ),
//                   )
//                 : Text(
//                     _page == _pageCount - 1
//                         ? 'Submit'
//                         : 'Next',
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// enum FieldType {
//   text,
//   email,
//   date,
//   integer,
//   decimal,
//   boolean,
// }

// class _FarmerField {
//   const _FarmerField(
//     this.name, {
//     this.type = FieldType.text,
//     this.required = false,
//     this.hint,
//     this.options,
//     this.maxIntegerDigits,
//     this.emptyAsString = false,
//   });

//   final String name;
//   final FieldType type;
//   final bool required;
//   final String? hint;
//   final List<String>? options;
//   final int? maxIntegerDigits;
//   final bool emptyAsString;

//   TextInputType get keyboardType {
//     switch (type) {
//       case FieldType.email:
//         return TextInputType.emailAddress;

//       case FieldType.integer:
//         return const TextInputType.numberWithOptions(
//           decimal: false,
//           signed: true,
//         );

//       case FieldType.decimal:
//         return const TextInputType.numberWithOptions(
//           decimal: true,
//           signed: true,
//         );

//       case FieldType.date:
//       case FieldType.boolean:
//       case FieldType.text:
//         return TextInputType.text;
//     }
//   }

//   String get displayType {
//     switch (type) {
//       case FieldType.date:
//         return r'string($date)';

//       case FieldType.email:
//         return r'string($email)';

//       case FieldType.integer:
//         return r'integer($int64)';

//       case FieldType.decimal:
//         return r'string($decimal)';

//       case FieldType.boolean:
//         return 'boolean';

//       case FieldType.text:
//         return 'string';
//     }
//   }

//   String? get defaultHint {
//     if (options != null) {
//       return 'Select an option';
//     }

//     switch (type) {
//       case FieldType.email:
//         return 'example@email.com';

//       case FieldType.date:
//         return 'YYYY-MM-DD';

//       case FieldType.integer:
//         return 'Whole number';

//       case FieldType.decimal:
//         if (maxIntegerDigits != null) {
//           return 'Maximum $maxIntegerDigits digits before decimal';
//         }

//         return 'Decimal number';

//       case FieldType.boolean:
//         return 'true or false';

//       case FieldType.text:
//         return 'string';
//     }
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FarmerDataView extends StatefulWidget {
  const FarmerDataView({super.key});

  @override
  State<FarmerDataView> createState() => _FarmerDataViewState();
}

class _FarmerDataViewState extends State<FarmerDataView> {
  static const _fields = <_FarmerField>[
    _FarmerField(
      'audit_date',
      type: FieldType.date,
      required: true,
    ),
    _FarmerField(
      'auditor_name',
      required: true,
    ),
    _FarmerField(
      'farm_name',
      required: true,
    ),
    _FarmerField(
      'owner_organization_name',
      required: true,
    ),
    _FarmerField('contact_person'),
    _FarmerField('contact_designation'),
    _FarmerField('mobile'),
    _FarmerField(
      'email',
      type: FieldType.email,
      required: true,
    ),
    _FarmerField(
      'gps_location',
      hint: 'Latitude, Longitude',
    ),
    _FarmerField('address'),
    _FarmerField('village_area'),
    _FarmerField('district'),
    _FarmerField('union'),
    _FarmerField('upazila'),

    _FarmerField(
      'farm_type',
      emptyAsString: true,
      options: [
        'POND',
        'SEMI_INTENSIVE',
        'INTENSIVE',
        'SUPER_INTENSIVE',
        'BIOFLOC',
        'IPRS',
        'RAS',
        'SHRIMP_VANNAMEI',
        'HATCHERY_NURSERY',
        'MARICULTURE',
        'OTHER',
      ],
    ),

    _FarmerField('farm_type_other'),

    _FarmerField(
      'farm_age',
      emptyAsString: true,
      options: [
        'LESS_THAN_1',
        '1_TO_3',
        '3_TO_5',
        'MORE_THAN_5',
      ],
    ),

    _FarmerField(
      'total_farm_area',
      type: FieldType.decimal,
    ),

    _FarmerField(
      'farm_area_unit',
      options: [
        'ACRE',
        'HECTARE',
      ],
    ),

    _FarmerField(
      'pond_count',
      type: FieldType.integer,
    ),
    _FarmerField(
      'tank_count',
      type: FieldType.integer,
    ),
    _FarmerField(
      'iprs_cell_count',
      type: FieldType.integer,
    ),
    _FarmerField(
      'raceway_count',
      type: FieldType.integer,
    ),

    _FarmerField(
      'primary_species',
      options: [
        'TILAPIA',
        'PANGAS',
        'ROHU',
        'CATLA',
        'SING',
        'MAGUR',
        'PABDA',
        'GULSHA',
        'KOI',
        'SHOL',
        'BOAL',
        'BAGDA',
        'VANNAMEI',
        'GOLDA',
        'SEA_BASS',
        'OTHER',
      ],
    ),

    _FarmerField('primary_species_other'),

    _FarmerField(
      'cycle_duration_months',
      type: FieldType.decimal,
      maxIntegerDigits: 4,
    ),

    _FarmerField(
      'average_monthly_production',
      type: FieldType.decimal,
    ),
    _FarmerField(
      'average_annual_production',
      type: FieldType.decimal,
    ),

    _FarmerField(
      'production_unit',
      emptyAsString: true,
      options: [
        'KG',
        'TON',
      ],
    ),

    _FarmerField(
      'average_selling_price',
      type: FieldType.decimal,
    ),

    _FarmerField(
      'stocking_density',
      emptyAsString: true,
      options: [
        'LOW',
        'MEDIUM',
        'HIGH',
      ],
    ),

    _FarmerField(
      'current_live_fish_value',
      type: FieldType.decimal,
    ),

    _FarmerField(
      'monitors_do',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),
    _FarmerField(
      'monitors_temperature',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),
    _FarmerField(
      'monitors_ph',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),
    _FarmerField(
      'monitors_salinity',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),
    _FarmerField(
      'monitors_ammonia',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),
    _FarmerField(
      'monitors_nitrite',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),
    _FarmerField(
      'monitors_tds_ec',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),

    _FarmerField('monitoring_other'),
    _FarmerField('monitoring_method'),
    _FarmerField('monitoring_frequency'),
    _FarmerField('measurement_time'),

    _FarmerField(
      'monitoring_approach',
      options: [
        'NONE',
        'VISUAL',
        'TEST_KIT',
        'PORTABLE_METER',
        'STAFF_SCHEDULE',
        'LAB',
        'AUTOMATIC_SENSOR',
        'IOT',
        'OTHER',
      ],
    ),

    _FarmerField('sensor_iot_brand_system'),

    _FarmerField(
      'night_water_monitoring',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),
    _FarmerField(
      'automatic_alert',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),
    _FarmerField(
      'mobile_realtime_data',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),
    _FarmerField(
      'night_do_measurement',
      type: FieldType.boolean,
      hint: 'DO measurement between 12 AM and 6 AM',
      options: ['true', 'false'],
    ),

    _FarmerField(
      'aerator_type',
      options: [
        'PADDLE_WHEEL',
        'BLOWER',
        'AIR_DIFFUSER',
        'VENTURI',
        'PUMP_CIRCULATION',
        'OTHER',
      ],
    ),

    _FarmerField('aerator_type_other'),

    _FarmerField(
      'total_aerators',
      type: FieldType.integer,
    ),

    _FarmerField('aerator_decision_method'),

    _FarmerField(
      'aerator_24_hours',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),

    _FarmerField('electricity_source'),

    _FarmerField(
      'backup_power_available',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),

    _FarmerField('power_backup_types'),

    _FarmerField(
      'average_power_restore_time_minutes',
      type: FieldType.integer,
    ),

    _FarmerField(
      'power_aerator_failure_frequency',
      emptyAsString: true,
      options: [
        'NONE',
        '1_TO_2',
        '3_TO_5',
        'MORE_THAN_5',
      ],
    ),

    _FarmerField(
      'problem_low_do',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),
    _FarmerField(
      'problem_fish_gasping',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),
    _FarmerField(
      'problem_mass_mortality',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),
    _FarmerField(
      'problem_ph_fluctuation',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),
    _FarmerField(
      'problem_temperature_stress',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),
    _FarmerField(
      'problem_salinity_fluctuation',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),
    _FarmerField(
      'problem_ammonia',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),
    _FarmerField(
      'problem_algal_bloom_crash',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),
    _FarmerField(
      'problem_disease_outbreak',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),
    _FarmerField(
      'problem_aerator_failure',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),
    _FarmerField(
      'problem_pump_failure',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),
    _FarmerField(
      'problem_power_failure',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),
    _FarmerField(
      'problem_feed_related',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),
    _FarmerField(
      'problem_water_exchange',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),
    _FarmerField(
      'problem_staff_monitoring',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),

    _FarmerField('problem_other'),
    _FarmerField('top_problem_1'),
    _FarmerField('top_problem_2'),
    _FarmerField('top_problem_3'),

    _FarmerField(
      'major_mortality_event',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),

    _FarmerField(
      'estimated_loss',
      type: FieldType.decimal,
    ),
    _FarmerField(
      'mortality_event_count',
      type: FieldType.integer,
    ),
    _FarmerField(
      'total_mortality_loss',
      type: FieldType.decimal,
    ),

    _FarmerField(
      'mortality_possible_cause',
      options: [
        'LOW_DO',
        'WATER_QUALITY',
        'DISEASE',
        'POWER_FAILURE',
        'AERATOR_FAILURE',
        'UNKNOWN',
        'OTHER',
      ],
    ),

    _FarmerField('mortality_cause_other'),

    _FarmerField(
      'water_problem_affects_growth_fcr_production',
      type: FieldType.boolean,
      options: ['true', 'false'],
    ),

    _FarmerField(
      'impact_confidence',
      options: [
        'YES',
        'NO',
        'NOT_SURE',
      ],
    ),

    _FarmerField(
      'monitoring_staff_count',
      type: FieldType.integer,
    ),

    _FarmerField(
      'daily_monitoring_hours',
      type: FieldType.decimal,
      maxIntegerDigits: 4,
    ),

    _FarmerField(
      'monthly_test_kit_cost',
      type: FieldType.decimal,
    ),
    _FarmerField(
      'monthly_labour_cost',
      type: FieldType.decimal,
    ),
    _FarmerField(
      'annual_lab_test_cost',
      type: FieldType.decimal,
    ),
    _FarmerField(
      'monthly_production_loss',
      type: FieldType.decimal,
    ),
    _FarmerField(
      'annual_monitoring_cost',
      type: FieldType.decimal,
    ),

    _FarmerField(
      'daily_decision_maker',
      options: [
        'OWNER',
        'FARM_MANAGER',
        'TECHNICIAN',
        'FISHERIES_EXPERT',
        'OTHER',
      ],
    ),

    _FarmerField('daily_decision_maker_other'),
    _FarmerField('technology_decision_maker'),
    _FarmerField('technology_decision_maker_designation'),
    _FarmerField('technology_decision_maker_mobile'),

    _FarmerField(
      'technology_adoption_attitude',
      options: [
        'VERY_INTERESTED',
        'INTERESTED_ROI',
        'INTERESTED_TRIAL',
        'FINANCING_NEEDED',
        'CURRENTLY_NOT_INTERESTED',
      ],
    ),

    _FarmerField('additional_notes'),
  ];

  final _formKey = GlobalKey<FormState>();

  final _controllers = <String, TextEditingController>{};
  final _values = <String, String>{};
  final _serverErrors = <String, String>{};

  int _page = 0;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();

    for (final field in _fields) {
      _controllers[field.name] = TextEditingController();
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }

    super.dispose();
  }

  int get _pageCount {
    return (_fields.length / 10).ceil();
  }

  List<_FarmerField> get _visibleFields {
    final start = _page * 10;
    final end = (start + 10).clamp(
      0,
      _fields.length,
    );

    return _fields.sublist(start, end);
  }

  String _fieldValue(String fieldName) {
    if (_values.containsKey(fieldName)) {
      return _values[fieldName] ?? '';
    }

    return _controllers[fieldName]?.text.trim() ?? '';
  }

  void _next() {
    final isValid =
        _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    if (_page < _pageCount - 1) {
      setState(() {
        _page++;
      });
    } else {
      _submit();
    }
  }

  String? _validateField(
    _FarmerField field,
    String? rawValue,
  ) {
    final value = rawValue?.trim() ?? '';

    final serverError = _serverErrors[field.name];

    if (serverError != null) {
      return serverError;
    }

    if (field.required && value.isEmpty) {
      if (field.type == FieldType.email) {
        return 'Email address is required';
      }

      return 'This field is required';
    }

    if (value.isEmpty) {
      return null;
    }

    switch (field.type) {
      case FieldType.date:
        final correctFormat = RegExp(
          r'^\d{4}-\d{2}-\d{2}$',
        ).hasMatch(value);

        final parsedDate = DateTime.tryParse(value);

        if (!correctFormat ||
            parsedDate == null ||
            _formatDate(parsedDate) != value) {
          return 'Date must use YYYY-MM-DD format';
        }

        break;

      case FieldType.email:
        final emailPattern = RegExp(
          r"^[A-Za-z0-9.!#$%&'*+/=?^_`{|}~-]+@[A-Za-z0-9-]+(?:\.[A-Za-z0-9-]+)+$",
        );

        if (!emailPattern.hasMatch(value)) {
          return 'Enter a valid email address';
        }

        break;

      case FieldType.integer:
        final integerPattern = RegExp(
          r'^[+-]?\d+$',
        );

        if (!integerPattern.hasMatch(value) ||
            int.tryParse(value) == null) {
          return 'Enter a valid whole number';
        }

        break;

      case FieldType.decimal:
        final decimalPattern = RegExp(
          r'^[+-]?(?:\d+(?:\.\d+)?|\.\d+)$',
        );

        if (!decimalPattern.hasMatch(value) ||
            num.tryParse(value) == null) {
          return 'Enter a valid number';
        }

        if (field.maxIntegerDigits != null) {
          final unsignedValue = value.replaceFirst(
            RegExp(r'^[+-]'),
            '',
          );

          var integerPart =
              unsignedValue.split('.').first;

          integerPart = integerPart.replaceFirst(
            RegExp(r'^0+'),
            '',
          );

          final integerDigitCount =
              integerPart.isEmpty
                  ? 1
                  : integerPart.length;

          if (integerDigitCount >
              field.maxIntegerDigits!) {
            return 'Maximum ${field.maxIntegerDigits} digits allowed before decimal point';
          }
        }

        break;

      case FieldType.text:
      case FieldType.boolean:
        break;
    }

    return null;
  }

  void _clearServerError(String fieldName) {
    if (!_serverErrors.containsKey(fieldName)) {
      return;
    }

    setState(() {
      _serverErrors.remove(fieldName);
    });
  }

  bool _showServerErrors(dynamic responseBody) {
    if (responseBody is! Map) {
      return false;
    }

    final errors = <String, String>{};

    responseBody.forEach((key, value) {
      final fieldName = key.toString();

      final fieldExists = _fields.any(
        (field) => field.name == fieldName,
      );

      if (!fieldExists) {
        return;
      }

      if (value is List) {
        errors[fieldName] = value.join('\n');
      } else {
        errors[fieldName] = value.toString();
      }
    });

    if (errors.isEmpty) {
      return false;
    }

    final firstInvalidFieldIndex =
        _fields.indexWhere(
      (field) => errors.containsKey(field.name),
    );

    setState(() {
      _serverErrors
        ..clear()
        ..addAll(errors);

      if (firstInvalidFieldIndex >= 0) {
        _page = firstInvalidFieldIndex ~/ 10;
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _formKey.currentState?.validate();
    });

    return true;
  }

  String _formatDate(DateTime date) {
    String twoDigits(int number) {
      return number.toString().padLeft(2, '0');
    }

    return '${date.year.toString().padLeft(4, '0')}-'
        '${twoDigits(date.month)}-'
        '${twoDigits(date.day)}';
  }

  Future<void> _pickDate(
    _FarmerField field,
  ) async {
    final controller =
        _controllers[field.name]!;

    final currentDate = DateTime.tryParse(
      controller.text.trim(),
    );

    final selectedDate = await showDatePicker(
      context: context,
      initialDate:
          currentDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      controller.text =
          _formatDate(selectedDate);

      _clearServerError(field.name);

      setState(() {});
    }
  }

  dynamic _convertFieldValue(
    _FarmerField field,
  ) {
    final value = _fieldValue(field.name);

    if (value.isEmpty) {
      if (field.emptyAsString) {
        return '';
      }

      if (field.type == FieldType.text) {
        if (field.name == 'primary_species') {
          return null;
        }

        return '';
      }

      return null;
    }

    switch (field.type) {
      case FieldType.integer:
        return int.tryParse(value);

      case FieldType.decimal:
        final parsedValue =
            num.tryParse(value);

        return parsedValue?.toString();

      case FieldType.boolean:
        return value == 'true';

      case FieldType.date:
      case FieldType.email:
      case FieldType.text:
        return value;
    }
  }

  Map<String, dynamic> _buildPayload() {
    final payload = <String, dynamic>{};

    for (final field in _fields) {
      payload[field.name] =
          _convertFieldValue(field);
    }

    return payload;
  }

  Future<void> _submit() async {
    if (_isSubmitting) {
      return;
    }

    final isValid =
        _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    setState(() {
      _isSubmitting = true;
      _serverErrors.clear();
    });

    final payload = _buildPayload();

    final uri = Uri.parse(
      'http://66.29.151.40:8004/reports/audits/',
    );

    debugPrint('Farmer audit request body:');

    debugPrint(
      const JsonEncoder.withIndent('  ')
          .convert(payload),
    );

    try {
      final response = await http.post(
        uri,
        headers: const {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(payload),
      );

      debugPrint(
        'Farmer audit response: ${response.statusCode}',
      );

      debugPrint(response.body);

      if (!mounted) {
        return;
      }

      if (response.statusCode >= 200 &&
          response.statusCode < 300) {
        Get.snackbar(
          'Submitted',
          'Farmer data has been submitted successfully.',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        var inlineErrorsShown = false;

        String generalError =
            'Server returned status ${response.statusCode}.';

        try {
          final decodedResponse = jsonDecode(
            response.body,
          );

          inlineErrorsShown = _showServerErrors(
            decodedResponse,
          );

          if (decodedResponse is Map) {
            final messages = <String>[];

            decodedResponse.forEach((key, value) {
              if (value is List) {
                messages.add(
                  '$key: ${value.join(', ')}',
                );
              } else {
                messages.add('$key: $value');
              }
            });

            if (messages.isNotEmpty) {
              generalError = messages.join('\n');
            }
          }
        } catch (_) {
          // Server response was not valid JSON.
        }

        Get.snackbar(
          'Submission failed',
          inlineErrorsShown
              ? 'Please correct the highlighted fields.'
              : generalError,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 7),
        );
      }
    } catch (error) {
      debugPrint(
        'Farmer audit request error: $error',
      );

      if (mounted) {
        Get.snackbar(
          'Submission failed',
          'Could not submit farmer data.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xffe8f6f1),
      appBar: AppBar(
        backgroundColor:
            const Color(0xffd4fcfd),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: Get.back,
        ),
        title: const Text(
          "Farmer's Data",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Text(
                    'MoreFish Audit Form',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'DMA Technologies',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.fromLTRB(
                  16,
                  12,
                  16,
                  12,
                ),
                itemCount:
                    _visibleFields.length,
                itemBuilder: (context, index) {
                  return _buildField(
                    _visibleFields[index],
                  );
                },
              ),
            ),
            _buildNavigation(),
          ],
        ),
      ),
    );
  }

  Widget _buildField(_FarmerField field) {
    late final Widget input;

    if (field.options == null) {
      input = TextFormField(
        key: ValueKey(
          'text_${field.name}',
        ),
        controller:
            _controllers[field.name],
        autovalidateMode:
            AutovalidateMode.onUserInteraction,
        keyboardType: field.keyboardType,
        readOnly:
            field.type == FieldType.date,
        onTap: field.type == FieldType.date
            ? () => _pickDate(field)
            : null,
        decoration: _decoration(field),
        validator: (value) {
          return _validateField(
            field,
            value,
          );
        },
        onChanged: (_) {
          _clearServerError(field.name);
        },
        onSaved: (value) {
          _values[field.name] =
              value?.trim() ?? '';
        },
      );
    } else {
      /*
       * FIX:
       * কেবল options-এর মধ্যে থাকা non-empty
       * value dropdown-এ initialValue হবে।
       */
      final savedValue =
          _values[field.name];

      final String? validInitialValue =
          savedValue != null &&
                  savedValue.isNotEmpty &&
                  field.options!.contains(
                    savedValue,
                  )
              ? savedValue
              : null;

      input =
          DropdownButtonFormField<String>(
        /*
         * Page পরিবর্তনের সময় আগের
         * dropdown-এর state reuse বন্ধ করবে।
         */
        key: ValueKey(
          'dropdown_${field.name}',
        ),
        initialValue: validInitialValue,
        autovalidateMode:
            AutovalidateMode.onUserInteraction,
        isExpanded: true,
        decoration: _decoration(field),

        /*
         * ভুল করে duplicate option থাকলেও
         * toSet() সেটি বাদ দেবে।
         */
        items: field.options!
            .toSet()
            .map((option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(
              option,
              overflow:
                  TextOverflow.ellipsis,
            ),
          );
        }).toList(),

        onChanged: (value) {
          setState(() {
            _serverErrors.remove(
              field.name,
            );

            if (value == null ||
                value.isEmpty) {
              _values.remove(field.name);
            } else {
              _values[field.name] = value;
            }
          });
        },

        onSaved: (value) {
          /*
           * null value-কে empty string হিসেবে
           * dropdown map-এ save করা হবে না।
           */
          if (value == null ||
              value.isEmpty) {
            _values.remove(field.name);
          } else {
            _values[field.name] = value;
          }
        },

        validator: (value) {
          final serverError =
              _serverErrors[field.name];

          if (serverError != null) {
            return serverError;
          }

          if (field.required &&
              (value == null ||
                  value.isEmpty)) {
            return 'Please select an option';
          }

          return null;
        },
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final label = Padding(
          padding: EdgeInsets.only(
            top: 8,
            right:
                constraints.maxWidth < 560
                    ? 0
                    : 12,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color:
                        Color(0xff233d67),
                    fontSize: 14,
                  ),
                  children: [
                    TextSpan(
                      text: field.name,
                    ),
                    if (field.required)
                      const TextSpan(
                        text: ' *',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                  ],
                ),
              ),
              Text(
                field.displayType,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        );

        return Padding(
          padding: const EdgeInsets.only(
            bottom: 14,
          ),
          child:
              constraints.maxWidth < 560
                  ? Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .stretch,
                      children: [
                        label,
                        const SizedBox(
                          height: 4,
                        ),
                        input,
                      ],
                    )
                  : Row(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: label,
                        ),
                        Expanded(
                          flex: 7,
                          child: input,
                        ),
                      ],
                    ),
        );
      },
    );
  }

  InputDecoration _decoration(
    _FarmerField field,
  ) {
    return InputDecoration(
      hintText:
          field.hint ?? field.defaultHint,
      filled: true,
      fillColor: Colors.white,
      isDense: true,
      contentPadding:
          const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 11,
      ),
      suffixIcon:
          field.type == FieldType.date
              ? const Icon(
                  Icons.calendar_month,
                )
              : null,
      border: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: Color(0xffd9d9d9),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: Color(0xffd9d9d9),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: Color(0xff233d67),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
      focusedErrorBorder:
          OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.5,
        ),
      ),
      errorStyle: const TextStyle(
        color: Colors.red,
        fontSize: 11,
      ),
    );
  }

  Widget _buildNavigation() {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        16,
        10,
        16,
        16,
      ),
      color: const Color(0xffd4fcfd),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [
          OutlinedButton(
            onPressed:
                _page == 0 || _isSubmitting
                    ? null
                    : () {
                        setState(() {
                          _page--;
                        });
                      },
            child: const Text('Back'),
          ),
          Text(
            'Page ${_page + 1} of $_pageCount',
          ),
          ElevatedButton(
            onPressed:
                _isSubmitting ? null : _next,
            child: _isSubmitting
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child:
                        CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    _page ==
                            _pageCount - 1
                        ? 'Submit'
                        : 'Next',
                  ),
          ),
        ],
      ),
    );
  }
}

enum FieldType {
  text,
  email,
  date,
  integer,
  decimal,
  boolean,
}

class _FarmerField {
  const _FarmerField(
    this.name, {
    this.type = FieldType.text,
    this.required = false,
    this.hint,
    this.options,
    this.maxIntegerDigits,
    this.emptyAsString = false,
  });

  final String name;
  final FieldType type;
  final bool required;
  final String? hint;
  final List<String>? options;
  final int? maxIntegerDigits;
  final bool emptyAsString;

  TextInputType get keyboardType {
    switch (type) {
      case FieldType.email:
        return TextInputType.emailAddress;

      case FieldType.integer:
        return const TextInputType
            .numberWithOptions(
          decimal: false,
          signed: true,
        );

      case FieldType.decimal:
        return const TextInputType
            .numberWithOptions(
          decimal: true,
          signed: true,
        );

      case FieldType.date:
      case FieldType.boolean:
      case FieldType.text:
        return TextInputType.text;
    }
  }

  String get displayType {
    switch (type) {
      case FieldType.date:
        return r'string($date)';

      case FieldType.email:
        return r'string($email)';

      case FieldType.integer:
        return r'integer($int64)';

      case FieldType.decimal:
        return r'string($decimal)';

      case FieldType.boolean:
        return 'boolean';

      case FieldType.text:
        return 'string';
    }
  }

  String? get defaultHint {
    if (options != null) {
      return 'Select an option';
    }

    switch (type) {
      case FieldType.email:
        return 'example@email.com';

      case FieldType.date:
        return 'YYYY-MM-DD';

      case FieldType.integer:
        return 'Whole number';

      case FieldType.decimal:
        if (maxIntegerDigits != null) {
          return 'Maximum $maxIntegerDigits digits before decimal';
        }

        return 'Decimal number';

      case FieldType.boolean:
        return 'true or false';

      case FieldType.text:
        return 'string';
    }
  }
}