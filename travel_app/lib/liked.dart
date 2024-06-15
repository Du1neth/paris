import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LikedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferences'),
      ),
      body: FutureBuilder<Map<String, bool>>(
        future: _loadPreferences(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final preferences = snapshot.data!;
            final selectedPreferences = preferences.entries.where((entry) => entry.value).map((entry) => entry.key).toList();
            return ListView(
              children: selectedPreferences.map((preference) {
                return ListTile(
                  title: Text(preference),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }

  Future<Map<String, bool>> _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      'Cafe': prefs.getBool('Cafe') ?? false,
      'Restaurant': prefs.getBool('Restaurant') ?? false,
      'Landmarks': prefs.getBool('Landmarks') ?? false,
      'Cinemas': prefs.getBool('Cinemas') ?? false,
    };
  }
}

void main() {
  runApp(MaterialApp(
    home: LikedPage(),
  ));
}
