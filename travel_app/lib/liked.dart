import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class LikedPage extends StatelessWidget {
  const LikedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> likedPlaces = [
      'Eiffel Tower',
      'Louvre Museum',
      'Notre-Dame-de-Paris',
      'Arc de Triomphe',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Liked Places'),
      ),
      body: ListView.builder(
        itemCount: likedPlaces.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                title: Text(
                  likedPlaces[index],
                  style: GoogleFonts.getFont(
                    'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: GNav(
        selectedIndex: 1,
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
