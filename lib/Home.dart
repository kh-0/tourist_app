import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourist_app/Pages/SecondPage.dart';
import 'package:tourist_app/login.dart';
import 'package:tourist_app/home.dart';
import 'package:tourist_app/models/trip_model.dart';
import 'package:tourist_app/trip_details_page.dart';

import 'Pages/FirstPage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TripeModel> tripList = [
    TripeModel(
        description: "des1",
        name: "name",
        image:
            "https://youimg1.tripcdn.com/target/0101q12000a4syk4vE492_C_670_376_Q70.webp?proc=source%2ftrip&proc=source%2ftrip"),
    TripeModel(
        description: "des2",
        name: "name",
        image:
            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg"),
    TripeModel(
        description: "des3",
        name: "name",
        image:
            "https://st2.depositphotos.com/3837271/7112/i/950/depositphotos_71126621-stock-photo-road-trip-sign.jpg"),
    TripeModel(
        description: "des4",
        name: "name",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm82bi-2q_knG_vGf30Xm3cy55upTwbnC6yA&usqp=CAU")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        elevation: 0,
        title: Text('T i t e l'),
        centerTitle: true,
        //  leading: IconButton(
        //   onPressed: () {
        //open menu
        //   },
        //    icon: Icon(Icons.menu),
        //  ),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const loginscreen();
              }));
//do somthing
            },
            icon: Icon(Icons.person),
          )
        ],
      ),
      ///////drawer////////////////////////////////////////////////
      drawer: Drawer(
          child: Container(
        color: Colors.deepPurple[100],
        child: ListView(
          children: [
            DrawerHeader(
                child: Center(
                    child: Text(
              'Refrences',
              style: TextStyle(fontSize: 35),
            ))),
            ListTile(
              leading: Icon(Icons.travel_explore_sharp),
              title: Text(
                'Entertaining',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => FirstPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.travel_explore_sharp),
              title: Text(
                'Nature ',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
            )
          ],
        ),
      )),

      /////////////////////////////////////////////////////////////
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: tripList.length,
            itemBuilder: (c, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return TripDetailsPage(
                      tripeModel: tripList[index],
                    );
                  }));
                },
                child: Container(
                  height: 370,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 300,
                        child: Image.network(tripList[index].image!),
                      ),
                      Text(
                        "${tripList[index].name}",
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.deepPurple[300],
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        "${tripList[index].description}",
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
