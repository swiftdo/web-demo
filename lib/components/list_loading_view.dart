import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:web_demo/style/context_style.dart';

class ListLoadingView extends StatelessWidget {
  const ListLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitWave(
      color: context.primaryColor,
      type: SpinKitWaveType.start,
    );
  }
}
