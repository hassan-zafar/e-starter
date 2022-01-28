import 'package:flutter/material.dart';

// ignore: always_specify_types
Future showLoadingDislog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return const Center(
        child: SizedBox(
          height: 30,
          width: 30,
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    },
  );
}

class ShowLoading extends StatelessWidget {
  const ShowLoading({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator.adaptive());
  }
}