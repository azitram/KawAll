import 'package:flutter/material.dart';
import '../supportsystem_detail/supportsystem_detail_page.dart';
import '../supportsystem_list/supportsystem_list.dart';

class SupportSystemMenu extends StatefulWidget {
  const SupportSystemMenu({Key? key}) : super(key: key);

  @override
  _SupportSystemMenuState createState() => _SupportSystemMenuState();
}

class _SupportSystemMenuState extends State<SupportSystemMenu> {
  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/background_supportsystem_menu.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text('Support System Course'),
            backgroundColor: const Color(0xffA14D4D),
            elevation: 22,
            shadowColor: const Color(0xffAFC5A5),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)
                )
            ),
          ),
          body: ListView.separated(
              padding: const EdgeInsets.all(30.0),
              itemCount: supportSystemCourseList.length,
              itemBuilder: (context, index) {
                final CourseList list = supportSystemCourseList[index];
                return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return SupportSystemDetail(list: list,);
                      }));
                    },
                    child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                              child: Image.asset(
                                list.imageList,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    list.title,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                );
              },
              separatorBuilder: (BuildContext context, int index){
                return const Divider(
                  color: Colors.transparent,
                );
              }
          ),
        )
      ],
    );
  }
}