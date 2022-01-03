import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Bittubhai";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];
    Catalogmodel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(Catalogmodel.items!=null && Catalogmodel.items.isNotEmpty)
              CatalogList().expand()
              else
              const Center(child: CircularProgressIndicator(),
              )
            ],
          ),
        ),
      ));
  }
}


class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
              "Trending products".text.xl2.make(),
      
            ],
          );
  }
}


class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      shrinkWrap: true,
      itemCount: Catalogmodel.items.length,
      itemBuilder:(context, index) {
        final catalog = Catalogmodel.items[index];
        return CatalogItem(catalog: catalog);
      },
      );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : assert(catalog!=null),
  super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
         CatalogImage(image: catalog.image,
         ),
         Expanded(child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
             catalog.desc.text.make(),
             10.heightBox,
             ButtonBar(

               alignment: MainAxisAlignment.spaceBetween,
               buttonPadding: EdgeInsets.zero,
               children: [
                 "\$${catalog.price}".text.bold.make(),
                 ElevatedButton(onPressed: () {},
                 style: ButtonStyle(
                   backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                   shape: MaterialStateProperty.all(const StadiumBorder(),)
                 ),
                 child: "Buy".text.make())
               ],
             ).pOnly(right: 8.0)
           ],
         ))
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Image.network(
      image,
      ).box.rounded.p8.color(MyTheme.creamColor).make().p16().w40(context);
  }
}