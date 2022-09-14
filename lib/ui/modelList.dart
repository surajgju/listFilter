import 'package:flutter/material.dart';
import 'package:untitled/models/objectModel.dart';

class ModelList extends StatefulWidget {
  const ModelList({Key? key}) : super(key: key);

  @override
  State<ModelList> createState() => _MyListState();
}

class _MyListState extends State<ModelList> {
  ObjectModel objectModel = ObjectModel();
  List ls1 = [{"title": "India", "iconUrl":"http://www.geonames.org/flags/x/in.gif"},
    {"title":"USA", "iconUrl":"http://www.geonames.org/flags/x/us.gif"}
    ,
    {"title":"USA", "iconUrl":"http://www.geonames.org/flags/x/af.gif"},
    {"title":"Japan", "iconUrl":"http://www.geonames.org/flags/x/ag.gif"},
    {"title":"Australia", "iconUrl":"http://www.geonames.org/flags/x/ca.gif"},
    {"title":"Europe", "iconUrl":"http://www.geonames.org/flags/x/cn.gif"},
    {"title":"Russia", "iconUrl":"http://www.geonames.org/flags/x/in.gif"},
    {"title":"Algeria", "iconUrl":"http://www.geonames.org/flags/x/in.gif"},
    {"title":"Bahrain", "iconUrl":"http://www.geonames.org/flags/x/in.gif"},
    {"title":"Dominica", "iconUrl":"http://www.geonames.org/flags/x/ad.gif"}
  ];
  List<ObjectModel> datalist1 =[];
  List<String> list1 =  ["India", "USA", "Japan","Australia", "Europe","Russia", "Algeria	", "Bahrain","Dominica", "Italy"];
  List<ObjectModel> list2 =  [];
  bool searchEnabe = false;
  final searchTextController = TextEditingController();


  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
initState(){
  super.initState();
   ls1.forEach((e) { datalist1.add(ObjectModel.fromJson(e));});

}
  onsearchInput() {
    print(datalist1.where((i)=>i.title!.toLowerCase().contains("${searchTextController.text.toLowerCase()}")));
    if (searchTextController.text.length >= 1){
      List<ObjectModel> tempList = datalist1.where((i)=>i.title!.toLowerCase().contains("${searchTextController.text.toLowerCase()}")).toList();
      setState((){
        list2= tempList;
      });}

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              "Model List Screen",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.w800),
            ),

            actions: [
              AnimatedContainer(
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.fastOutSlowIn,
                  width: searchEnabe == true
                      ? screenWidth(context) * 0.4
                      : 60,
                  //width: screenWidth(context) * 0.23,
                  // height: screenHeight(context) * 0.002,
                  margin:
                  EdgeInsets.only(right: 16, top: 10, bottom: 5),
                  padding: EdgeInsets.only(
                      right: 10, left: 12, top: 1, bottom: 0),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    border: Border.all(color: Colors.white, width: 0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(()=>{  searchEnabe =
                            !searchEnabe});


                          },
                          child: Icon(
                            Icons.search_sharp,
                            color: Colors.white,
                            size: 20,
                          )),
                      searchEnabe == true
                          ? Flexible(
                          child: Container(
                              margin: EdgeInsets.only(
                                  bottom: 8, left: 5, right: 10),
                              child: TextField(
                                  autocorrect: false,
                                  enableSuggestions: false,
                                  style: TextStyle(
                                      decoration:
                                      TextDecoration.none,
                                      color: Colors.white),
                                  decoration: InputDecoration(
                                    enabledBorder:
                                    UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                            Colors.white)),
                                    focusedBorder: InputBorder
                                        .none, //     UnderlineInputBorder(
                                    //         borderSide: BorderSide(
                                    //             color:
                                    //                 Colors.white)),
                                    contentPadding: EdgeInsets.only(
                                        bottom: 12, left: 5),
                                    hintText: "Search",
                                    labelStyle: TextStyle(
                                        decoration:
                                        TextDecoration.none),

                                    hintStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13),
                                    counterText: "",
                                    // errorText: !controller.phoneValid ==
                                    //         true
                                    //     ? "Please enter valid phone no"
                                    //     : null
                                    //labelText: 'Full Name',
                                  ),
                                  //  textInputAction: TextInputAction.next,
                                  onChanged: (e) =>
                                      onsearchInput()
                                  // {
                                  //   if (e.length == 20)
                                  //     FocusManager
                                  //         .instance.primaryFocus
                                  //         ?.unfocus();
                                  // }
                                  ,
                                  cursorColor: Colors.white,
                                  // keyboardType: TextInputType.text,
                                  controller: searchTextController)))
                          : Container(),
                    ],
                  ))]),
        body: list2.length>0 &&searchTextController != null && searchTextController.text.isNotEmpty ? allItems(list2):allItems(datalist1)

    );
  }
  
  Widget allItems(List<ObjectModel> list) => Column(
    children: [
      Expanded(child:  ListView.builder(
          itemCount: list.length,
          itemBuilder: (context,index)=>
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                  decoration: BoxDecoration(
                  //    color: Colors.black12,
                      border: Border.all(color: Colors.black12, width: 1),
                     // borderRadius: BorderRadius.circular(10)
                  ),
                  child:ListTile(
                    leading: Image.network(list[index].iconUrl!,
                      width: 80,
                    fit: BoxFit.cover,
                    ),
                      title:Text(list[index].title!)

                    ))))
    ],
  );
}
