import 'package:flutter/material.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(child: Container(height: 5,color: Color(0xffffaf04),),),
                Expanded(child: Container(height: 5,color: Color(0xffeaeaea),),),

    ],);
  }
}