import 'package:flutter/material.dart';
import 'package:animation_list/model/item.dart';


class ItemWidget extends StatelessWidget {

  final Item item;
  final Animation animation;
  final VoidCallback onClicked;

const ItemWidget({
  @required this.item,
  @required this.animation,
  @required this.onClicked,
  Key key
}) : super(key: key);

  @override
  Widget build(BuildContext context) =>ScaleTransition(
      scale: animation,
      child: Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          leading: CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(item.urlImage),
          ),
          title: Text(item.title+', '+item.qty,
            style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Anton'),
          ),
          trailing: IconButton(
            onPressed: onClicked,
            icon: Icon(Icons.delete_forever, color: Colors.red, size: 32,),
          ),
        ),
      ),
  );
}
