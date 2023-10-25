import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:new_project/model/user.dart';
import 'package:new_project/pages/home.dart';
import 'package:new_project/user/user_pref.dart';
import 'package:new_project/widget/appbar_widget.dart';
import 'package:new_project/widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
            isEdit: false,
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          //NumbersWidget(),
          const SizedBox(height: 48),
          buildAbout(user),
        ],
      ),
      bottomNavigationBar: GNav(
        backgroundColor: Colors.white,
        gap: 10,
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home', // Change this to 'Home' for the Home tab
            onPressed: () {
              // Navigator.pushNamed(context, 'Home');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            },
          ),
          const GButton(icon: Icons.book, text: 'Activities'),
          const GButton(icon: Icons.check_circle, text: 'Available'),
          const GButton(icon: Icons.qr_code_rounded, text: 'QR CODE'),
          const GButton(icon: Icons.track_changes_rounded, text: 'Tracker'),
          const GButton(icon: Icons.notifications, text: 'Notifications'),
          GButton(
            icon: Icons.person,
            text: 'Profile', // Change this to 'Profile' for the Profile tab
            onPressed: () {
              // Navigator.pushNamed(context, 'ProfilePage');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      );

  Widget buildAbout(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
