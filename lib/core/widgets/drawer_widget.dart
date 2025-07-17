import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:line_icons/line_icons.dart';

Widget drawerWidget(bool isDark, {Function()? onPressed}) {
  final List<Map<String, dynamic>> drawerItems = [
    {'icon': LineIcons.github, 'title': 'Github'},
    {'icon': LineIcons.linkedinIn, 'title': 'Linkedin'},
    {'icon': LineIcons.telegram, 'title': 'Telegram'},
    {'icon': Iconsax.instagram, 'title': 'Instagram'},
  ];

  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.grey[900]!,
          const Color.fromARGB(255, 61, 61, 61),
        ],
      ),
    ),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                isDark ? Iconsax.sun_1 : Iconsax.moon,
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: Image.asset('assets/image/me.png', width: 75, height: 75),
          ),
          const SizedBox(height: 5),
          const Center(
            child: Text(
              'Majid Ghasemy',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: 'ClashDisplay',
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              'Mid Level Flutter Developer',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'ClashDisplay',
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 30),

          // ListView for menu items
          Expanded(
            child: ListView.builder(
              itemCount: drawerItems.length,
              itemBuilder: (context, index) {
                final item = drawerItems[index];
                return ListTile(
                  leading: Icon(item['icon'], color: Colors.white),
                  title: Text(
                    item['title'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'ClashDisplay',
                    ),
                  ),
                  onTap: () {
                    // Handle tap for each item here
                  },
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
