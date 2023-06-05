import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtubedropdown/models/county_model.dart';
import 'package:youtubedropdown/models/district_model.dart';
import 'package:youtubedropdown/providers/county_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countyPv = Provider.of<CountyProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("MainScreen"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Consumer<CountyProvider>(
                      builder: (BuildContext context, cp, Widget? child) {
                        return Column(
                          children: [
                            DropdownButtonFormField<CountyModel>(
                                items: cp.list
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e.name ?? "-"),
                                        ))
                                    .toList(),
                                onChanged: (v) {
                                  cp.selectedDistrict = null;
                                  cp
                                      .getDistricts(countyId: v?.id)
                                      .then((value) => null);
                                },
                                decoration: InputDecoration(
                                    labelText: "İl", hintText: "İl Seçiniz")),
                            if(cp.disticts.isNotEmpty) DropdownButtonFormField<DistrictModel>(
                              value: null,
                                items: cp.disticts
                                    .map((e) => DropdownMenuItem(
                                          child: Text(e.name ?? "-"),
                                          value: e,
                                        ))
                                    .toList(),
                                onChanged: (v) {},
                                decoration: InputDecoration(
                                    labelText: "İlçe",
                                    hintText: "İlçe Seçiniz"))
                          ],
                        );
                      },
                    );
                  }
                },
                future: countyPv.getList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
