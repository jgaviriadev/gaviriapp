import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/services/injection_container.dart';
import '../../../../../core/utils/utils.dart';
import '../../bloc/general_bloc.dart';
import '../../widgets/widgets.dart';
import 'widgets/skill_card.dart';

class AboutMePage extends StatelessWidget {
  static const String routeName = '/about-me';
  const AboutMePage({super.key});
  @override
  Widget build(BuildContext context) {
    final GeneralBloc bloc = getIt<GeneralBloc>();
    AppLocalizations l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: BaseColor.background,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              pageName: l10n.aboutMe,
            ),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.only(left: 2.h, right: 2.h, bottom: 2.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            Constants.avatarImg,
                            width: 36.w,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Jhonatan Gaviria M.",
                                  style: CustomText.textBlackSemiBold14
                                ),
                                const SizedBox(height: 8),
                                GestureDetector(
                                  onTap: () async {
                                    final Uri url = Uri.parse(Constants.urlWhatsApp);
                                    await launchUrl(url);
                                  },
                                  child: Text(
                                    bloc.user.phone ?? "",
                                    style: CustomText.textBlueSemiBold10
                                  ),
                                ),
                                const SizedBox(height: 8),
                                GestureDetector(
                                  onTap: () async {
                                    final Uri emailLaunchUri = Uri(
                                      scheme: 'mailto',
                                      path: bloc.user.email ?? "",
                                      query: encodeQueryParameters(<String, String>{
                                        'subject': l10n.interestInDevelopment,
                                      }),
                                    );
                                    await launchUrl(emailLaunchUri);
                                  },
                                  child: Text(
                                    bloc.user.email ?? "",
                                    style: CustomText.textBlackNormal10
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.all(1.h),
                                child: Column(
                                  children: [
                                    Text(
                                      l10n.developer,
                                      style: CustomText.textBlueSemiBold10
                                    ),
                                    Text(
                                      l10n.profession,
                                      style: CustomText.textBlackNormal10
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 0.5,
                              height: 5.h,
                              color: BaseColor.grayText,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      getCurrentAge(),
                                      style: CustomText.textBlueSemiBold10,
                                    ),
                                    Text(
                                      l10n.age,
                                      style: CustomText.textBlackNormal10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 0.5,
                              height: 5.h,
                              color: BaseColor.grayText,
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Colombia",
                                      style: CustomText.textBlueSemiBold10,
                                    ),
                                    Text(
                                      l10n.country,
                                      style: CustomText.textBlackNormal10
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Links",
                        style: CustomText.textBlackBold10
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(5),
                              onTap: () async {
                                final Uri url = Uri.parse(bloc.user.linkedin ?? "");
                                await launchUrl(url);
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 8.w,
                                        height: 8.w,
                                        decoration: BoxDecoration(
                                          color: BaseColor.blueClearly,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(Constants.linkedinIcon),
                                        )
                                      ),
                                      const SizedBox(width: 24),
                                      Text(
                                        "LinkedIn",
                                        style: CustomText.textBlackBold10
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(5),
                              onTap: () async{
                                final Uri url = Uri.parse(bloc.user.github ?? "");
                                await launchUrl(url);
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 8.w,
                                        height: 8.w,
                                        decoration: BoxDecoration(
                                          color: BaseColor.blueClearly,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(Constants.githubIcon),
                                        )
                                      ),
                                      const SizedBox(width: 24),
                                      Text(
                                        "Github",
                                        style: CustomText.textBlackBold10
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        l10n.summary,
                        style: CustomText.textBlackBold10
                      ),
                      const SizedBox(height: 8),
                      Text(
                        bloc.user.summary ?? "",
                        style: CustomText.textBlackNormal10,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Skills",
                        style: CustomText.textBlackBold10
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: Wrap(
                          spacing: 20,
                          runSpacing: 10,
                          alignment: WrapAlignment.center,
                          children: bloc.user.skills!.map((e) => 
                            SkillCard(
                              name: e.name ?? "",
                              url: e.img ?? "",
                            )).toList(),
                        ),
                      )
                    ],
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}