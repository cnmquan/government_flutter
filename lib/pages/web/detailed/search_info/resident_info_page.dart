import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:goverment_flutter_system/models.dart';

import '../../../../utils/assets.dart';
import '../../../../utils/routing.dart';
import '../../../../widgets/web.dart';

class ResidentInfoPage extends StatelessWidget {
  final ResidentModel? resident;
  const ResidentInfoPage({
    Key? key,
    this.resident,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (resident == null) {
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: resident!.idCardModel!.image!,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        imageBuilder: (context, imageProvider) => Container(
                          width: 240,
                          height: 240,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
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
                                text: resident?.idCardModel?.fullName,
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
                                text: r'ID: ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: resident?.idCardModel?.idNumber,
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
                                text: r'Ngày sinh: ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: resident
                                    ?.birthCertificationModel?.dateOfBirth,
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
                                text: r'Địa chỉ thường trú: ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: resident?.idCardModel?.placeOfResidence,
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
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Wrap(
                runAlignment: WrapAlignment.center,
                alignment: WrapAlignment.center,
                spacing: 24,
                runSpacing: 24,
                children: [
                  ImageBoxTextWidget(
                    imagePath: ImageAssetPath.idCard,
                    title: r'CMND/CCCD',
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        RoutingWebPath.idCard,
                        arguments: resident?.idCardModel,
                      );
                    },
                    size: 240,
                  ),
                  ImageBoxTextWidget(
                    imagePath: ImageAssetPath.birthCertification,
                    title: r'Giấy khai sinh',
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        RoutingWebPath.birthCertificate,
                        arguments: resident?.birthCertificationModel,
                      );
                    },
                    size: 240,
                  ),
                  ImageBoxTextWidget(
                    imagePath: ImageAssetPath.registrationBook,
                    title: r'Sổ hộ khẩu',
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        RoutingWebPath.registrationBook,
                        arguments: '123456',
                      );
                    },
                    size: 240,
                  ),
                  ImageBoxTextWidget(
                    imagePath: ImageAssetPath.familyInformation,
                    title: r'Thông tin người thân',
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        RoutingWebPath.familyInfo,
                        arguments: '123456',
                      );
                    },
                    size: 240,
                  ),
                ],
              )
            ],
          )),
    );
  }
}
