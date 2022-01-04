import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        // ignore: deprecated_member_use
                        MaterialStateProperty.all(context.theme.buttonColor),
                    shape: MaterialStateProperty.all(StadiumBorder(),)
                    ),
                child: "Add to cart".text.make()
                ).wh(120, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4.color(context.accentColor).bold.make(),
                    catalog.desc.text.xl.make(),10.heightBox,
                    "Takimata invidunt et stet est lorem sed sed. Sadipscing et aliquyam kasd gubergren et lorem tempor consetetur. Eirmod gubergren amet sed tempor tempor sit ut gubergren. Clita gubergren et et est sea sea amet, vero tempor sed accusam consetetur ut diam voluptua. Et sed rebum sit justo ut amet nonumy."
                    .text.make().p8()
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
