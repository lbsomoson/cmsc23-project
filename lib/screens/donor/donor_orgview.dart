import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DonorOrgView extends StatefulWidget {
  const DonorOrgView({super.key});

  @override
  State<DonorOrgView> createState() => _DonorOrgViewState();
}

class _DonorOrgViewState extends State<DonorOrgView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 428,
      height: 972,
      decoration: BoxDecoration(
          color : Color.fromRGBO(255, 255, 255, 1),
  ),
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 428,
        height: 224,
        decoration: BoxDecoration(
          image : DecorationImage(
          image: AssetImage('assets/images/Rectangle51.png'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),Positioned(
        top: 241,
        left: 23,
        child: Text('Cats of UPLB', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Lato',
        fontSize: 20,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 19,
        left: 17,
        child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color : Color.fromRGBO(255, 255, 255, 1),
      borderRadius : BorderRadius.all(Radius.elliptical(40, 40)),
  )
      )
      ),Positioned(
        top: 27,
        left: 24,
        child: Container(
        width: 23,
        height: 23,
        decoration: BoxDecoration(
          image : DecorationImage(
          image: AssetImage('assets/images/Back.png'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),Positioned(
        top: 269,
        left: 23,
        child: Text('Organization Category', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(62, 218, 134, 1),
        fontFamily: 'Inter',
        fontSize: 13,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 582,
        left: 23,
        child: Container(
      width: 382,
      height: 141,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 382,
        height: 141,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
      color : Color.fromRGBO(255, 255, 255, 1),
      border : Border.all(
          color: Color.fromRGBO(220, 220, 220, 1),
          width: 1,
        ),
  )
      )
      ),Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 141,
        height: 141,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(0),
          ),
      image : DecorationImage(
          image: AssetImage('assets/images/Rectangle34.png'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),Positioned(
        top: 16,
        left: 160,
        child: Text('Help Animal Sanctuary', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Inter',
        fontSize: 15,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 43,
        left: 160,
        child: Text('₱5,000 fund raised from ₱7,000', textAlign: TextAlign.left, style: TextStyle(
        color: Color(0xFF3EDA86),
        fontFamily: 'Inter',
        fontSize: 10,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 60,
        left: 160,
        child: Text('21 Donors', textAlign: TextAlign.left, style: TextStyle(
        color: Color(0xFF3EDA86),
        fontFamily: 'Inter',
        fontSize: 10,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 77,
        left: 160,
        child: Text('4 Days Left', textAlign: TextAlign.left, style: TextStyle(
        color: Color(0xFF3EDA86),
        fontFamily: 'Inter',
        fontSize: 10,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 103,
        left: 156,
        child: Container(
      width: 55,
      height: 22,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 55,
        height: 22,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
      color : Color.fromRGBO(243, 243, 243, 1),
  )
      )
      ),Positioned(
        top: 5,
        left: 23,
        child: Text('View', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(62, 218, 134, 1),
        fontFamily: 'Inter',
        fontSize: 9,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 5,
        left: 10,
        child: Container(
        width: 11,
        height: 11,
        decoration: BoxDecoration(
          image : DecorationImage(
          image: AssetImage('assets/images/Eye.png'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),
        ]
      )
    )
      ),
        ]
      )
    )
      ),Positioned(
        top: 430,
        left: 23,
        child: Container(
      width: 382,
      height: 141,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 382,
        height: 141,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
      color : Color.fromRGBO(255, 255, 255, 1),
      border : Border.all(
          color: Color.fromRGBO(220, 220, 220, 1),
          width: 1,
        ),
  )
      )
      ),Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 141,
        height: 141,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(0),
          ),
      image : DecorationImage(
          image: AssetImage('assets/images/Rectangle34.png'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),Positioned(
        top: 16,
        left: 160,
        child: Text('Help Animal Sanctuary', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Inter',
        fontSize: 15,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 43,
        left: 160,
        child: Text('₱5,000 fund raised from ₱7,000', textAlign: TextAlign.left, style: TextStyle(
        color: Color(0xFF3EDA86),
        fontFamily: 'Inter',
        fontSize: 10,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 60,
        left: 160,
        child: Text('21 Donors', textAlign: TextAlign.left, style: TextStyle(
        color: Color(0xFF3EDA86),
        fontFamily: 'Inter',
        fontSize: 10,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 77,
        left: 160,
        child: Text('4 Days Left', textAlign: TextAlign.left, style: TextStyle(
        color: Color(0xFF3EDA86),
        fontFamily: 'Inter',
        fontSize: 10,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 103,
        left: 156,
        child: Container(
      width: 55,
      height: 22,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 55,
        height: 22,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
      color : Color.fromRGBO(243, 243, 243, 1),
  )
      )
      ),Positioned(
        top: 5,
        left: 23,
        child: Text('View', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(62, 218, 134, 1),
        fontFamily: 'Inter',
        fontSize: 9,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 5,
        left: 10,
        child: Container(
        width: 11,
        height: 11,
        decoration: BoxDecoration(
          image : DecorationImage(
          image: AssetImage('assets/images/Eye.png'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),
        ]
      )
    )
      ),
        ]
      )
    )
      ),Positioned(
        top: 735,
        left: 23,
        child: Container(
      width: 382,
      height: 141,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 382,
        height: 141,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
      color : Color.fromRGBO(255, 255, 255, 1),
      border : Border.all(
          color: Color.fromRGBO(220, 220, 220, 1),
          width: 1,
        ),
  )
      )
      ),Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 141,
        height: 141,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(0),
          ),
      image : DecorationImage(
          image: AssetImage('assets/images/Rectangle34.png'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),Positioned(
        top: 16,
        left: 160,
        child: Text('Help Animal Sanctuary', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Inter',
        fontSize: 15,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 43,
        left: 160,
        child: Text('₱5,000 fund raised from ₱7,000', textAlign: TextAlign.left, style: TextStyle(
        color: Color(0xFF3EDA86),
        fontFamily: 'Inter',
        fontSize: 10,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 60,
        left: 160,
        child: Text('21 Donors', textAlign: TextAlign.left, style: TextStyle(
        color: Color(0xFF3EDA86),
        fontFamily: 'Inter',
        fontSize: 10,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 77,
        left: 160,
        child: Text('4 Days Left', textAlign: TextAlign.left, style: TextStyle(
        color: Color(0xFF3EDA86),
        fontFamily: 'Inter',
        fontSize: 10,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 103,
        left: 156,
        child: Container(
      width: 55,
      height: 22,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 55,
        height: 22,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
      color : Color.fromRGBO(243, 243, 243, 1),
  )
      )
      ),Positioned(
        top: 5,
        left: 23,
        child: Text('View', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(62, 218, 134, 1),
        fontFamily: 'Inter',
        fontSize: 9,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 5,
        left: 10,
        child: Container(
        width: 11,
        height: 11,
        decoration: BoxDecoration(
          image : DecorationImage(
          image: AssetImage('assets/images/Eye.png'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),
        ]
      )
    )
      ),
        ]
      )
    )
      ),Positioned(
        top: 888,
        left: 23,
        child: Container(
      width: 382,
      height: 141,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 382,
        height: 141,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
      color : Color.fromRGBO(255, 255, 255, 1),
      border : Border.all(
          color: Color.fromRGBO(220, 220, 220, 1),
          width: 1,
        ),
  )
      )
      ),Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 141,
        height: 141,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(0),
          ),
      image : DecorationImage(
          image: AssetImage('assets/images/Rectangle34.png'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),Positioned(
        top: 16,
        left: 160,
        child: Text('Help Animal Sanctuary', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Inter',
        fontSize: 15,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 43,
        left: 160,
        child: Text('₱5,000 fund raised from ₱7,000', textAlign: TextAlign.left, style: TextStyle(
        color: Color(0xFF3EDA86),
        fontFamily: 'Inter',
        fontSize: 10,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 60,
        left: 160,
        child: Text('21 Donors', textAlign: TextAlign.left, style: TextStyle(
        color: Color(0xFF3EDA86),
        fontFamily: 'Inter',
        fontSize: 10,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 77,
        left: 160,
        child: Text('4 Days Left', textAlign: TextAlign.left, style: TextStyle(
        color: Color(0xFF3EDA86),
        fontFamily: 'Inter',
        fontSize: 10,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 103,
        left: 156,
        child: Container(
      width: 55,
      height: 22,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 55,
        height: 22,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
      color : Color.fromRGBO(243, 243, 243, 1),
  )
      )
      ),Positioned(
        top: 5,
        left: 23,
        child: Text('View', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(62, 218, 134, 1),
        fontFamily: 'Inter',
        fontSize: 9,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 5,
        left: 10,
        child: Container(
        width: 11,
        height: 11,
        decoration: BoxDecoration(
          image : DecorationImage(
          image: AssetImage('assets/images/Eye.png'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),
        ]
      )
    )
      ),
        ]
      )
    )
      ),Positioned(
        top: 293,
        left: 23,
        child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(159, 159, 159, 1),
        fontFamily: 'Inter',
        fontSize: 10,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 408,
        left: 23,
        child: Divider(
        color: Color.fromRGBO(138, 138, 138, 1),
        thickness: 0.5
      )
      ,
      
      ),Positioned(
        top: 343,
        left: 39,
        child: Text('Los Baños, Laguna ', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(62, 218, 134, 1),
        fontFamily: 'Inter',
        fontSize: 10,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 361,
        left: 39,
        child: Text('09123456789', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(62, 218, 134, 1),
        fontFamily: 'Inter',
        fontSize: 10,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 378,
        left: 39,
        child: Text('mail@cats.uplb.org', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(62, 218, 134, 1),
        fontFamily: 'Inter',
        fontSize: 10,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 343,
        left: 23,
        child: Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          image : DecorationImage(
          image: AssetImage('assets/images/Location.png'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),Positioned(
        top: 361,
        left: 23,
        child: Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          image : DecorationImage(
          image: AssetImage('assets/images/Phone.png'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),Positioned(
        top: 379,
        left: 25,
        child: Container(
        width: 11,
        height: 11,
        decoration: BoxDecoration(
          image : DecorationImage(
          image: AssetImage('assets/images/Email.png'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),
        ]
      )
    );
        }
        }
        