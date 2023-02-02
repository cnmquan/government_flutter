import 'package:flutter/material.dart';
import 'package:goverment_flutter_system/models.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:goverment_flutter_system/utils/routing.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../logic/user_controller.dart';
import '../../../utils/assets.dart';
import '../../../utils/translation.dart';
import '../../../widgets/web.dart';

@WidgetbookUseCase(name: 'Page', type: SearchInformationPage)
Widget searchInformationPage(BuildContext context) =>
    const MaterialApp(home: SearchInformationPage());

class SearchInformationPage extends StatefulWidget {
  final bool isComingSoon;
  const SearchInformationPage({
    Key? key,
    this.isComingSoon = false,
  }) : super(key: key);

  @override
  State<SearchInformationPage> createState() => _SearchInformationPageState();
}

class _SearchInformationPageState extends State<SearchInformationPage> {
  List<ResidentModel?>? residents;
  String? filterValue;
  bool showAdvance = false;
  bool loading = true;

  late final PlutoGridStateManager stateManager;

  @override
  void initState() {
    super.initState();
    updateResidents();
  }

  void updateResidents() async {
    await UserController().getResidentsFromSearch().then((value) {
      residents = value;
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (widget.isComingSoon) {
      return TemplateWidget(
        isSignIn: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: NotifyMessageWidget(
            width: size.width * 0.4,
            height: 240,
            fontSize: 24,
            animatedPath: JsonAssetPath.comingSoon,
            title: TextPath.upComingTitle,
            message: TextPath.upComingMessage,
          ),
        ),
      );
    } else {
      if (loading) {
        return TemplateWidget(
          isSignIn: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: LoadingWidget(
              size: size.width * 0.4,
            ),
          ),
        );
      }
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
                    r'Tìm kiếm thông tin',
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
                      columns: SearchInfoGridWidget.searchInfoColumns,
                      rows: residents!
                          .map(
                            (value) => SearchInfoGridWidget.getRowByValue(
                              id: value!.phoneNumber!,
                              name: value.idCardModel!.fullName!,
                              dateOfBirth: value.idCardModel!.dateOfBirth!,
                              place: value.idCardModel!.placeOfResidence,
                              paperNumber:
                                  (value.papers as List<dynamic>).length,
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
                          RoutingWebPath.residentInfo,
                          arguments: residents!.firstWhere(
                              (element) =>
                                  element?.phoneNumber ==
                                  event.row?.cells["id"]?.value,
                              orElse: () => null),
                        );
                      },
                      onLoaded: (PlutoGridOnLoadedEvent event) {
                        stateManager = event.stateManager;
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
}
