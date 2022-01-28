import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utilities/utilities.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    required TextEditingController controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.title,
    this.validator,
    this.initialValue,
    this.minLines = 1,
    this.maxLines = 1,
    this.hint,
    this.readOnly = false,
    this.autoFocus = false,
    this.textAlign = TextAlign.start,
    Key? key,
  })  : _controller = controller,
        super(key: key);
  final TextEditingController _controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String? value)? validator;
  final String? initialValue;
  final int? minLines;
  final int? maxLines;
  final String? title;
  final String? hint;
  final bool readOnly;
  final bool autoFocus;
  final TextAlign textAlign;
  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  void _onListen() => setState(() {});
  @override
  void initState() {
    widget._controller.addListener(_onListen);
    super.initState();
  }

  @override
  void dispose() {
    widget._controller.removeListener(_onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        initialValue: widget.initialValue,
        controller: widget._controller,
        readOnly: widget.readOnly,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        autofocus: widget.autoFocus,
        textAlign: widget.textAlign,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        validator: (String? value) => widget.validator!(value),
        cursorColor: Theme.of(context).colorScheme.secondary,
        decoration: InputDecoration(
          labelText: widget.title,
          hintText: widget.hint,
          suffixIcon: (widget._controller.text.isEmpty)
              ? const SizedBox()
              : IconButton(
                  splashRadius: Utilities.padding,
                  onPressed: () => setState(() {
                    widget._controller.clear();
                  }),
                  icon: const Icon(CupertinoIcons.clear, size: 18),
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
