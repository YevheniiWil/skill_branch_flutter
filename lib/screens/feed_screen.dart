import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/screens/photo_screen.dart';
import 'package:FlutterGalleryApp/widgets/widgets.dart';
import 'package:flutter/material.dart';

const String kFlutterDash =
    'https://flutter.dev/assets/404/dash_nest-c64796b59b65042a2b40fae5764c13b7477a592db79eaf04c86298dcb75b78ea.png';

class Feed extends StatefulWidget {

  Feed({Key key}):super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  _buildItem(index),
                  Divider(thickness: 2, color: AppColors.mercury)
                ],
              );
            }));
  }

  Widget _buildItem(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FullScreenImage(index: index)));
            },
            child: Hero(
              tag: "heroTag $index",
              child: Photo(photoLink: kFlutterDash),
            )),
        _buildPhotoMeta(index),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            "This is Flutter Dash I love it",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.h3.copyWith(color: AppColors.manatee),
          ),
        )
      ],
    );
  }

  _buildPhotoMeta(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  UserAvatar('https://lh3.googleusercontent.com/a-/AOh14GhCuBlfLKUIB8qyyaqBhbmu5_SrqPERw-h6Xqpy=s96-c-rg-br100'),
                  SizedBox(
                    width: 6,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Yevhenii',
                    style: AppStyles.h2Black,
                  ),
                  Text(
                    '@Yevhenii',
                    style: AppStyles.h5Black.copyWith(color: AppColors.manatee),
                  )
                ],
              ),
            ],
          ),
          LikeButton(likeCount: 10, isLiked: true),
        ],
      ),
    );
  }
}