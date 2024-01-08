part of '../view.dart';

class _Table extends StatelessWidget {
  const _Table({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.width, vertical: 14.height),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
        ),
        child: Column(
          children: [
            _TableHeader(),
            Expanded(
                child: ListView.separated(
                    padding: EdgeInsets.only(top: 14.height),
                    itemBuilder: (_, index) =>
                        _TableItem(title: "Egypt", value: "Cairo"),
                    separatorBuilder: (_, index) => Padding(
                          padding: EdgeInsets.only(bottom: 14.height),
                          child: Divider(
                            color: AppColors.gray100,
                          ),
                        ),
                    itemCount: 10))
          ],
        ),
      ),
    );
  }
}
