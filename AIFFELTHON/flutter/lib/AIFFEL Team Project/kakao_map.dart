import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import 'CustomAppBar.dart';

class KakaoMaps extends StatefulWidget {
  const KakaoMaps({super.key});


  @override
  State<KakaoMaps> createState() => _KakaoMapsState();
}

class _KakaoMapsState extends State<KakaoMaps> {
  Position? _currentPosition;
  List<dynamic> _hospitals = [];
  late KakaoMapController mapController;
  bool isTrafficLine = false;

  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _loadHospitals();
  }

  Future<void> _loadHospitals() async {
    try {
      final String response = await rootBundle.loadString('assets/hospitals.json');
      final data = await json.decode(response);
      final Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      // 병원과 사용자 위치와의 거리를 계산하고, 거리에 따라 정렬
      List<dynamic> sortedHospitals = (data as List).map((hospital) {
        double latitude;
        double longitude;
        if (hospital['좌표(Y)'] is String) {
          latitude = double.parse(hospital['좌표(Y)']);
        } else {
          latitude = hospital['좌표(Y)'];
        }
        if (hospital['좌표(X)'] is String) {
          longitude = double.parse(hospital['좌표(X)']);
        } else {
          longitude = hospital['좌표(X)'];
        }
        double distance = Geolocator.distanceBetween(currentPosition.latitude, currentPosition.longitude, latitude, longitude);
        return {
          'hospital': hospital,
          'distance': distance,
        };
      }).toList();

      sortedHospitals.sort((a, b) => a['distance'].compareTo(b['distance']));
      List nearestHospitals = sortedHospitals.take(10).map((e) => e['hospital']).toList();

      setState(() {
        _hospitals = nearestHospitals;
      });

      // 병원 위치에 마커 추가
      markers.clear(); // 기존 마커를 클리어
      for (var hospital in _hospitals) {
        double latitude = hospital['좌표(Y)'] is String ? double.parse(hospital['좌표(Y)']) : hospital['좌표(Y)'];
        double longitude = hospital['좌표(X)'] is String ? double.parse(hospital['좌표(X)']) : hospital['좌표(X)'];
        String markerId = 'hospital_${DateTime.now().millisecondsSinceEpoch}';
        String hospitalName = hospital['요양기관명']; // 병원명을 변수로 저장
        Marker marker = Marker(
          markerId: markerId,
          latLng: LatLng(latitude, longitude),
          infoWindowContent: '<div style="padding:10px;">$hospitalName <br> <a href="https://map.kakao.com/link/map/$hospitalName,$latitude,$longitude" style="color:blue" target="_blank">큰 지도 보기</a> <a href="https://map.kakao.com/link/to/$hospitalName,$latitude,$longitude" style="color:blue" target="_blank">길찾기</a> </div>',
          infoWindowRemovable: false,
          infoWindowFirstShow: true,
        );
        markers.add(marker);
      }
      setState(() {});
    } catch(e) {
      print('병원 데이터를 불러오는 데 실패했습니다: $e');
    }
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // 위치 서비스가 비활성화되어 있습니다.
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // 권한이 거부되었습니다.
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // 권한이 영구적으로 거부되었습니다.
      return;
    }

    // 현재 위치를 얻습니다.
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentPosition = position;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          backgroundColor: Color(0xFFE7E1DE),
          appBar: CustomAppBar(
            titleText: '병원 상세 지도',
            onBackPressed: () {
              Navigator.pop(context);
            },
            onSettingPressed: () {
              Navigator.pushNamed(context, '/six');
            },
          ),
          body: _currentPosition == null
              ? Center(child: CircularProgressIndicator())
              : Stack(
                  children: [
                    KakaoMap(
                      currentLevel: 4,
                      center: LatLng(_currentPosition!.latitude, _currentPosition!.longitude), // 지도의 중심 위치 설정
                      onMapCreated: ((controller) async {
                        mapController = controller;

                        // 현재 위치를 기반으로 마커 생성
                        markers.add(Marker(
                          markerId: UniqueKey().toString(), // 고유한 ID 할당
                          latLng: LatLng(_currentPosition!.latitude, _currentPosition!.longitude), // 현재 위치의 위도와 경도
                          infoWindowContent: '<div style="padding:10px;">내 위치</div>',
                          infoWindowFirstShow: true,
                          infoWindowRemovable: false
                        ));
                        setState(() {});
                      }),
                      markers: markers.toList(), // 마커 리스트를 KakaoMap 위젯에 전달

                      mapTypeControl: true,
                      mapTypeControlPosition: ControlPosition.topRight,
                      zoomControl: true,
                      zoomControlPosition: ControlPosition.right,
                    ),
                  ],
                )
        ),
      ),
    );
  }
}
