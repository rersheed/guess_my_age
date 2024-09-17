import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();
  String age = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Welcome to",
                style: TextStyle(fontSize: 30),
              ),
              const Text(
                "Guess My Age",
                style: TextStyle(fontSize: 50),
              ),
              const SizedBox(height: 30),
              TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(
                age,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: guessMyAge,
                child: const Text("Guess "),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> guessMyAge() async {
    setState(() {
      age = "Loading...";
    });
    final String name = _nameController.text.trim();
    Uri url = Uri.parse('https://api.agify.io?name=$name');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      var guessedAge = responseBody['age'];
      setState(() {
        age = "$name is $guessedAge years old.";
      });
    }
  }
}
