import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_project/pages/profile.dart';
import 'login.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final Box _boxLogin = Hive.box("login");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CMS"),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white),
              ),
              child: IconButton(
                onPressed: () {
                  _boxLogin.clear();
                  _boxLogin.put("loginStatus", false);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Login();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.logout_rounded),
              ),
            ),
          )
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome!",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            Text(
              _boxLogin.get("userName"),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
      bottomNavigationBar: GNav(
        backgroundColor: Colors.white,
        gap: 10,
        tabs: [
          const GButton(icon: Icons.home, text: 'Home'),
          const GButton(icon: Icons.book, text: 'Activities'),
          const GButton(icon: Icons.check_circle, text: 'Available'),
          const GButton(icon: Icons.qr_code_rounded, text: 'QR CODE'),
          const GButton(icon: Icons.track_changes_rounded, text: 'Tracker'),
          const GButton(icon: Icons.notifications, text: 'Notifications'),
          GButton(
              icon: Icons.person,
              text: 'Profile',
              onPressed: () {
                //Navigator.pushNamed(context, 'profile');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              }),
        ],
      ),
    );
  }
}
