import 'package:FlutterGalleryApp/res/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  final int likeCount;
  final bool isLiked;

  LikeButton({this.likeCount = 0, this.isLiked = false});

  @override
  State<StatefulWidget> createState() {
    return _LikeButton();
  }
}

class _LikeButton extends State<LikeButton> {
  bool isLiked;

  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            isLiked = !isLiked;
          });
        },
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
                child: Icon(isLiked ? AppIcons.like_fill : AppIcons.like)),
            Text(
              widget.likeCount.toString(),
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ));
  }
}