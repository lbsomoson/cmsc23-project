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
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              width: 428,
              height: 224,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Rectangle 34.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          
          const Positioned(
            top: 241,
            left: 23,
            child: Text(
              'Cats of UPLB',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Lato',
                fontSize: 20,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          Positioned(
            top: 19,
            left: 17,
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.all(
                  Radius.elliptical(40, 40),
                ),
              ),
            ),
          ),
          const Positioned(
            top: 269,
            left: 23,
            child: Text(
              'Organization Category',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(62, 218, 134, 1),
                fontFamily: 'Inter',
                fontSize: 13,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
