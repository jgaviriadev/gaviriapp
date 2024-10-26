import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/utils.dart';
import '../../domain/entities/entities.dart';

class ProjectCard extends StatefulWidget {
  final ProjectEntity project;
  const ProjectCard({
    super.key, required this.project,
  });


  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool bodyVisible = false;
  @override
  Widget build(BuildContext context) {
    AppLocalizations l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.h, left: 1.h, right: 1.h),
                  child: Container(
                    width: double.infinity,
                    height: 25.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Swiper(
                      viewportFraction: 0.8,
                      scale: 0.9,
                      autoplay: true,
                      itemCount: widget.project.img?.length ?? 0,
                      //layout: SwiperLayout.STACK,
                      itemBuilder: (_, int index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(
                            imageUrl: widget.project.img![index],
                            placeholder: (_, __) => Center(
                              child: CircularProgressIndicator(
                                color: BaseColor.blue,
                              ),
                            ),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2.h),
                  child: Container(
                    decoration: BoxDecoration(color: BaseColor.blue, borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Text(
                        widget.project.platform ?? "",
                        style: CustomText.textWhiteBold8
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.project.name ?? "",
                              style: CustomText.textBlueBold10
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              widget.project.technologies ?? "",
                              style: CustomText.textBlackBold8
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: BaseColor.blueClearly,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        width: 24,
                        height: 24,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              bodyVisible = !bodyVisible;
                            });
                          }, 
                          child: Icon(
                            bodyVisible ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
                            color: BaseColor.blue,
                          )
                        ),
                      ),
                    ],
                  ),
                  bodyVisible ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 2.h),
                      Text(
                        widget.project.desc ?? "",
                        style: CustomText.textBlackNormal10,
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 2.h),
                      if((widget.project.url ?? "") != "")GestureDetector(
                        onTap: () async {
                          final Uri url = Uri.parse(widget.project.url!);
                          await launchUrl(url);
                        },
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: BaseColor.blueClearly,
                                borderRadius: BorderRadius.circular(5)
                              ),
                              width: 24,
                              height: 24,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    bodyVisible = !bodyVisible;
                                  });
                                }, 
                                child: Icon(
                                  Icons.link,
                                  color: BaseColor.blue,
                                )
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              l10n.view,
                              style: CustomText.textBlueBold10,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ) : const SizedBox()
                ],
              ),
            )
            
          ],
        ),
      ),
    );
  }
}