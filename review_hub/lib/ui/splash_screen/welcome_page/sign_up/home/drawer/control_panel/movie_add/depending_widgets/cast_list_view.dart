import 'dart:io';
import 'package:flutter/material.dart';
import 'package:review_hub/depending_data/depending_colors.dart';

class CastListWidget extends StatelessWidget {
  const CastListWidget({
    super.key,
    required this.height,
    required this.castImages,
    required this.castNames,
    this.icons,
  });

  final double height;
  final ValueNotifier<List<String>> castImages;
  final ValueNotifier<List<String>> castNames;
  final bool? icons;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: castImages,
      builder: (context, List<String> images, child) {
        return ValueListenableBuilder(
          valueListenable: castNames,
          builder: (context, List<String> names, child) {
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: images.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      color:Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            // Cast Image with decoration
                            Hero(
                              tag: 'cast_${images[index]}',
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      // ignore: deprecated_member_use
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: CircleAvatar(
                                  radius: 35,
                                
                                  child: CircleAvatar(
                                    radius: 34,
                                    backgroundImage: FileImage(
                                      File(images[index]),
                                    ),
                                    onBackgroundImageError: (e, _) {
                                      // Show placeholder on error
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            
                            // Name and Role section
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    names[index],
                                    style:  TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color:textWeight
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                
                                ],
                              ),
                            ),
                            
                           
                           
                              IconButton(
                                icon: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  
                                  remove(
                                    castImages: castImages,
                                    castNames: castNames,
                                    index: index,
                                  );
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  void remove({
    required ValueNotifier<List<String>> castImages,
    required ValueNotifier<List<String>> castNames,
    required int index,
  }) {
    // Add your remove logic here
    castImages.value.removeAt(index);
    castNames.value.removeAt(index);
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    castImages.notifyListeners();
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    castNames.notifyListeners();
  }
}