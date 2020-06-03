import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String imageLink;

  UserAvatar(this.imageLink);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            radius: 40,
            backgroundImage: CachedNetworkImageProvider(imageLink),
          ),
        ),
      ],
    );
  }
}