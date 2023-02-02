import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../../models.dart';
import '../../../../utils/assets.dart';
import '../../../../utils/translation.dart';
import '../../../../widgets/web.dart';

class BirthCertificationPage extends StatefulWidget {
  final BirthCertificationModel? birthCertification;
  const BirthCertificationPage({
    Key? key,
    this.birthCertification,
  }) : super(key: key);

  @override
  State<BirthCertificationPage> createState() => _BirthCertificationPageState();
}

class _BirthCertificationPageState extends State<BirthCertificationPage> {
  bool isEditState = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (widget.birthCertification == null) {
      return const TemplateWidget(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: NotifyMessageWidget(
          title: r'Đã xảy ra lỗi',
          message:
              r'Hệ thống truy xuất dữ liệu có vấn đề. Vui lòng thử lại sau.',
          animatedPath: JsonAssetPath.failed,
        ),
      ));
    }
    if (isLoading) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        _showLoadingDialog(context);
      });
      return const TemplateWidget(child: SizedBox.shrink());
    }
    return TemplateWidget(
      isSignIn: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            const Text(
              r'Thông tin giấy khai sinh',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              width: size.width > 800 ? size.width * 0.72 : double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  SizedBox(
                    width:
                        size.width > 800 ? size.width * 0.28 : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.bCFullName,
                      defaultValue: widget.birthCertification?.fullName,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width:
                        size.width > 800 ? size.width * 0.28 : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.bcGender,
                      defaultValue: widget.birthCertification?.gender,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width:
                        size.width > 800 ? size.width * 0.28 : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.bcDateOfBirth,
                      defaultValue: widget.birthCertification?.dateOfBirth,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width:
                        size.width > 800 ? size.width * 0.28 : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.bcDateOfBirthText,
                      defaultValue: widget.birthCertification?.dateOfBirthText,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width:
                        size.width > 800 ? size.width * 0.28 : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.bcPlaceOfBirth,
                      defaultValue: widget.birthCertification?.placeOfBirth,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width:
                        size.width > 800 ? size.width * 0.28 : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.bcEthnic,
                      defaultValue: widget.birthCertification?.ethnic,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width:
                        size.width > 800 ? size.width * 0.28 : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.bcNationality,
                      defaultValue: widget.birthCertification?.nationality,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width:
                        size.width > 800 ? size.width * 0.28 : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.bcPlaceOfOrigin,
                      defaultValue: widget.birthCertification?.placeOfOrigin,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width:
                        size.width > 800 ? size.width * 0.28 : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.bcDateOfRegistration,
                      defaultValue:
                          widget.birthCertification?.dateOfRegistration,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width:
                        size.width > 800 ? size.width * 0.28 : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.bcPlaceOfRegistration,
                      defaultValue:
                          widget.birthCertification?.placeOfRegistration,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: double.maxFinite,
                    child: Center(
                      child: Text(
                        TextPath.bcFatherInformation,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width > 800
                        ? size.width * 0.56 + 24
                        : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.bCFullName,
                      defaultValue: widget.birthCertification?.fatherFullName,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width:
                        size.width > 800 ? size.width * 0.28 : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.bcEthnic,
                      defaultValue: widget.birthCertification?.fatherEthnic,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width:
                        size.width > 800 ? size.width * 0.28 : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.bcNationality,
                      defaultValue:
                          widget.birthCertification?.fatherNationality,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: double.maxFinite,
                    child: Center(
                      child: Text(
                        TextPath.bcMotherInformation,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width > 800
                        ? size.width * 0.56 + 24
                        : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.bCFullName,
                      defaultValue: widget.birthCertification?.motherFullName,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width:
                        size.width > 800 ? size.width * 0.28 : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.bcEthnic,
                      defaultValue: widget.birthCertification?.motherEthnic,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width:
                        size.width > 800 ? size.width * 0.28 : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.bcNationality,
                      defaultValue:
                          widget.birthCertification?.motherNationality,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: double.maxFinite,
                    child: Center(
                      child: Text(
                        TextPath.bcDeclarerInformation,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width:
                        size.width > 800 ? size.width * 0.28 : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.bCFullName,
                      defaultValue: widget.birthCertification?.declarerFullName,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width:
                        size.width > 800 ? size.width * 0.28 : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.bcRelationship,
                      defaultValue:
                          widget.birthCertification?.declarerRelationship,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
