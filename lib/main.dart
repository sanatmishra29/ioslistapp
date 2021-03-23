import 'package:flutter/material.dart';
import 'package:animation_list/data.dart';
import 'package:animation_list/model/item.dart';
import 'package:animation_list/widget/item_widget.dart';

void main() => runApp(Animated());

class Animated extends StatelessWidget {

  final String appName = "Animated Lists";

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        primaryColor: Colors.red[800]
      ),
    home: AnimatedApp(appTitle: appName,),
  );
}

class AnimatedApp extends StatefulWidget {

  final String appTitle;

  const AnimatedApp({
    @required this.appTitle,
});

  @override
  _AnimatedAppState createState() => _AnimatedAppState();
}

class _AnimatedAppState extends State<AnimatedApp> {

final key = GlobalKey<AnimatedListState>();

final items = List.from(Data.itemsListData);

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
            child: Text(widget.appTitle,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Anton',
                color: Colors.grey[50],
                letterSpacing: 2.0,
              ),
            )
        ),
      ),
    body: Column(
      children: [
        Expanded(
          child: AnimatedList(
            key: key,
            initialItemCount: items.length,
            itemBuilder: (context, index, animation) =>
            buildItem(items[index], index, animation),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: buildInsertButton(),
        )
      ],
    ),
  );

  Widget buildItem(item, int index, Animation<double> animation) =>
    ItemWidget(
      item: item,
      animation: animation,
      onClicked: () => removeItem(index),
    );


  Widget buildInsertButton() =>
      ElevatedButton(
          child: Text('Insert',
          style: TextStyle(
            fontSize: 15.0,
            fontFamily: 'Anton'
          ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed))
                  return Colors.green;
                return null; // Use the component's default.
              },
            ),
          ),
        onPressed: () => addItem(2, Item(title: 'New Item', qty: '1 Kg', urlImage: 'https://images.unsplash.com/photo-1563636619-e9143da7973b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=701&q=80')),
  );

  void addItem(int index, Item item){
    items.insert(index, item);
    key.currentState.insertItem(index);
  }

  void removeItem(int index){
    final item = items.removeAt(index);
    
    key.currentState.removeItem(index, (context, animation) => buildItem(item, index, animation));
  }

}

