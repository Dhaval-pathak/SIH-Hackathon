
import 'package:badges/badges.dart';
import 'package:untitled/data/json.dart';
import 'package:untitled/pages/doctor_profile_page.dart';
import 'package:untitled/theme/colors.dart';
import 'package:untitled/widgets/avatar_image.dart';
import 'package:untitled/widgets/doctor_box.dart';
import 'package:untitled/widgets/textbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({ Key? key }) : super(key: key);

  @override
  _DoctorPageState createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Hospitals", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10)
,            child: Icon(
              Icons.info,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: getBody(),
    );
  }

  getBody(){
    return 
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: CustomTextBox()),
                    SizedBox(width: 5,),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Sort By'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    title: Text('Location'),
                                    onTap: () {
                                      // Add logic for sorting by location
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    title: Text('Hospital Speciality'),
                                    onTap: () {
                                      // Add logic for sorting by hospital speciality
                                      Navigator.pop(context);
                                    },
                                  ),
                                  // Add more sorting options as needed
                                ],
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.filter_list_rounded),
                    )

                  ],
                ),
                SizedBox(height: 20,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(chatsData.length, (index) => 
                     Padding(
                       padding: const EdgeInsets.only(right: 10),
                       // child:
                       // Badge(
                       //    badgeColor: Colors.green,
                       //    borderSide: BorderSide(color: Colors.white),
                       //    position: BadgePosition.topEnd(top: -3, end: 0),
                       //    badgeContent: Text(''),
                       //    child: AvatarImage(chatsData[index]["image"].toString())
                       //  ),
                     ) 
                    )
                  ),
                ),
                SizedBox(height: 20,),
                getDoctorList()
              ]
          )
        )
      );
  }

  getDoctorList(){
    return 
      new StaggeredGridView.countBuilder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          itemCount: doctors.length,
          itemBuilder: (BuildContext context, int index) => 
            DoctorBox(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> DoctorProfilePage()));
              },
              index: index, doctor: doctors[index]
            ),
          staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 3 : 2),
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        );
  }

}