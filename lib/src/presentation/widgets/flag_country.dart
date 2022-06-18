import 'package:click_app/src/data/models/currency_model.dart';
import 'package:click_app/src/presentation/widgets/flux_image.dart';
import 'package:flutter/material.dart';

class FlagCountryWidget extends StatelessWidget {
  final CurrencyModel currencyModel;
  const FlagCountryWidget({Key? key, required this.currencyModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          FluxImage(
            imageUrl: currencyModel.flagImg!,
          ),
          SizedBox(
            width: 3,
          ),
          Text(
            currencyModel.name!,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.blue),
          )
        ],
      ),
    );
  }
}
