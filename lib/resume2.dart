import 'dart:io';

import 'package:demo11/constant.dart';
import 'package:demo11/dataModel.dart';
import 'package:demo11/main.dart';
import 'package:demo11/pdfdownload.dart';
import 'package:flutter/material.dart';

class ResumeWithFullData extends StatefulWidget {
  const ResumeWithFullData({super.key});

  @override
  State<ResumeWithFullData> createState() => _ResumeWithFullDataState();
}

class _ResumeWithFullDataState extends State<ResumeWithFullData> {
  @override
  Widget build(BuildContext context) {
    DataModel data = ModalRoute.of(context)!.settings.arguments as DataModel;
    return WillPopScope(
      onWillPop: back,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Styles.primary,
          appBar: AppBar(
            title: Text("Demo Your Resume"),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Styles.primary,
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Image.asset("assets/images/demo.jpeg"),
                hsize(),
                ElevatedButton(
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: const Text(
                          '/storage/emulated/0/Android/data/com.example.demo11/files/resume.pdf'),
                      action: SnackBarAction(
                        label: 'ok',
                        onPressed: () {
                          dialog(info: "Exit App");
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    pdfCreate(data);
                  },
                  child: Text("Download Resume"),
                )
              ],
            ),
          ),
          drawer: (path == null) ? sidebarNull() : sidebarTrue(),
        ),
      ),
    );
  }

  Future<bool> back() async {
    dialog(info: "Exit App", exit_code: "exit_code");
    return await true;
  }

  void dialog(
      {String? home, String? about, required String? info, String? exit_code}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Styles.primary,
          title: Text(
            '$info',
            style: TextStyle(color: Colors.white),
          ),
          content: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / 14.8,
            width: MediaQuery.of(context).size.width / 14.8,
            decoration: BoxDecoration(
              color: Styles.primary,
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Styles.primary,
                    side: BorderSide(color: Styles.grey, width: 1),
                  ),
                  onPressed: () {
                    if (home == 'home') {
                      Navigator.pushReplacementNamed(context, 'resume');
                    } else if (about == 'about') {
                      Navigator.pushReplacementNamed(context, 'about');
                    } else if (exit_code == 'exit_code') {
                      exit(0);
                    }
                  },
                  child: Text("Yes"),
                ),
                wsize(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Styles.primary,
                    side: BorderSide(color: Styles.grey, width: 1),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("No"),
                ),
                wsize(),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10.0),
                //     ),
                //     backgroundColor: Styles.primary,
                //     side: BorderSide(color: Styles.grey, width: 1),
                //   ),
                //   onPressed: () {
                //     Navigator.pushNamed(context, '/');
                //   },
                //   child: Text("Go Home"),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget sidebarTrue() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Drawer(
        backgroundColor: Styles.grey,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Styles.greyshad700,
              ),
              accountName: Text("Abhishek Mishra"),
              accountEmail: Text("abhishekm977@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Styles.primary,
                backgroundImage: FileImage(
                  File(
                    "$path",
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                dialog(home: 'home', info: "Are You Jump Home Scren ?");
                // Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text("About"),
              onTap: () {
                dialog(about: 'about', info: "Are You Jump About Scren ?");
                // Navigator.pushNamed(context, 'about');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget sidebarNull() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Drawer(
        backgroundColor: Styles.grey,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Styles.greyshad700,
              ),
              accountName: Text("Abhishek Mishra"),
              accountEmail: Text("abhishekm977@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Styles.primary,
                backgroundImage: AssetImage(
                  "assets/images/profile.png",
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                dialog(home: 'home', info: "Are You Jump Home Scren ?");
                // Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text("About"),
              onTap: () {
                dialog(about: 'about', info: "Are You Jump About Scren ?");
                // Navigator.pushNamed(context, 'about');
              },
            ),
          ],
        ),
      ),
    );
  }
}
