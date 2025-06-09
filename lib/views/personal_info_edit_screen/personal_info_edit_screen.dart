import 'package:craft_ai/controllers/profile_state_notifier/profile_providers.dart';
import 'package:craft_ai/controllers/profile_state_notifier/profile_states.dart';
import 'package:craft_ai/models/user_data.dart';
import 'package:craft_ai/views/personal_info_edit_screen/widgets/personal_info_fields.dart';
import 'package:craft_ai/views/personal_info_edit_screen/widgets/personal_info_save_btn.dart';
import 'package:craft_ai/views/personal_info_edit_screen/widgets/personal_info_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PersonalInfoEditScreen extends ConsumerStatefulWidget {
  final String title;
  final UserData userData;
  const PersonalInfoEditScreen({
    super.key,
    required this.title,
    required this.userData,
  });

  @override
  ConsumerState<PersonalInfoEditScreen> createState() =>
      _PersonalInfoEditScreenState();
}

class _PersonalInfoEditScreenState
    extends ConsumerState<PersonalInfoEditScreen> {
  bool isDialogShown = false;

  late TextEditingController nameController,
      designationController,
      emailController,
      phoneNoController,
      addressController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.userData.name);
    designationController = TextEditingController(
      text: widget.userData.designation,
    );
    emailController = TextEditingController(text: widget.userData.email);
    phoneNoController = TextEditingController(text: widget.userData.phoneNo);
    addressController = TextEditingController(text: widget.userData.address);
  }

  @override
  void dispose() {
    nameController.dispose();
    designationController.dispose();
    emailController.dispose();
    phoneNoController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(profileStateNotifierProvider, (previous, next) {
      if (next is ProfileLoadingState) {
        if (!isDialogShown) {
          isDialogShown = true;
          showDialog(
            context: context,
            builder: (context) {
              return Dialog.fullscreen(
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.onSecondary.withAlpha(80),
                child: Center(
                  child: LoadingAnimationWidget.threeRotatingDots(
                    color: Theme.of(context).colorScheme.primary,
                    size: 25,
                  ),
                ),
              );
            },
          );
        }
      } else if (next is ProfileLoadedState || next is ProfileErrorState) {
        if (isDialogShown) {
          Navigator.of(context)
            ..pop()
            ..pop();
          isDialogShown = false;
        }
      }
    }, onError: (error, stackTrace) {});
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                PersonalInfoText(text: 'Name'),
                PersonalInfoField(
                  hint: 'Enter your name here...',
                  controller: nameController,
                ),
                PersonalInfoText(text: 'Job Role'),
                PersonalInfoField(
                  hint: 'Enter your designation here...',
                  controller: designationController,
                ),
                PersonalInfoText(text: 'Email'),
                PersonalInfoField(
                  hint: 'Enter your email here...',
                  controller: emailController,
                ),
                PersonalInfoText(text: 'Contact No.'),
                PersonalInfoField(
                  hint: 'Enter your contact number here...',
                  controller: phoneNoController,
                ),
                PersonalInfoText(text: 'Address'),
                PersonalInfoField(
                  hint: 'Enter your address here...',
                  controller: addressController,
                ),
              ],
            ),
            PersonalInfoSaveBtn(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                ref
                    .read(profileStateNotifierProvider.notifier)
                    .addUserData(
                      widget.userData.copyWith(
                        name: nameController.text.trim(),
                        designation: designationController.text.trim(),
                        email: emailController.text.trim(),
                        phoneNo: phoneNoController.text.trim(),
                        address: addressController.text.trim(),
                      ),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
