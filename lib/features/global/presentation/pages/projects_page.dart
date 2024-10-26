import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jgaviriadev_app/core/utils/base_color.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/services/injection_container.dart';
import '../../../../core/utils/utils.dart';
import '../bloc/general_bloc.dart';
import '../widgets/widgets.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});
  @override
  Widget build(BuildContext context) {
    AppLocalizations l10n = AppLocalizations.of(context)!;
    final GeneralBloc bloc = getIt<GeneralBloc>();
    return Scaffold(
      backgroundColor: BaseColor.background,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              pageName: l10n.projects,
            ),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.only(left: 2.h, right: 2.h, bottom: 2.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: bloc.user.projects!.map((e) => ProjectCard(project: e,),).toList()
                  ),
                )
              )
            )
          ],
        ),
      ),
    );
  }
}

