import 'package:click_app/src/data/models/all_models.dart';
import 'package:click_app/src/presentation/widgets/flux_image.dart';
import 'package:flutter/material.dart';

class CurrencyDataWidget extends StatelessWidget {
  final DataCurrenciesModel dataCurrencyModel;
  const CurrencyDataWidget({Key? key, required this.dataCurrencyModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          FluxImage(
            imageUrl: dataCurrencyModel.flag!,
          ),
          SizedBox(
            width: 3,
          ),
          Text(
            dataCurrencyModel.code!,
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
