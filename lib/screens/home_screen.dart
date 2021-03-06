import 'package:flutter/material.dart';
import 'package:mood_tracker/config/palette.dart';
import 'package:mood_tracker/config/styles.dart';
import 'package:mood_tracker/widgets/tip_of_the_day.dart';
import 'package:mood_tracker/widgets/widgets.dart';
import 'package:mood_tracker/screens/screens.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(screenHeight),
          _buildPast7Days(screenHeight),
          _buildKeywords(screenHeight),
          _buildTipOfTheDay(screenHeight),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    Map<int, Color> color = {
      50: Color.fromRGBO(117, 119, 151, .1),
      100: Color.fromRGBO(117, 119, 151, .2),
      200: Color.fromRGBO(117, 119, 151, .3),
      300: Color.fromRGBO(117, 119, 151, .4),
      400: Color.fromRGBO(117, 119, 151, .5),
      500: Color.fromRGBO(117, 119, 151, .6),
      600: Color.fromRGBO(117, 119, 151, .7),
      700: Color.fromRGBO(117, 119, 151, .8),
      800: Color.fromRGBO(117, 119, 151, .9),
      900: Color.fromRGBO(117, 119, 151, 1),
    };
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 32.0,
          horizontal: 16.0,
        ),
        decoration: BoxDecoration(
          color: MaterialColor(0xFFE5F3FF, color),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Image.asset(
                  'assets/heart_logo.png',
                  width: 150,
                  height: 150,
                ),
              ],
            ),
            Text(
              'Hi Amy,',
              style: const TextStyle(
                color: Color(0xFF333333),
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'How\'s it going?',
              style: const TextStyle(
                color: Color(0xFF333333),
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Row(
              children: <Widget>[
                FlatButton(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14.0,
                    horizontal: 24.0,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => FeelixButtonScreen()),
                        (Route<dynamic> route) => false);
                  },
                  color: Color(0xFF4F8BFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    'Chat with Feelix',
                    style: Styles.buttonTextStyle,
                  ),
                  textColor: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildPast7Days(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Mood for Past 7 days',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            PastWeekCards(),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildKeywords(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Keywords',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'Here are the top 5 keywords that you frequently mentioned in a conversation with the chatbot in the past 7 days',
              style: const TextStyle(
                fontSize: 12.0,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Top5Keywords(),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildTipOfTheDay(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Tip of the Day',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Container(
              height: screenHeight * 0.15,
              decoration: BoxDecoration(
                color: Palette.secondaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TipOfTheDay(),
            ),
          ],
        ),
      ),
    );
  }
}
