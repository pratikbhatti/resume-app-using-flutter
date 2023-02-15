import 'dart:io';

import 'package:demo11/dataModel.dart';
import 'package:demo11/main.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:csc_picker/csc_picker.dart';

class Resume1 extends StatefulWidget {
  const Resume1({super.key});

  @override
  State<Resume1> createState() => _Resume1State();
}

class _Resume1State extends State<Resume1> {
  TextEditingController txtBirth = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController phone_number = TextEditingController();
  TextEditingController eduction = TextEditingController();
  TextEditingController email =
      TextEditingController(text: "example@gmail.com");
  TextEditingController post_name = TextEditingController();
  String radio_button = "Male";

  String number_select_item = "+91";
  bool hobby = false;
  bool learn = false;
  bool read = false;
  bool coding = false;
  bool sport = false;
  String n1 = "pratik";
  bool watching_movie = false;
  bool playing_games = false;
  var validateKey = GlobalKey<FormState>();

  List number = [
    "+91",
    "+92",
    "+93",
    "+94",
    "+95",
    "+96",
    "+97",
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: back,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Styles.primary,
          appBar: AppBar(
            title: Text("Resume"),
            centerTitle: true,
            backgroundColor: Styles.primary,
            elevation: 0,
          ),
          body: Form(
            key: validateKey,
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      (path == null)
                          ? CircleAvatar(
                              backgroundColor: Styles.primary,
                              radius: 100,
                              backgroundImage: AssetImage(
                                "assets/images/profile.png",
                              ),
                            )
                          : CircleAvatar(
                              radius: 100,
                              // backgroundImage: NetworkImage("$path"),
                              backgroundImage: FileImage(
                                File(
                                  "$path",
                                ),
                              ),
                            ),
                      hsize(),
                      ElevatedButton(
                        onPressed: () {
                          sheetbar();
                        },
                        child: Text("Upload Iamge"),
                      ),
                      hsize(),
                      custom_textformsield(
                          'Name',
                          'Enter Your Name ',
                          Icon(
                            Icons.person,
                            color: Styles.grey,
                          ),
                          "Name",
                          name),
                      hsize(),
                      custom_textformsield(
                          'Surname',
                          'Enter Your Surname ',
                          Icon(
                            Icons.person,
                            color: Styles.grey,
                          ),
                          "Surname",
                          surname),
                      hsize(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: radio("Male"),
                          ),
                          wsize(),
                          Expanded(
                            child: radio("Female"),
                          ),
                          wsize(),
                          Expanded(
                            child: radio("Other"),
                          ),
                        ],
                      ),
                      hsize(),
                      birth_day(),
                      hsize(),
                      phone_number_function(),
                      hsize(),
                      custom_textformsield(
                          'Eduction',
                          'Enter Your Eduction',
                          Icon(
                            Icons.library_books,
                            color: Styles.grey,
                          ),
                          "Eduction",
                          eduction),
                      hsize(),
                      email_valid(),
                      hsize(),
                      custom_textformsield(
                          'Post Name',
                          'Enter Your Apply Post Name',
                          Icon(
                            Icons.add_business_sharp,
                            color: Styles.grey,
                          ),
                          "Post Name",
                          post_name),
                      hsize(),
                      one_list(),
                      Container(
                        child: hobby == false ? null : open_hobbies(),
                      ),
                      hsize(),
                      list_internation(),
                      hsize(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          String data = "";
                          if (read == true) {
                            data = data + 'Reading';
                          }
                          if (learn == true) {
                            data = data + 'Learning';
                          }
                          if (coding == true) {
                            data = data + 'Coding';
                          }
                          if (watching_movie == true) {
                            data = data + 'Watching Movie';
                          }
                          if (playing_games == true) {
                            data = data + 'Playing Games';
                          }
                          if (sport == true) {
                            data = data + 'Sport';
                          }

                          List save = [
                            name.text,
                            surname.text,
                            txtBirth.text,
                            phone_number.text,
                            eduction.text,
                            email.text,
                            post_name.text,
                            radio_button.toString(),
                            data
                          ];
                          // DataModel d2 = DataModel(eduction: eduction.text);
                          DataModel d1 = DataModel(
                            name: save[0],
                            surname: save[1],
                            txtBirth: save[2],
                            phone_number: save[3],
                            eduction: save[4],
                            email: save[5],
                            post_name: save[6],
                            radio_button: save[7],
                            checkbox_data: save[8],
                          );

                          if (validateKey.currentState!.validate()) {
                            dialog(submit: 'submit', data: d1);
                          }
                        },
                        child: Text("Submit"),
                      ),
                      hsize(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          name.clear();
                          txtBirth.clear();
                          surname.clear();
                          phone_number.clear();
                          eduction.clear();
                          email.clear();
                          post_name.clear();
                          // validateKey.currentState!.reset();
                        },
                        child: Text("Reset"),
                      ),
                      hsize(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          dialog(back: 'back');
                        },
                        child: Text("Back"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          drawer: (path == null) ? sidebarNull() : sidebarTrue(),
        ),
      ),
    );
  }

  Future<bool> back() async {
    dialog(back: 'back');
    return await true;
  }

  Widget email_valid() {
    return TextFormField(
      controller: email,
      validator: (value) {
        if (value!.isEmpty) {
          return "PLease Enter Your Email";
        }
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return "Please enter a valid email address";
        } else {
          return null;
        }
      },
      cursorColor: Styles.textcolor,
      style: TextStyle(color: Styles.textcolor),
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(color: Styles.grey),
        hintText: 'Enter Your Email',
        hintStyle: TextStyle(color: Styles.grey),
        prefixIcon: Icon(
          Icons.email,
          color: Styles.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Styles.grey),
          borderRadius: BorderRadius.circular(15.0),
        ),
        border: new OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          borderSide: new BorderSide(color: Styles.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          borderSide: BorderSide(
            width: 1,
            color: Styles.greyshad700,
          ),
        ),
      ),
    );
  }

  void dialog({String? submit, String? back, DataModel? data}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Styles.primary,
          title: Text(
            "Are You Sure You Are Exit",
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
                    if (submit == 'submit')
                      Navigator.pushReplacementNamed(context, 'resumedata',
                          arguments: data);
                    else if (back == 'back') {
                      exit(0);
                      // SystemNavigator.pop();
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
              accountName: Text("Example"),
              accountEmail: Text("example@gmail.com"),
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
                Navigator.pushNamed(context, 'resume');
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text("About"),
              onTap: () {
                Navigator.pushNamed(context, 'about');
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
              accountName: Text("Example"),
              accountEmail: Text("example@gmail.com"),
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
                Navigator.pushNamed(context, 'resume');
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text("About"),
              onTap: () {
                Navigator.pushNamed(context, 'about');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget list_internation() {
    return CSCPicker(
      selectedItemStyle: TextStyle(color: Styles.textcolor, fontSize: 15),
      disabledDropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        color: Styles.greyshad700,
        border: Border.all(color: Styles.grey, width: 1),
      ),
      searchBarRadius: 10.0,
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(13),
        ),
        color: Styles.greyshad700,
        border: Border.all(color: Styles.grey, width: 1),
      ),

      // layout: Layout.vertical,
      // flagState: CountryFlage.D,
      onCountryChanged: (country) {
        // setState(() {
        //   countryValue = country;
        // });
      },
      onStateChanged: (state) {
        // setState(() {
        //   stateValue = state!;
        // });
      },
      onCityChanged: (city) {
        // setState(() {
        //   cityValue = city!;
        // });
      },
      countryDropdownLabel: "Country",

      stateDropdownLabel: "State",
      cityDropdownLabel: "City",
      dropdownDialogRadius: 30,
    );
  }

  Widget open_hobbies() {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: ListView(
        shrinkWrap: true,
        children: [
          CheckboxListTile(
            activeColor: Styles.grey,
            checkColor: Styles.primary,
            title: Text("Reading"),
            tileColor: Styles.grey,
            value: read,
            onChanged: (value) {
              setState(
                () {
                  read = value!;
                },
              );
            },
          ),
          CheckboxListTile(
            activeColor: Styles.grey,
            checkColor: Styles.primary,
            title: Text("Learning"),
            tileColor: Styles.grey,
            value: learn,
            onChanged: (value) {
              setState(
                () {
                  learn = value!;
                },
              );
            },
          ),
          CheckboxListTile(
            activeColor: Styles.grey,
            checkColor: Styles.primary,
            title: Text("Coding"),
            tileColor: Styles.grey,
            value: coding,
            onChanged: (value) {
              setState(
                () {
                  coding = value!;
                },
              );
            },
          ),
          CheckboxListTile(
            activeColor: Styles.grey,
            checkColor: Styles.primary,
            title: Text("Watching Movie"),
            tileColor: Styles.grey,
            value: watching_movie,
            onChanged: (value) {
              setState(
                () {
                  watching_movie = value!;
                },
              );
            },
          ),
          CheckboxListTile(
            activeColor: Styles.grey,
            checkColor: Styles.primary,
            title: Text("Playing Games"),
            tileColor: Styles.grey,
            value: playing_games,
            onChanged: (value) {
              setState(
                () {
                  playing_games = value!;
                },
              );
            },
          ),
          CheckboxListTile(
            activeColor: Styles.grey,
            checkColor: Styles.primary,
            title: Text("Sport"),
            tileColor: Styles.grey,
            value: sport,
            onChanged: (value) {
              setState(
                () {
                  sport = value!;
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget one_list() {
    return ListView(
      shrinkWrap: true,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              hobby = !hobby;
            });
          },
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / 14,
            width: MediaQuery.of(context).size.width / 10,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Styles.greyshad700,
              borderRadius: BorderRadius.all(
                Radius.circular(13),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hobbies",
                    style: TextStyle(color: Styles.textcolor, fontSize: 15),
                  ),
                  Icon(
                    hobby == false
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                    color: Styles.textcolor,
                  ),
                ],
              ),
            ),
          ),
        ),
        // Icon(
        //   Icons.keyboard_arrow_down,
        //   color: Styles.textcolor,
        // ),
      ],
    );
  }

  Widget phone_number_function() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "PLease Enter Your Number";
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.number,
      cursorColor: Styles.textcolor,
      style: TextStyle(
        color: Styles.textcolor,
      ),
      decoration: InputDecoration(
        labelText: 'Phone Number',
        labelStyle: TextStyle(color: Styles.grey),
        hintText: 'Enter Your Phone Number',
        prefixIcon: number_function(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Styles.grey), //<-- SEE HERE

          borderRadius: BorderRadius.circular(15.0),
        ),
        border: new OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          borderSide: new BorderSide(color: Styles.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          borderSide: BorderSide(
            width: 1,
            color: Styles.greyshad700,
          ),
        ),
      ),
    );
  }

  Widget number_function() {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          items: number
              .asMap()
              .entries
              .map(
                (e) => DropdownMenuItem(
                  child: Text(
                    "${number[e.key]}",
                    style: TextStyle(color: Styles.grey),
                  ),
                  value: "${number[e.key]}",
                ),
              )
              .toList(),
          onChanged: (newvalue) {
            setState(
              () {
                number_select_item = newvalue as String;
              },
            );
          },
          dropdownColor: Styles.textcolor,
          iconEnabledColor: Styles.grey,
          value: number_select_item as String,
        ),
      ),
    );
  }

  Widget birth_day() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "PLease Enter Your Number";
        } else {
          return null;
        }
      },
      controller: txtBirth,
      style: TextStyle(color: Styles.textcolor),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Styles.grey),
          borderRadius: BorderRadius.circular(15.0),
        ),
        prefixIcon: Icon(
          Icons.date_range,
          color: Styles.grey,
        ),
        border: new OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          borderSide: new BorderSide(color: Styles.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          borderSide: BorderSide(width: 1, color: Styles.greyshad700),
        ),
        labelText: "Date Of Birth",
        labelStyle: TextStyle(color: Styles.grey),
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );

        if (pickedDate != null) {
          String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
          setState(
            () {
              txtBirth.text = formattedDate;
            },
          );
        } else {
          print("Date is not selected");
        }
      },
    );
  }

  Widget radio(String value) {
    return Container(
      height: MediaQuery.of(context).size.height / 15,
      // width: double.infinity,
      decoration: BoxDecoration(
        // color: Colors.white,
        border: Border.all(color: Styles.grey),
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Row(
        children: [
          Radio(
            fillColor:
                MaterialStateColor.resolveWith((states) => Styles.greyshad700),
            value: "$value",
            groupValue: radio_button,
            onChanged: (value) {
              setState(
                () {
                  radio_button = value! as String;
                  print(radio_button);
                },
              );
            },
          ),
          Text(
            "$value",
            style: TextStyle(color: Styles.grey, fontSize: 15),
          ),
        ],
      ),
    );
  }

  void sheetbar() {
    showModalBottomSheet(
      backgroundColor: Styles.grey,
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.camera),
              title: Text("Camera"),
              onTap: () async {
                ImagePicker pick = ImagePicker();
                XFile? img = await pick.pickImage(source: ImageSource.camera);
                setState(() {
                  path = img!.path;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text("Gallery"),
              onTap: () async {
                ImagePicker pick = ImagePicker();
                XFile? img = await pick.pickImage(source: ImageSource.gallery);
                setState(() {
                  path = img!.path;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.remove_circle_outline),
              title: Text("Remove Photo"),
              onTap: () async {
                setState(() {
                  path = null;
                });
              },
            ),
          ],
        );
      },
    );
  }
}
