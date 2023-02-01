import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goverment_flutter_system/logic/user_controller.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../../models.dart';
import '../../../utils/assets.dart';
import '../../../utils/routing.dart';
import '../../../utils/translation.dart';
import '../../../widgets/mobile.dart';

@WidgetbookUseCase(name: 'Page', type: HomePage)
Widget homePageGlobal(BuildContext context) => MaterialApp(home: HomePage());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String fullName = 'Nguyen Van A';
    String imagePath =
        'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=466&q=80';
    return FutureBuilder<ResidentModel?>(
        future: UserController()
            .getResidentFromEmail(FirebaseAuth.instance.currentUser!.email!),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Scaffold(
              body: NotifyMessageWidget(
                title: r'Đã xảy ra lỗi',
                message: r'Ứng dụng hiện tại gặp sự cố. Vui lòng thử lại sau.',
                animatedPath: JsonAssetPath.failed,
              ),
            );
          }
          if (!snapshot.hasData) {
            return const Scaffold(body: LoadingWidget());
          }
          ResidentModel residentModel = snapshot.data!;
          return Scaffold(
            appBar: AppbarWidget(
              title: residentModel.idCardModel!.fullName!,
              canBackPage: false,
              imagePath: imagePath,
            ),
            body: GridView.extent(
              primary: false,
              padding: const EdgeInsets.all(24),
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              maxCrossAxisExtent: 180,
              children: [
                ImageBoxTextWidget(
                  imagePath: ImageAssetPath.idCard,
                  title: TextPath.idCard,
                  onTap: () => Navigator.pushNamed(
                    context,
                    RoutingMobilePath.idCard,
                    arguments: residentModel.idCardModel,
                  ),
                ),
                ImageBoxTextWidget(
                  imagePath: ImageAssetPath.birthCertification,
                  title: TextPath.birthCertification,
                  onTap: () => Navigator.pushNamed(
                    context,
                    RoutingMobilePath.birthCertification,
                    arguments: residentModel.birthCertificationModel,
                  ),
                ),
                ImageBoxTextWidget(
                  imagePath: ImageAssetPath.registrationBook,
                  title: TextPath.registrationBook,
                  onTap: () => Navigator.pushNamed(
                    context,
                    RoutingMobilePath.registrationBook,
                  ),
                ),
                ImageBoxTextWidget(
                  imagePath: ImageAssetPath.familyInformation,
                  title: TextPath.familyInformation,
                  onTap: () => Navigator.pushNamed(
                    context,
                    RoutingMobilePath.familyInformation,
                  ),
                ),
                ImageBoxTextWidget(
                  imagePath: ImageAssetPath.requestPaper,
                  title: TextPath.requestPaper,
                  onTap: () => Navigator.pushNamed(
                    context,
                    RoutingMobilePath.requestPaper,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
