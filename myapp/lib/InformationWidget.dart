import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInfo extends StatefulWidget {

  final double subBill;
  final double tipPercentage;
  final int split;

  CustomInfo({
    Key? key,
    required this.subBill,
    required this.tipPercentage,
    required this.split,
  }):super(key: key);

  @override
  State<CustomInfo> createState() => _CustomInfoState();
}

class _CustomInfoState extends State<CustomInfo> {

  late double _subBill;
  late double _tipPercentage;
  late int _split;
  late double tipBill=0;
  late double totalBill=0;
  late int totalBill1=0;
  late int totalBill2=0;

  final TextStyle numberStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  final TextStyle textStyle = const TextStyle(
    fontSize: 16,
    color: Colors.white,
  );

  @override
  void initState() {
    _subBill=0;
    _tipPercentage=0;
    _split=1;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    if(widget.split!=0&&(widget.tipPercentage!=_tipPercentage ||widget.subBill!=_subBill ||widget.split!=_split) ){
      _split=widget.split;
      _subBill=widget.subBill/_split;
      _tipPercentage=widget.tipPercentage;
      tipBill =_subBill*_tipPercentage;
      totalBill=_subBill+tipBill;
      totalBill1=totalBill.floor();
      totalBill2=((totalBill-totalBill1)*100).floor();
    }
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                          height: 10.0
                      ),
                      Text(
                        "\$",
                        style: numberStyle,
                      ),
                      RichText(
                        text: TextSpan(
                          style: numberStyle,
                          children: [
                            TextSpan(text: totalBill1.toString(), style: TextStyle(fontSize: 48,)),
                            TextSpan(text: ' '),
                            TextSpan(text: '.${totalBill2.toString()}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Total",
                    style: textStyle,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 120,
            child: VerticalDivider(
              thickness: 0.5,
              color: Colors.grey,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 0, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("SUBTOTAL",style: textStyle,),
                  Text("\$ ${_subBill.toStringAsFixed(2)}",style: numberStyle,),
                  const SizedBox(height: 20,),
                  Text("TIP",style: textStyle,),
                  Text("\$ ${tipBill.toStringAsFixed(2)}",style: numberStyle,),
                ],
              ),
            ),
          ),
        ],
      );
  }
}
