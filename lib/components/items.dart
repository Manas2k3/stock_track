import 'package:flutter/material.dart';
import 'package:stock_track/model/api_model.dart';

class Item extends StatelessWidget {
  final Datum item;

  Item({required this.item});

  @override
  Widget build(BuildContext context) {
    // Determine the color for percent change based on its value
    Color percentChangeColor =
        item.p.startsWith('-') ? Colors.red : Colors.green;

    return Material(
      elevation: 4.0, // Set the elevation value as needed
      borderRadius: BorderRadius.circular(8.0), // Match the border radius
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border:
              Border.all(color: Theme.of(context).colorScheme.inversePrimary),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${item.s}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                SizedBox(height: 4.0),
                Text(
                  '\₹${item.c}',
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                SizedBox(height: 4.0),
                Text(
                  '${item.p}%',
                  style: TextStyle(
                    fontSize: 16,
                    color: percentChangeColor,
                    fontWeight: FontWeight.bold,
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
