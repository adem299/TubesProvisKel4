import 'package:flutter/material.dart';

class CardNotif extends StatelessWidget {
  final String date;
  final String description;

  const CardNotif({super.key, required this.date, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.message_rounded,
          size: 30,
        ),
        title: Text(
          date,
          style: TextStyle(fontSize: 12, color: Colors.grey[700]),
        ),
        subtitle: Text(
          description,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
      ),
    );
  }
}
