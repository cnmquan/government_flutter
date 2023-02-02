import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../../models.dart';
import '../../../../utils/assets.dart';
import '../../../../utils/translation.dart';
import '../../../../widgets/web.dart';

class IdCardPage extends StatefulWidget {
  final IdCardModel? idCard;
  const IdCardPage({
    Key? key,
    this.idCard,
  }) : super(key: key);

  @override
  State<IdCardPage> createState() => _IdCardPageState();
}

class _IdCardPageState extends State<IdCardPage> {
  bool isEditState = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (widget.idCard == null) {
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
              r'Thông tin thẻ CMND/CCCD',
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
                      label: TextPath.idCardNumber,
                      defaultValue: widget.idCard?.idNumber,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width:
                        size.width > 800 ? size.width * 0.28 : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.idCardFullName,
                      defaultValue: widget.idCard?.fullName,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width:
                        size.width > 800 ? size.width * 0.28 : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.idCardDateOfBirth,
                      defaultValue: widget.idCard?.dateOfBirth,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width:
                        size.width > 800 ? size.width * 0.28 : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.idCardGender,
                      defaultValue: widget.idCard?.gender,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width:
                        size.width > 800 ? size.width * 0.28 : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.idCardNationality,
                      defaultValue: widget.idCard?.nationality,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width:
                        size.width > 800 ? size.width * 0.28 : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.idCardPlaceOfOrigin,
                      defaultValue: widget.idCard?.placeOfOrigin,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width:
                        size.width > 800 ? size.width * 0.28 : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.idCardPlaceOfResidence,
                      defaultValue: widget.idCard?.placeOfResidence,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width:
                        size.width > 800 ? size.width * 0.28 : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.idCardEthnic,
                      defaultValue: widget.idCard?.ethnic,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width:
                        size.width > 800 ? size.width * 0.28 : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.idCardReligion,
                      defaultValue: widget.idCard?.religion,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width:
                        size.width > 800 ? size.width * 0.28 : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.idCardDateOfExpiry,
                      defaultValue: widget.idCard?.dateOfExpiry,
                      canEditable: false,
                      padding: 12,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: size.width > 800
                        ? size.width * 0.56 + 24
                        : double.maxFinite,
                    child: CustomTextFieldWidget(
                      label: TextPath.idCardPlaceOfGranted,
                      defaultValue: widget.idCard?.placeOfGranted,
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
