// lib/screens/forms/form_helper.dart

import 'package:flutter/material.dart';

class FormHelper {
  static Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  static Widget buildTextField(
    String label,
    TextEditingController controller, {
    String? hint,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
    int? maxLength,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        maxLength: maxLength,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 16,
          ),
          counterText: maxLength != null ? '' : null,
        ),
        keyboardType: keyboardType,
        maxLines: maxLines,
      ),
    );
  }

  static Widget buildDatePickerField(
    BuildContext context,
    String label,
    TextEditingController controller, {
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          hintText: 'DD/MM/YYYY',
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              if (picked != null) {
                // Format as DD/MM/YYYY
                final String day = picked.day.toString().padLeft(2, '0');
                final String month = picked.month.toString().padLeft(2, '0');
                final String year = picked.year.toString();
                controller.text = '$day/$month/$year';
              }
            },
          ),
        ),
        keyboardType: TextInputType.datetime,
        readOnly: true,
      ),
    );
  }

  // Validation Helpers
  static String? validateNumberField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Please enter only numbers';
    }
    return null;
  }

  static String? validateDecimalField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    if (!RegExp(r'^[0-9]+(\.[0-9]{1,2})?$').hasMatch(value)) {
      return 'Please enter a valid decimal number';
    }
    return null;
  }

  static String? validateTextField(String? value, {int minLength = 1}) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    if (value.length < minLength) {
      return 'Minimum $minLength characters required';
    }
    // Reject special characters except space, hyphen, and apostrophe
    if (!RegExp(r"^[a-zA-Z\s\-']+$").hasMatch(value)) {
      return 'Please enter only letters';
    }
    return null;
  }

  static String? validateNameField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    }
    if (!RegExp(r"^[a-zA-Z\s\-']+$").hasMatch(value)) {
      return 'Name can only contain letters, spaces, hyphens, and apostrophes';
    }
    return null;
  }

  static String? validateEmailField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validatePhoneField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    }
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Phone number must be exactly 10 digits';
    }
    return null;
  }

  static String? validateDateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Date cannot be empty';
    }
    // Validate DD/MM/YYYY format
    if (!RegExp(r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/([0-9]{4})$')
        .hasMatch(value)) {
      return 'Please enter date in DD/MM/YYYY format';
    }
    return null;
  }

  static String? validatePinField(String? value) {
    if (value == null || value.isEmpty) {
      return 'PIN code cannot be empty';
    }
    if (!RegExp(r'^[0-9]{6}$').hasMatch(value)) {
      return 'PIN code must be exactly 6 digits';
    }
    return null;
  }

  static String? validateAccountNumberField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Account number cannot be empty';
    }
    if (!RegExp(r'^[0-9]{9,18}$').hasMatch(value)) {
      return 'Account number should be between 9 and 18 digits';
    }
    return null;
  }

  static String? validateConditionalField(
    String? value,
    bool isRequired, {
    String fieldName = 'This field',
  }) {
    if (isRequired && (value == null || value.isEmpty)) {
      return '$fieldName is required';
    }
    return null;
  }

  static void addListeners(
    List<TextEditingController> controllers,
    VoidCallback onChanged,
  ) {
    for (var controller in controllers) {
      controller.addListener(onChanged);
    }
  }

  static void disposeControllers(List<TextEditingController> controllers) {
    for (var controller in controllers) {
      controller.dispose();
    }
  }
}
