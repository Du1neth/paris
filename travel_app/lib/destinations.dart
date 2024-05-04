import 'package:flutter/material.dart';

class destinations extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final String description;

destinations({
  required this.image,
  required this.name,
  required this.price,
  required this.description,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, bottom:  10.0),
      child: Container(
        padding: EdgeInsets.all(20),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromARGB(37, 3, 168, 244),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(image)),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(                    
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Rs. ' + price),
                Icon(Icons.favorite_outline)
              ],),
            )
          ],
        ),
      ),
    );
  }
}
