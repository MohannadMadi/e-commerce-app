class Item {
  String? itemName;
  int? itemPrice;
  String? imgUrl;
  int? rating;

  Item({this.itemName, this.itemPrice, this.imgUrl, this.rating});
}

Item item1 = Item(
    itemName: "Airpds",
    itemPrice: 100,
    imgUrl: "images/airPods.jpg",
    rating: 3);
