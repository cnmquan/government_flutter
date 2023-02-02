import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../../logic/request_controller.dart';
import '../../../models.dart';
import '../../../utils/assets.dart';
import '../../../utils/translation.dart';
import '../../../widgets/mobile.dart';

@WidgetbookUseCase(name: 'Page', type: BirthCertificatePage)
Widget birthCertificatePage(BuildContext context) {
  return MaterialApp(
      home: BirthCertificatePage(
    birthCertification: BirthCertificationModel.example(),
    phoneNumber: '01234567878',
  ));
}

class BirthCertificatePage extends StatefulWidget {
  final BirthCertificationModel birthCertification;
  final String phoneNumber;
  const BirthCertificatePage({
    Key? key,
    required this.birthCertification,
    required this.phoneNumber,
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
                      if (changedList.isEmpty) {
                        return;
                      }
                      var results = _convertMapToListInBirthCertification(
                          changedList, widget.birthCertification);
                      debugPrint('$results');
                      _showLoadingDialog(context);
                      DateTime now = DateTime.now();
                      RequestModel requestModel = RequestModel(
                        phoneNumber: widget.phoneNumber,
                        fullName: widget.birthCertification.fullName,
                        dateRequest:
                            '${now.hour}:${now.minute}:${now.second} ${now.day}/${now.month}/${now.year}',
                        requestType: r'Chỉnh sửa giấy khai sinh',
                        requests: results,
                        status: r'Chưa được chấp nhận',
                      );
                      RequestController()
                          .sendRequestResident(requestModel)
                          .then((value) {
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

  String? _convertRequestString({
    String? name,
    String? before,
    String? after,
  }) {
    if (after == null) {
      return null;
    }
    return 'Thay đổi $name từ $before thành $after';
  }

  List<String?> _convertMapToListInBirthCertification(
      Map<String, String?> after, BirthCertificationModel? model) {
    List<String?> results = [];
    final fullName = _convertRequestString(
      name: 'họ và tên',
      before: model?.fullName,
      after: after['fullName'],
    );
    if (fullName != null) {
      results.add(fullName);
    }
    final gender = _convertRequestString(
      name: 'giới tính',
      before: model?.gender,
      after: after['gender'],
    );
    if (gender != null) {
      results.add(gender);
    }
    final dateOfBirth = _convertRequestString(
      name: 'ngày sinh',
      before: model?.dateOfBirth,
      after: after['dateOfBirth'],
    );
    if (dateOfBirth != null) {
      results.add(dateOfBirth);
    }
    final dateOfBirthText = _convertRequestString(
      name: 'ngày sinh bằng chữ',
      before: model?.dateOfBirthText,
      after: after['dateOfBirthText'],
    );
    if (dateOfBirthText != null) {
      results.add(dateOfBirthText);
    }
    final placeOfBirth = _convertRequestString(
      name: 'nơi sinh',
      before: model?.placeOfBirth,
      after: after['placeOfBirth'],
    );
    if (placeOfBirth != null) {
      results.add(placeOfBirth);
    }
    final ethnic = _convertRequestString(
      name: 'dân tộc',
      before: model?.ethnic,
      after: after['ethnic'],
    );
    if (ethnic != null) {
      results.add(ethnic);
    }
    final nationality = _convertRequestString(
      name: 'quốc tịch',
      before: model?.nationality,
      after: after['nationality'],
    );
    if (nationality != null) {
      results.add(nationality);
    }
    final placeOfOrigin = _convertRequestString(
      name: 'quê quán',
      before: model?.placeOfOrigin,
      after: after['placeOfOrigin'],
    );
    if (placeOfOrigin != null) {
      results.add(placeOfOrigin);
    }
    final fatherFullName = _convertRequestString(
      name: 'họ và tên cha',
      before: model?.fatherFullName,
      after: after['fatherFullName'],
    );
    if (fatherFullName != null) {
      results.add(fatherFullName);
    }
    final fatherEthnic = _convertRequestString(
      name: 'dân tộc của cha',
      before: model?.fatherEthnic,
      after: after['fatherEthnic'],
    );
    if (fatherEthnic != null) {
      results.add(fatherEthnic);
    }
    final fatherNationality = _convertRequestString(
      name: 'quốc tịch của cha',
      before: model?.fatherNationality,
      after: after['fatherNationality'],
    );
    if (fatherNationality != null) {
      results.add(fatherNationality);
    }
    final motherFullName = _convertRequestString(
      name: 'họ và tên mẹ',
      before: model?.motherFullName,
      after: after['motherFullName'],
    );
    if (motherFullName != null) {
      results.add(motherFullName);
    }
    final motherEthnic = _convertRequestString(
      name: 'dân tộc của mẹ',
      before: model?.motherEthnic,
      after: after['motherEthnic'],
    );
    if (motherEthnic != null) {
      results.add(motherEthnic);
    }
    final motherNationality = _convertRequestString(
      name: 'quốc tịch của mẹ',
      before: model?.motherNationality,
      after: after['motherNationality'],
    );
    if (motherNationality != null) {
      results.add(motherNationality);
    }
    final declarerFullName = _convertRequestString(
      name: 'họ và tên người khai',
      before: model?.declarerFullName,
      after: after['declarerFullName'],
    );
    if (declarerFullName != null) {
      results.add(declarerFullName);
    }
    final declarerRelationship = _convertRequestString(
      name: 'mối quan hệ của người khai',
      before: model?.declarerRelationship,
      after: after['declarerRelationship'],
    );
    if (declarerRelationship != null) {
      results.add(declarerRelationship);
    }
    final dateOfRegistration = _convertRequestString(
      name: 'ngày đăng ký',
      before: model?.dateOfRegistration,
      after: after['dateOfRegistration'],
    );
    if (dateOfRegistration != null) {
      results.add(dateOfRegistration);
    }
    final placeOfRegistration = _convertRequestString(
      name: 'nơi đăng ký',
      before: model?.placeOfRegistration,
      after: after['placeOfRegistration'],
    );
    if (placeOfRegistration != null) {
      results.add(placeOfRegistration);
    }
    return results;
  }
}
