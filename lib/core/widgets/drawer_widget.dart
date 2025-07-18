import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:todolistapp/core/app_colors.dart';
import 'package:todolistapp/core/widgets/text_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:todolistapp/core/app_data.dart';
Widget drawerWidget(bool isDark, {Function()? onPressed}) {


  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          isDark ? Colors.black : Colors.white,
          isDark
              ? AppColors().darkModeColors[0]
              : AppColors().lightModeColors[0],
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
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ),
          Center(
            child: Image.asset('assets/image/me.png', width: 75, height: 75),
          ),
          const SizedBox(height: 5),
          Center(
            child: textWidget(
              isDark: isDark,
              txt: 'Majid Ghasemy',
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: textWidget(
              isDark: isDark,
              txt: 'Mid Level Flutter Developer',
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
              itemCount: AppData().drawerItems.length,
              itemBuilder: (context, index) {
                final item = AppData().drawerItems[index];
                return ListTile(
                  leading: Icon(
                    item['icon'],
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  title: Text(
                    item['title'],
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                      fontFamily: 'ClashDisplay',
                    ),
                  ),
                  onTap: () async {
                    final url = Uri.parse(item['url']);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      );
                    } else {
                      throw 'Could not launch ${item['url']}';
                    }
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
