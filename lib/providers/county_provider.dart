import 'package:flutter/material.dart';

import '../helpers/api.dart';
import '../models/county_model.dart';
import '../models/district_model.dart';

class CountyProvider with ChangeNotifier{
  final _api = Api();
  List<CountyModel> _list = [];

  List<CountyModel> get list => _list;

  Future<void> getList() async {
    final result = await _api.dioGet(url: 'county');
    if(result?.statusCode == 200){
      var _datas = <CountyModel>[];
      Iterable _iterable = result?.data;
      _datas = _iterable.map((e) => CountyModel.fromJson(e)).toList();
      _list = _datas;
    } else {
      _list = [];
    }
    notifyListeners();
  }
  
  List<DistrictModel> _disticts = [];

  List<DistrictModel> get disticts => _disticts;
  DistrictModel? _selectedDistrict;


  DistrictModel? get selectedDistrict => _selectedDistrict;

  set selectedDistrict(DistrictModel? value) {
    _selectedDistrict = value;
    notifyListeners();
  }

  Future<void> getDistricts({ String? countyId})async {
    _disticts = [];
    notifyListeners();
    final result = await _api.dioGet(url: "district/getByCounty?county=$countyId");
    if(result?.statusCode == 200){
      var _datas = <DistrictModel>[];
      Iterable _iterable = result?.data;
      _datas = _iterable.map((e) => DistrictModel.fromJson(e)).toList();
       _disticts = _datas;
    }
    print('ilçeler uzunluk : ${_disticts.length}');
    notifyListeners();
  }
}