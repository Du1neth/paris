import 'package:flutter/material.dart';

class Activities extends StatelessWidget {
  final String image;
  final String actName;
  final String desc;

  const Activities({
    required this.image,
    required this.actName,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 10, right: 10),
      child: Container(
        width: 320,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.grey[200] 
              : Colors.grey[800], 
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 150,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    actName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black // Light mode text color
                          : Colors.white, // Dark mode text color
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    desc,
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.grey // Light mode text color
                          : Colors.white70, // Dark mode text color
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
