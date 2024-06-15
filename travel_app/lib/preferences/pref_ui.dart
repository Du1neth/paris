import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/home_page.dart';

class PreferencesScreen extends StatefulWidget {
  @override
  _PreferencesScreenState createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  Map<String, bool> _preferences = {
    'Cafe': false,
    'Restaurant': false,
    'Landmarks': false,
    'Cinemas': false,
  };

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _preferences['Cafe'] = prefs.getBool('Cafe') ?? false;
      _preferences['Restaurant'] = prefs.getBool('Restaurant') ?? false;
      _preferences['Landmarks'] = prefs.getBool('Landmarks') ?? false;
      _preferences['Cinemas'] = prefs.getBool('Cinemas') ?? false;
    });
  }

  _savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Cafe', _preferences['Cafe']!);
    prefs.setBool('Restaurant', _preferences['Restaurant']!);
    prefs.setBool('Landmarks', _preferences['Landmarks']!);
    prefs.setBool('Cinemas', _preferences['Cinemas']!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Preferences"),
      ),
      body: ListView(
        children: _preferences.keys.map((String key) {
          return CheckboxListTile(
            title: Text(key),
            value: _preferences[key],
            onChanged: (bool? value) {
              setState(() {
                _preferences[key] = value!;
              });
              _savePreferences();
            },
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ElevatedButton(
            onPressed: () {
              _savePreferences();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(
                      selectedPreferences: _preferences.entries
                          .where((entry) => entry.value)
                          .map((entry) => entry.key)
                          .toList()),
                ),
              );
            },
            child: Text('Go to Home Page'),
          ),
        ),
      ),
    );
  }
}
