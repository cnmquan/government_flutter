import 'package:flutter/material.dart';
import 'package:goverment_flutter_system/logic/request_controller.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../../models.dart';
import '../../../utils/assets.dart';
import '../../../utils/routing.dart';
import '../../../utils/translation.dart';
import '../../../widgets/web.dart';

@WidgetbookUseCase(name: 'Page', type: AcceptRequestPage)
Widget acceptRequestPage(BuildContext context) =>
    MaterialApp(home: AcceptRequestPage());

class AcceptRequestPage extends StatefulWidget {
  const AcceptRequestPage({Key? key}) : super(key: key);

  @override
  State<AcceptRequestPage> createState() => _AcceptRequestPageState();
}

class _AcceptRequestPageState extends State<AcceptRequestPage> {
  List<RequestModel?>? requests;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    updateRequests();
  }

  void updateRequests() async {
    await RequestController().getAllRequestResident().then((value) {
      requests = value;
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (loading) {
      return const TemplateWidget(
        isSignIn: true,
        isBackOn: false,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: LoadingWidget(),
        ),
      );
    }
    debugPrint('${requests!.first}');
    return TemplateWidget(
      isSignIn: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            const SizedBox(
                width: double.maxFinite,
                child: Text(
                  r'Danh sách yêu cầu',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                )),
            // Container(
            //   width: size.width > 540
            //       ? size.width * 0.6
            //       : size.width * 0.8,
            //   height: 60,
            //   padding: const EdgeInsets.symmetric(
            //       vertical: 8, horizontal: 12),
            //   decoration: BoxDecoration(
            //     border: Border.all(
            //       color: Colors.black,
            //     ),
            //     borderRadius: BorderRadius.circular(12),
            //   ),
            //   child: TextField(
            //     onChanged: (value) {},
            //     style: const TextStyle(
            //       fontSize: 16,
            //       fontWeight: FontWeight.w400,
            //     ),
            //     decoration: const InputDecoration(
            //       prefixIcon: Icon(Icons.search),
            //       enabledBorder: InputBorder.none,
            //       border: InputBorder.none,
            //       focusedBorder: InputBorder.none,
            //       hintText: r'Tìm kiếm',
            //     ),
            //   ),
            // ),
            // if (showAdvance) ...[
            //   SizedBox(
            //     width: double.maxFinite,
            //     child: IconButton(
            //       onPressed: () {
            //         setState(() {
            //           showAdvance = false;
            //         });
            //       },
            //       style: ElevatedButton.styleFrom(
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12),
            //           side: const BorderSide(
            //             color: Colors.black,
            //             width: 10,
            //           ),
            //         ),
            //         padding: const EdgeInsets.all(12),
            //       ),
            //       icon: const Icon(
            //         Icons.keyboard_arrow_up_rounded,
            //         size: 32,
            //       ),
            //     ),
            //   ),
            //   Wrap(
            //     children: [
            //       const SizedBox(
            //         width: 100,
            //         height: 50,
            //         child: Center(
            //           child: Text(
            //             r'Lọc theo: ',
            //             style: TextStyle(
            //               fontSize: 16,
            //               fontWeight: FontWeight.w700,
            //             ),
            //           ),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 140,
            //         height: 60,
            //         child: RadioListTile(
            //           title: const Text(
            //             r'ID',
            //             style: TextStyle(
            //               fontSize: 14,
            //               fontWeight: FontWeight.w400,
            //             ),
            //           ),
            //           value: "id",
            //           groupValue: filterValue,
            //           onChanged: (value) {
            //             setState(() {
            //               filterValue = value;
            //             });
            //           },
            //         ),
            //       ),
            //       SizedBox(
            //         width: 140,
            //         height: 60,
            //         child: RadioListTile(
            //           title: const Text(
            //             r'Tên',
            //             style: TextStyle(
            //               fontSize: 14,
            //               fontWeight: FontWeight.w400,
            //             ),
            //           ),
            //           value: "name",
            //           groupValue: filterValue,
            //           onChanged: (value) {
            //             setState(() {
            //               filterValue = value;
            //             });
            //           },
            //         ),
            //       ),
            //       SizedBox(
            //         width: 140,
            //         height: 60,
            //         child: RadioListTile(
            //           title: const Text(
            //             r'Chủ hộ',
            //             style: TextStyle(
            //               fontSize: 14,
            //               fontWeight: FontWeight.w400,
            //             ),
            //           ),
            //           value: "owner",
            //           groupValue: filterValue,
            //           onChanged: (value) {
            //             setState(() {
            //               filterValue = value;
            //             });
            //           },
            //         ),
            //       ),
            //       SizedBox(
            //         width: 140,
            //         height: 60,
            //         child: RadioListTile(
            //           title: const Text(
            //             r'Nơi sinh',
            //             style: TextStyle(
            //               fontSize: 14,
            //               fontWeight: FontWeight.w400,
            //             ),
            //           ),
            //           value: "placeOfBirth",
            //           groupValue: filterValue,
            //           onChanged: (value) {
            //             setState(() {
            //               filterValue = value;
            //             });
            //           },
            //         ),
            //       ),
            //     ],
            //   ),
            // ] else ...[
            //   SizedBox(
            //     width: double.maxFinite,
            //     child: IconButton(
            //       onPressed: () {
            //         setState(() {
            //           showAdvance = true;
            //         });
            //       },
            //       style: ElevatedButton.styleFrom(
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12),
            //           side: const BorderSide(
            //             color: Colors.black,
            //             width: 10,
            //           ),
            //         ),
            //         padding: const EdgeInsets.all(12),
            //       ),
            //       icon: const Icon(
            //         Icons.keyboard_arrow_down_rounded,
            //         size: 32,
            //       ),
            //     ),
            //   ),
            // ],
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 480,
                child: PlutoGrid(
                    mode: PlutoGridMode.select,
                    columns: SearchInfoGridWidget.requestsColumn,
                    rows: requests!
                        .map(
                          (value) => SearchInfoGridWidget.getRowRequestByValue(
                            phoneNumber: value!.phoneNumber,
                            fullName: value.fullName,
                            dateRequest: value.dateRequest,
                            requestType: value.requestType,
                            status: value.status,
                          ),
                        )
                        .toList(),
                    configuration: PlutoGridConfiguration(
                      localeText: const PlutoGridLocaleText(
                        unfreezeColumn: r'Bỏ cố định cột',
                        setFilter: r'Thiết lập bộ lọc',
                        filterAllColumns: r'Lọc toàn bộ cột',
                        filterColumn: r'Lọc theo cột',
                        freezeColumnToStart: r'Cố định cột đầu',
                        freezeColumnToEnd: r'Cố định cột cuối',
                        autoFitColumn: r'Tự động chỉnh kích cỡ',
                        setColumns: r'Hiện cột',
                        hideColumn: r'Ẩn cột',
                        setColumnsTitle: r'Tiêu đề cột',
                        resetFilter: r'Chỉnh sửa bộ lọc',
                        filterType: r'Loại',
                        filterValue: r'Giá trị',
                        filterContains: r'Bao gồm',
                        filterEndsWith: r'Kết thúc với',
                        filterEquals: r'Bằng với',
                        filterGreaterThan: r'Lớn hơn',
                        filterGreaterThanOrEqualTo: r'Lớn hơn hoặc bằng',
                        filterLessThan: r'Nhỏ hơn',
                        filterLessThanOrEqualTo: r'Nhỏ hơn hoặc bằng',
                        filterStartsWith: r'Bắt đầu với',
                      ),
                      columnSize: PlutoGridColumnSizeConfig(
                        resizeMode: PlutoResizeMode.pushAndPull,
                        autoSizeMode: size.width > 720
                            ? PlutoAutoSizeMode.scale
                            : PlutoAutoSizeMode.none,
                      ),
                      columnFilter: PlutoGridColumnFilterConfig(
                        filters: [
                          ...FilterHelper.defaultFilters,
                        ],
                        resolveDefaultColumnFilter: (column, resolver) {
                          if (column.field == 'text') {
                            return resolver<PlutoFilterTypeContains>()
                                as PlutoFilterType;
                          } else if (column.field == 'number') {
                            return resolver<PlutoFilterTypeGreaterThan>()
                                as PlutoFilterType;
                          } else if (column.field == 'date') {
                            return resolver<PlutoFilterTypeLessThan>()
                                as PlutoFilterType;
                          }

                          return resolver<PlutoFilterTypeContains>()
                              as PlutoFilterType;
                        },
                      ),
                    ),
                    onSelected: (PlutoGridOnSelectedEvent event) {
                      Navigator.of(context).pushNamed(
                        RoutingWebPath.requestResident,
                        arguments: requests!.firstWhere(
                            (element) =>
                                element?.dateRequest ==
                                event.row?.cells["dateRequest"]?.value,
                            orElse: () => null),
                      );
                    },
                    onLoaded: (PlutoGridOnLoadedEvent event) {
                      // stateManager = event.stateManager;
                      setState(() {});
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
