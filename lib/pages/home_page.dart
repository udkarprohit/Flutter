// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Bittubhai";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text("Catalog", 
          style: TextStyle(
            color: Colors.black,
          ))
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: Catalogmodel.item.length,
        itemBuilder: (context, index) {
          return ItemWidget(item: Catalogmodel.item[index],);
        },
      ),
      ),
      drawer: MyDrawer(),
    );
  }
}
