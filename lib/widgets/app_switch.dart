import 'package:flutter/cupertino.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';

class AppSwitch extends StatefulWidget {
  const AppSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.rotate = true,
    this.color = AppColors.green,
  });

  final bool value;
  final void Function(bool) onChanged;
  final bool rotate;
  final Color color;

  @override
  State<AppSwitch> createState() => _AppSwitchState();
}

class _AppSwitchState extends State<AppSwitch> {
  late bool value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32.width,
      height: 24.height,
      child: Transform.scale(
        transformHitTests: false,
        scale: 0.7,
        child: RotatedBox(
          quarterTurns: widget.rotate ? 2 : 0,
          child: CupertinoSwitch(
            value: value,
            onChanged: (v) {
              value = v;
              setState(() {});
              widget.onChanged(value);
            },
            activeColor: widget.color,
          ),
        ),
      ),
    );
  }
}
