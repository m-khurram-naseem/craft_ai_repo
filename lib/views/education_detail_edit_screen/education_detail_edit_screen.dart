import 'package:craft_ai/controllers/profile_state_notifier/profile_providers.dart';
import 'package:craft_ai/controllers/profile_state_notifier/profile_states.dart';
import 'package:craft_ai/models/education.dart';
import 'package:craft_ai/views/education_detail_edit_screen/widgets/education_detail_field.dart';
import 'package:craft_ai/views/education_detail_edit_screen/widgets/education_detail_save_btn.dart';
import 'package:craft_ai/views/education_detail_edit_screen/widgets/education_detail_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class EducationDetailEditScreen extends ConsumerStatefulWidget {
  final bool isUpdate;
  final List<Education> eduacation;
  final int? currentIndex;
  const EducationDetailEditScreen({
    super.key,
    required this.isUpdate,
    required this.eduacation,
    this.currentIndex,
  });

  @override
  ConsumerState<EducationDetailEditScreen> createState() =>
      _EducationDetailEditScreenState();
}

class _EducationDetailEditScreenState
    extends ConsumerState<EducationDetailEditScreen> {
  DateTime startDate = DateTime.now(), endDate = DateTime.now();
  DateFormat dateFormat = DateFormat('MMMM dd, yyyy');
  bool isDialogShown = false;
  late TextEditingController degreeNameController,
      instituteNameController,
      instituteAddressController,
      startDateController,
      endDateController;

  @override
  void initState() {
    super.initState();
    Education? education;
    if (widget.currentIndex != null) {
      education = widget.eduacation[widget.currentIndex!];
    }
    degreeNameController = TextEditingController(text: education?.degreeName);
    instituteNameController = TextEditingController(
      text: education?.instituteName,
    );
    instituteAddressController = TextEditingController(
      text: education?.instituteAddress,
    );
    startDateController = TextEditingController(
      text: education != null ? dateFormat.format(education.startDate) : null,
    );
    endDateController = TextEditingController(
      text: education != null ? dateFormat.format(education.endDate) : null,
    );
    if(education != null){
      startDate = education.startDate;
      endDate = education.endDate;
    }
  }

  @override
  void dispose() {
    degreeNameController.dispose();
    instituteNameController.dispose();
    instituteAddressController.dispose();
    startDateController.dispose();
    endDateController.dispose();
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
          widget.isUpdate ? 'Update Education' : 'Add Education',
          style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                EducationDetailText(text: 'Degree Name'),
                EducationDetailField(
                  hint: 'Enter your degree here...',
                  controller: degreeNameController,
                ),
                EducationDetailText(text: 'Institution Name'),
                EducationDetailField(
                  hint: 'Enter school/college/university here...',
                  controller: instituteNameController,
                ),
                EducationDetailText(text: 'Institution Location'),
                EducationDetailField(
                  hint: 'Enter school/college/university address here...',
                  controller: instituteAddressController,
                ),
                EducationDetailText(text: 'Start Date'),
                EducationDetailField(
                  hint: 'Enter start date here...',
                  controller: startDateController,
                  isDateField: true,
                  selectedDate: startDate,
                  onChanged: (value) {
                    startDate = value;
                    startDateController.text = dateFormat.format(startDate);
                  },
                ),
                EducationDetailText(text: 'End Date'),
                EducationDetailField(
                  hint: 'Enter end date here...',
                  controller: endDateController,
                  isDateField: true,
                  selectedDate: endDate,
                  onChanged: (value) {
                    endDate = value;
                    endDateController.text = dateFormat.format(endDate);
                  },
                ),
              ],
            ),
            EducationDetailSaveBtn(
              onPressed: () {
                var education = Education(
                  degreeName: degreeNameController.text.trim(),
                  instituteName: instituteNameController.text.trim(),
                  instituteAddress: instituteAddressController.text.trim(),
                  startDate: startDate,
                  endDate: endDate,
                );
                List<Education> updatedEducation = widget.eduacation;
                if (widget.currentIndex == null) {
                  updatedEducation.add(education);
                } else {
                  updatedEducation = widget.eduacation;
                  updatedEducation[widget.currentIndex!] = education;
                }
                ref
                    .read(profileStateNotifierProvider.notifier)
                    .addEducation(updatedEducation);
              },
            ),
          ],
        ),
      ),
    );
  }
}
