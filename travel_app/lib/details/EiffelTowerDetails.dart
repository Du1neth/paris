import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:like_button/like_button.dart';

class EiffelTowerDetails extends StatefulWidget {
  @override
  _EiffelTowerDetailsState createState() => _EiffelTowerDetailsState();
}

class _EiffelTowerDetailsState extends State<EiffelTowerDetails> {
  final List<String> imagePaths = [
    'assets/images/eiffel-tower.jpg',
    'assets/images/eiffel-tower2.jpg',
  ];
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Stack(
              children: [
                PageView.builder(
                  itemCount: imagePaths.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.asset(
                      imagePaths[index],
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    );
                  },
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 20,
                  child: Image.asset(
                    'assets/images/swipe.gif',
                    height: 60,
                    width: 60,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          // Details
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.deepPurple.withOpacity(0.1),
                    Colors.purple.withOpacity(0.1),
                  ],
                ),
              ),
              child: const Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Eiffel Tower',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'A wrought-iron lattice tower located on the Champ de Mars in Paris, France. It is named after the engineer Gustave Eiffel, whose company designed and built the tower.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price: Rs. 10100', 
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        LikeButton(),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GNav(
        selectedIndex: 0,
        onTabChange: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/liked_places');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/settings');
          }
        },
        tabBorderRadius: 90,
        tabBorder: Border.all(color: Colors.deepPurple, width: 1),
        color: Colors.grey[800],
        activeColor: Colors.deepPurple,
        tabBackgroundColor:
            const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        duration: Duration(milliseconds: 900),
        tabMargin: EdgeInsets.all(15),
        gap: 10,
        tabs: const [
          GButton(
            icon: Icons.home_outlined,
            text: 'Home',
            iconSize: 20,
            iconColor: Colors.deepPurple,
          ),
          GButton(
            icon: Icons.favorite_outline,
            text: 'Liked Places',
            iconSize: 20,
            iconColor: Colors.deepPurple,
          ),
          GButton(
            icon: Icons.settings_outlined,
            text: 'Settings',
            iconSize: 20,
            iconColor: Colors.deepPurple,
          ),
        ],
      ),
    );
  }
}
