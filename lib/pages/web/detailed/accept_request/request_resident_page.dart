import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/material.dart';

import '../../../../logic/request_controller.dart';
import '../../../../models.dart';
import '../../../../utils/assets.dart';
import '../../../../utils/routing.dart';
import '../../../../widgets/web.dart';

final List<String> statusList = [
  'Chưa được tiếp nhận',
  'Đã được tiếp nhận',
  'Đang xử lý',
  'Đã xử lý',
];

class RequestResidentPage extends StatefulWidget {
  final RequestModel? requestModel;
  const RequestResidentPage({
    Key? key,
    this.requestModel,
  }) : super(key: key);

  @override
  State<RequestResidentPage> createState() => _RequestResidentPageState();
}

class _RequestResidentPageState extends State<RequestResidentPage> {
  String? selectedValue;
  @override
  void initState() {
    super.initState();
    if (widget.requestModel != null) {
      selectedValue = widget.requestModel?.status;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (widget.requestModel == null) {
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
    return TemplateWidget(
      isSignIn: true,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.84 > 840 ? 840 : double.maxFinite,
                decoration: size.width * 0.84 > 840
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black),
                      )
                    : null,
                padding:
                    size.width * 0.84 > 840 ? const EdgeInsets.all(12) : null,
                child: Wrap(
                  runAlignment: WrapAlignment.center,
                  alignment: WrapAlignment.center,
                  spacing: 24,
                  runSpacing: 24,
                  children: [
                    SizedBox(
                        width: double.maxFinite,
                        child: Text(
                          widget.requestModel!.requestType!,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 24),
                          textAlign: TextAlign.center,
                        )),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: size.width * 0.84 > 840 ? 360 : double.maxFinite,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: <InlineSpan>[
                                const TextSpan(
                                  text: r'Họ và tên: ',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.requestModel?.fullName,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text.rich(
                            TextSpan(
                              children: <InlineSpan>[
                                const TextSpan(
                                  text: r'Số điện thoại: ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.requestModel?.phoneNumber,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text.rich(
                            TextSpan(
                              children: <InlineSpan>[
                                const TextSpan(
                                  text: r'Ngày gửi yêu cầu: ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.requestModel?.dateRequest,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text.rich(
                            TextSpan(
                              children: <InlineSpan>[
                                const TextSpan(
                                  text: r'Người tiếp nhận: ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.requestModel?.acceptPerson ??
                                      'Chưa ai tiếp nhận',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text.rich(
                            TextSpan(
                              children: <InlineSpan>[
                                const TextSpan(
                                  text: r'Ngày tiếp nhận: ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.requestModel?.dateAccept ??
                                      'Chưa tiếp nhận',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.84 > 840 ? 360 : double.maxFinite,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            r'Yêu cầu',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                          for (var content
                              in widget.requestModel!.requests!) ...[
                            Text(
                              '- $content',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                          ]
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                width: size.width * 0.84 > 840 ? 840 : double.maxFinite,
                decoration: size.width * 0.84 > 840
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black),
                      )
                    : null,
                padding:
                    size.width * 0.84 > 840 ? const EdgeInsets.all(12) : null,
                child: Wrap(
                  runAlignment: WrapAlignment.center,
                  alignment: WrapAlignment.center,
                  spacing: 24,
                  runSpacing: 24,
                  children: [
                    const SizedBox(
                        width: double.maxFinite,
                        child: Text(
                          r'Cập nhật trạng thái',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20),
                          textAlign: TextAlign.center,
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        hint: Text(
                          widget.requestModel!.status!,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        items: statusList
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value as String;
                          });
                        },
                        buttonHeight: 80,
                        buttonWidth: 280,
                        itemHeight: 40,
                        buttonPadding:
                            const EdgeInsets.only(left: 14, right: 14),
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        itemPadding: const EdgeInsets.only(left: 14, right: 14),
                        dropdownMaxHeight: 200,
                        dropdownWidth: 280,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    CustomButtonWidget(
                      title: r'Cập nhật',
                      thumbnail: Colors.blue,
                      width: 240,
                      height: 80,
                      onPress: () {
                        if (selectedValue != widget.requestModel?.status) {
                          RequestController()
                              .updateRequestResident(widget.requestModel!,
                                  'Nguyễn Văn A', selectedValue!)
                              .then((value) {
                            Navigator.pushNamedAndRemoveUntil(context,
                                RoutingWebPath.acceptRequest, (route) => false);
                          });
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
