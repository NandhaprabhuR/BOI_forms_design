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
      ),
    );
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
