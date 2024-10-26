import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/services/injection_container.dart';
import '../../../../core/utils/utils.dart';
import '../../domain/entities/entities.dart';
import '../bloc/general_bloc.dart';
import '../widgets/widgets.dart';
import 'about_me/about_me_page.dart';
import 'education_page.dart';
import 'experience_page.dart';
import 'projects_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GeneralBloc bloc = getIt<GeneralBloc>();
  UserEntity? userData;
  int coount = 0;

  @override
  void didChangeDependencies() {
    Locale locale = Localizations.localeOf(context);
    bloc.add(GetUserInfoEvent(languageCode: locale.languageCode));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations l10n = AppLocalizations.of(context)!;
    return BlocProvider.value(
      value: bloc,
      child: BlocListener<GeneralBloc, GeneralState>(
        listener: (context, state) {
          if (state is SuccessGetUserInfoState) {
            userData = state.userData;
          }
        },
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: BaseColor.background,
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(2.h),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              Constants.avatarPC,
                              height: 35.h,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text("Jhonatan Gaviria M.", style: CustomText.textBlackSemiBold14),
                              ),
                              BlocSelector<GeneralBloc, GeneralState, SuccessGetUserInfoState?>(
                                selector: (state) => state is SuccessGetUserInfoState ? state : null,
                                builder: (context, state) {
                                  return Container(
                                    decoration: BoxDecoration(color: BaseColor.blueClearly, borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      child: Text(state?.userData.jobTitle ?? "", style: CustomText.textBlueSemiBold10),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                          SizedBox(height: 1.h),
                          GeneralButton(
                            text: l10n.contactMe,
                            onPressed: () async {
                              final Uri url = Uri.parse(Constants.urlWhatsApp);
                              if (!await launchUrl(url)) {}
                            },
                          ),
                          SizedBox(height: 1.h),
                          Expanded(
                              child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Divider(),
                                SizedBox(height: 1.h),
                                Text(l10n.doYouWantToWorkWithMe, style: CustomText.textBlackSemiBold10),
                                SizedBox(height: 1.h),
                                Text(
                                  l10n.ifYouWantToCommunicatewithMe,
                                  style: CustomText.textGrayNormal10,
                                  textAlign: TextAlign.justify,
                                ),
                                SizedBox(height: 2.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    HomeOption(
                                        text: l10n.aboutMe,
                                        svgIconPath: Constants.aboutMeIcon,
                                        onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => const AboutMePage()),
                                            )),
                                    const SizedBox(width: 16),
                                    HomeOption(
                                      text: l10n.education,
                                      svgIconPath: Constants.educationIcon,
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const EducationPage()),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    HomeOption(
                                      text: l10n.projects,
                                      svgIconPath: Constants.projectsIcon,
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const ProjectsPage()),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    HomeOption(
                                      text: l10n.experience,
                                      svgIconPath: Constants.experienceIcons,
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const ExperiencePage()),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BlocSelector<GeneralBloc, GeneralState, LoadingState?>(
              selector: (state) => state is LoadingState ? state : null,
              builder: (context, state) {
                return Visibility(
                  visible: state?.isLoading ?? false,
                  child: const CustomLoading(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
