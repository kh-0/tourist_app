import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourist_app/login.dart';
import 'package:tourist_app/home.dart';
import 'package:tourist_app/models/trip_model.dart';

class TripDetailsPage extends StatefulWidget {
  final TripeModel tripeModel;
  const TripDetailsPage({super.key, required this.tripeModel});

  @override
  State<TripDetailsPage> createState() => _TripDetailsPageState();
}

class _TripDetailsPageState extends State<TripDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        elevation: 0,
        title: Text("${widget.tripeModel.name}"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              child: Image.network(widget.tripeModel.image!),
            ),
            Text(
              "${widget.tripeModel.name}",
              style: TextStyle(
                  color: Colors.deepPurple[300],
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              "${widget.tripeModel.description}",
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
