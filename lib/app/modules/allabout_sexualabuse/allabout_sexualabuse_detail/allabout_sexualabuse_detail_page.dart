import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../allabout_sexualabuse_list/allabout_sexualabuse_list.dart';

class DetailScreen extends StatelessWidget {
  final CourseList list;

  const DetailScreen({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 100,
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(20),
                  child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.only(top: 20, bottom: 20, right: 30, left: 30),
                      decoration: const BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)
                          )
                      ),
                      child: Center(child: Text(
                          list.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          )
                      ))
                  )
              ),
              pinned: true,
              backgroundColor: const Color(0xffEC9F87),
              expandedHeight: 600,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  list.imageCover,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      child: Text(
                        list.material,
                        style: const TextStyle(
                          height: 1.7,
                          fontSize: 15,
                          letterSpacing: 0.0,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    )
                  ],
                )
            ),
          ]
      ),
      bottomNavigationBar: Container(
          height: 70,
          padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
          decoration: const BoxDecoration(
              color: Color(0xffEC9F87),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15)
              )
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFFE484), //background
                    foregroundColor: const Color(0xffFFFFFF),
                  ),
                  child: Text(list.buttontext),
                  onPressed: () {
                    var url = list.ytlink;
                    launchUrl (
                      Uri.parse(url),
                    );
                  },
                ),
              ]
          )
      ),
    );

  }
}