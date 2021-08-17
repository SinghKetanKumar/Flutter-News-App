import 'package:flutter/cupertino.dart';
import 'package:flutter_app_advanced_newsapp/styles/theme.dart';
import 'package:flutter_app_advanced_newsapp/widgets/headline_sider.dart';
import 'package:flutter_app_advanced_newsapp/widgets/hot_news.dart';
import 'package:flutter_app_advanced_newsapp/widgets/top_channels.dart';
import 'package:flutter_app_advanced_newsapp/styles/theme.dart' as Style;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HeadlingSliderWidget(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Text("Top channels", style: TextStyle(
                  color: Colors.titleColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0
              ),),
            ],
          ),
        ),
        TopChannelsWidget(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Text("Hot news", style: TextStyle(
                  color: Colors.titleColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0
              ),),
            ],
          ),
        ),
        HotNewsWidget()
      ],
    );
  }
}