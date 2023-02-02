import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../../logic/request_controller.dart';
import '../../../models.dart';
import '../../../utils/assets.dart';
import '../../../utils/translation.dart';
import '../../../widgets/mobile.dart';

@WidgetbookUseCase(name: 'Page', type: RequestListPage)
Widget requestListPaperPage(BuildContext context) => const MaterialApp(
        home: RequestListPage(
      phoneNumber: '0123456678',
    ));

class RequestListPage extends StatelessWidget {
  final String phoneNumber;
  const RequestListPage({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(
        title: TextPath.requestPaper,
        canBackPage: true,
      ),
      body: FutureBuilder<List<RequestModel?>?>(
          future: RequestController().getRequestResidents(phoneNumber),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const NotifyMessageWidget(
                animatedPath: JsonAssetPath.failed,
                title: r'Đã xảy ra lỗi',
                message: r'Hệ thống đang gặp sự cố. Vui lòng thử lại sau',
              );
            }
            if (snapshot.connectionState != ConnectionState.done) {
              return const LoadingWidget();
            }
            List<RequestModel?> requests = snapshot.data!;
            if (requests.isEmpty) {
              return const NotifyMessageWidget(
                animatedPath: JsonAssetPath.notFound,
                title: r'Thông báo',
                message: r'Hiện tại bạn chưa gửi bất cứ yêu cầu nào.',
              );
            }
            return SingleChildScrollView(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: requests.length,
                    itemBuilder: (context, index) {
                      return RequestBoxWidget(
                        requestModel: requests[index]!,
                      );
                    }));
          }),
    );
  }
}
