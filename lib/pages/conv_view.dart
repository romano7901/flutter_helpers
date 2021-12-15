import 'package:flutter/material.dart';
import 'package:verstka/model/messenger.dart';



class ConvView extends StatefulWidget {

  @override
  _ConvViewState createState() => _ConvViewState();
}

class _ConvViewState extends State<ConvView> {

  List<ConversationList> messages = [
    ConversationList('Romano', 'dskj s glkjs  привет привет прив лв', true),
    ConversationList('Romano', 'dskj s glkjs  привет привет прив лв', false),
    ConversationList('Romano', 'dskj sd fsgfd gdfsg  glkjs  привет привет прив лв', true),
    ConversationList('Romano', 'dskj s glkjs  приветsd  sdf привет прив лв', false),
    ConversationList('Romano', 'dskj s glkjs  привет привет sdfg sfdg  прив лв', true),
    ConversationList('Romano', 'dskj s glkjs Не надо рвать на себе рубаху, ведь еще не веечер.  привет пs dfg sривет прив лв', false),
    ConversationList('Romano', 'dskj s glkjs  привет привет прив лв', false),
    ConversationList('Romano', 'dskj s glkjs  привет привет прив лв', false),
    ConversationList('Romano', 'dskj sd fsgfd gdfsg  glkjs  привет привет прив лв', true),
    ConversationList('Romano', 'dskj s glkjs  приветsd  sdf привет прив лв', false),
    ConversationList('Romano', 'dskj s glkjs  привет привет sdfg sfdg  прив лв', false),
    ConversationList('Romano', 'dskj s glkjs  привет пs dfg sривет прив лв', false),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(' Разговор с Пися Камущкин'),),

      body: Stack(

      children: <Widget>[
        ListView.builder(
          itemCount: messages.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 10,bottom: 10),

          itemBuilder: (context, index){
            return Container(
              padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
              child: Align(
                alignment: (messages[index].isMy?Alignment.topLeft:Alignment.topRight),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: (messages[index].isMy?Colors.blueAccent.shade200:Colors.green[200]),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Text(messages[index].text, style: TextStyle(fontSize: 15),),
                ),
              ),
            );
          },
        ),

        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            color: Colors.black,
            padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
            height: 50,
            width: double.infinity,
             child: Row(
              children: <Widget>[
                SizedBox(width: 15,),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Гвоздани ка",
                        hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 15,),
                FloatingActionButton(
                  onPressed: (){},
                  child: Icon(Icons.send,color: Colors.white,size: 18,),
                  backgroundColor: Colors.blue,
                  elevation: 0,
                ),
              ],

            ),
          ),
        ),
      ],
    ));
  }
}
