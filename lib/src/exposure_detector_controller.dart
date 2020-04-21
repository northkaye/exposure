import 'package:flutter/foundation.dart';

import './lru_list.dart';
import './exposure_detector_layer.dart';

class ExposureDetectorController {

  static final _instance = ExposureDetectorController();
  
  static ExposureDetectorController get instance => _instance;

  Duration updateInterval = const Duration(milliseconds: 200);

  int exposureTime = 500;

  LruList<Key> _filterKeyList = LruList(maxLength: 100);

  bool filterKeysContains(Key key) {
    return _filterKeyList.contains(key);
  }

  void forget(Key key) {
    _filterKeyList.add(key);
    ExposureDetectorLayer.forget(key);
  }
}