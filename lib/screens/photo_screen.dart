import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullScreenImage extends StatefulWidget {

   static const  String link =
      'https://www.interfax.ru/ftproot/photos/photostory/2019/10/16/wild1_700.jpg';
  static const String description =
      'bla bla ';
  
  final String name;
  final String userName;
  final String altDescription;
  final String photo;
  final String userPhoto;

  FullScreenImage(
      {this.name = "",
      this.userName = "",
      this.altDescription = "Beautiful girl in a yellow dress with a flower on her head in the summer in the forest",
      this.photo = link,
      this.userPhoto = link,
      Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FullScreenImage();
  }
}

class _FullScreenImage extends State<FullScreenImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: <Widget>[
          Photo(photoLink: widget.photo, key: Key('Photo')),
          Padding(
            padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
            child: Text(
              widget.altDescription,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: AppStyles.h3,
            ),
          ),
          _photo(),
          _buttons(),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Center(
        child: Text(
          'Photo',
          style: TextStyle(color: AppColors.black),
        ),
      ),
      backgroundColor: AppColors.white,
      leading: IconButton(
        color: AppColors.alto,
        icon: Icon( CupertinoIcons.back),
        onPressed: () {},
      ),
    );
  }

  Widget _photo() {
    return Row(
      
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20), 
          child: UserAvatar(imageLink: widget.userPhoto),
          ),         
        Column(
          children: <Widget>[
            Text(
              widget.name,
              style: AppStyles.h1Black,
            ),
            Text(
              '@${widget.userName}',
              style: AppStyles.h5Black,
            )
          ],
        ),
      ],
    );
  }

  Widget _buttons() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: LikeButton(likeCount: 23, isLiked: true),
        ),
        Expanded(
          child: GestureDetector(
            child: Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: AppColors.dodgerBlue,
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Text(
                'Save',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: AppColors.white),
              ),
            ),
            onTap: someMethod,
          ),
        ),
        Expanded(
          child: GestureDetector(
            child: Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: AppColors.dodgerBlue,
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Text(
                'Visit',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: AppColors.white),
              ),
            ),
            onTap: someMethod,
          ),
        ),
      ],
    );
  }

  void someMethod() {}
}