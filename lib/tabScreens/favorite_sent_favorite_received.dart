import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../global.dart';

class FavoriteSentFavoriteReceivedScreen extends StatefulWidget {
  const FavoriteSentFavoriteReceivedScreen({super.key});

  @override
  State<FavoriteSentFavoriteReceivedScreen> createState() =>
      _FavoriteSentFavoriteReceivedScreenState();
}

class _FavoriteSentFavoriteReceivedScreenState
    extends State<FavoriteSentFavoriteReceivedScreen> {

      bool isFavoriteSentClicked = true;
      List<String> favoriteSentList = [];
      List<String> favoriteReceivedList = [];
      List favoritesList = [];

      getFavoriteListKeys() async {
        if(isFavoriteSentClicked){
          var favoriteSentDocument = await FirebaseFirestore.instance.collection("users").doc(currentUserID).collection("favoriteSent").get();
          for(int i=0;i<favoriteSentDocument.docs.length;i++){
            favoriteSentList.add(favoriteSentDocument.docs[i].id);
          }
              getKeysDataFromUsersCollection(favoriteSentList);
        }else{
          var favoriteReceivedDocument = await FirebaseFirestore.instance.collection("users").doc(currentUserID).collection("favoriteReceived").get();
          for(int i=0;i<favoriteReceivedDocument.docs.length;i++){
            favoriteReceivedList.add(favoriteReceivedDocument.docs[i].id);
          }
              getKeysDataFromUsersCollection(favoriteReceivedList);
        } 
      }

      getKeysDataFromUsersCollection(List<String> keysList) async {
        var allUserDocument = await FirebaseFirestore.instance.collection("users").get();

        for(int i=0; i<allUserDocument.docs.length;i++){
          for(int k=0;k<keysList.length;k++) {
            if (((allUserDocument.docs[i].data() as dynamic)["uid"]) == keysList[k]) {
              favoritesList.add(allUserDocument.docs[i].data());
            }
          }
      }
        setState(() {
          favoritesList;
        });
      }

      @override
      void initState() {
        super.initState();
        getFavoriteListKeys();
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
              favoriteSentList.clear();
              favoriteSentList = [];
              favoriteReceivedList.clear();
              favoriteReceivedList = [];
              favoritesList.clear();
              favoritesList = [];

              setState(() {
                isFavoriteSentClicked = true;
              });
              getFavoriteListKeys();
            }, 
            child: Text("My Favorites",
              style: TextStyle(
                color: isFavoriteSentClicked ? Colors.white:Colors.grey,
                fontWeight: isFavoriteSentClicked ? FontWeight.bold:FontWeight.normal,
                fontSize: 16
              ),
             )
            ),
            Text("        |    ", style: TextStyle(color: Colors.amber),),
              TextButton(
            onPressed: (){
               favoriteSentList.clear();
              favoriteSentList = [];
              favoriteReceivedList.clear();
              favoriteReceivedList = [];
              favoritesList.clear();
              favoritesList = [];

              setState(() {
                isFavoriteSentClicked = false;
              });
              getFavoriteListKeys();
            }, 
            child: Text("I am their Favorite",
              style: TextStyle(
                color: isFavoriteSentClicked ? Colors.grey:Colors.white,
                fontWeight: isFavoriteSentClicked ? FontWeight.normal:FontWeight.bold,
                fontSize: 16
              ),
             )
            ),
        ],
      )),
      body: favoritesList.isEmpty ? Center(child: Icon(Icons.person_off_sharp, color: Colors.black, size: 60,),)
      : GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(8),
        children: 
          List.generate(favoritesList.length, (index) {
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
                        image: NetworkImage(favoritesList[index]["imageProfile"],), fit: BoxFit.cover),
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          Text(favoritesList[index]["name"].toString()+" ◉ "+favoritesList[index]["age"].toString(),
                          maxLines: 2,
                            style:  TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                          ),
                          SizedBox(height: 4,),
                          Row(
                            children: [
                              Icon(Icons.location_pin),
                              Expanded(
                              child: Text(favoritesList[index]["city"].toString()+", "+favoritesList[index]["country"].toString(),
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
