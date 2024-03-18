import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../global.dart';

class ViewSentViewReceivedScreen extends StatefulWidget {
  const ViewSentViewReceivedScreen({super.key});

  @override
  State<ViewSentViewReceivedScreen> createState() =>
      _ViewSentViewReceivedScreenState();
}

class _ViewSentViewReceivedScreenState
    extends State<ViewSentViewReceivedScreen> {

      bool isViewSentClicked = true;
      List<String> viewSentList = [];
      List<String> viewReceivedList = [];
      List viewsList = [];

      getViewListKeys() async {
        if(isViewSentClicked){
          var viewSentDocument = await FirebaseFirestore.instance.collection("users").doc(currentUserID).collection("viewSent").get();
          for(int i=0;i<viewSentDocument.docs.length;i++){
            viewSentList.add(viewSentDocument.docs[i].id);
          }
              getKeysDataFromUsersCollection(viewSentList);
        }else{
          var viewReceivedDocument = await FirebaseFirestore.instance.collection("users").doc(currentUserID).collection("viewReceived").get();
          for(int i=0;i<viewReceivedDocument.docs.length;i++){
            viewReceivedList.add(viewReceivedDocument.docs[i].id);
          }
              getKeysDataFromUsersCollection(viewReceivedList);
        } 
      }

      getKeysDataFromUsersCollection(List<String> keysList) async {
        var allUserDocument = await FirebaseFirestore.instance.collection("users").get();

        for(int i=0; i<allUserDocument.docs.length;i++){
          for(int k=0;k<keysList.length;k++) {
            if (((allUserDocument.docs[i].data() as dynamic)["uid"]) == keysList[k]) {
              viewsList.add(allUserDocument.docs[i].data());
            }
          }
      }
        setState(() {
          viewsList;
        });
      }

      @override
      void initState() {
        super.initState();
        getViewListKeys();
        }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: (){
              viewSentList.clear();
              viewSentList = [];
              viewReceivedList.clear();
              viewReceivedList = [];
              viewsList.clear();
              viewsList = [];

              setState(() {
                isViewSentClicked = true;
              });
              getViewListKeys();
            }, 
            child: Text("My Views",
              style: TextStyle(
                color: isViewSentClicked ? Colors.white:Colors.grey,
                fontWeight: isViewSentClicked ? FontWeight.bold:FontWeight.normal,
                fontSize: 16
              ),
             )
            ),
            Text("        |    ", style: TextStyle(color: Colors.amber),),
              TextButton(
            onPressed: (){
               viewSentList.clear();
              viewSentList = [];
              viewReceivedList.clear();
              viewReceivedList = [];
              viewsList.clear();
              viewsList = [];

              setState(() {
                isViewSentClicked = false;
              });
              getViewListKeys();
            }, 
            child: Text("I am their View",
              style: TextStyle(
                color: isViewSentClicked ? Colors.grey:Colors.white,
                fontWeight: isViewSentClicked ? FontWeight.normal:FontWeight.bold,
                fontSize: 16
              ),
             )
            ),
        ],
      )),
      body: viewsList.isEmpty ? Center(child: Icon(Icons.person_off_sharp, color: Colors.black, size: 60,),)
      : GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(8),
        children: 
          List.generate(viewsList.length, (index) {
            return GridTile(
              child: Padding(
                padding: EdgeInsets.all(2),
                child: Card(
                  color: Colors.blue[200],
                  child: GestureDetector(
                    onTap: (){

                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(viewsList[index]["imageProfile"],), fit: BoxFit.cover),
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          Text(viewsList[index]["name"].toString()+" ◉ "+viewsList[index]["age"].toString(),
                          maxLines: 2,
                            style:  TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                          ),
                          SizedBox(height: 4,),
                          Row(
                            children: [
                              Icon(Icons.location_pin),
                              Expanded(
                              child: Text(viewsList[index]["city"].toString()+", "+viewsList[index]["country"].toString(),
                              maxLines: 2,
                                style:  TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.normal, overflow: TextOverflow.ellipsis),
                              ),
                            ),]
                          ),
                        ],
                      ),),
                    ),
                  ),
                ),
                ) 
              );
          }),
      )
    );
  }
}
