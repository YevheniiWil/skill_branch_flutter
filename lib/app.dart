import 'package:flutter/material.dart';
import 'res/res.dart';
import 'screens/feed_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  int currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  List<Widget>pages = [
    Feed(key: PageStorageKey('FeedPage')),
    Container(),
    Container(),
  ];

  final List<BottomNavyBarItem>_tabs = [
    BottomNavyBarItem(
      asset: AppIcons.home,
      title: Text('Feed'),
      activeColor: AppColors.dodgerBlue,
      inactiveColor: AppColors.manatee,
    ), BottomNavyBarItem(
      asset: AppIcons.home,
      title: Text('Search'),
      activeColor: AppColors.dodgerBlue,
      inactiveColor: AppColors.manatee,
    ), BottomNavyBarItem(
      asset: AppIcons.home,
      title: Text('User'),
      activeColor: AppColors.dodgerBlue,
      inactiveColor: AppColors.manatee,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
          showElevation: true,
          itemCornerRadius: 8,
          curve: Curves.ease,
          items: _tabs,
          currentTab: currentTab,
          onItemSelected: (index) {
            setState(() {
              currentTab = index;
            });
          }
      ),
      body: PageStorage(child: pages[currentTab],
        bucket: bucket,),
    );
  }
}

class BottomNavyBar extends StatelessWidget {
  final Color backgroundColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<BottomNavyBarItem> items;
  final ValueChanged<int> onItemSelected;
  final MainAxisAlignment mainAxisAlignment;
  final double itemCornerRadius;
  final double containerHeight;
  final Curve curve;
  final int currentTab;


  BottomNavyBar({this.backgroundColor, this.showElevation = true,
    this.animationDuration = const Duration(milliseconds: 270),
    @required this.items, @required this.onItemSelected,
    this.mainAxisAlignment = MainAxisAlignment
        .spaceBetween, this.itemCornerRadius = 50, this.containerHeight = 56,
    this.curve = Curves.linear, this.currentTab}) {
    assert(items != null);
    assert(items.length >= 2 && items.length <= 5);
    assert(onItemSelected != null);
    assert(curve != null);
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = (backgroundColor == null) ? Theme
        .of(context)
        .bottomAppBarColor : backgroundColor;
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          if(showElevation)
            const BoxShadow(
                color: Colors.black,
                blurRadius: 2
            )
        ],
      ),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: containerHeight,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: items.map((item) {
              var index = items.indexOf(item);

              return GestureDetector(
                onTap: () {
                  onItemSelected(index);
                },
                child: _ItemWidget(
                    item: item,
                    isSelected: currentTab == index ? true : false,
                    backgroundColor : bgColor,
                    itemCornerRadius : itemCornerRadius,
                    animationDuration: animationDuration,
                    curve: curve
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final bool isSelected;
  final BottomNavyBarItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;
  final Curve curve;

  const _ItemWidget(
      {Key key, @required this.isSelected, @required this.item, @required this.backgroundColor,
        @required this.itemCornerRadius, @required this.animationDuration, this.curve = Curves
          .linear})
      :
        assert(isSelected != null),
        assert(item != null),
        assert(backgroundColor != null),
        assert(itemCornerRadius != null),
        assert(curve != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isSelected ? 150 : (MediaQuery
          .of(context)
          .size
          .width - 150 - 8 * 4 - 4 * 2) / 2,
      height: double.maxFinite,
      duration: animationDuration,
      curve: curve,
      decoration: BoxDecoration(
        color: isSelected
            ? item.activeColor.withOpacity(0.2)
            : backgroundColor,
        borderRadius: BorderRadius.circular(itemCornerRadius),
      ),
      child: Container(
        width: isSelected ? 150 : (MediaQuery
            .of(context)
            .size
            .width - 150 - 8 * 4 - 4 * 2) / 2,
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
                item.asset,
                size: 20,
                color: isSelected ? item.activeColor.withOpacity(0.2) : item
                    .inactiveColor
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: DefaultTextStyle.merge(style: TextStyle(
                    color: isSelected
                        ? item.activeColor.withOpacity(0.2)
                        : item.inactiveColor,
                    fontWeight: FontWeight.bold
                ),
                  maxLines: 1,
                  textAlign: item.textAlign,
                  child: item.title,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomNavyBarItem {
  final IconData asset;
  final Text title;
  final Color activeColor;
  final Color inactiveColor;
  final TextAlign textAlign;

  BottomNavyBarItem(
      {@required this.asset, @required this.title, this.activeColor,
        this.inactiveColor, this.textAlign}) {
    assert(asset != null);
    assert(title != null);
  }


}