import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../utils/assets.dart';
import '../../../../utils/routing.dart';
import '../../../../widgets/web.dart';

class ResidentInfoPage extends StatelessWidget {
  final String? residentId;
  const ResidentInfoPage({
    Key? key,
    this.residentId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String imagePath =
        'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=466&q=80';
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
                        imageUrl: imagePath,
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
                      children: const [
                        SizedBox(
                          height: 8,
                        ),
                        Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                text: r'Họ và tên: ',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: r'Nguyễn Văn A',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                text: r'ID: ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: r'123456789abc',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                text: r'Ngày sinh: ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: r'01/01/2001',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                text: r'Địa chỉ thường trú: ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: r'Ấp 1, xã Long Xuyên, Việt Nam',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
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
                        arguments: '123456',
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
                        arguments: '123456',
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
