import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreenImage extends StatelessWidget {
  const ProfileScreenImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 4,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/logo.png'),
              ),
            ),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                GestureDetector(
                  onTap: () {
                    ImagePicker().pickImage(source: ImageSource.gallery);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    padding: EdgeInsets.all(5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Icon(
                            Icons.edit_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
