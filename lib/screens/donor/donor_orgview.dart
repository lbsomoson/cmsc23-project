import 'package:flutter/material.dart';
import 'package:project/widgets/divider.dart';
import 'package:project/widgets/donor_org_info.dart';
import 'package:project/widgets/donor_view_help.dart';
import '../../widgets/appbar_title.dart'; 

class DonorOrgView extends StatefulWidget {
  const DonorOrgView({super.key});

  @override
  State<DonorOrgView> createState() => _DonorOrgViewState();
}

class _DonorOrgViewState extends State<DonorOrgView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 224,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/orgpic.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                SizedBox(height: 5), 
                Padding(
                  padding: const EdgeInsets.all(10.0), 
                  child: DonorOrgInfo(),
                ),
                DividerWidget(),
                DonorViewHelp(),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back,
                        color: Theme.of(context).colorScheme.primary),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
