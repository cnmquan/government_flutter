// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetbookGenerator
// **************************************************************************

import 'dart:core';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/material/button.dart';
import 'package:flutter/src/material/color_scheme.dart';
import 'package:flutter/src/material/floating_action_button_theme.dart';
import 'package:flutter/src/material/material_state.dart';
import 'package:flutter/src/material/scaffold.dart';
import 'package:flutter/src/material/text_theme.dart';
import 'package:flutter/src/material/theme.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:flutter/src/material/tooltip.dart';
import 'package:flutter/widgets.dart';
import 'package:goverment_flutter_system/models.dart';
import 'package:goverment_flutter_system/pages/mobile/detailed/birth_certificate_page.dart';
import 'package:goverment_flutter_system/pages/mobile/detailed/idcard_page.dart';
import 'package:goverment_flutter_system/pages/mobile/detailed/registration_book_page.dart';
import 'package:goverment_flutter_system/pages/mobile/detailed/request_paper_page.dart';
import 'package:goverment_flutter_system/pages/mobile/global/forget_password_page.dart';
import 'package:goverment_flutter_system/pages/mobile/global/home_page.dart';
import 'package:goverment_flutter_system/pages/mobile/global/not_found_page.dart';
import 'package:goverment_flutter_system/pages/mobile/global/sign_in_page.dart';
import 'package:goverment_flutter_system/pages/mobile/global/sign_up_page.dart';
import 'package:goverment_flutter_system/pages/web/detailed/accept_request_page.dart';
import 'package:goverment_flutter_system/pages/web/detailed/mange_employee_page.dart';
import 'package:goverment_flutter_system/pages/web/detailed/search_information_page.dart';
import 'package:goverment_flutter_system/pages/web/detailed/statistic_people_page.dart';
import 'package:goverment_flutter_system/pages/web/detailed/statistic_report_page.dart';
import 'package:goverment_flutter_system/pages/web/global/forget_password_page.dart';
import 'package:goverment_flutter_system/pages/web/global/home_page.dart';
import 'package:goverment_flutter_system/pages/web/global/not_found_page.dart';
import 'package:goverment_flutter_system/pages/web/global/sign_in_page.dart';
import 'package:goverment_flutter_system/theme.dart';
import 'package:goverment_flutter_system/utils/assets.dart';
import 'package:goverment_flutter_system/utils/routing.dart';
import 'package:goverment_flutter_system/utils/translation.dart';
import 'package:goverment_flutter_system/utils/translation/text_path.dart';
import 'package:goverment_flutter_system/widgets/mobile.dart';
import 'package:goverment_flutter_system/widgets/mobile/detailed/auth_text_field_widget.dart';
import 'package:goverment_flutter_system/widgets/mobile/global/appbar_widget.dart';
import 'package:goverment_flutter_system/widgets/mobile/global/circle_image_widget.dart';
import 'package:goverment_flutter_system/widgets/mobile/global/custom_button_widget.dart';
import 'package:goverment_flutter_system/widgets/mobile/global/custom_floating_button_widget.dart';
import 'package:goverment_flutter_system/widgets/mobile/global/custom_text_field_widget.dart';
import 'package:goverment_flutter_system/widgets/mobile/global/image_box_text_widget.dart';
import 'package:goverment_flutter_system/widgets/mobile/notify/loading_widget.dart';
import 'package:goverment_flutter_system/widgets/mobile/notify/notify_message_widget.dart';
import 'package:goverment_flutter_system/widgets/web.dart';
import 'package:lottie/lottie.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(HotReload());
}

