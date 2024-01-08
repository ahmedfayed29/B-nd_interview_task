part of '../view.dart';

class _Skills extends StatelessWidget {
  const _Skills({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = RegisterCubit.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
            title: tr('skills'),
            color: AppColors.gray500,
            appTextStyle: AppTextStyle.textMdSemiBold),
        SizedBox(
          height: 8.height,
        ),
        InkWell(
          onTap: () => DownBottomSheet(
                  data: context
                      .read<DependenciesCubit>()
                      .state
                      .dependenciesModel
                      .data
                      .tags,
                  onTab: (value) => cubit.addTag(value as TagModel),
                  context: context,
                  title: tr("skills"))
              .showModal(),
          child: Container(
            width: double.infinity,
            height: cubit.skillsList.isEmpty ? 60.height : null,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.textFieldBG.withOpacity(.03),
            ),
            padding:
                EdgeInsets.symmetric(horizontal: 16.width, vertical: 16.height),
            child: Wrap(
              children: List.generate(
                  cubit.skillsList.length,
                  (index) => Container(
                        margin:
                            EdgeInsets.only(right: 8.width, bottom: 8.height),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.width, vertical: 10.height),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppText(
                                title: cubit.skillsList[index].label,
                                color: AppColors.primary,
                                appTextStyle: AppTextStyle.textXlSemiBold),
                            SizedBox(
                              width: 4.width,
                            ),
                            InkWell(
                                onTap: () => cubit.removeTag(index),
                                child: Icon(
                                  Icons.clear,
                                  color: AppColors.primary,
                                ))
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primary100,
                        ),
                      )),
            ),
          ),
        )
      ],
    );
  }
}
