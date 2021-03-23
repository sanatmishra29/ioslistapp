import 'package:meta/meta.dart';

class Item {
  final String title;
  final String qty;
  final String urlImage;

  const Item({
    @required this.title,
    @required this.qty,
    @required this.urlImage,
  });
}
