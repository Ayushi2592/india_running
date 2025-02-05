/*import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';

class ReviewDetailsScreen extends StatefulWidget {
  const ReviewDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ReviewDetailsScreen> createState() => _ReviewDetailsScreenState();
}

class _ReviewDetailsScreenState extends State<ReviewDetailsScreen> {
  bool _showPersonalFields = false;
  bool _showTimingFields = false;
  bool _showAdditionalFields = false;

  String _selectedGender = 'Male';
  TextEditingController _dobController = TextEditingController();

  @override
  void dispose() {
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.primaryLight,
                    child: Icon(
                      Icons.arrow_back,
                      size: 20,
                      color: AppColors.primary,
                    ),
                  ),
                  onPressed: () {
                    context.pop();
                  },
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Text(
                    'Review Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        AppImages.image3,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Indian Navy Half Marathon',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '5K',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.location_on, size: 16, color: Colors.grey),
                            SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                'Mumbai, India',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                            SizedBox(width: 4),
                            Text(
                              '12th March 2025',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildSection(
              title: 'Personal Information',
              showFields: _showPersonalFields,
              onToggle: () {
                setState(() {
                  _showPersonalFields = !_showPersonalFields;
                });
              },
              fields: [
                'First Name',
                'Last Name',
                'Email ID',
                'Phone Number',
              ],
              specialFields: _buildSpecialPersonalFields(),
            ),
            const SizedBox(height: 10),
            _buildPendingButton(),
            const Divider(thickness: 1, color: Colors.grey),
            _buildSection(
              title: 'Timing Details',
              showFields: _showTimingFields,
              onToggle: () {
                setState(() {
                  _showTimingFields = !_showTimingFields;
                });
              },
              fields: [
                'Start Time',
                'End Time',
                'Duration',
              ],
            ),
            const SizedBox(height: 10),
            _buildPendingButton(),
            const Divider(thickness: 1, color: Colors.grey),
            _buildSection(
              title: 'Additional Information',
              showFields: _showAdditionalFields,
              onToggle: () {
                setState(() {
                  _showAdditionalFields = !_showAdditionalFields;
                });
              },
              fields: [
                'Comments',
                'Special Requests',
              ],
            ),
            const SizedBox(height: 10),
            _buildPendingButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecialPersonalFields() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: TextField(
            controller: _dobController,
            decoration: InputDecoration(
              hintText: 'Date of Birth',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.red, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.red, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              suffixIcon: IconButton(
                icon: const Icon(Icons.calendar_today, color: Colors.grey),
                onPressed: _selectDateOfBirth,
              ),
            ),
            readOnly: true,
          ),
        ),
        const SizedBox(height: 10),
        const Text('Gender', style: TextStyle(fontSize: 16)),
        Row(
          children: [
            Expanded(
              child: RadioListTile<String>(
                title: const Text('Male'),
                value: 'Male',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value!;
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                title: const Text('Female'),
                value: 'Female',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value!;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _selectDateOfBirth() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _dobController.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  Widget _buildSection({
    required String title,
    required bool showFields,
    required VoidCallback onToggle,
    required List<String> fields,
    Widget? specialFields,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: Icon(
                showFields ? Icons.remove : Icons.add,
                color: Colors.lightBlue,
              ),
              onPressed: onToggle,
            ),
          ],
        ),
        if (showFields) ...[
          ...fields.map((field) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: _buildTextField(field),
          )),
          if (specialFields != null) specialFields,
        ],
      ],
    );
  }

  Widget _buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
    );
  }

  Widget _buildPendingButton() {
    return Container(
      width: 120,
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.yellow.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Text(
          'Pending',
          style: TextStyle(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

 */

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';

class ReviewDetailsScreen extends StatefulWidget {
  const ReviewDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ReviewDetailsScreen> createState() => _ReviewDetailsScreenState();
}

class _ReviewDetailsScreenState extends State<ReviewDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _showPersonalFields = false;
  bool _showTimingFields = false;
  bool _showAdditionalFields = false;

  TextEditingController _dobController = TextEditingController();
  String? _selectedGender;

  @override
  void dispose() {
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: 20),
              _buildEventInfo(),
              const SizedBox(height: 20),
              _buildSection(
                title: 'Personal Information',
                showFields: _showPersonalFields,
                onToggle: () {
                  setState(() {
                    _showPersonalFields = !_showPersonalFields;
                  });
                },
                fields: ['First Name', 'Last Name', 'Email ID', 'Phone Number'],
                specialFields: _buildSpecialPersonalFields(),
              ),
              const SizedBox(height: 10),
              _buildPendingButton(),
              const Divider(thickness: 1, color: Colors.grey),
              _buildSection(
                title: 'Timing Details',
                showFields: _showTimingFields,
                onToggle: () {
                  setState(() {
                    _showTimingFields = !_showTimingFields;
                  });
                },
                fields: ['Start Time', 'End Time', 'Duration'],
              ),
              const SizedBox(height: 10),
              _buildPendingButton(),
              const Divider(thickness: 1, color: Colors.grey),
              _buildSection(
                title: 'Additional Information',
                showFields: _showAdditionalFields,
                onToggle: () {
                  setState(() {
                    _showAdditionalFields = !_showAdditionalFields;
                  });
                },
                fields: ['Comments', 'Special Requests'],
              ),
              const SizedBox(height: 10),
              _buildPendingButton(),
              const SizedBox(height: 20),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.primaryLight,
            child: Icon(
              Icons.arrow_back,
              size: 20,
              color: AppColors.primary,
            ),
          ),
          onPressed: () {
            context.pop();
          },
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Text(
            'Review Details',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildEventInfo() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                AppImages.image3,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Indian Navy Half Marathon',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '5K',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        'Mumbai, India',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(
                      '12th March 2025',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialPersonalFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        TextFormField(
          controller: _dobController,
          decoration: const InputDecoration(
            labelText: 'Date of Birth',
            suffixIcon: Icon(Icons.calendar_today),
          ),
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );
            if (pickedDate != null) {
              _dobController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
            }
          },
          validator: (value) =>
          value == null || value.isEmpty ? 'Date of Birth is required' : null,
        ),
        const SizedBox(height: 20),
        const Text('Gender', style: TextStyle(fontSize: 16)),
        Row(
          children: [
            _buildRadioButton('Male'),
            _buildRadioButton('Female'),
            _buildRadioButton('Other'),
          ],
        ),
      ],
    );
  }

  Widget _buildRadioButton(String gender) {
    return Expanded(
      child: RadioListTile<String>(
        title: Text(gender),
        value: gender,
        groupValue: _selectedGender,
        onChanged: (value) {
          setState(() {
            _selectedGender = value;
          });
        },
      ),
    );
  }

  Widget _buildPendingButton() {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Pending functionality')),
        );
      },
      child: const Text('Pending Action'),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Validation Passed! Gender: $_selectedGender')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Validation Failed! Please correct errors.')),
          );
        }
      },
      child: const Text('Submit'),
    );
  }

  Widget _buildSection({
    required String title,
    required bool showFields,
    required VoidCallback onToggle,
    required List<String> fields,
    Widget? specialFields,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: Icon(
                showFields ? Icons.remove : Icons.add,
                color: Colors.lightBlue,
              ),
              onPressed: onToggle,
            ),
          ],
        ),
        if (showFields) ...[
          ...fields.map((field) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: _buildTextField(field),
          )),
          if (specialFields != null) specialFields,
        ],
      ],
    );
  }

  Widget _buildTextField(String hintText) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
      validator: (value) =>
      value == null || value.isEmpty ? '$hintText is required' : null,
    );
  }
}
