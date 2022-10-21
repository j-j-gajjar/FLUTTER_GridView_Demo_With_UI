import 'dart:math';

class ListOfData {
  ListOfData({this.id, this.prise, this.name, this.img});
  final int? id, prise;
  final String? name, img;
}

List allName = [
  "Sinzu",
  "Pikachu",
  "Doremon",
  "Giyan",
  "Priya",
  "Romyo",
  "lalit",
  "pratik",
  "jay",
];
List<ListOfData> listdata = getAllData();

List<ListOfData> getAllData() {
  List<ListOfData> listdata = [];
  allName.asMap().forEach((i, value) {
    int indexPlusOne = i + 1;
    listdata.add(
      ListOfData(
        id: indexPlusOne,
        prise: Random().nextInt(100) + 100,
        name: allName[i],
        img: "assets/cartoon$indexPlusOne.png",
      ),
    );
  });
  return listdata;
}
