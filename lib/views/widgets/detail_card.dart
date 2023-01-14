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
    return Column(
      children: [
        Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: SizedBox(
              width: 300,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Image(
                      image: NetworkImage(thumbnailUrl),
                      width: 300,
                      height: 300,
                    ),
                  ),
                  Align(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.tag),
                              Text(
                                tags == 'null' ? 'No Tags' : tags,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.location_pin),
                              Text(
                                area,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.restaurant),
                              Text(
                                category,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            elevation: 5,
            margin: EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  ),
                  Divider(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Instruction : ',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    instruction,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
