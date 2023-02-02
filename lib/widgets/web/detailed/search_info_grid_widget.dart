import 'package:pluto_grid/pluto_grid.dart';

class SearchInfoGridWidget {
  static List<PlutoColumn> searchInfoColumns = [
    PlutoColumn(
      title: r'ID',
      field: 'id',
      type: PlutoColumnType.text(),
      readOnly: true,
      minWidth: 160,
    ),
    PlutoColumn(
      title: r'Họ và Tên',
      field: 'name',
      type: PlutoColumnType.text(),
      readOnly: true,
      minWidth: 160,
    ),
    PlutoColumn(
      title: r'Ngày sinh',
      field: 'dateOfBirth',
      type: PlutoColumnType.text(),
      readOnly: true,
      minWidth: 160,
    ),
    PlutoColumn(
      title: r'Địa chỉ thường trú',
      field: 'place',
      type: PlutoColumnType.text(),
      readOnly: true,
      minWidth: 160,
    ),
    PlutoColumn(
      title: r'Số giấy tờ',
      field: 'paperNumber',
      type: PlutoColumnType.number(),
      readOnly: true,
      minWidth: 160,
    ),
  ];

  static PlutoRow getRowByValue({
    String? id,
    String? name,
    String? dateOfBirth,
    String? place,
    int? paperNumber,
  }) {
    return PlutoRow(
      cells: {
        'id': PlutoCell(value: id),
        'name': PlutoCell(value: name),
        'dateOfBirth': PlutoCell(value: dateOfBirth),
        'place': PlutoCell(value: place),
        'paperNumber': PlutoCell(value: paperNumber),
      },
    );
  }
}
