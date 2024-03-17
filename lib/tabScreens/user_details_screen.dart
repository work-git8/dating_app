import 'package:dating_app/widget/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {

   //Personal info
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController profileHeadingController = TextEditingController();
  TextEditingController lookingForInaPartnerController = TextEditingController();
  //Appearance
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController bodyTypeController = TextEditingController();
  //LifeStyle
  TextEditingController drinkController = TextEditingController();
  TextEditingController smokeController = TextEditingController();
  TextEditingController maritalStatusController = TextEditingController();
  TextEditingController haveChildrenController = TextEditingController();
  TextEditingController noOfChildrenController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController employmentStatusController = TextEditingController();
  TextEditingController incomeController = TextEditingController();
  TextEditingController livingSituationController = TextEditingController();
  TextEditingController willingToRelocateController = TextEditingController();
  TextEditingController relationshipYouAreLookingForController = TextEditingController();
  //Background-Cultural Values
  TextEditingController nationalityController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController languageSpokenController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController ethnicityController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
        title: Text(
          'User Details',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(
                Icons.logout,
                size: 30,
                color: Colors.white,
              ))
        ],
      ),
        body: Column(
          children:[ Expanded(
            flex: 4,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.all(10)),side: MaterialStateProperty.all(BorderSide(color: Colors.black, width: 3)),backgroundColor: MaterialStateProperty.all(Colors.amberAccent),elevation: MaterialStateProperty.all(20), fixedSize: MaterialStateProperty.all(Size.fromWidth(MediaQuery.of(context).size.width-36))),
                    onPressed: () {
                      Get.defaultDialog(title: "Personal info",
                      titlePadding: EdgeInsets.all(10),
                      titleStyle: TextStyle(fontSize: 25),
                      actions: [ElevatedButton(onPressed: (){}, child: Text("Save")), ElevatedButton(onPressed: (){Get.back();}, child: Text("Cancel"))],
                                  content: Container(
                                    padding: EdgeInsets.all(20),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(children: [
                                        CustomTextFormField(controller: emailController, hintText:"Enter your Email", icon: Icon(Icons.email),),
                                        SizedBox(height: 10,),
                                        CustomTextFormField(controller: ageController, hintText: "Enter your Age", icon: Icon(Icons.numbers),),
                                        SizedBox(height: 10,),
                                        CustomTextFormField(controller: phoneNoController, hintText: "Enter Contact Number", icon: Icon(Icons.phone),),
                                        SizedBox(height: 10,),
                                        CustomTextFormField(controller: cityController, hintText: "Enter your City", icon: Icon(Icons.location_city),),
                                        SizedBox(height: 10,),
                                        CustomTextFormField(controller: countryController, hintText: "Enter your Country", icon: Icon(Icons.location_city),),
                                        SizedBox(height: 10,),
                                        CustomTextFormField(controller: profileHeadingController, hintText: "A line describing you", icon: Icon(Icons.text_fields),),
                                        SizedBox(height: 10,),
                                        CustomTextFormField(controller: lookingForInaPartnerController, hintText: "What are you looking for in a partner", icon: Icon(Icons.face),)
                                      ],),
                                    ),
                                      ),
                      );
                    },
                    child: Text('Personal Info', style: TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  SizedBox(height: 15,),
                  ElevatedButton(
                    style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.all(10)),side: MaterialStateProperty.all(BorderSide(color: Colors.black, width: 3)),backgroundColor: MaterialStateProperty.all(Colors.amberAccent),elevation: MaterialStateProperty.all(20), fixedSize: MaterialStateProperty.all(Size.fromWidth(MediaQuery.of(context).size.width-36))),
                    onPressed: () {
                      Get.defaultDialog(title: "Appearance",
                      titlePadding: EdgeInsets.all(10),
                      titleStyle: TextStyle(fontSize: 25),
                      actions: [ElevatedButton(onPressed: (){}, child: Text("Save")), ElevatedButton(onPressed: (){Get.back();}, child: Text("Cancel"))],
                                  content: Container(
                                    padding: EdgeInsets.all(20),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(children: [
                                        CustomTextFormField(controller: heightController, hintText:"Enter your Height in ft", icon: Icon(Icons.insert_chart),),
                                        SizedBox(height: 10,),
                                        CustomTextFormField(controller: weightController, hintText: "Enter your Weight in kgs", icon: Icon(Icons.table_chart)),
                                        SizedBox(height: 10,),
                                        CustomTextFormField(controller: bodyTypeController, hintText: "Enter your Body Type", icon:Icon(Icons.type_specimen_sharp)),                                          
                                      ],),
                                    ),
                                      ),
                      );                   
                    },
                    child: Text('Appearance', style: TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  SizedBox(height: 15,),
                  ElevatedButton(
                    style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.all(10)),side: MaterialStateProperty.all(BorderSide(color: Colors.black, width: 3)),backgroundColor: MaterialStateProperty.all(Colors.amberAccent),elevation: MaterialStateProperty.all(20), fixedSize: MaterialStateProperty.all(Size.fromWidth(MediaQuery.of(context).size.width-36))),
                    onPressed: () {
                     Get.defaultDialog(title: "LifeStyle",
                      titlePadding: EdgeInsets.all(10),
                      titleStyle: TextStyle(fontSize: 25),
                      actions: [ElevatedButton(onPressed: (){}, child: Text("Save")), ElevatedButton(onPressed: (){Get.back();}, child: Text("Cancel"))],
                                  content: Container(
                                    padding: EdgeInsets.all(20),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(children: [
                                        CustomTextFormField(controller: drinkController, hintText:"About your drinking habit", icon: Icon(Icons.local_drink_outlined),),
                                        SizedBox(height: 10,),
                                        CustomTextFormField(controller: smokeController, hintText: "About your smoking habit", icon: Icon(Icons.smoking_rooms)),
                                        SizedBox(height: 10,),
                                        CustomTextFormField(controller: maritalStatusController, hintText: "Marital Status", icon: Icon(Icons.person_2_outlined)),
                                        SizedBox(height: 10,),
                                        CustomTextFormField(controller: haveChildrenController, hintText: "Do you have children?", icon: Icon(Icons.person_3_rounded)),
                                        SizedBox(height: 10,),
                                        CustomTextFormField(controller: noOfChildrenController, hintText: "Numbber of children", icon: Icon(Icons.person_4_outlined)),
                                        SizedBox(height: 10,),
                                        CustomTextFormField(controller: livingSituationController, hintText: "Living Situation", icon: Icon(CupertinoIcons.person_2_square_stack)),
                                        SizedBox(height: 10,),
                                        CustomTextFormField(controller: willingToRelocateController, hintText: "Are you willing to relocate to another place?", icon: Icon(Icons.person_2)),
                                        SizedBox(height: 10,),
                                        CustomTextFormField(controller: relationshipYouAreLookingForController, hintText: "What relationship are you looking for in a partner?", icon:Icon(Icons.person_add))
                                      ],),
                                    ),
                                  ),
                      );
                    },
                    child: Text('LifeStyle', style: TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  SizedBox(height: 15,),
                  ElevatedButton(
                    style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.all(10)),side: MaterialStateProperty.all(BorderSide(color: Colors.black, width: 3)),backgroundColor: MaterialStateProperty.all(Colors.amberAccent),elevation: MaterialStateProperty.all(20), fixedSize: MaterialStateProperty.all(Size.fromWidth(MediaQuery.of(context).size.width-36))),
                    onPressed: () {
                  Get.defaultDialog(title: "Background-Cultural Values",
                      titlePadding: EdgeInsets.all(10),
                      titleStyle: TextStyle(fontSize: 25),
                      actions: [ElevatedButton(onPressed: (){}, child: Text("Save")), ElevatedButton(onPressed: (){Get.back();}, child: Text("Cancel"))],
                                  content: Container(
                                    padding: EdgeInsets.all(20),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(children: [
                                        CustomTextFormField(controller: nationalityController, hintText:"Nationality", icon: Icon(Icons.flag),),
                                        SizedBox(height: 10,),
                                        CustomTextFormField(controller: educationController, hintText: "Educaton", icon: Icon(Icons.history_edu)),
                                        SizedBox(height: 10,),
                                        CustomTextFormField(controller: languageSpokenController, hintText: "Language Spoken", icon: Icon(CupertinoIcons.person_badge_plus_fill)),
                                        SizedBox(height: 10,),
                                        CustomTextFormField(controller: religionController, hintText: "Religion", icon:Icon(CupertinoIcons.checkmark_seal_fill)),
                                        SizedBox(height: 10,),
                                        CustomTextFormField(controller: ethnicityController, hintText: "Ethnicity", icon:Icon(CupertinoIcons.eye),),
                                        SizedBox(height: 10),
                                        CustomTextFormField(controller: professionController, hintText: "Profession", icon: Icon(Icons.business_center)),
                                        SizedBox(height: 10,),
                                        CustomTextFormField(controller: employmentStatusController, hintText: "Employment Status", icon: Icon(CupertinoIcons.rectangle_stack_person_crop_fill)),
                                        SizedBox(height: 10,),
                                        CustomTextFormField(controller: incomeController, hintText: "Income", icon:Icon(CupertinoIcons.money_dollar_circle)),
                                      ],),
                                    ),
                                      ),
                      );
                    },
                    child: Text('Background-Cultural Values', style: TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  SizedBox(height: 15,)                  
                ],
              ),
            ),
          ),
          Expanded(
                  flex: 5,
                  child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 5,crossAxisSpacing: 5), 
                  itemCount: 6,
                  itemBuilder: (context, index){
                    return Container(decoration: BoxDecoration(color: Colors.amberAccent, border: Border.all(color: Colors.black, width:3,), image: DecorationImage(image:AssetImage("assets/images/p2.jpg"), fit: BoxFit.cover),),);
                  }),
                )
          ]
        ),
    );
  }
}