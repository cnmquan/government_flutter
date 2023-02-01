import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../../models.dart';
import '../../../utils/assets.dart';
import '../../../utils/translation.dart';
import '../../../widgets/mobile.dart';

@WidgetbookUseCase(name: 'Page', type: BirthCertificatePage)
Widget birthCertificatePage(BuildContext context) {
  return MaterialApp(
      home: BirthCertificatePage(
    birthCertification: BirthCertificationModel.example(),
  ));
}

class BirthCertificatePage extends StatefulWidget {
  final BirthCertificationModel birthCertification;
  const BirthCertificatePage({
    Key? key,
    required this.birthCertification,
  }) : super(key: key);

  @override
  State<BirthCertificatePage> createState() => _BirthCertificatePageState();
}

class _BirthCertificatePageState extends State<BirthCertificatePage> {
  bool isEditState = false;
  bool isLoading = false;
  Map<String, String?> changedList = {};

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        _showLoadingDialog(context);
      });
      return const Scaffold(
        appBar: AppbarWidget(
          title: TextPath.birthCertification,
          canBackPage: true,
        ),
        backgroundColor: Colors.white,
        body: SizedBox.shrink(),
      );
    }
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const AppbarWidget(
          title: TextPath.birthCertification,
          canBackPage: true,
        ),
        floatingActionButton: CustomFloatingButtonWidget(
          isEditState: isEditState,
          onPress: () {
            if (isEditState) {
              setState(() {
                isEditState = false;
              });
            } else {
              setState(() {
                isEditState = true;
              });
            }
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    isEditState ? r'Sửa đổi thông tin' : r'Thông tin chi tiết',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                CustomTextFieldWidget(
                  label: TextPath.bCFullName,
                  defaultValue: widget.birthCertification.fullName,
                  changedValue: changedList['fullName'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['fullName'] = value;
                    });
                  },
                  canEditable:
                      widget.birthCertification.fullName != null && isEditState,
                ),
                CustomTextFieldWidget(
                  label: TextPath.bcGender,
                  defaultValue: widget.birthCertification.gender,
                  changedValue: changedList['gender'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['gender'] = value;
                    });
                  },
                  canEditable:
                      widget.birthCertification.gender != null && isEditState,
                ),
                CustomTextFieldWidget(
                  label: TextPath.bcDateOfBirth,
                  defaultValue: widget.birthCertification.dateOfBirth,
                  changedValue: changedList['dateOfBirth'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['dateOfBirth'] = value;
                    });
                  },
                  canEditable: widget.birthCertification.dateOfBirth != null &&
                      isEditState,
                ),
                CustomTextFieldWidget(
                  label: TextPath.bcDateOfBirthText,
                  defaultValue: widget.birthCertification.dateOfBirthText,
                  changedValue: changedList['dateOfBirthText'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['dateOfBirthText'] = value;
                    });
                  },
                  canEditable:
                      widget.birthCertification.dateOfBirthText != null &&
                          isEditState,
                ),
                CustomTextFieldWidget(
                  label: TextPath.bcPlaceOfBirth,
                  defaultValue: widget.birthCertification.placeOfBirth,
                  changedValue: changedList['placeOfBirth'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['placeOfBirth'] = value;
                    });
                  },
                  canEditable: widget.birthCertification.placeOfBirth != null &&
                      isEditState,
                ),
                CustomTextFieldWidget(
                  label: TextPath.bcEthnic,
                  defaultValue: widget.birthCertification.ethnic,
                  changedValue: changedList['ethnic'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['ethnic'] = value;
                    });
                  },
                  canEditable:
                      widget.birthCertification.ethnic != null && isEditState,
                ),
                CustomTextFieldWidget(
                  label: TextPath.bcNationality,
                  defaultValue: widget.birthCertification.nationality,
                  changedValue: changedList['nationality'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['nationality'] = value;
                    });
                  },
                  canEditable: widget.birthCertification.nationality != null &&
                      isEditState,
                ),
                CustomTextFieldWidget(
                  label: TextPath.bcPlaceOfOrigin,
                  defaultValue: widget.birthCertification.placeOfOrigin,
                  changedValue: changedList['placeOfOrigin'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['placeOfOrigin'] = value;
                    });
                  },
                  canEditable:
                      widget.birthCertification.placeOfOrigin != null &&
                          isEditState,
                ),
                CustomTextFieldWidget(
                  label: TextPath.bcDateOfRegistration,
                  defaultValue: widget.birthCertification.dateOfRegistration,
                  changedValue: changedList['dateOfRegistration'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['dateOfRegistration'] = value;
                    });
                  },
                  canEditable:
                      widget.birthCertification.dateOfRegistration != null &&
                          isEditState,
                ),
                CustomTextFieldWidget(
                  label: TextPath.bcPlaceOfRegistration,
                  defaultValue: widget.birthCertification.placeOfRegistration,
                  changedValue: changedList['placeOfRegistration'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['placeOfRegistration'] = value;
                    });
                  },
                  canEditable:
                      widget.birthCertification.placeOfRegistration != null &&
                          isEditState,
                ),
                const Text(
                  TextPath.bcFatherInformation,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextFieldWidget(
                  label: TextPath.bCFullName,
                  defaultValue: widget.birthCertification.fatherFullName,
                  changedValue: changedList['fatherFullName'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['fatherFullName'] = value;
                    });
                  },
                  canEditable:
                      widget.birthCertification.fatherFullName != null &&
                          isEditState,
                ),
                CustomTextFieldWidget(
                  label: TextPath.bcEthnic,
                  defaultValue: widget.birthCertification.fatherEthnic,
                  changedValue: changedList['fatherEthnic'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['fatherEthnic'] = value;
                    });
                  },
                  canEditable: widget.birthCertification.fatherEthnic != null &&
                      isEditState,
                ),
                CustomTextFieldWidget(
                  label: TextPath.bcNationality,
                  defaultValue: widget.birthCertification.fatherNationality,
                  changedValue: changedList['fatherNationality'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['fatherNationality'] = value;
                    });
                  },
                  canEditable:
                      widget.birthCertification.fatherNationality != null &&
                          isEditState,
                ),
                const Text(
                  TextPath.bcMotherInformation,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextFieldWidget(
                  label: TextPath.bCFullName,
                  defaultValue: widget.birthCertification.motherFullName,
                  changedValue: changedList['motherFullName'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['motherFullName'] = value;
                    });
                  },
                  canEditable:
                      widget.birthCertification.motherFullName != null &&
                          isEditState,
                ),
                CustomTextFieldWidget(
                  label: TextPath.bcEthnic,
                  defaultValue: widget.birthCertification.motherEthnic,
                  changedValue: changedList['motherEthnic'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['motherEthnic'] = value;
                    });
                  },
                  canEditable: widget.birthCertification.motherEthnic != null &&
                      isEditState,
                ),
                CustomTextFieldWidget(
                  label: TextPath.bcNationality,
                  defaultValue: widget.birthCertification.motherNationality,
                  changedValue: changedList['motherNationality'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['motherNationality'] = value;
                    });
                  },
                  canEditable:
                      widget.birthCertification.motherNationality != null &&
                          isEditState,
                ),
                const Text(
                  TextPath.bcDeclarerInformation,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextFieldWidget(
                  label: TextPath.bCFullName,
                  defaultValue: widget.birthCertification.declarerFullName,
                  changedValue: changedList['declarerFullName'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['declarerFullName'] = value;
                    });
                  },
                  canEditable:
                      widget.birthCertification.declarerFullName != null &&
                          isEditState,
                ),
                CustomTextFieldWidget(
                  label: TextPath.bcRelationship,
                  defaultValue: widget.birthCertification.declarerRelationship,
                  changedValue: changedList['declarerRelationship'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['declarerRelationship'] = value;
                    });
                  },
                  canEditable:
                      widget.birthCertification.declarerRelationship != null &&
                          isEditState,
                ),
                Visibility(
                  visible: !isEditState,
                  child: const SizedBox(
                    height: 32,
                  ),
                ),
                Visibility(
                  visible: isEditState,
                  child: CustomButtonWidget(
                    title: r'Gửi',
                    thumbnail: Colors.black,
                    height: 60,
                    width: 240,
                    padding: 12,
                    onPress: () {
                      _showLoadingDialog(context);
                      Future.delayed(const Duration(seconds: 5), () {
                        Navigator.maybePop(context);
                        Future.delayed(const Duration(milliseconds: 300), () {
                          _showCustomDialog(context);
                        });
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showCustomDialog(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const NotifyMessageWidget(
              animatedPath: JsonAssetPath.success,
              title: r'Thông báo',
              message: r'Chúng tôi đã ghi nhận góp ý của bạn và đang xử lý.',
            ),
          );
        }).then((value) => {Navigator.maybePop(context)});
  }

  _showLoadingDialog(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const LoadingWidget(),
          );
        });
  }
}
