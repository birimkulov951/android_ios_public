import 'package:android_ios/model/board_item_object.dart';
import 'package:android_ios/model/board_list_object.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'board_item.dart';
import 'board_list.dart';
import 'boardview.dart';
import 'boardview_controller.dart';

// stateless or statefull?
class BoardViewExample extends StatelessWidget {

  final List<BoardListObject> listData;

  BoardViewExample({Key key, this.listData}) : super(key: key);

  //@override
  //_BoardViewExample createState() => _BoardViewExample();

  //Can be used to animate to different sections of the BoardView
  final BoardViewController boardViewController = new BoardViewController();


  @override
  Widget build(BuildContext context) {
    List<BoardList> _lists = List<BoardList>();

    for (int i = 0; i < listData.length; i++) {
      _lists.add(_createBoardList(listData[i]));
    }
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: BoardView(
        lists: _lists,
        boardViewController: boardViewController,
      ),
    );
  }

  Widget buildBoardItem(BoardItemObject itemObject) {
    return BoardItem(
        onStartDragItem:
            (int listIndex, int itemIndex, BoardItemState state) {},
        onDropItem: (int listIndex, int itemIndex, int oldListIndex,
            int oldItemIndex, BoardItemState state) {
          //Used to update our local item data
          var item = listData[oldListIndex].items[oldItemIndex];

          listData[oldListIndex].items.removeAt(oldItemIndex);

          listData[listIndex].items.insert(itemIndex, item);
        },
        onTapItem:
            (int listIndex, int itemIndex, BoardItemState state) async {},
        item: Container(
          margin: EdgeInsets.fromLTRB(8, 0, 8, 8),

          child: Card(
            elevation: 1,

            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      itemObject.id,
                      style: TextStyle(
                          height: 1.0,
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      itemObject.name,
                      style: TextStyle(
                          height: 1.5,
                          color: Color(0xff2F334B),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      itemObject.phone,
                      style: TextStyle(
                          height: 1.5,
                          color: Color(0xff2F334B),
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      itemObject.course,
                      style: TextStyle(
                          height: 1.5,
                          color: Color(0xff2F334B),
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      itemObject.city,
                      style: TextStyle(
                          height: 1.5,
                          color: Color(0xff2F334B),
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                )),
          ),
        ));
  }

  Widget _createBoardList(BoardListObject list) {
    List<BoardItem> items = new List();
    for (int i = 0; i < list.items.length; i++) {
      items.insert(i, buildBoardItem(list.items[i]));
    }

    return BoardList(
      onStartDragList: (int listIndex) {},
      onTapList: (int listIndex) async {},
      onDropList: (int listIndex, int oldListIndex) {
        //Update our local list data
        var list = listData[oldListIndex];
        listData.removeAt(oldListIndex);
        listData.insert(listIndex, list);
      },
      headerBackgroundColor: Colors.transparent,
      backgroundColor: Color(0xffECEDFC),
      header: [
        Expanded(
            child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  list.title,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff2F334B)),
                ))),
        Container(
          padding: EdgeInsets.all(10),
          child: RaisedButton(
            color: Colors.deepPurple,
            child: Text(
              'Add',
              style: TextStyle(color: Colors.lightGreenAccent, fontFamily: 'Golos_Regular', fontSize: 14, fontWeight: FontWeight.w600
              ),),
            onPressed: () {
              var listItem = BoardItemObject(id: 'ID 044', name: 'Test',phone: '0 700 70 70 70', course: 'PHP', city: 'Bishkek');
              list.items.insert(items.length,listItem);
              // Pushing a named route
              // Navigator.of(context).pushNamed('/add fragment'
              //     //arguments: 'Hello there from the first page!',
              //     );
            },
          ),
        )],
      items: items,
    );
  }

}
