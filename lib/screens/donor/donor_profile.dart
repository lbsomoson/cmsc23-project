import 'package:flutter/material.dart';
import 'package:project/screens/donor/donor_edit_profile.dart';

class DonorProfileScreen extends StatefulWidget {
  const DonorProfileScreen({Key? key}) : super(key: key);

  @override
  State<DonorProfileScreen> createState() => _DonorProfileScreenState();
}

class _DonorProfileScreenState extends State<DonorProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Color.fromRGBO(62, 218, 134, 1),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: 428,
          height: 926,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 300,
                left: 130,
                child: Text(
                  'Juan Dela Cruz',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(62, 218, 134, 1),
                    fontFamily: 'Inter',
                    fontSize: 20,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
              ),
              Positioned(
                top: 325,
                left: 150,
                child: Text(
                  '@juandelacruz',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),

              Positioned(
                child: Container(
                  width: 428,
                  height: 165,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Rectangle 58.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 100,
                left: 120,
                child: Container(
                  width: 168,
                  height: 168,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(1, 1),
                        blurRadius: 4,
                      )
                    ],
                    border: Border.all(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      width: 5,
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Ellipse 9.png'),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.all(Radius.elliptical(168, 168)),
                  ),
                ),
              ),
              Positioned(
                top: 650,
                left: 130,
                child: Container(
                  width: 382,
                  height: 51,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100),
                              topRight: Radius.circular(100),
                              bottomLeft: Radius.circular(100),
                              bottomRight: Radius.circular(100),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment(1, 0),
                              end: Alignment(0, 1),
                              colors: [
                                Color.fromRGBO(62, 218, 134, 1),
                                Color.fromRGBO(142, 229, 0, 1)
                              ],
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          child: Center(
                                child: TextButton(
                                  onPressed:(){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context)=>DonorEditProfile())
                                    );
                                  },
                                child: Text ('Edit Profile',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1,
                                ),
                              ),
                                ),
                            
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 450,
                left: 36,
                child: Text(
                  'Address',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(121, 121, 121, 1),
                    fontFamily: 'Inter',
                    fontSize: 15,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
              Positioned(
                top: 370,
                left: 36,
                child: Text(
                  'Name',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(121, 121, 121, 1),
                    fontFamily: 'Inter',
                    fontSize: 15,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
              Positioned(
                top: 530,
                left: 36,
                child: Text(
                  'Contact Number',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(121, 121, 121, 1),
                    fontFamily: 'Inter',
                    fontSize: 15,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
              Positioned(
                top: 874,
                left: 199,
                child: Container(
                  width: 30,
                  height: 30,
                ),
              ),
              Positioned(
                top: 400,
                left: 36,
                child: Text(
                  'Juan Dela Cruz',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: 24,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
              Positioned(
                top: 480,
                left: 36,
                child: Text(
                  'Los Baños, Laguna',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: 24,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
              Positioned(
                top: 560,
                left: 36,
                child: Text(
                  '09954695022',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: 24,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
