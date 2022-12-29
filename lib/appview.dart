// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:prmier_app/Widget/user_transaction.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});
  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        "AccueilPage",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        child: Text("Chart!!!"),
                      ),
                    ),
                    UserTransaction()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
