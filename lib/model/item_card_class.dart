// ignore_for_file: public_member_api_docs, sort_constructors_first
class Item {
  String? itemName;
  double? itemPrice;
  String? imgUrl;
  double? rating;
  bool animate;
  Item({
    this.itemName,
    this.itemPrice,
    this.imgUrl,
    this.rating,
    this.animate = false,
  });
}

Item item1 = Item(
    itemName: "Airpods",
    itemPrice: 100.0,
    imgUrl: "images/airPods.jpg",
    rating: 2.0);
Item item2 = Item(
    itemName: "Cool Bag",
    itemPrice: 200.0,
    imgUrl: "images/bag.jpg",
    rating: 4.0);
Item item3 = Item(
    itemName: "fit bit 5",
    itemPrice: 122.0,
    imgUrl: "images/fit bit 5.jpg",
    rating: 3.5);
Item item4 = Item(
    itemName: "Apple pencil",
    itemPrice: 150.0,
    imgUrl: "images/pencil.jpg",
    rating: 4.0);

List<Item> items = [item1, item2, item3, item4];
