part of '../view.dart';

class _UserType extends StatelessWidget {
  const _UserType({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.of(context);
    final List<TagModel> user =
        context.read<DependenciesCubit>().state.dependenciesModel.data.types;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
            title: tr('user_type'),
            color: AppColors.gray500,
            appTextStyle: AppTextStyle.textMdSemiBold),
        SingleChildScrollView(
          child: Row(
            children: List.generate(
                user.length,
                (index) => radioItem(
                      title: user[index].label,
                      value: user[index].value,
                      group: cubit.userType,
                    )),
          ),
        )
      ],
    );
  }

  Widget radioItem({
    required String title,
    required int value,
    required int group,
  }) {
    print("value is $value group is $group");
    return Row(
      children: [
        Radio(
            value: value,
            activeColor: AppColors.primary,
            groupValue: group,
            onChanged: (val) => null),
        AppText(
            title: title,
            color: AppColors.black,
            appTextStyle: AppTextStyle.textLgSemiBold),
      ],
    );
  }
}
