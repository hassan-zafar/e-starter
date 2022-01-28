import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import '../utilities/utilities.dart';

class PhoneNumberField extends StatefulWidget {
  const PhoneNumberField({Key? key, required this.onChange}) : super(key: key);
  final Function(PhoneNumber)? onChange;
  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(Utilities.borderRadius),
        ),
        labelText: 'Mobile number',
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(Utilities.borderRadius),
        ),
      ),
      initialCountryCode: 'PK',
      keyboardType: TextInputType.number,
      onChanged: (PhoneNumber phone) => widget.onChange!(phone),
    );
  }
}