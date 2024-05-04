import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/theme/theme.dart';
import 'package:travel_app/theme/theme_provider.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Toggle Theme',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Light Mode',
                  style: TextStyle(
                    fontSize: 16,
                    color: themeProvider.themeData == darkMode
                        ? Colors.white
                        : const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                Switch(
                  value: themeProvider.themeData == darkMode,
                  onChanged: (value) {
                    themeProvider.toggleTheme();
                  },
                  activeColor: Colors.deepPurple,
                ),
                Text(
                  'Dark Mode',
                  style: TextStyle(
                    fontSize: 16,
                    color: themeProvider.themeData == lightMode
                        ? Color.fromARGB(255, 0, 0, 0)
                        : Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
