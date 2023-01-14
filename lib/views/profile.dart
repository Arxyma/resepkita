import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const Profile());
}

class Profile extends StatelessWidget {
  const Profile({Key key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Profil Saya',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: const Color(0xFFFCFBF4),
      ),
      home: const Home(
        title: '',
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key key, @required this.title});
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final double coverHeight = 200;
  final double profileHeight = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        buildTop(),
        buildContent(),
      ],
    ));
  }

  Widget buildTop() {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        )
      ],
    );
  }

  Widget buildCoverImage() => SizedBox(
        width: double.infinity,
        height: coverHeight,
        child: Container(
          color: Colors.orange,
        ),
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: profileHeight / 2 - 7,
          backgroundColor: Colors.grey.shade800,
          backgroundImage: NetworkImage('assets/img.jpg'),
        ),
      );

  Widget buildContent() => Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
              child: Column(
                children: [
                  const Text(
                    'Ujang Surejang',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 28,
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'ujangracing45@gmail.com',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black45,
                        fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Divider(),
          const SizedBox(height: 16),
          buildAbout(),
          const SizedBox(height: 32),
        ],
      );

  Widget buildAbout() => Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
        height: 400,
        alignment: Alignment.center,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'USER PROFILE',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey),
              ),
            ),
            SizedBox(height: 5),
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'First Name',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Ujang',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                    ),
                    Divider(),
                    Text(
                      'Last Name',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Surejang',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                    ),
                    Divider(),
                    Text(
                      'Email Address',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'ujangracing45@gmail.com',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                    ),
                    Divider(),
                    Text(
                      'Phone Number',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '+6283 842 736 366',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                    ),
                    Divider(),
                    Text(
                      'Address',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Jl. Srigunting Tim. 7-29, Maleber, Kec. Andir, Kota Bandung, Jawa Barat 40184',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildSocialIcon(IconData icon) => CircleAvatar(
        radius: 30,
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Center(
                child: Icon(
              icon,
              size: 40,
            )),
          ),
        ),
      );
}
