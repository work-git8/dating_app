import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../global.dart';

class LikeSentLikeReceivedScreen extends StatefulWidget {
  const LikeSentLikeReceivedScreen({super.key});

  @override
  State<LikeSentLikeReceivedScreen> createState() =>
      _LikeSentLikeReceivedScreenState();
}

class _LikeSentLikeReceivedScreenState
    extends State<LikeSentLikeReceivedScreen> {

      bool isLikeSentClicked = true;
      List<String> likeSentList = [];
      List<String> likeReceivedList = [];
      List likesList = [];

      getLikeListKeys() async {
        if(isLikeSentClicked){
          var likeSentDocument = await FirebaseFirestore.instance.collection("users").doc(currentUserID).collection("likeSent").get();
          for(int i=0;i<likeSentDocument.docs.length;i++){
            likeSentList.add(likeSentDocument.docs[i].id);
          }
              getKeysDataFromUsersCollection(likeSentList);
        }else{
          var likeReceivedDocument = await FirebaseFirestore.instance.collection("users").doc(currentUserID).collection("likeReceived").get();
          for(int i=0;i<likeReceivedDocument.docs.length;i++){
            likeReceivedList.add(likeReceivedDocument.docs[i].id);
          }
              getKeysDataFromUsersCollection(likeReceivedList);
        } 
      }

      getKeysDataFromUsersCollection(List<String> keysList) async {
        var allUserDocument = await FirebaseFirestore.instance.collection("users").get();

        for(int i=0; i<allUserDocument.docs.length;i++){
          for(int k=0;k<keysList.length;k++) {
            if (((allUserDocument.docs[i].data() as dynamic)["uid"]) == keysList[k]) {
              likesList.add(allUserDocument.docs[i].data());
            }
          }
      }
        setState(() {
          likesList;
        });
      }

      @override
      void initState() {
        super.initState();
        getLikeListKeys();
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
              likeSentList.clear();
              likeSentList = [];
              likeReceivedList.clear();
              likeReceivedList = [];
              likesList.clear();
              likesList = [];

              setState(() {
                isLikeSentClicked = true;
              });
              getLikeListKeys();
            }, 
            child: Text("My Likes",
              style: TextStyle(
                color: isLikeSentClicked ? Colors.white:Colors.grey,
                fontWeight: isLikeSentClicked ? FontWeight.bold:FontWeight.normal,
                fontSize: 16
              ),
             )
            ),
            Text("        |    ", style: TextStyle(color: Colors.amber),),
              TextButton(
            onPressed: (){
               likeSentList.clear();
              likeSentList = [];
              likeReceivedList.clear();
              likeReceivedList = [];
              likesList.clear();
              likesList = [];

              setState(() {
                isLikeSentClicked = false;
              });
              getLikeListKeys();
            }, 
            child: Text("I am their Like",
              style: TextStyle(
                color: isLikeSentClicked ? Colors.grey:Colors.white,
                fontWeight: isLikeSentClicked ? FontWeight.normal:FontWeight.bold,
                fontSize: 16
              ),
             )
            ),
        ],
      )),
      body: likesList.isEmpty ? Center(child: Icon(Icons.person_off_sharp, color: Colors.black, size: 60,),)
      : GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(8),
        children: 
          List.generate(likesList.length, (index) {
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
                        image: NetworkImage(likesList[index]["imageProfile"],), fit: BoxFit.cover),
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          Text(likesList[index]["name"].toString()+" ◉ "+likesList[index]["age"].toString(),
                          maxLines: 2,
                            style:  TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                          ),
                          SizedBox(height: 4,),
                          Row(
                            children: [
                              Icon(Icons.location_pin),
                              Expanded(
                              child: Text(likesList[index]["city"].toString()+", "+likesList[index]["country"].toString(),
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
