import 'package:demo11/constant.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Stack(
              children: [
                Row(
                  children: [
                    Container(
                      height: 500,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 15, 86, 145),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "PROFILE",
                              style: TextStyle(
                                color: Styles.white,
                                fontSize: 20,
                                decoration: TextDecoration.underline,
                                decorationStyle: TextDecorationStyle.double,
                              ),
                            ),
                            hsize(),
                            Text(
                              "Name",
                              style: TextStyle(color: Styles.white),
                            ),
                            Text(
                              "Pratik Bhatti",
                              style: TextStyle(
                                  color: Styles.lightwhite, fontSize: 12),
                            ),
                            hsize(),
                            Text(
                              "Date Of Birth",
                              style: TextStyle(color: Styles.white),
                            ),
                            Text(
                              "9/1/1999",
                              style: TextStyle(
                                  color: Styles.lightwhite, fontSize: 12),
                            ),
                            hsize(),
                            Text(
                              "Phone Number",
                              style: TextStyle(color: Styles.white),
                            ),
                            Text(
                              "5411531351",
                              style: TextStyle(
                                  color: Styles.lightwhite, fontSize: 12),
                            ),
                            hsize(),
                            Text(
                              "Email",
                              style: TextStyle(color: Styles.white),
                            ),
                            Text(
                              "pratik@gmail.com",
                              style: TextStyle(
                                  color: Styles.lightwhite, fontSize: 12),
                            ),
                            hsize(),
                            Text(
                              "Gender",
                              style: TextStyle(color: Styles.white),
                            ),
                            Text(
                              "male",
                              style: TextStyle(
                                  color: Styles.lightwhite, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 12, right: 12, top: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "OBJECTIVE",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.double,
                              color: Color.fromARGB(255, 15, 86, 145),
                            ),
                          ),
                          hsize(),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "To secure a challenging position in a reputable organization to expand learning, knowledge and skills",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          hsize(),
                          Text(
                            "EDUCTION",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.double,
                              color: Color.fromARGB(255, 15, 86, 145),
                            ),
                          ),
                          hsize(),
                          Container(
                            width: 200,
                            // width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Eduction",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          hsize(),
                          Text(
                            "POST NAME",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.double,
                              color: Color.fromARGB(255, 15, 86, 145),
                            ),
                          ),
                          hsize(),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Post Name",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          hsize(),
                          Text(
                            "HOBBIES",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.double,
                              color: Color.fromARGB(255, 15, 86, 145),
                            ),
                          ),
                          hsize(),
                          Container(
                            // width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Hobbies",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Container(
                    // width: MediaQuery.of(context).size.width / 2,
                    // height: MediaQuery.of(context).size.height / 10,
                    decoration: BoxDecoration(
                      color: Styles.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name Surname",
                          style: TextStyle(fontSize: 30),
                        ),
                        Text("Post Name"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
