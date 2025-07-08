import 'package:flutter/material.dart';
import 'package:todolistapp/core/widgets/glassy_icon_bottom_widget.dart';
import 'package:todolistapp/core/widgets/text_widget.dart';
import '/core/widgets/glass_circle_widget.dart';

Widget projectCardWidget( projectController) {
   return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 1,
      childAspectRatio: 2,
      mainAxisSpacing: 15,
    ),
    itemCount: projectController.projects.length,
    itemBuilder: (context, index) {
  

      return GestureDetector(
        onTap: () {
          
        
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
             gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blueAccent, Colors.blueAccent.withBlue(200)],
              ),
            ),
            child: Stack(
              children: [
                // Large circle with blur effect in background

                Positioned(
                  top: -50,
                  right: -50,
                  child: glassCircleWidget(200, 200, 0.15, SizedBox()),
                ),
                // Main content
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textWidget(
                        isBottom: true,
                        isDark: false,
                        txt: projectController.projects[index],
                        weight: 'title',
                      ),

                     /* Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textWidget(
                            isDark: false,
                            txt: progress,
                            isBottom: true,
                          ),
                          textWidget(
                            isDark: false,
                            txt: 'tasks',
                            isBottom: true,
                            fontSize: 16,
                          ),
                        ],
                      ),*/
                    ],
                  ),
                ),
                // Delete button
                glassyIconBottomWidget(context, projectController, index),
              ],
            ),
          ),
        ),
      );
    },
  );
}
