import 'package:craft_ai/controllers/profile_state_notifier/profile_providers.dart';
import 'package:craft_ai/controllers/profile_state_notifier/profile_states.dart';
import 'package:craft_ai/models/work_experience.dart';
import 'package:craft_ai/views/work_experience_edit_screen/widgets/work_experience_field.dart';
import 'package:craft_ai/views/work_experience_edit_screen/widgets/work_experience_save_btn.dart';
import 'package:craft_ai/views/work_experience_edit_screen/widgets/work_experience_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class WorkExpreicneEditScreen extends ConsumerStatefulWidget {
  final bool isUpdate;
  final List<WorkExperience> workExperiences;
  final int? currentIndex;
  const WorkExpreicneEditScreen({
    super.key,
    required this.isUpdate,
    required this.workExperiences,
    this.currentIndex,
  });

  @override
  ConsumerState<WorkExpreicneEditScreen> createState() =>
      _WorkExpreicneEditScreenState();
}

class _WorkExpreicneEditScreenState
    extends ConsumerState<WorkExpreicneEditScreen> {
  DateTime startDate = DateTime.now(), endDate = DateTime.now();
  DateFormat dateFormat = DateFormat('MMMM dd, yyyy');
    bool isDialogShown = false;
  late TextEditingController jobDesignationController,
      jobDescriptionController,
      companyNameController,
      companyAddressController,
      startDateController,
      endDateController;

  @override
  void initState() {
    super.initState();
    WorkExperience? currentExperience;
    if (widget.currentIndex != null) {
      currentExperience = widget.workExperiences[widget.currentIndex!];
    }
    jobDesignationController = TextEditingController(
      text: currentExperience?.jobRole,
    );
    jobDescriptionController = TextEditingController(text: currentExperience?.jobDescription);
    companyNameController = TextEditingController(
      text: currentExperience?.companyName,
    );
    companyAddressController = TextEditingController(
      text: currentExperience?.companyAddress,
    );
    startDateController = TextEditingController(
      text:
          currentExperience != null
              ? dateFormat.format(currentExperience.startDate)
              : null,
    );
    endDateController = TextEditingController(
      text:
          currentExperience != null
              ? dateFormat.format(currentExperience.endDate)
              : null,
    );
    if(currentExperience != null){
      startDate = currentExperience.startDate;
      endDate = currentExperience.endDate;
    }
  }

  @override
  void dispose() {
    jobDesignationController.dispose();
    jobDescriptionController.dispose();
    companyNameController.dispose();
    companyAddressController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(profileStateNotifierProvider , (previous, next) {
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
    },onError: (error, stackTrace) {
      
    },);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isUpdate ? 'Update Experience' : 'Add Experience',
          style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                WorkExperienceText(text: 'Job Designation'),
                WorkExperienceField(
                  hint: 'Enter your designation here...',
                  controller: jobDesignationController,
                ),
                WorkExperienceText(text: 'Job Description'),
                WorkExperienceField(
                  hint: 'Enter job description here...',
                  controller: jobDescriptionController,
                ),
                WorkExperienceText(text: 'Company Name'),
                WorkExperienceField(
                  hint: 'Enter company name here...',
                  controller: companyNameController,
                ),
                WorkExperienceText(text: 'Company Adress'),
                WorkExperienceField(
                  hint: 'Enter company adress here...',
                  controller: companyAddressController,
                ),
                WorkExperienceText(text: 'Start Date'),
                WorkExperienceField(
                  hint: 'Enter start date here...',
                  isDateField: true,
                  controller: startDateController,
                  onChanged: (value) {
                    startDate = value;
                    startDateController.text = dateFormat.format(value);
                  },
                ),
                WorkExperienceText(text: 'End Date'),
                WorkExperienceField(
                  hint: 'Enter end date here...',
                  isDateField: true,
                  controller: endDateController,
                  onChanged: (value) {
                    endDate = value;
                    endDateController.text = dateFormat.format(value);
                  },
                ),
              ],
            ),
            WorkExperienceSaveBtn(
              onPressed: () {
                var workExperience = WorkExperience(
                  jobRole: jobDesignationController.text.trim(),
                  jobDescription: jobDescriptionController.text.trim(),
                  companyName: companyNameController.text.trim(),
                  companyAddress: companyAddressController.text.trim(),
                  startDate: startDate,
                  endDate: endDate,
                );
                var updatedExperiences = widget.workExperiences;
                if (widget.currentIndex == null) {
                  updatedExperiences.add(workExperience);
                } else {
                  updatedExperiences = widget.workExperiences;
                  updatedExperiences[widget.currentIndex!] = workExperience;
                }
                ref
                    .read(profileStateNotifierProvider.notifier)
                    .addWorkExperience(updatedExperiences);
              },
            ),
          ],
        ),
      ),
    );
  }
}
