import 'package:flutter_catalog/models/catalog.dart';

class CartModel{

//catalog field
// ignore: unused_field
late Catalogmodel _catalog;

//Collection of IDs - store of each item
// ignore: unused_field
final List<int> _itemIds = [];

//Get Catalog
Catalogmodel get catalog => _catalog;

set catalog(Catalogmodel newCatalog){
  assert(newCatalog!=null);
  _catalog = newCatalog;
}

//Get Item in the cart
List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

//Get Total Price
num get totalPrice => items.fold(0, (total, current) => total + current.price);

//Add item

void add(Item item){
  _itemIds.add(item.id);
}

//Remove Item
void remove(Item item){
  _itemIds.remove(item.id);
}

}