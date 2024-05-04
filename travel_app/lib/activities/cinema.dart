import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:like_button/like_button.dart';

class ActivitiesDetails1 extends StatefulWidget {
  @override
  State<ActivitiesDetails1> createState() => _ActivitiesDetails1State();
}

class _ActivitiesDetails1State extends State<ActivitiesDetails1> {
  final List<String> activityPaths = [
    'assets/images/arthouse.jpg',
    'assets/images/eiffel-tower2.jpg',
  ];
  int _activityImages = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          LikeButton(),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          PageView.builder(
            itemCount: activityPaths.length,
            onPageChanged: (index) {
              setState(() {
                _activityImages = index + 1;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(
                activityPaths[index],
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              );
            },
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Image $_activityImages of ${activityPaths.length}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.white.withOpacity(0.9) // Light mode background color
                    : Colors.grey[900], // Dark mode background color
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Art-House Cinema',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black // Light mode text color
                          : Colors.white, // Dark mode text color
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'A historic flytrap for Parisian cinephiles, the 5th and 6th arrondissements are still full of independent cinemas, most notably Le Champo on Rue des Écoles, where many of the Nouvelle Vague directors hung about in the \’50s and \’60s.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black54 // Light mode text color
                          : Colors.white70, // Dark mode text color
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Location: Paris',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).brightness == Brightness.light
                              ? Colors.black // Light mode text color
                              : Colors.white, // Dark mode text color
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Book Now'),
                      ),
                    ],
                  ),
                ],
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
            text: 'Liked',
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

