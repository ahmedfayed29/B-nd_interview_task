part of '../view.dart';

class _TableActions extends StatelessWidget {
  const _TableActions({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = CountriesCubit.of(context);
    return Row(
      children: [
        imageItem(image: Res.prev_first, onTap: () => cubit.changePage(1)),
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
        // Expanded(
        //     child: NumberPaginator(
        //   // by default, the paginator shows numbers as center content
        //   numberPages: cubit.lastPage,
        //   initialPage: cubit.currentPage,
        //   controller: cubit.pageController,
        //   showPrevButton: false,
        //   showNextButton: false,
        //   config: NumberPaginatorUIConfig(
        //     mode: ContentDisplayMode.numbers,
        //     height: 32.height,
        //     buttonSelectedBackgroundColor: AppColors.primary,
        //     buttonUnselectedBackgroundColor: AppColors.gray200,
        //     buttonShape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(5),
        //     ),
        //   ),
        //
        //   onPageChange: (int index) {
        //     print("index is $index");
        //     cubit.changePage(index + 1);
        //   },
        // )),
        Expanded(
            child: PaginationControls(
          currentPage: cubit.currentPage,
          // this should be your current page state variable
          lastPage: cubit.lastPage,
          // this should be your last page state variable
          onPageChanged: (int page) {
            cubit.changePage(page);
            // setState(() {
            //   _currentPage = page;
            //   // Here you would also call your method to fetch the data for the current page
            // });
          },
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
        imageItem(
            image: Res.next_last,
            onTap: () => cubit.changePage(cubit.lastPage)),
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

class PaginationControls extends StatelessWidget {
  final int currentPage;
  final int lastPage;
  final ValueChanged<int> onPageChanged;

  PaginationControls({
    required this.currentPage,
    required this.lastPage,
    required this.onPageChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This function determines which page numbers to show
    List<int> pageList() {
      const int window = 2; // How many pages to show around the current page
      var lowBound = (currentPage - window).clamp(1, lastPage);
      var highBound = (currentPage + window).clamp(1, lastPage);
      if (highBound - lowBound < window * 2) {
        highBound = (lowBound + window * 2).clamp(1, lastPage);
      }
      return List.generate(highBound - lowBound + 1, (i) => lowBound + i);
    }

    print("currentPage $currentPage");
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Generate page number buttons
        for (var i in pageList())
          InkWell(
            onTap: () => onPageChanged(i),
            child: Container(
              width: 32.width,
              height: 32.height,
              margin: EdgeInsets.symmetric(horizontal: 4.width),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color:
                      currentPage == i - 1 ? AppColors.primary : Colors.white,
                  border: Border.all(
                    color: AppColors.gray200,
                  )),
              alignment: Alignment.center,
              child: AppText(
                title: '$i',
                color: currentPage == i - 1 ? Colors.white : Colors.black,
                appTextStyle: AppTextStyle.textMdSemiBold,
              ),
            ),
          ),
      ],
    );
  }
}
