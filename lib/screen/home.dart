// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:rest_api/model/albums.dart';
import 'package:rest_api/services/networking.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentApiIndex = 0;
  Future<Albums>? futureAlbums;
  @override
  void initState() {
    super.initState();
    futureAlbums = fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Rest Api",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0.0,
      ),
      body: Center(
        child: FutureBuilder(
          key: ValueKey(currentApiIndex),
          future: futureAlbums,
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.title);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator(
              color: Colors.black,
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            currentApiIndex = (currentApiIndex + 1) % 100;
            futureAlbums = fetchAlbums();
          });
        },
        tooltip: "Refresh",
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
