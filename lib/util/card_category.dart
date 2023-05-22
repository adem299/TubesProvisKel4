import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final icon;
  final String title;

  const CategoryCard({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 100,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.green[200], borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 50,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),

            // Text(
            //   "\$" + balance.toString(),
            //   style: TextStyle(color: Colors.white, fontSize: 28),
            // ),
          ],
        ),
      ),
    );
  }
}
