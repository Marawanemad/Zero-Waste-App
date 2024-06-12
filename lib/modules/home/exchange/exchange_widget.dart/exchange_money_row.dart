import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/assets.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

class ExchangeMoneyRow extends StatefulWidget {
  const ExchangeMoneyRow({
    super.key,
    required this.money,
    required this.pointValue,
    this.isSelected = false,
    required this.onSelected,
  });

  final String money;
  final String pointValue;
  final bool isSelected;
  final VoidCallback onSelected;
  @override
  State<ExchangeMoneyRow> createState() => _ExchangeMoneyRowState();
}

class _ExchangeMoneyRowState extends State<ExchangeMoneyRow> {
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: Container(
        height: 56,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: CustomColors.vividGreen49.withOpacity(0.6)),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            setState(() {
              widget.onSelected();
            });
          },
          child: Row(
            children: [
              Container(
                width: 72,
                decoration: ShapeDecoration(
                  color: CustomColors.vividGreen49.withOpacity(0.6),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                  ),
                ),
                child: const Image(
                  image: AssetImage(Assets.imagesHomeExchangeCoin),
                  fit: BoxFit.cover,
                  height: 86,
                ),
              ),
              const SizedBox(width: 25),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "${widget.money} EGP\n",
                    style: CustomTextStyle.semiBold20
                        .copyWith(color: Colors.black)
                        .responsive(context)),
                TextSpan(
                    text: "${widget.pointValue} point",
                    style: CustomTextStyle.regular12.responsive(context)),
              ])),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(right: 15),
                width: 36,
                height: 36,
                decoration: ShapeDecoration(
                  shape: const CircleBorder(
                    side: BorderSide(color: CustomColors.vividGreen49),
                  ),
                  color: widget.isSelected
                      ? CustomColors.vividGreen49
                      : Colors.white.withOpacity(0),
                ),
                child: widget.isSelected
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                      )
                    : const SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
