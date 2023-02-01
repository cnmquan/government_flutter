import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../../models.dart';
import '../../../utils/assets.dart';
import '../../../utils/translation.dart';
import '../../../widgets/mobile.dart';

@WidgetbookUseCase(name: 'Page', type: IdCardPage)
Widget idCardPage(BuildContext) => MaterialApp(
        home: IdCardPage(
      idCard: IdCardModel.example(),
    ));

class IdCardPage extends StatefulWidget {
  final IdCardModel idCard;
  const IdCardPage({
    Key? key,
    required this.idCard,
  }) : super(key: key);

  @override
  State<IdCardPage> createState() => _IdCardPageState();
}

class _IdCardPageState extends State<IdCardPage> {
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
          title: TextPath.idCard,
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
          title: TextPath.idCard,
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
                  label: TextPath.idCardNumber,
                  defaultValue: widget.idCard.idNumber,
                  changedValue: changedList['idNumber'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['idNumber'] = value;
                    });
                  },
                  canEditable: widget.idCard.idNumber != null && isEditState,
                ),
                CustomTextFieldWidget(
                  label: TextPath.idCardFullName,
                  defaultValue: widget.idCard.fullName,
                  changedValue: changedList['fullName'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['fullName'] = value;
                    });
                  },
                  canEditable: widget.idCard.fullName != null && isEditState,
                ),
                CustomTextFieldWidget(
                  label: TextPath.idCardDateOfBirth,
                  defaultValue: widget.idCard.dateOfBirth,
                  changedValue: changedList['dateOfBirth'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['dateOfBirth'] = value;
                    });
                  },
                  canEditable: widget.idCard.dateOfBirth != null && isEditState,
                ),
                CustomTextFieldWidget(
                  label: TextPath.idCardGender,
                  defaultValue: widget.idCard.gender,
                  changedValue: changedList['gender'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['gender'] = value;
                    });
                  },
                  canEditable: widget.idCard.gender != null && isEditState,
                ),
                CustomTextFieldWidget(
                  label: TextPath.idCardNationality,
                  defaultValue: widget.idCard.nationality,
                  changedValue: changedList['nationality'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['nationality'] = value;
                    });
                  },
                  canEditable: widget.idCard.nationality != null && isEditState,
                ),
                CustomTextFieldWidget(
                  label: TextPath.idCardPlaceOfOrigin,
                  defaultValue: widget.idCard.placeOfOrigin,
                  changedValue: changedList['placeOfOrigin'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['placeOfOrigin'] = value;
                    });
                  },
                  canEditable:
                      widget.idCard.placeOfOrigin != null && isEditState,
                ),
                CustomTextFieldWidget(
                  label: TextPath.idCardPlaceOfResidence,
                  defaultValue: widget.idCard.placeOfResidence,
                  changedValue: changedList['placeOfResidence'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['placeOfResidence'] = value;
                    });
                  },
                  canEditable:
                      widget.idCard.placeOfResidence != null && isEditState,
                ),
                CustomTextFieldWidget(
                  label: TextPath.idCardEthnic,
                  defaultValue: widget.idCard.ethnic,
                  changedValue: changedList['ethnic'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['ethnic'] = value;
                    });
                  },
                  canEditable: widget.idCard.ethnic != null && isEditState,
                ),
                CustomTextFieldWidget(
                  label: TextPath.idCardReligion,
                  defaultValue: widget.idCard.religion,
                  changedValue: changedList['religion'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['religion'] = value;
                    });
                  },
                  canEditable: widget.idCard.religion != null && isEditState,
                ),
                CustomTextFieldWidget(
                  label: TextPath.idCardDateOfExpiry,
                  defaultValue: widget.idCard.dateOfExpiry,
                  changedValue: changedList['dateOfExpiry'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['dateOfExpiry'] = value;
                    });
                  },
                  canEditable:
                      widget.idCard.dateOfExpiry != null && isEditState,
                ),
                CustomTextFieldWidget(
                  label: TextPath.idCardPlaceOfGranted,
                  defaultValue: widget.idCard.placeOfGranted,
                  changedValue: changedList['placeOfGranted'],
                  onChangeText: (value) {
                    setState(() {
                      changedList['placeOfGranted'] = value;
                    });
                  },
                  canEditable:
                      widget.idCard.placeOfGranted != null && isEditState,
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
