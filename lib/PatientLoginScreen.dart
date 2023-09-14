import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PatientLoginScreen extends StatefulWidget {
  const PatientLoginScreen({super.key});

  @override
  State<PatientLoginScreen> createState() => _PatientLoginScreenState();
}

class _PatientLoginScreenState extends State<PatientLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Stack(
          children: <Widget>[
            ClipPath(
                clipper: _MyCustomClipper(context),
                child: Container(
                  alignment: Alignment.center,

                )),
            Positioned(
              left: 30,
              right: 30,
              top: MediaQuery.of(context).size.height * 0.15,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Card(
                    child: Container(
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      child: Column(
                        children: <Widget>[

                          Container(
                            margin: EdgeInsets.only(bottom: 24, top: 0),
                            child: Text(
                              "USER LOGIN",

                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            child: Column(
                              children: <Widget>[

                                TextFormField(


                                  decoration: InputDecoration(
                                    hintText: "Email",

                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 16),
                                  child: TextFormField(

                                    decoration: InputDecoration(
                                      hintText: "Password",
                                    )
                                  ),
                                ),


                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder: (context) => SignUpScreenUser())
                      // );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Center(
                        child: RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: "Don't have an Account? ",

                            ),
                            TextSpan(
                                text: " SignUp",

                            ),
                          ]),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 24,
              left: 12,
              child: BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },

              ),
            )
          ],
        ));
  }
}
class _MyCustomClipper extends CustomClipper<Path> {
  final BuildContext _context;

  _MyCustomClipper(this._context);

  @override
  Path getClip(Size size) {
    final path = Path();
    Size size = MediaQuery.of(_context).size;
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(0, size.height * 0.6);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}