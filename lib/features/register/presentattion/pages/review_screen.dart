/*import 'package:flutter/material.dart';
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
  final _dobController = TextEditingController();

  String? _selectedGender;
  bool _showPersonalFields = false;
  bool _showTimingFields = false;
  bool _showAdditionalFields = false;

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
                fields: [
                  _buildTextField('First Name', (value) {
                    if (value == null || value.isEmpty) {
                      return 'First Name is required';
                    } else if (!RegExp(r"^[a-zA-Z]+$").hasMatch(value)) {
                      return 'First Name should contain only letters';
                    }
                    return null;
                  }),
                  _buildTextField('Last Name', (value) {
                    if (value == null || value.isEmpty) {
                      return 'Last Name is required';
                    } else if (!RegExp(r"^[a-zA-Z]+$").hasMatch(value)) {
                      return 'Last Name should contain only letters';
                    }
                    return null;
                  }),
                  _buildTextField('Email ID', (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    } else if (!RegExp(
                            r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
                        .hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  }),
                  _buildTextField('Phone Number', (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone Number is required';
                    } else if (!RegExp(r"^[0-9]{10}$").hasMatch(value)) {
                      return 'Phone Number must be 10 digits';
                    }
                    return null;
                  }),
                  _buildDateOfBirthField(),
                  _buildGenderSelection(),
                ],
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
                  _buildTextField('Start Time', (value) {
                    return value == null || value.isEmpty
                        ? 'Start Time is required'
                        : null;
                  }),
                  _buildTextField('End Time', (value) {
                    return value == null || value.isEmpty
                        ? 'End Time is required'
                        : null;
                  }),
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
                  _buildTextField('Comments', (value) => null),
                  _buildTextField('Special Requests', (value) => null),
                ],
              ),
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
          icon: const Icon(Icons.arrow_back, size: 24),
          onPressed: () {
            context.pop();
          },
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Text(
            'Review Details',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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

  Widget _buildDateOfBirthField() {
    return TextFormField(
      controller: _dobController,
      decoration: const InputDecoration(
        labelText: 'Date of Birth',
        suffixIcon: Icon(Icons.calendar_today),
        //child: dataResponse == null
            //? Conatiner()
            //: Text(dataResponse['data'].toString()),
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now().subtract(const Duration(days: 6570)),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          int age = DateTime.now().year - pickedDate.year;
          if (age < 18 || age > 100) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Age must be between 18 and 100')),
            );
          } else {
            _dobController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
          }
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Date of Birth is required';
        }
        return null;
      },
    );
  }

  Widget _buildGenderSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Gender', style: TextStyle(fontSize: 16)),
        Row(
          children: [
            _buildRadioButton('Male'),
            _buildRadioButton('Female'),
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

  Widget _buildTextField(String hintText, String? Function(String?) validator) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        validator: validator,
      ),
    );
  }

  Widget _buildPendingButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Pending functionality')),
        );
      },
      child:
          const Text('Pending Action', style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Validation Passed!')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please fix errors and try again.')),
          );
        }
      },
      child: const Text('Submit', style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildSection({
    required String title,
    required bool showFields,
    required VoidCallback onToggle,
    required List<Widget> fields,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            IconButton(
              icon: Icon(showFields ? Icons.remove : Icons.add),
              onPressed: onToggle,
            ),
          ],
        ),
        if (showFields) ...fields,
      ],
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
  final _dobController = TextEditingController();

  String? _selectedGender;
  String? _selectedTimeSlot;
  String? _selectedRequest;

  bool _showPersonalFields = false;
  bool _showTimingFields = false;
  bool _showAdditionalFields = false;
  bool _agreeToTerms = false;

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
                fields: [
                  _buildTextField('First Name', (value) {
                    if (value == null || value.isEmpty) {
                      return 'First Name is required';
                    } else if (!RegExp(r"^[a-zA-Z]+$").hasMatch(value)) {
                      return 'First Name should contain only letters';
                    }
                    return null;
                  }),
                  _buildTextField('Last Name', (value) {
                    if (value == null || value.isEmpty) {
                      return 'Last Name is required';
                    } else if (!RegExp(r"^[a-zA-Z]+$").hasMatch(value)) {
                      return 'Last Name should contain only letters';
                    }
                    return null;
                  }),
                  _buildTextField('Email ID', (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    } else if (!RegExp(
                            r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
                        .hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  }),
                  _buildTextField('Phone Number', (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone Number is required';
                    } else if (!RegExp(r"^[0-9]{10}$").hasMatch(value)) {
                      return 'Phone Number must be 10 digits';
                    }
                    return null;
                  }),
                  _buildDateOfBirthField(),
                  _buildGenderSelection(),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(thickness: 1, color: Colors.grey),
              _buildSection(
                title: 'Select your Blood Group',
                showFields: _showTimingFields,
                onToggle: () {
                  setState(() {
                    _showTimingFields = !_showTimingFields;
                  });
                },
                fields: [
                  _buildDropdownField(
                    labelText: 'Blood Group',
                    items: ['A+', 'AB+', 'B+', 'O-'],
                    value: _selectedTimeSlot,
                    onChanged: (value) {
                      setState(() {
                        _selectedTimeSlot = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
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
                  _buildDropdownField(
                    labelText: 'ID Proof',
                    items: ['Aadhar No.', 'PAN No.'],
                    value: _selectedRequest,
                    onChanged: (value) {
                      setState(() {
                        _selectedRequest = value;
                      });
                    },
                  ),
                  _buildTextField('Enter your choosen ID Proof no.', (value) => null),
                ],
              ),
              const SizedBox(height: 20),
              _buildAgreementCheckbox(),
              const SizedBox(height: 20),
              _buildContinueButton(),
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
          icon: const Icon(Icons.arrow_back, size: 24),
          onPressed: () {
            context.pop();
          },
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Text(
            'Review Details',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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

  Widget _buildDateOfBirthField() {
    return TextFormField(
      controller: _dobController,
      decoration: const InputDecoration(
        labelText: 'Date of Birth',
        suffixIcon: Icon(Icons.calendar_today),
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now().subtract(const Duration(days: 6570)),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          int age = DateTime.now().year - pickedDate.year;
          if (age < 18 || age > 100) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Age must be between 18 and 100')),
            );
          } else {
            _dobController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
          }
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Date of Birth is required';
        }
        return null;
      },
    );
  }

  Widget _buildGenderSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Gender', style: TextStyle(fontSize: 16)),
        Row(
          children: [
            _buildRadioButton('Male'),
            _buildRadioButton('Female'),
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

  Widget _buildTextField(String hintText, String? Function(String?) validator) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: hintText,
          border: const OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }

  Widget _buildDropdownField({
    required String labelText,
    required List<String> items,
    required String? value,
    required void Function(String?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
        value: value,
        items: items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select $labelText';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required bool showFields,
    required VoidCallback onToggle,
    required List<Widget> fields,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          trailing: Icon(showFields ? Icons.expand_less : Icons.expand_more),
          onTap: onToggle,
        ),
        if (showFields) ...fields,
      ],
    );
  }

  Widget _buildAgreementCheckbox() {
    return Row(
      children: [
        Checkbox(
          value: _agreeToTerms,
          onChanged: (value) {
            setState(() {
              _agreeToTerms = value!;
            });
          },
        ),
        const Expanded(
          child: Text(
            'I agree to the terms & conditions',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildContinueButton() {
    final isFormValid = _formKey.currentState?.validate() ?? false;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          backgroundColor: _canProceed(isFormValid) ? Colors.blue : Colors.grey,
        ),
        onPressed: _canProceed(isFormValid)
            ? () {
                context.push('/paymentscreen');  
              }
            : null,
        child: const Text(
          'Continue',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  bool _canProceed(bool isFormValid) {
    return isFormValid && _agreeToTerms;
  }
}
