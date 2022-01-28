import 'package:flutter/material.dart';

// ignore_for_file: constant_identifier_names
enum UserTypeEnum { ENTREPRENEUR, INVESTOR }

class UserTypeWidget extends StatefulWidget {
  const UserTypeWidget({
    required this.isENTREPRENEUR,
    required this.onChanged,
    Key? key,
  }) : super(key: key);
  final bool isENTREPRENEUR;
  final void Function(bool)? onChanged;
  @override
  State<UserTypeWidget> createState() => _UserTypeWidgetState();
}

class _UserTypeWidgetState extends State<UserTypeWidget> {
  late UserTypeEnum _usetEnum = (widget.isENTREPRENEUR)
      ? UserTypeEnum.ENTREPRENEUR
      : UserTypeEnum.INVESTOR;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              _usetEnum = UserTypeEnum.ENTREPRENEUR;
            });
            widget.onChanged!(true);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Radio<UserTypeEnum>(
                value: UserTypeEnum.ENTREPRENEUR,
                activeColor: Theme.of(context).primaryColor,
                groupValue: _usetEnum,
                onChanged: (UserTypeEnum? value) {
                  setState(() {
                    _usetEnum = value!;
                  });
                  widget.onChanged!(true);
                },
              ),
              const Text('ENTREPRENEUR'),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _usetEnum = UserTypeEnum.INVESTOR;
            });
            widget.onChanged!(false);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Radio<UserTypeEnum>(
                value: UserTypeEnum.INVESTOR,
                groupValue: _usetEnum,
                activeColor: Theme.of(context).primaryColor,
                onChanged: (UserTypeEnum? value) {
                  setState(() {
                    _usetEnum = value!;
                  });
                  widget.onChanged!(false);
                },
              ),
              const Text('INVESTOR'),
            ],
          ),
        ),
      ],
    );
  }
}
