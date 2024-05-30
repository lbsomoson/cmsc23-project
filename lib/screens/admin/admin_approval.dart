import 'package:flutter/material.dart';
import 'package:project/models/organization_model.dart';
import 'package:project/providers/admin_provider.dart';
import 'package:project/widgets/button.dart';
import 'package:project/widgets/divider.dart';
import 'package:project/widgets/text2.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class AdminApprovalScreen extends StatefulWidget {
  final Organization org;
  const AdminApprovalScreen({required this.org, super.key});

  @override
  State<AdminApprovalScreen> createState() => _AdminApprovalScreenState();
}

class _AdminApprovalScreenState extends State<AdminApprovalScreen> {
  bool isApprovedClicked = false;

  void handleApproveClicked(String id) async {
    String res = await context.read<AdminProvider>().approveOrganization(id);

    print("res: $res");

    final snackBar = SnackBar(
      content: const Text('Approved organization!'),
      action: SnackBarAction(label: 'Close', onPressed: () {}),
    );

    setState(() {
      isApprovedClicked = true;
    });

    // TODO: FIX NAVIGATION AFTER ADDING A DONATION DRIVE
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/images/dog.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.org.name,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(22, 57, 30, 1),
                            )),
                        const Text2Widget(
                            text: "Category of Organization", style: 'body2'),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text2Widget(
                            maxLines: 5,
                            text:
                                "Lorem ipsum dolor sit amet, consectetur  adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in",
                            style: 'body'),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.email,
                                color: Theme.of(context).colorScheme.primary,
                                size: 20),
                            const SizedBox(
                              width: 5,
                            ),
                            Text2Widget(text: widget.org.email, style: "body3")
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(Icons.phone,
                                color: Theme.of(context).colorScheme.primary,
                                size: 20),
                            const SizedBox(
                              width: 5,
                            ),
                            Text2Widget(
                                text: widget.org.contactNumber, style: "body3")
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.location_on,
                                color: Theme.of(context).colorScheme.primary,
                                size: 20),
                            const SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: widget.org.addresses
                                  .map((address) => Text2Widget(
                                      text: address, style: 'body3'))
                                  .toList(),
                            ),
                          ],
                        ),
                        const DividerWidget(),
                        const Text2Widget(
                            text: "Proof/s of Legitimacy",
                            style: "sectionHeader"),
                        const SizedBox(
                          height: 10,
                        ),
                        FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: widget.org.photoUrl,
                          fit: BoxFit.cover,
                        ),
                        const DividerWidget(),
                        const SizedBox(
                          height: 10,
                        ),
                        // user(),
                        !isApprovedClicked
                            ? Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ButtonWidget(
                                      handleClick: () => {
                                            handleApproveClicked(
                                                widget.org.organizationId!)
                                          },
                                      block: true,
                                      label: "Approve",
                                      style: 'filled'),
                                ],
                              )
                            : const Center(
                                child: Text2Widget(
                                text: "Organization Approved",
                                style: 'body2',
                              ))
                      ],
                    ),
                  ),
                ],
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
      ),
    );
  }

  Widget user() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/juan.jpg',
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Juan Dela Cruz",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(22, 57, 30, 1),
                    )),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.email,
                        color: Theme.of(context).colorScheme.primary, size: 20),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text2Widget(
                        text: "juandelacruz@gmail.com", style: "body3")
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(Icons.location_on,
                        color: Theme.of(context).colorScheme.primary, size: 20),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text2Widget(text: "Los Baños, Laguna", style: "body3")
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(Icons.phone,
                        color: Theme.of(context).colorScheme.primary, size: 20),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text2Widget(text: "09954695022", style: "body3")
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
