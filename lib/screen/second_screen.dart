// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:rest_api/model/posts.dart';
import 'package:rest_api/services/post_service.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int currentPostIndex = 0;
  Future<Posts>? _futurePosts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Second Screen",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: FutureBuilder(
          key: ValueKey(currentPostIndex),
          future: _futurePosts,
          builder: (_, snapshots) {
            if (snapshots.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Title: ${snapshots.data!.title}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.5,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Text(
                    "Title: ${snapshots.data!.body}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.5,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Text(
                    "Title: ${snapshots.data!.id}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.5,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Text(
                    "Title: ${snapshots.data!.userId}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.5,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              );
            } else if (snapshots.hasError) {
              return Text("Error -> ${snapshots.error}");
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
            currentPostIndex = (currentPostIndex + 1) % 100;
            _futurePosts = getPosts();
          });
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        tooltip: "Refresh",
        child: Icon(Icons.refresh),
      ),
    );
  }
}
