import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotificationService{
  FirebaseMessaging meaasaging = FirebaseMessaging.instance;

  
  Future whenNotificationReceived(BuildContext context)async{

    //when App is Terminated
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? remoteMessage){
      if(remoteMessage != null){
        openAppAndShowNotificationData(
          remoteMessage.data["userID"],
          remoteMessage.data["senderID"],
          context
        );
      }
    });

    //when App is in Foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage? remoteMessage){
          if(remoteMessage != null){
           openAppAndShowNotificationData(
          remoteMessage.data["userID"],
          remoteMessage.data["senderID"],
          context
        );
      }
    });

    //when App is in Foreground
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? remoteMessage) { 
      if(remoteMessage != null){
           openAppAndShowNotificationData(
          remoteMessage.data["userID"],
          remoteMessage.data["senderID"],
          context
        );
      }
    });
  }

  openAppAndShowNotificationData(receeiverID, senderID, context) async {

    }

}


