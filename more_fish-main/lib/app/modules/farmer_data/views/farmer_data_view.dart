import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FarmerDataView extends StatefulWidget {
  const FarmerDataView({super.key});

  @override
  State<FarmerDataView> createState() => _FarmerDataViewState();
}

class _FarmerDataViewState extends State<FarmerDataView> {
  static const _fields = <_FarmerField>[
    _FarmerField('audit_date', type: r'string($date)', required: true),
    _FarmerField('farm_name', required: true),
    _FarmerField('auditor_name', required: true),
    _FarmerField('owner_organization_name', required: true),
    _FarmerField('contact_person'),
    _FarmerField('contact_designation'),
    _FarmerField('mobile'),
    _FarmerField(
      'email',
      type: r'string($email)',
      keyboardType: TextInputType.emailAddress,
    ),
    _FarmerField('gps_location', hint: 'Latitude, Longitude'),
    _FarmerField('address'),
    _FarmerField('village_area'),
    _FarmerField('district'),
    _FarmerField('union'),
    _FarmerField('upazila'),
    _FarmerField(
      'farm_type',
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
      options: ['LESS_THAN_1', '1_TO_3', '3_TO_5', 'MORE_THAN_5'],
    ),
    _FarmerField(
      'total_farm_area',
      type: r'string($decimal)',
      keyboardType: TextInputType.number,
    ),
    _FarmerField('farm_area_unit', options: ['ACRE', 'HECTARE']),
    _FarmerField(
      'pond_count',
      type: r'integer($int64)',
      keyboardType: TextInputType.number,
    ),
    _FarmerField(
      'tank_count',
      type: r'integer($int64)',
      keyboardType: TextInputType.number,
    ),
    _FarmerField(
      'iprs_cell_count',
      type: r'integer($int64)',
      keyboardType: TextInputType.number,
    ),
    _FarmerField(
      'raceway_count',
      type: r'integer($int64)',
      keyboardType: TextInputType.number,
    ),
    _FarmerField('primary_species'),
    _FarmerField('primary_species_other'),
    _FarmerField(
      'cycle_duration_months',
      type: r'string($decimal)',
      keyboardType: TextInputType.number,
    ),
    _FarmerField(
      'average_monthly_production',
      type: r'string($decimal)',
      keyboardType: TextInputType.number,
    ),
    _FarmerField(
      'average_annual_production',
      type: r'string($decimal)',
      keyboardType: TextInputType.number,
    ),
    _FarmerField('production_unit', options: ['KG', 'TON']),
    _FarmerField(
      'average_selling_price',
      type: r'string($decimal)',
      keyboardType: TextInputType.number,
    ),
    _FarmerField('water_source'),
    _FarmerField('remarks'),
    _FarmerField('stocking_density', options: ['LOW', 'MEDIUM', 'HIGH']),
    _FarmerField(
      'current_live_fish_value',
      type: r'string($decimal)',
      keyboardType: TextInputType.number,
    ),
    _FarmerField('monitors_do', type: 'boolean', options: ['true', 'false']),
    _FarmerField(
      'monitors_temperature',
      type: 'boolean',
      options: ['true', 'false'],
    ),
    _FarmerField('monitors_ph', type: 'boolean', options: ['true', 'false']),
    _FarmerField(
      'monitors_salinity',
      type: 'boolean',
      options: ['true', 'false'],
    ),
    _FarmerField(
      'monitors_ammonia',
      type: 'boolean',
      options: ['true', 'false'],
    ),
    _FarmerField(
      'monitors_nitrite',
      type: 'boolean',
      options: ['true', 'false'],
    ),
    _FarmerField(
      'monitors_tds_ec',
      type: 'boolean',
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
      type: 'boolean',
      options: ['true', 'false'],
    ),
    _FarmerField(
      'automatic_alert',
      type: 'boolean',
      options: ['true', 'false'],
    ),
    _FarmerField(
      'mobile_realtime_data',
      type: 'boolean',
      options: ['true', 'false'],
    ),
    _FarmerField(
      'night_do_measurement',
      type: 'boolean',
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
      type: r'integer($int64)',
      keyboardType: TextInputType.number,
    ),
    _FarmerField('aerator_decision_method'),
    _FarmerField(
      'aerator_24_hours',
      type: 'boolean',
      options: ['true', 'false'],
    ),
    _FarmerField('electricity_source'),
    _FarmerField(
      'backup_power_available',
      type: 'boolean',
      options: ['true', 'false'],
    ),
    _FarmerField('power_backup_types'),
    _FarmerField(
      'average_power_restore_time_minutes',
      type: r'integer($int64)',
      keyboardType: TextInputType.number,
    ),
    _FarmerField(
      'power_aerator_failure_frequency',
      options: ['NONE', '1_TO_2', '3_TO_5', 'MORE_THAN_5'],
    ),
    _FarmerField('problem_low_do', type: 'boolean', options: ['true', 'false']),
    _FarmerField(
      'problem_fish_gasping',
      type: 'boolean',
      options: ['true', 'false'],
    ),
    _FarmerField(
      'problem_mass_mortality',
      type: 'boolean',
      options: ['true', 'false'],
    ),
    _FarmerField(
      'problem_ph_fluctuation',
      type: 'boolean',
      options: ['true', 'false'],
    ),
    _FarmerField(
      'problem_temperature_stress',
      type: 'boolean',
      options: ['true', 'false'],
    ),
    _FarmerField(
      'problem_salinity_fluctuation',
      type: 'boolean',
      options: ['true', 'false'],
    ),
    _FarmerField(
      'problem_ammonia',
      type: 'boolean',
      options: ['true', 'false'],
    ),
    _FarmerField(
      'problem_algal_bloom_crash',
      type: 'boolean',
      options: ['true', 'false'],
    ),
    _FarmerField(
      'problem_disease_outbreak',
      type: 'boolean',
      options: ['true', 'false'],
    ),
    _FarmerField(
      'problem_aerator_failure',
      type: 'boolean',
      options: ['true', 'false'],
    ),
    _FarmerField(
      'problem_pump_failure',
      type: 'boolean',
      options: ['true', 'false'],
    ),
    _FarmerField(
      'problem_power_failure',
      type: 'boolean',
      options: ['true', 'false'],
    ),
    _FarmerField(
      'problem_feed_related',
      type: 'boolean',
      options: ['true', 'false'],
    ),
    _FarmerField(
      'problem_water_exchange',
      type: 'boolean',
      options: ['true', 'false'],
    ),
    _FarmerField(
      'problem_staff_monitoring',
      type: 'boolean',
      options: ['true', 'false'],
    ),
    _FarmerField('problem_other'),
    _FarmerField('top_problem_1'),
    _FarmerField('top_problem_2'),
    _FarmerField('top_problem_3'),
    _FarmerField(
      'major_mortality_event',
      type: 'boolean',
      options: ['true', 'false'],
    ),
    _FarmerField(
      'estimated_loss',
      type: r'string($decimal)',
      keyboardType: TextInputType.number,
    ),
    _FarmerField(
      'mortality_event_count',
      type: r'integer($int64)',
      keyboardType: TextInputType.number,
    ),
    _FarmerField(
      'total_mortality_loss',
      type: r'string($decimal)',
      keyboardType: TextInputType.number,
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
      type: 'boolean',
      options: ['true', 'false'],
    ),
    _FarmerField('impact_confidence', options: ['YES', 'NO', 'NOT_SURE']),
    _FarmerField(
      'monitoring_staff_count',
      type: r'integer($int64)',
      keyboardType: TextInputType.number,
    ),
    _FarmerField(
      'daily_monitoring_hours',
      type: r'string($decimal)',
      keyboardType: TextInputType.number,
    ),
    _FarmerField(
      'monthly_test_kit_cost',
      type: r'string($decimal)',
      keyboardType: TextInputType.number,
    ),
    _FarmerField(
      'monthly_labour_cost',
      type: r'string($decimal)',
      keyboardType: TextInputType.number,
    ),
    _FarmerField(
      'annual_lab_test_cost',
      type: r'string($decimal)',
      keyboardType: TextInputType.number,
    ),
    _FarmerField(
      'monthly_production_loss',
      type: r'string($decimal)',
      keyboardType: TextInputType.number,
    ),
    _FarmerField(
      'annual_monitoring_cost',
      type: r'string($decimal)',
      keyboardType: TextInputType.number,
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
  int _page = 0;

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

  int get _pageCount => (_fields.length / 10).ceil();

  List<_FarmerField> get _visibleFields {
    final start = _page * 10;
    final end = (start + 10).clamp(0, _fields.length);
    return _fields.sublist(start, end);
  }

  void _next() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    if (_page < _pageCount - 1) {
      setState(() => _page++);
    } else {
      _submit();
    }
  }

  void _submit() {
    Get.snackbar('Submitted', 'Farmer data has been submitted successfully.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe8f6f1),
      appBar: AppBar(
        backgroundColor: const Color(0xffd4fcfd),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: Get.back,
        ),
        title: const Text(
          "Farmer's Data",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'DMA Technologies',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                itemCount: _visibleFields.length,
                itemBuilder: (context, index) =>
                    _buildField(_visibleFields[index]),
              ),
            ),
            _buildNavigation(),
          ],
        ),
      ),
    );
  }

  Widget _buildField(_FarmerField field) {
    final input = field.options == null
        ? TextFormField(
            controller: _controllers[field.name],
            keyboardType: field.keyboardType,
            decoration: _decoration(field),
            validator: field.requiredField
                ? (value) =>
                      value == null || value.trim().isEmpty ? 'Required' : null
                : null,
            onSaved: (value) => _values[field.name] = value?.trim() ?? '',
          )
        : DropdownButtonFormField<String>(
            initialValue: _values[field.name],
            decoration: _decoration(field),
            items: field.options!
                .map(
                  (option) =>
                      DropdownMenuItem(value: option, child: Text(option)),
                )
                .toList(),
            onChanged: (value) =>
                setState(() => _values[field.name] = value ?? ''),
            onSaved: (value) => _values[field.name] = value ?? '',
            validator: field.requiredField
                ? (value) => value == null || value.isEmpty ? 'Required' : null
                : null,
          );

    return LayoutBuilder(
      builder: (context, constraints) {
        final label = Padding(
          padding: EdgeInsets.only(
            top: 8,
            right: constraints.maxWidth < 560 ? 0 : 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Color(0xff233d67),
                    fontSize: 14,
                  ),
                  children: [
                    TextSpan(text: field.name),
                    if (field.requiredField)
                      const TextSpan(
                        text: ' *',
                        style: TextStyle(color: Colors.red),
                      ),
                  ],
                ),
              ),
              Text(
                field.type,
                style: const TextStyle(color: Colors.black, fontSize: 11),
              ),
            ],
          ),
        );

        return Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: constraints.maxWidth < 560
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [label, const SizedBox(height: 4), input],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 5, child: label),
                    Expanded(flex: 7, child: input),
                  ],
                ),
        );
      },
    );
  }

  InputDecoration _decoration(_FarmerField field) {
    return InputDecoration(
      hintText: field.hint ?? (field.options == null ? 'string' : null),
      filled: true,
      fillColor: Colors.white,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Color(0xffd9d9d9)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Color(0xffd9d9d9)),
      ),
    );
  }

  Widget _buildNavigation() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
      color: const Color(0xffd4fcfd),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OutlinedButton(
            onPressed: _page == 0 ? null : () => setState(() => _page--),
            child: const Text('Back'),
          ),
          Text('Page ${_page + 1} of $_pageCount'),
          ElevatedButton(
            onPressed: _next,
            child: Text(_page == _pageCount - 1 ? 'Submit' : 'Next'),
          ),
        ],
      ),
    );
  }
}

class _FarmerField {
  const _FarmerField(
    this.name, {
    this.type = 'string',
    this.required = false,
    this.hint,
    this.keyboardType = TextInputType.text,
    this.options,
  });

  final String name;
  final String type;
  final bool required;
  final String? hint;
  final TextInputType keyboardType;
  final List<String>? options;

  bool get requiredField => required;
}
