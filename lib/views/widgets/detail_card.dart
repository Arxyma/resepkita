import 'package:flutter/material.dart';
import 'package:resepkita/views/details.dart';

class DetailCard extends StatelessWidget {
  final String id;
  final String title;
  final String area;
  final String category;
  final String thumbnailUrl;
  final String instruction;
  final String tags;

  DetailCard({
    @required this.title,
    @required this.category,
    @required this.area,
    @required this.thumbnailUrl,
    @required this.id,
    @required this.instruction,
    @required this.tags,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 10,
        margin: EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Card(
                elevation: 10,
                child: Image(
                  image: NetworkImage(thumbnailUrl),
                  width: 300,
                  height: 300,
                  // fit: BoxFit.cover,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                instruction,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
