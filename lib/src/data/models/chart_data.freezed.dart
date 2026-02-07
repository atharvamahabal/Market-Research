// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chart_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

YahooChartResponse _$YahooChartResponseFromJson(Map<String, dynamic> json) {
  return _YahooChartResponse.fromJson(json);
}

/// @nodoc
mixin _$YahooChartResponse {
  ChartData get chart => throw _privateConstructorUsedError;

  /// Serializes this YahooChartResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of YahooChartResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $YahooChartResponseCopyWith<YahooChartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YahooChartResponseCopyWith<$Res> {
  factory $YahooChartResponseCopyWith(
          YahooChartResponse value, $Res Function(YahooChartResponse) then) =
      _$YahooChartResponseCopyWithImpl<$Res, YahooChartResponse>;
  @useResult
  $Res call({ChartData chart});

  $ChartDataCopyWith<$Res> get chart;
}

/// @nodoc
class _$YahooChartResponseCopyWithImpl<$Res, $Val extends YahooChartResponse>
    implements $YahooChartResponseCopyWith<$Res> {
  _$YahooChartResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of YahooChartResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chart = null,
  }) {
    return _then(_value.copyWith(
      chart: null == chart
          ? _value.chart
          : chart // ignore: cast_nullable_to_non_nullable
              as ChartData,
    ) as $Val);
  }

  /// Create a copy of YahooChartResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChartDataCopyWith<$Res> get chart {
    return $ChartDataCopyWith<$Res>(_value.chart, (value) {
      return _then(_value.copyWith(chart: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$YahooChartResponseImplCopyWith<$Res>
    implements $YahooChartResponseCopyWith<$Res> {
  factory _$$YahooChartResponseImplCopyWith(_$YahooChartResponseImpl value,
          $Res Function(_$YahooChartResponseImpl) then) =
      __$$YahooChartResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ChartData chart});

  @override
  $ChartDataCopyWith<$Res> get chart;
}

/// @nodoc
class __$$YahooChartResponseImplCopyWithImpl<$Res>
    extends _$YahooChartResponseCopyWithImpl<$Res, _$YahooChartResponseImpl>
    implements _$$YahooChartResponseImplCopyWith<$Res> {
  __$$YahooChartResponseImplCopyWithImpl(_$YahooChartResponseImpl _value,
      $Res Function(_$YahooChartResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of YahooChartResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chart = null,
  }) {
    return _then(_$YahooChartResponseImpl(
      chart: null == chart
          ? _value.chart
          : chart // ignore: cast_nullable_to_non_nullable
              as ChartData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$YahooChartResponseImpl implements _YahooChartResponse {
  const _$YahooChartResponseImpl({required this.chart});

  factory _$YahooChartResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$YahooChartResponseImplFromJson(json);

  @override
  final ChartData chart;

  @override
  String toString() {
    return 'YahooChartResponse(chart: $chart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YahooChartResponseImpl &&
            (identical(other.chart, chart) || other.chart == chart));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, chart);

  /// Create a copy of YahooChartResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$YahooChartResponseImplCopyWith<_$YahooChartResponseImpl> get copyWith =>
      __$$YahooChartResponseImplCopyWithImpl<_$YahooChartResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YahooChartResponseImplToJson(
      this,
    );
  }
}

abstract class _YahooChartResponse implements YahooChartResponse {
  const factory _YahooChartResponse({required final ChartData chart}) =
      _$YahooChartResponseImpl;

  factory _YahooChartResponse.fromJson(Map<String, dynamic> json) =
      _$YahooChartResponseImpl.fromJson;

  @override
  ChartData get chart;

  /// Create a copy of YahooChartResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$YahooChartResponseImplCopyWith<_$YahooChartResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChartData _$ChartDataFromJson(Map<String, dynamic> json) {
  return _ChartData.fromJson(json);
}

/// @nodoc
mixin _$ChartData {
  List<ChartResult>? get result => throw _privateConstructorUsedError;
  dynamic get error => throw _privateConstructorUsedError;

  /// Serializes this ChartData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChartData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChartDataCopyWith<ChartData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartDataCopyWith<$Res> {
  factory $ChartDataCopyWith(ChartData value, $Res Function(ChartData) then) =
      _$ChartDataCopyWithImpl<$Res, ChartData>;
  @useResult
  $Res call({List<ChartResult>? result, dynamic error});
}

/// @nodoc
class _$ChartDataCopyWithImpl<$Res, $Val extends ChartData>
    implements $ChartDataCopyWith<$Res> {
  _$ChartDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChartData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<ChartResult>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChartDataImplCopyWith<$Res>
    implements $ChartDataCopyWith<$Res> {
  factory _$$ChartDataImplCopyWith(
          _$ChartDataImpl value, $Res Function(_$ChartDataImpl) then) =
      __$$ChartDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ChartResult>? result, dynamic error});
}

/// @nodoc
class __$$ChartDataImplCopyWithImpl<$Res>
    extends _$ChartDataCopyWithImpl<$Res, _$ChartDataImpl>
    implements _$$ChartDataImplCopyWith<$Res> {
  __$$ChartDataImplCopyWithImpl(
      _$ChartDataImpl _value, $Res Function(_$ChartDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChartData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
    Object? error = freezed,
  }) {
    return _then(_$ChartDataImpl(
      result: freezed == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<ChartResult>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChartDataImpl implements _ChartData {
  const _$ChartDataImpl({final List<ChartResult>? result, this.error})
      : _result = result;

  factory _$ChartDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChartDataImplFromJson(json);

  final List<ChartResult>? _result;
  @override
  List<ChartResult>? get result {
    final value = _result;
    if (value == null) return null;
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final dynamic error;

  @override
  String toString() {
    return 'ChartData(result: $result, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartDataImpl &&
            const DeepCollectionEquality().equals(other._result, _result) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_result),
      const DeepCollectionEquality().hash(error));

  /// Create a copy of ChartData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartDataImplCopyWith<_$ChartDataImpl> get copyWith =>
      __$$ChartDataImplCopyWithImpl<_$ChartDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChartDataImplToJson(
      this,
    );
  }
}

abstract class _ChartData implements ChartData {
  const factory _ChartData(
      {final List<ChartResult>? result, final dynamic error}) = _$ChartDataImpl;

  factory _ChartData.fromJson(Map<String, dynamic> json) =
      _$ChartDataImpl.fromJson;

  @override
  List<ChartResult>? get result;
  @override
  dynamic get error;

  /// Create a copy of ChartData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChartDataImplCopyWith<_$ChartDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChartResult _$ChartResultFromJson(Map<String, dynamic> json) {
  return _ChartResult.fromJson(json);
}

/// @nodoc
mixin _$ChartResult {
  ChartMeta get meta => throw _privateConstructorUsedError;
  List<int>? get timestamp => throw _privateConstructorUsedError;
  ChartIndicators get indicators => throw _privateConstructorUsedError;

  /// Serializes this ChartResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChartResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChartResultCopyWith<ChartResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartResultCopyWith<$Res> {
  factory $ChartResultCopyWith(
          ChartResult value, $Res Function(ChartResult) then) =
      _$ChartResultCopyWithImpl<$Res, ChartResult>;
  @useResult
  $Res call({ChartMeta meta, List<int>? timestamp, ChartIndicators indicators});

  $ChartMetaCopyWith<$Res> get meta;
  $ChartIndicatorsCopyWith<$Res> get indicators;
}

/// @nodoc
class _$ChartResultCopyWithImpl<$Res, $Val extends ChartResult>
    implements $ChartResultCopyWith<$Res> {
  _$ChartResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChartResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? timestamp = freezed,
    Object? indicators = null,
  }) {
    return _then(_value.copyWith(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ChartMeta,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      indicators: null == indicators
          ? _value.indicators
          : indicators // ignore: cast_nullable_to_non_nullable
              as ChartIndicators,
    ) as $Val);
  }

  /// Create a copy of ChartResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChartMetaCopyWith<$Res> get meta {
    return $ChartMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }

  /// Create a copy of ChartResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChartIndicatorsCopyWith<$Res> get indicators {
    return $ChartIndicatorsCopyWith<$Res>(_value.indicators, (value) {
      return _then(_value.copyWith(indicators: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChartResultImplCopyWith<$Res>
    implements $ChartResultCopyWith<$Res> {
  factory _$$ChartResultImplCopyWith(
          _$ChartResultImpl value, $Res Function(_$ChartResultImpl) then) =
      __$$ChartResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ChartMeta meta, List<int>? timestamp, ChartIndicators indicators});

  @override
  $ChartMetaCopyWith<$Res> get meta;
  @override
  $ChartIndicatorsCopyWith<$Res> get indicators;
}

/// @nodoc
class __$$ChartResultImplCopyWithImpl<$Res>
    extends _$ChartResultCopyWithImpl<$Res, _$ChartResultImpl>
    implements _$$ChartResultImplCopyWith<$Res> {
  __$$ChartResultImplCopyWithImpl(
      _$ChartResultImpl _value, $Res Function(_$ChartResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChartResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? timestamp = freezed,
    Object? indicators = null,
  }) {
    return _then(_$ChartResultImpl(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ChartMeta,
      timestamp: freezed == timestamp
          ? _value._timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      indicators: null == indicators
          ? _value.indicators
          : indicators // ignore: cast_nullable_to_non_nullable
              as ChartIndicators,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChartResultImpl implements _ChartResult {
  const _$ChartResultImpl(
      {required this.meta,
      final List<int>? timestamp,
      required this.indicators})
      : _timestamp = timestamp;

  factory _$ChartResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChartResultImplFromJson(json);

  @override
  final ChartMeta meta;
  final List<int>? _timestamp;
  @override
  List<int>? get timestamp {
    final value = _timestamp;
    if (value == null) return null;
    if (_timestamp is EqualUnmodifiableListView) return _timestamp;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ChartIndicators indicators;

  @override
  String toString() {
    return 'ChartResult(meta: $meta, timestamp: $timestamp, indicators: $indicators)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartResultImpl &&
            (identical(other.meta, meta) || other.meta == meta) &&
            const DeepCollectionEquality()
                .equals(other._timestamp, _timestamp) &&
            (identical(other.indicators, indicators) ||
                other.indicators == indicators));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, meta,
      const DeepCollectionEquality().hash(_timestamp), indicators);

  /// Create a copy of ChartResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartResultImplCopyWith<_$ChartResultImpl> get copyWith =>
      __$$ChartResultImplCopyWithImpl<_$ChartResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChartResultImplToJson(
      this,
    );
  }
}

abstract class _ChartResult implements ChartResult {
  const factory _ChartResult(
      {required final ChartMeta meta,
      final List<int>? timestamp,
      required final ChartIndicators indicators}) = _$ChartResultImpl;

  factory _ChartResult.fromJson(Map<String, dynamic> json) =
      _$ChartResultImpl.fromJson;

  @override
  ChartMeta get meta;
  @override
  List<int>? get timestamp;
  @override
  ChartIndicators get indicators;

  /// Create a copy of ChartResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChartResultImplCopyWith<_$ChartResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChartMeta _$ChartMetaFromJson(Map<String, dynamic> json) {
  return _ChartMeta.fromJson(json);
}

/// @nodoc
mixin _$ChartMeta {
  String get currency => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  double get regularMarketPrice => throw _privateConstructorUsedError;
  double get previousClose => throw _privateConstructorUsedError;
  double get regularMarketDayHigh => throw _privateConstructorUsedError;
  double get regularMarketDayLow => throw _privateConstructorUsedError;
  int get regularMarketVolume => throw _privateConstructorUsedError;

  /// Serializes this ChartMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChartMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChartMetaCopyWith<ChartMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartMetaCopyWith<$Res> {
  factory $ChartMetaCopyWith(ChartMeta value, $Res Function(ChartMeta) then) =
      _$ChartMetaCopyWithImpl<$Res, ChartMeta>;
  @useResult
  $Res call(
      {String currency,
      String symbol,
      double regularMarketPrice,
      double previousClose,
      double regularMarketDayHigh,
      double regularMarketDayLow,
      int regularMarketVolume});
}

/// @nodoc
class _$ChartMetaCopyWithImpl<$Res, $Val extends ChartMeta>
    implements $ChartMetaCopyWith<$Res> {
  _$ChartMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChartMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? symbol = null,
    Object? regularMarketPrice = null,
    Object? previousClose = null,
    Object? regularMarketDayHigh = null,
    Object? regularMarketDayLow = null,
    Object? regularMarketVolume = null,
  }) {
    return _then(_value.copyWith(
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      regularMarketPrice: null == regularMarketPrice
          ? _value.regularMarketPrice
          : regularMarketPrice // ignore: cast_nullable_to_non_nullable
              as double,
      previousClose: null == previousClose
          ? _value.previousClose
          : previousClose // ignore: cast_nullable_to_non_nullable
              as double,
      regularMarketDayHigh: null == regularMarketDayHigh
          ? _value.regularMarketDayHigh
          : regularMarketDayHigh // ignore: cast_nullable_to_non_nullable
              as double,
      regularMarketDayLow: null == regularMarketDayLow
          ? _value.regularMarketDayLow
          : regularMarketDayLow // ignore: cast_nullable_to_non_nullable
              as double,
      regularMarketVolume: null == regularMarketVolume
          ? _value.regularMarketVolume
          : regularMarketVolume // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChartMetaImplCopyWith<$Res>
    implements $ChartMetaCopyWith<$Res> {
  factory _$$ChartMetaImplCopyWith(
          _$ChartMetaImpl value, $Res Function(_$ChartMetaImpl) then) =
      __$$ChartMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String currency,
      String symbol,
      double regularMarketPrice,
      double previousClose,
      double regularMarketDayHigh,
      double regularMarketDayLow,
      int regularMarketVolume});
}

/// @nodoc
class __$$ChartMetaImplCopyWithImpl<$Res>
    extends _$ChartMetaCopyWithImpl<$Res, _$ChartMetaImpl>
    implements _$$ChartMetaImplCopyWith<$Res> {
  __$$ChartMetaImplCopyWithImpl(
      _$ChartMetaImpl _value, $Res Function(_$ChartMetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChartMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? symbol = null,
    Object? regularMarketPrice = null,
    Object? previousClose = null,
    Object? regularMarketDayHigh = null,
    Object? regularMarketDayLow = null,
    Object? regularMarketVolume = null,
  }) {
    return _then(_$ChartMetaImpl(
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      regularMarketPrice: null == regularMarketPrice
          ? _value.regularMarketPrice
          : regularMarketPrice // ignore: cast_nullable_to_non_nullable
              as double,
      previousClose: null == previousClose
          ? _value.previousClose
          : previousClose // ignore: cast_nullable_to_non_nullable
              as double,
      regularMarketDayHigh: null == regularMarketDayHigh
          ? _value.regularMarketDayHigh
          : regularMarketDayHigh // ignore: cast_nullable_to_non_nullable
              as double,
      regularMarketDayLow: null == regularMarketDayLow
          ? _value.regularMarketDayLow
          : regularMarketDayLow // ignore: cast_nullable_to_non_nullable
              as double,
      regularMarketVolume: null == regularMarketVolume
          ? _value.regularMarketVolume
          : regularMarketVolume // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChartMetaImpl implements _ChartMeta {
  const _$ChartMetaImpl(
      {required this.currency,
      required this.symbol,
      required this.regularMarketPrice,
      required this.previousClose,
      required this.regularMarketDayHigh,
      required this.regularMarketDayLow,
      required this.regularMarketVolume});

  factory _$ChartMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChartMetaImplFromJson(json);

  @override
  final String currency;
  @override
  final String symbol;
  @override
  final double regularMarketPrice;
  @override
  final double previousClose;
  @override
  final double regularMarketDayHigh;
  @override
  final double regularMarketDayLow;
  @override
  final int regularMarketVolume;

  @override
  String toString() {
    return 'ChartMeta(currency: $currency, symbol: $symbol, regularMarketPrice: $regularMarketPrice, previousClose: $previousClose, regularMarketDayHigh: $regularMarketDayHigh, regularMarketDayLow: $regularMarketDayLow, regularMarketVolume: $regularMarketVolume)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartMetaImpl &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.regularMarketPrice, regularMarketPrice) ||
                other.regularMarketPrice == regularMarketPrice) &&
            (identical(other.previousClose, previousClose) ||
                other.previousClose == previousClose) &&
            (identical(other.regularMarketDayHigh, regularMarketDayHigh) ||
                other.regularMarketDayHigh == regularMarketDayHigh) &&
            (identical(other.regularMarketDayLow, regularMarketDayLow) ||
                other.regularMarketDayLow == regularMarketDayLow) &&
            (identical(other.regularMarketVolume, regularMarketVolume) ||
                other.regularMarketVolume == regularMarketVolume));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currency,
      symbol,
      regularMarketPrice,
      previousClose,
      regularMarketDayHigh,
      regularMarketDayLow,
      regularMarketVolume);

  /// Create a copy of ChartMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartMetaImplCopyWith<_$ChartMetaImpl> get copyWith =>
      __$$ChartMetaImplCopyWithImpl<_$ChartMetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChartMetaImplToJson(
      this,
    );
  }
}

abstract class _ChartMeta implements ChartMeta {
  const factory _ChartMeta(
      {required final String currency,
      required final String symbol,
      required final double regularMarketPrice,
      required final double previousClose,
      required final double regularMarketDayHigh,
      required final double regularMarketDayLow,
      required final int regularMarketVolume}) = _$ChartMetaImpl;

  factory _ChartMeta.fromJson(Map<String, dynamic> json) =
      _$ChartMetaImpl.fromJson;

  @override
  String get currency;
  @override
  String get symbol;
  @override
  double get regularMarketPrice;
  @override
  double get previousClose;
  @override
  double get regularMarketDayHigh;
  @override
  double get regularMarketDayLow;
  @override
  int get regularMarketVolume;

  /// Create a copy of ChartMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChartMetaImplCopyWith<_$ChartMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChartIndicators _$ChartIndicatorsFromJson(Map<String, dynamic> json) {
  return _ChartIndicators.fromJson(json);
}

/// @nodoc
mixin _$ChartIndicators {
  List<ChartQuote> get quote => throw _privateConstructorUsedError;

  /// Serializes this ChartIndicators to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChartIndicators
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChartIndicatorsCopyWith<ChartIndicators> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartIndicatorsCopyWith<$Res> {
  factory $ChartIndicatorsCopyWith(
          ChartIndicators value, $Res Function(ChartIndicators) then) =
      _$ChartIndicatorsCopyWithImpl<$Res, ChartIndicators>;
  @useResult
  $Res call({List<ChartQuote> quote});
}

/// @nodoc
class _$ChartIndicatorsCopyWithImpl<$Res, $Val extends ChartIndicators>
    implements $ChartIndicatorsCopyWith<$Res> {
  _$ChartIndicatorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChartIndicators
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quote = null,
  }) {
    return _then(_value.copyWith(
      quote: null == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as List<ChartQuote>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChartIndicatorsImplCopyWith<$Res>
    implements $ChartIndicatorsCopyWith<$Res> {
  factory _$$ChartIndicatorsImplCopyWith(_$ChartIndicatorsImpl value,
          $Res Function(_$ChartIndicatorsImpl) then) =
      __$$ChartIndicatorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ChartQuote> quote});
}

/// @nodoc
class __$$ChartIndicatorsImplCopyWithImpl<$Res>
    extends _$ChartIndicatorsCopyWithImpl<$Res, _$ChartIndicatorsImpl>
    implements _$$ChartIndicatorsImplCopyWith<$Res> {
  __$$ChartIndicatorsImplCopyWithImpl(
      _$ChartIndicatorsImpl _value, $Res Function(_$ChartIndicatorsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChartIndicators
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quote = null,
  }) {
    return _then(_$ChartIndicatorsImpl(
      quote: null == quote
          ? _value._quote
          : quote // ignore: cast_nullable_to_non_nullable
              as List<ChartQuote>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChartIndicatorsImpl implements _ChartIndicators {
  const _$ChartIndicatorsImpl({required final List<ChartQuote> quote})
      : _quote = quote;

  factory _$ChartIndicatorsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChartIndicatorsImplFromJson(json);

  final List<ChartQuote> _quote;
  @override
  List<ChartQuote> get quote {
    if (_quote is EqualUnmodifiableListView) return _quote;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quote);
  }

  @override
  String toString() {
    return 'ChartIndicators(quote: $quote)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartIndicatorsImpl &&
            const DeepCollectionEquality().equals(other._quote, _quote));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_quote));

  /// Create a copy of ChartIndicators
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartIndicatorsImplCopyWith<_$ChartIndicatorsImpl> get copyWith =>
      __$$ChartIndicatorsImplCopyWithImpl<_$ChartIndicatorsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChartIndicatorsImplToJson(
      this,
    );
  }
}

abstract class _ChartIndicators implements ChartIndicators {
  const factory _ChartIndicators({required final List<ChartQuote> quote}) =
      _$ChartIndicatorsImpl;

  factory _ChartIndicators.fromJson(Map<String, dynamic> json) =
      _$ChartIndicatorsImpl.fromJson;

  @override
  List<ChartQuote> get quote;

  /// Create a copy of ChartIndicators
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChartIndicatorsImplCopyWith<_$ChartIndicatorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChartQuote _$ChartQuoteFromJson(Map<String, dynamic> json) {
  return _ChartQuote.fromJson(json);
}

/// @nodoc
mixin _$ChartQuote {
  List<double?>? get open => throw _privateConstructorUsedError;
  List<double?>? get high => throw _privateConstructorUsedError;
  List<double?>? get low => throw _privateConstructorUsedError;
  List<double?>? get close => throw _privateConstructorUsedError;
  List<int?>? get volume => throw _privateConstructorUsedError;

  /// Serializes this ChartQuote to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChartQuote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChartQuoteCopyWith<ChartQuote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartQuoteCopyWith<$Res> {
  factory $ChartQuoteCopyWith(
          ChartQuote value, $Res Function(ChartQuote) then) =
      _$ChartQuoteCopyWithImpl<$Res, ChartQuote>;
  @useResult
  $Res call(
      {List<double?>? open,
      List<double?>? high,
      List<double?>? low,
      List<double?>? close,
      List<int?>? volume});
}

/// @nodoc
class _$ChartQuoteCopyWithImpl<$Res, $Val extends ChartQuote>
    implements $ChartQuoteCopyWith<$Res> {
  _$ChartQuoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChartQuote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? open = freezed,
    Object? high = freezed,
    Object? low = freezed,
    Object? close = freezed,
    Object? volume = freezed,
  }) {
    return _then(_value.copyWith(
      open: freezed == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      high: freezed == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      low: freezed == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      close: freezed == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      volume: freezed == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChartQuoteImplCopyWith<$Res>
    implements $ChartQuoteCopyWith<$Res> {
  factory _$$ChartQuoteImplCopyWith(
          _$ChartQuoteImpl value, $Res Function(_$ChartQuoteImpl) then) =
      __$$ChartQuoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<double?>? open,
      List<double?>? high,
      List<double?>? low,
      List<double?>? close,
      List<int?>? volume});
}

/// @nodoc
class __$$ChartQuoteImplCopyWithImpl<$Res>
    extends _$ChartQuoteCopyWithImpl<$Res, _$ChartQuoteImpl>
    implements _$$ChartQuoteImplCopyWith<$Res> {
  __$$ChartQuoteImplCopyWithImpl(
      _$ChartQuoteImpl _value, $Res Function(_$ChartQuoteImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChartQuote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? open = freezed,
    Object? high = freezed,
    Object? low = freezed,
    Object? close = freezed,
    Object? volume = freezed,
  }) {
    return _then(_$ChartQuoteImpl(
      open: freezed == open
          ? _value._open
          : open // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      high: freezed == high
          ? _value._high
          : high // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      low: freezed == low
          ? _value._low
          : low // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      close: freezed == close
          ? _value._close
          : close // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      volume: freezed == volume
          ? _value._volume
          : volume // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChartQuoteImpl implements _ChartQuote {
  const _$ChartQuoteImpl(
      {final List<double?>? open,
      final List<double?>? high,
      final List<double?>? low,
      final List<double?>? close,
      final List<int?>? volume})
      : _open = open,
        _high = high,
        _low = low,
        _close = close,
        _volume = volume;

  factory _$ChartQuoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChartQuoteImplFromJson(json);

  final List<double?>? _open;
  @override
  List<double?>? get open {
    final value = _open;
    if (value == null) return null;
    if (_open is EqualUnmodifiableListView) return _open;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double?>? _high;
  @override
  List<double?>? get high {
    final value = _high;
    if (value == null) return null;
    if (_high is EqualUnmodifiableListView) return _high;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double?>? _low;
  @override
  List<double?>? get low {
    final value = _low;
    if (value == null) return null;
    if (_low is EqualUnmodifiableListView) return _low;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double?>? _close;
  @override
  List<double?>? get close {
    final value = _close;
    if (value == null) return null;
    if (_close is EqualUnmodifiableListView) return _close;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int?>? _volume;
  @override
  List<int?>? get volume {
    final value = _volume;
    if (value == null) return null;
    if (_volume is EqualUnmodifiableListView) return _volume;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ChartQuote(open: $open, high: $high, low: $low, close: $close, volume: $volume)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartQuoteImpl &&
            const DeepCollectionEquality().equals(other._open, _open) &&
            const DeepCollectionEquality().equals(other._high, _high) &&
            const DeepCollectionEquality().equals(other._low, _low) &&
            const DeepCollectionEquality().equals(other._close, _close) &&
            const DeepCollectionEquality().equals(other._volume, _volume));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_open),
      const DeepCollectionEquality().hash(_high),
      const DeepCollectionEquality().hash(_low),
      const DeepCollectionEquality().hash(_close),
      const DeepCollectionEquality().hash(_volume));

  /// Create a copy of ChartQuote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartQuoteImplCopyWith<_$ChartQuoteImpl> get copyWith =>
      __$$ChartQuoteImplCopyWithImpl<_$ChartQuoteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChartQuoteImplToJson(
      this,
    );
  }
}

abstract class _ChartQuote implements ChartQuote {
  const factory _ChartQuote(
      {final List<double?>? open,
      final List<double?>? high,
      final List<double?>? low,
      final List<double?>? close,
      final List<int?>? volume}) = _$ChartQuoteImpl;

  factory _ChartQuote.fromJson(Map<String, dynamic> json) =
      _$ChartQuoteImpl.fromJson;

  @override
  List<double?>? get open;
  @override
  List<double?>? get high;
  @override
  List<double?>? get low;
  @override
  List<double?>? get close;
  @override
  List<int?>? get volume;

  /// Create a copy of ChartQuote
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChartQuoteImplCopyWith<_$ChartQuoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
