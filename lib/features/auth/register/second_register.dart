part of 'view.dart';

class SecondRegister extends StatelessWidget {
  final RegisterCubit cubit;

  const SecondRegister({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: cubit,
        child: BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) {
            final cubit = RegisterCubit.of(context);
            return ListView(
              padding: EdgeInsets.only(
                  left: 16.width,
                  right: 16.width,
                  bottom: 32.height,
                  top: 20 + Utils.topDevicePadding),
              children: [
                _RegisterHeader(),
                SizedBox(
                  height: 32.height,
                ),
                Form(key: cubit.formKey2, child: _RegisterSecInput()),
                AppButton(
                  title: tr('submit'),
                  borderColor: AppColors.primary,
                  onTap: () => cubit.register(),
                  showArrow: true,
                  titleColor: AppColors.white,
                  color: AppColors.primary,
                  margin: EdgeInsets.only(top: 24.height),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
