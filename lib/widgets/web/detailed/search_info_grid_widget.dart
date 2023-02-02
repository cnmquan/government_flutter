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

  static List<PlutoColumn> requestsColumn = [
    PlutoColumn(
      title: r'Số điện thoại',
      field: 'phoneNumber',
      type: PlutoColumnType.text(),
      readOnly: true,
      minWidth: 160,
    ),
    PlutoColumn(
      title: r'Họ và Tên',
      field: 'fullName',
      type: PlutoColumnType.text(),
      readOnly: true,
      minWidth: 160,
    ),
    PlutoColumn(
      title: r'Ngày gửi',
      field: 'dateRequest',
      type: PlutoColumnType.text(),
      readOnly: true,
      minWidth: 160,
    ),
    PlutoColumn(
      title: r'Yêu cầu',
      field: 'requestType',
      type: PlutoColumnType.text(),
      readOnly: true,
      minWidth: 160,
    ),
    PlutoColumn(
      title: r'Trạng thái',
      field: 'status',
      type: PlutoColumnType.text(),
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

  static PlutoRow getRowRequestByValue({
    String? phoneNumber,
    String? fullName,
    String? dateRequest,
    String? requestType,
    String? status,
  }) {
    return PlutoRow(
      cells: {
        'phoneNumber': PlutoCell(value: phoneNumber),
        'fullName': PlutoCell(value: fullName),
        'dateRequest': PlutoCell(value: dateRequest),
        'requestType': PlutoCell(value: requestType),
        'status': PlutoCell(value: status),
      },
    );
  }
}
