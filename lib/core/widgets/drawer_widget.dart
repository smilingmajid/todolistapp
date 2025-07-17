import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:line_icons/line_icons.dart';


Widget drawerWidget() {
  return    Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                // ignore: deprecated_member_use
                Colors.grey[900]!.withOpacity(0.8),
                // ignore: deprecated_member_use
                const Color.fromARGB(255, 255, 0, 0),
              ],
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'ClashDisplay',
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                ListTile(
                  leading: const Icon(LineIcons.github, color: Colors.white),
                  title: const Text(
                    'Github',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'ClashDisplay',
                    ),
                  ),
                  onTap: () {
                    //advancedDrawerController.hideDrawer();
                  },
                ),

                //Linkdin
                ListTile(
                  leading:
                      const Icon(LineIcons.linkedinIn, color: Colors.white),
                  title: const Text(
                    'Linkedin',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'ClashDisplay',
                    ),
                  ),
                  onTap: () {
                    //advancedDrawerController.hideDrawer();

                  },
                ),
                //Telegram
                ListTile(
                  leading: const Icon(LineIcons.telegram, color: Colors.white),
                  title: const Text(
                    'Telegram',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'ClashDisplay',
                    ),
                  ),
                  onTap: () {
                   // advancedDrawerController.hideDrawer();
                  },
                ),
                ListTile(
                  leading: const Icon(Iconsax.instagram, color: Colors.white),
                  title: const Text(
                    'Instagram',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'ClashDisplay',
                    ),
                  ),
                  onTap: () {
                   // advancedDrawerController.hideDrawer();
                  },
                ),
              ],
            ),
          ),
        );
}
