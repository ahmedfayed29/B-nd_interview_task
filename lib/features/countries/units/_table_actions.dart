part of '../view.dart';

class _TableActions extends StatelessWidget {
  const _TableActions({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = CountriesCubit.of(context);
    return Row(
      children: [
        imageItem(image: Res.prev_first, onTap: () => cubit.changePage(0)),
        SizedBox(
          width: 5.width,
        ),
        imageItem(
            image: Res.prev,
            onTap: () {
              if (cubit.currentPage > 0)
                cubit.changePage(cubit.currentPage - 1);
            }),
        SizedBox(
          width: 5.width,
        ),
        Expanded(
            child: NumberPaginator(
          // by default, the paginator shows numbers as center content
          numberPages: 10,
          initialPage: cubit.currentPage,
          controller: cubit.pageController,
          showPrevButton: false,
          showNextButton: false,
          config: NumberPaginatorUIConfig(
            mode: ContentDisplayMode.numbers,
            height: 32.height,
            buttonSelectedBackgroundColor: AppColors.primary,
            buttonUnselectedBackgroundColor: AppColors.gray200,
            buttonShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),

          onPageChange: (int index) => cubit.changePage(index),
        )),
        SizedBox(
          width: 5.width,
        ),
        imageItem(
            image: Res.next,
            onTap: () => cubit.changePage(cubit.currentPage + 1)),
        SizedBox(
          width: 5.width,
        ),
        imageItem(image: Res.next_last, onTap: () => cubit.changePage(9)),
      ],
    );
  }

  Widget imageItem({required String image, required VoidCallback onTap}) =>
      InkWell(
        onTap: onTap,
        child: Image.asset(
          image,
          width: 32.width,
          height: 32.height,
        ),
      );
}