class HotReload extends StatelessWidget {
  const HotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook<ThemeData>(
      appInfo: AppInfo(
        name: 'Government Demo',
      ),
      themes: [
        WidgetbookTheme(
          name: 'Light Theme',
          data: getLightTheme(),
        ),
        WidgetbookTheme(
          name: 'Dark Theme',
          data: getDarkTheme(),
        ),
      ],
      devices: [
        Device(
          name: 'iPhone 13',
          resolution: Resolution(
            nativeSize: DeviceSize(
              height: 2532.0,
              width: 1170.0,
            ),
            scaleFactor: 3.0,
          ),
          type: DeviceType.mobile,
        ),
        Device(
          name: 'S21 Ultra',
          resolution: Resolution(
            nativeSize: DeviceSize(
              height: 3200.0,
              width: 1440.0,
            ),
            scaleFactor: 3.75,
          ),
          type: DeviceType.mobile,
        ),
        Device(
          name: 'iMac M1',
          resolution: Resolution(
            nativeSize: DeviceSize(
              height: 2520.0,
              width: 4480.0,
            ),
            scaleFactor: 2.0,
          ),
          type: DeviceType.desktop,
        ),
      ],
      categories: [
        WidgetbookCategory(
          name: 'use cases',
          folders: [
            WidgetbookFolder(
              name: 'widgets',
              widgets: [],
              folders: [
                WidgetbookFolder(
                  name: 'mobile',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'detailed',
                      widgets: [
                        WidgetbookComponent(
                          name: 'AuthTextFieldWidget',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Password',
                              builder: (context) => password(context),
                            ),
                            WidgetbookUseCase(
                              name: 'Phone Number',
                              builder: (context) => phoneNumber(context),
                            ),
                            WidgetbookUseCase(
                              name: 'Default',
                              builder: (context) => defaultTextField(context),
                            ),
                          ],
                        ),
                      ],
                      folders: [],
                    ),
                    WidgetbookFolder(
                      name: 'global',
                      widgets: [
                        WidgetbookComponent(
                          name: 'AppbarWidget',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Long title',
                              builder: (context) => appbarLongTitle(context),
                            ),
                            WidgetbookUseCase(
                              name: 'Short title',
                              builder: (context) => appbarShortTitle(context),
                            ),
                            WidgetbookUseCase(
                              name: 'Can back page',
                              builder: (context) => appbarBackPage(context),
                            ),
                          ],
                        ),
                        WidgetbookComponent(
                          name: 'ImageBoxTextWidget',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Short title',
                              builder: (context) =>
                                  shortTitleImageBoxTextWidget(context),
                            ),
                            WidgetbookUseCase(
                              name: 'Long title',
                              builder: (context) =>
                                  longTitleImageBoxTextWidget(context),
                            ),
                            WidgetbookUseCase(
                              name: 'Small size',
                              builder: (context) =>
                                  smallSizeImageBoxTextWidget(context),
                            ),
                            WidgetbookUseCase(
                              name: 'Medium size',
                              builder: (context) =>
                                  mediumSizeImageBoxTextWidget(context),
                            ),
                            WidgetbookUseCase(
                              name: 'Large size',
                              builder: (context) =>
                                  largeSizeImageBoxTextWidget(context),
                            ),
                          ],
                        ),
                        WidgetbookComponent(
                          name: 'CircleImageWidget',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Small',
                              builder: (context) =>
                                  smallCircleImageWidget(context),
                            ),
                            WidgetbookUseCase(
                              name: 'Large',
                              builder: (context) =>
                                  largeCircleImageWidget(context),
                            ),
                          ],
                        ),
                        WidgetbookComponent(
                          name: 'CustomButtonWidget',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Short title',
                              builder: (context) =>
                                  shortTitleCustomButtonWidget(context),
                            ),
                            WidgetbookUseCase(
                              name: 'Long title',
                              builder: (context) =>
                                  longTitleCustomButtonWidget(context),
                            ),
                          ],
                        ),
                        WidgetbookComponent(
                          name: 'CustomTextFieldWidget',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Editable Textfield',
                              builder: (context) => editableTextField(context),
                            ),
                            WidgetbookUseCase(
                              name: 'Not Editable Textfield',
                              builder: (context) =>
                                  notEditableTextField(context),
                            ),
                          ],
                        ),
                      ],
                      folders: [],
                    ),
                    WidgetbookFolder(
                      name: 'notify',
                      widgets: [
                        WidgetbookComponent(
                          name: 'LoadingWidget',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Loading',
                              builder: (context) => loadingWidget(context),
                            ),
                          ],
                        ),
                        WidgetbookComponent(
                          name: 'NotifyMessageWidget',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Not found',
                              builder: (context) => notFound(context),
                            ),
                            WidgetbookUseCase(
                              name: 'Success',
                              builder: (context) => success(context),
                            ),
                            WidgetbookUseCase(
                              name: 'Coming soon',
                              builder: (context) => comingSoon(context),
                            ),
                          ],
                        ),
                      ],
                      folders: [],
                    ),
                  ],
                ),
              ],
            ),
            WidgetbookFolder(
              name: 'material',
              widgets: [
                WidgetbookComponent(
                  name: 'FloatingActionButton',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'FloatingActionButton',
                      builder: (context) =>
                          customFloatingActionButtonWidget(context),
                    ),
                  ],
                ),
              ],
              folders: [],
            ),
            WidgetbookFolder(
              name: 'pages',
              widgets: [],
              folders: [
                WidgetbookFolder(
                  name: 'web',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'detailed',
                      widgets: [
                        WidgetbookComponent(
                          name: 'StatisticReportPage',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Page',
                              builder: (context) =>
                                  statisticReportPage(context),
                            ),
                          ],
                        ),
                        WidgetbookComponent(
                          name: 'StatisticPeoplePage',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Page',
                              builder: (context) =>
                                  statisticPeoplePage(context),
                            ),
                          ],
                        ),
                        WidgetbookComponent(
                          name: 'SearchInformationPage',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Page',
                              builder: (context) =>
                                  searchInformationPage(context),
                            ),
                          ],
                        ),
                        WidgetbookComponent(
                          name: 'AcceptRequestPage',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Page',
                              builder: (context) => acceptRequestPage(context),
                            ),
                          ],
                        ),
                        WidgetbookComponent(
                          name: 'ManageEmployeePage',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Page',
                              builder: (context) => manageEmployeePage(context),
                            ),
                          ],
                        ),
                      ],
                      folders: [],
                    ),
                    WidgetbookFolder(
                      name: 'global',
                      widgets: [
                        WidgetbookComponent(
                          name: 'SignInPage',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Page',
                              builder: (context) => signInPage(context),
                            ),
                          ],
                        ),
                        WidgetbookComponent(
                          name: 'ForgetPasswordPage',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Page',
                              builder: (context) => forgetPasswordPage(context),
                            ),
                          ],
                        ),
                        WidgetbookComponent(
                          name: 'NotFoundPage',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Page',
                              builder: (context) => notFoundPage(context),
                            ),
                          ],
                        ),
                        WidgetbookComponent(
                          name: 'HomePage',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Page',
                              builder: (context) => homePage(context),
                            ),
                          ],
                        ),
                      ],
                      folders: [],
                    ),
                  ],
                ),
                WidgetbookFolder(
                  name: 'mobile',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'detailed',
                      widgets: [
                        WidgetbookComponent(
                          name: 'IdCardPage',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Page',
                              builder: (context) => idCardPage(context),
                            ),
                          ],
                        ),
                        WidgetbookComponent(
                          name: 'RequestPaperPage',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Page',
                              builder: (context) => requestPaperPage(context),
                            ),
                          ],
                        ),
                        WidgetbookComponent(
                          name: 'BirthCertificatePage',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Page',
                              builder: (context) =>
                                  birthCertificatePage(context),
                            ),
                          ],
                        ),
                        WidgetbookComponent(
                          name: 'RegistrationBookPage',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Page',
                              builder: (context) =>
                                  registrationBookPage(context),
                            ),
                          ],
                        ),
                      ],
                      folders: [],
                    ),
                    WidgetbookFolder(
                      name: 'global',
                      widgets: [
                        WidgetbookComponent(
                          name: 'SignInPage',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Page',
                              builder: (context) => signInPageGlobal(context),
                            ),
                          ],
                        ),
                        WidgetbookComponent(
                          name: 'ForgetPasswordPage',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Page',
                              builder: (context) =>
                                  forgetPasswordPageGlobal(context),
                            ),
                          ],
                        ),
                        WidgetbookComponent(
                          name: 'SignUpPage',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Page',
                              builder: (context) => signUpPageGlobal(context),
                            ),
                          ],
                        ),
                        WidgetbookComponent(
                          name: 'NotFoundPage',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Page',
                              builder: (context) => notFoundPageGlobal(context),
                            ),
                          ],
                        ),
                        WidgetbookComponent(
                          name: 'HomePage',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Page',
                              builder: (context) => homePageGlobal(context),
                            ),
                          ],
                        ),
                      ],
                      folders: [],
                    ),
                  ],
                ),
              ],
            ),
          ],
          widgets: [],
        ),
      ],
    );
  }
}
