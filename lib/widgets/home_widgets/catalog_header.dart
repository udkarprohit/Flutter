
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ignore: deprecated_member_use
        "Catalog App".text.xl5.bold.color(context.theme.accentColor).make(),
        "Trending products".text.xl2.make(),
      ],
    );
  }
}