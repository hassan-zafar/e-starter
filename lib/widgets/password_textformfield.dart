import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utilities/custom_validator.dart';
import '../utilities/utilities.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    required TextEditingController controller,
    this.title = 'Password',
    Key? key,
  })  : _controller = controller,
        super(key: key);
  final TextEditingController _controller;
  final String title;
  @override
  PasswordTextFormFieldState createState() => PasswordTextFormFieldState();
}

class PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _notVisible = true;
  void _onListener() => setState(() {});
  @override
  void initState() {
    widget._controller.addListener(_onListener);
    super.initState();
  }

  @override
  void dispose() {
    widget._controller.removeListener(_onListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: widget._controller,
        obscureText: _notVisible,
        textInputAction: TextInputAction.done,
        cursorColor: Theme.of(context).colorScheme.secondary,
        validator: (String? value) => CustomValidator.password(value),
        decoration: InputDecoration(
          labelText: widget.title,
          hintText: widget.title,
          suffixIcon: IconButton(
            onPressed: () => setState(() {
              _notVisible = !_notVisible;
            }),
            splashRadius: Utilities.padding,
            icon: (_notVisible == true)
                ? const Icon(CupertinoIcons.eye)
                : const Icon(CupertinoIcons.eye_slash),
          ),
          focusColor: Theme.of(context).primaryColor,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(Utilities.borderRadius),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(Utilities.borderRadius),
          ),
        ),
      ),
    );
  }
}