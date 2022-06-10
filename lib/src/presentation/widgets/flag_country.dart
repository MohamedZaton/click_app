import 'package:click_app/src/presentation/widgets/flux_image.dart';
import 'package:flutter/material.dart';

class FlagCountryWidget extends StatelessWidget {
  final String flagImgPath;
  final String name;
  final Function()? onTap;

  const FlagCountryWidget(
      {Key? key, required this.flagImgPath, required this.name, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 80,
        height: 50,
        child: Row(
          children: [
            FluxImage(
              imageUrl: flagImgPath,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}
