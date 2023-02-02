import 'package:flutter/material.dart';

import '../../../models.dart';

class RequestBoxWidget extends StatefulWidget {
  final RequestModel requestModel;
  const RequestBoxWidget({
    Key? key,
    required this.requestModel,
  }) : super(key: key);

  @override
  State<RequestBoxWidget> createState() => _RequestBoxWidgetState();
}

class _RequestBoxWidgetState extends State<RequestBoxWidget> {
  bool isShowAll = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isShowAll = !isShowAll;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.requestModel.requestType!,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text.rich(
                TextSpan(
                  children: <InlineSpan>[
                    const TextSpan(
                      text: r'Ngày gửi: ',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: widget.requestModel.dateRequest!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
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
                      text: r'Trạng thái: ',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: widget.requestModel.status!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              if (isShowAll) ...[
                if (widget.requestModel.acceptPerson != null) ...[
                  Text.rich(
                    TextSpan(
                      children: <InlineSpan>[
                        const TextSpan(
                          text: r'Người phụ trách: ',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: widget.requestModel.acceptPerson!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
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
                          text: r'Ngày xác nhận: ',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: widget.requestModel.dateAccept!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
                const Text(
                  r'Yêu cầu sửa đổi',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                for (var i in widget.requestModel.requests!) ...[
                  Text(
                    '- ${i.toString()}',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                ],
              ]
            ],
          ),
        ),
      ),
    );
  }
}
