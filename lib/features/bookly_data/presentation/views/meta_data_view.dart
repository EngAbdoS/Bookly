import 'package:bookly/features/bookly_data/presentation/views/widgets/meta_data_body.dart';
import 'package:flutter/material.dart';
class MetaDataView extends StatelessWidget {
  const MetaDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MetaDataBody(),
    );
  }
}
