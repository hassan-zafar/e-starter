import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class CircularProfileImage extends StatelessWidget {
  const CircularProfileImage({
    required this.imageURL,
    this.radius = 30,
    Key? key,
  }) : super(key: key);
  final String imageURL;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Theme.of(context).primaryColor,
      child: CircleAvatar(
        radius: radius - 2,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: CircleAvatar(
          radius: radius - 4,
          backgroundColor: Theme.of(context).primaryColor,
          child: imageURL.isEmpty
              ? const FittedBox(
                  child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'No\nImage',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ))
              : ExtendedImage.network(
                  imageURL,
                  width: radius * 2,
                  height: radius * 2,
                  fit: BoxFit.cover,
                  cache: true,
                  shape: BoxShape.circle,
                ),
        ),
      ),
    );
  }
}