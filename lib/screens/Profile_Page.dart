import 'package:flutter/material.dart';

const darkColor = Color(0xFF49535C);

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var montserrat = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w800,
    );
    return Material(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.black,
            Colors.brown,
            Colors.black,
          ],
        )),
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              constraints: BoxConstraints(maxWidth: 500),
              decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 700,
                    child: Stack(
                      children: [
                        ClipPath(
                          clipper: AvatarClipper(),
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 11,
                          top: 100,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTOkHm3_mPQ5PPRvGtU6Si7FJg8DVDtZ47rw&usqp=CAU"),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "My Account",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 38,
                                      color: const Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "|Gayatri Samal|",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 8)
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 30,
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "User Account Name : \nContact Details : ",
                              style: montserrat,
                            ),
                            const SizedBox(height: 45),
                            Text(
                              " Your Address: \nContact Us: ",
                              style: montserrat,
                            ),
                          ],
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Mahii ", style: montserrat),
                            Text("8956784586", style: montserrat),
                            const SizedBox(height: 45),
                            Text(
                                "Flat no-1, \nShivani Plaza,\nBalaji Nagar - Sangli ",
                                style: montserrat),
                            Text("0223-4156-8956", style: montserrat)
                          ],
                        )
                      ],
                    ),
                  ),
                  //         const SizedBox(height: 40),
                  //         Padding(
                  //           padding: const EdgeInsets.only(
                  //               left: 8.0, right: 8.0, bottom: 8.0),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //             crossAxisAlignment: CrossAxisAlignment.center,
                  //             children: [
                  //               Column(
                  //                 children: [
                  //                   Text(
                  //                     "6280",
                  //                     style: buildMontserrat(
                  //                       const Color(0xFF000000),
                  //                       fontWeight: FontWeight.bold,
                  //                     ),
                  //                   ),
                  //                   Text(
                  //                     "Subscribers",
                  //                     style: buildMontserrat(darkColor),
                  //                   )
                  //                 ],
                  //               ),
                  //               SizedBox(
                  //                 height: 50,
                  //                 child: const VerticalDivider(
                  //                   color: Color(0xFF9A9A9A),
                  //                 ),
                  //               ),
                  //               Column(
                  //                 children: [
                  //                   Text(
                  //                     "1745",
                  //                     style: buildMontserrat(
                  //                       const Color(0xFF000000),
                  //                       fontWeight: FontWeight.bold,
                  //                     ),
                  //                   ),
                  //                   Text(
                  //                     "Followers",
                  //                     style: buildMontserrat(darkColor),
                  //                   )
                  //                 ],
                  //               ),
                  //               SizedBox(
                  //                 height: 50,
                  //                 child: const VerticalDivider(
                  //                   color: Color(0xFF9A9A9A),
                  //                 ),
                  //               ),
                  //               Column(
                  //                 children: [
                  //                   Text(
                  //                     "163",
                  //                     style: buildMontserrat(
                  //                       const Color(0xFF000000),
                  //                       fontWeight: FontWeight.bold,
                  //                     ),
                  //                   ),
                  //                   Text(
                  //                     "Videos",
                  //                     style: buildMontserrat(darkColor),
                  //                   )
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         const SizedBox(height: 8)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle buildMontserrat(
    Color color, {
    FontWeight fontWeight = FontWeight.w800,
  }) {
    return const TextStyle(
      fontSize: 24,
      color: Colors.black,
      fontWeight: FontWeight.w800,
    );
  }
}

class AvatarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height)
      ..lineTo(8, size.height)
      ..arcToPoint(Offset(114, size.height), radius: Radius.circular(1))
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
