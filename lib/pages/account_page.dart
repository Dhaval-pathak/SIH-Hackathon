import 'dart:io';

import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({ Key? key }) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: ElevatedButton(
            child: Text("Log Out"),
            onPressed: (){
              exit(0);
            }
          )
      ),
    );
  }
}