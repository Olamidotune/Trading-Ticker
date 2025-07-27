// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() init,
    required TResult Function(String? searchKey) fetchNews,
    required TResult Function(News news) fetchNewsSuccess,
    required TResult Function(String? errorMessage) fetchNewsFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? init,
    TResult? Function(String? searchKey)? fetchNews,
    TResult? Function(News news)? fetchNewsSuccess,
    TResult? Function(String? errorMessage)? fetchNewsFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? init,
    TResult Function(String? searchKey)? fetchNews,
    TResult Function(News news)? fetchNewsSuccess,
    TResult Function(String? errorMessage)? fetchNewsFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NewsEvent value) $default, {
    required TResult Function(_Init value) init,
    required TResult Function(_FetchNews value) fetchNews,
    required TResult Function(_FetchNewsSuccess value) fetchNewsSuccess,
    required TResult Function(_FetchNewsFailure value) fetchNewsFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_NewsEvent value)? $default, {
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchNews value)? fetchNews,
    TResult? Function(_FetchNewsSuccess value)? fetchNewsSuccess,
    TResult? Function(_FetchNewsFailure value)? fetchNewsFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NewsEvent value)? $default, {
    TResult Function(_Init value)? init,
    TResult Function(_FetchNews value)? fetchNews,
    TResult Function(_FetchNewsSuccess value)? fetchNewsSuccess,
    TResult Function(_FetchNewsFailure value)? fetchNewsFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsEventCopyWith<$Res> {
  factory $NewsEventCopyWith(NewsEvent value, $Res Function(NewsEvent) then) =
      _$NewsEventCopyWithImpl<$Res, NewsEvent>;
}

/// @nodoc
class _$NewsEventCopyWithImpl<$Res, $Val extends NewsEvent>
    implements $NewsEventCopyWith<$Res> {
  _$NewsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$NewsEventImplCopyWith<$Res> {
  factory _$$NewsEventImplCopyWith(
          _$NewsEventImpl value, $Res Function(_$NewsEventImpl) then) =
      __$$NewsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NewsEventImplCopyWithImpl<$Res>
    extends _$NewsEventCopyWithImpl<$Res, _$NewsEventImpl>
    implements _$$NewsEventImplCopyWith<$Res> {
  __$$NewsEventImplCopyWithImpl(
      _$NewsEventImpl _value, $Res Function(_$NewsEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NewsEventImpl implements _NewsEvent {
  const _$NewsEventImpl();

  @override
  String toString() {
    return 'NewsEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NewsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() init,
    required TResult Function(String? searchKey) fetchNews,
    required TResult Function(News news) fetchNewsSuccess,
    required TResult Function(String? errorMessage) fetchNewsFailure,
  }) {
    return $default();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? init,
    TResult? Function(String? searchKey)? fetchNews,
    TResult? Function(News news)? fetchNewsSuccess,
    TResult? Function(String? errorMessage)? fetchNewsFailure,
  }) {
    return $default?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? init,
    TResult Function(String? searchKey)? fetchNews,
    TResult Function(News news)? fetchNewsSuccess,
    TResult Function(String? errorMessage)? fetchNewsFailure,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NewsEvent value) $default, {
    required TResult Function(_Init value) init,
    required TResult Function(_FetchNews value) fetchNews,
    required TResult Function(_FetchNewsSuccess value) fetchNewsSuccess,
    required TResult Function(_FetchNewsFailure value) fetchNewsFailure,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_NewsEvent value)? $default, {
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchNews value)? fetchNews,
    TResult? Function(_FetchNewsSuccess value)? fetchNewsSuccess,
    TResult? Function(_FetchNewsFailure value)? fetchNewsFailure,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NewsEvent value)? $default, {
    TResult Function(_Init value)? init,
    TResult Function(_FetchNews value)? fetchNews,
    TResult Function(_FetchNewsSuccess value)? fetchNewsSuccess,
    TResult Function(_FetchNewsFailure value)? fetchNewsFailure,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _NewsEvent implements NewsEvent {
  const factory _NewsEvent() = _$NewsEventImpl;
}

/// @nodoc
abstract class _$$InitImplCopyWith<$Res> {
  factory _$$InitImplCopyWith(
          _$InitImpl value, $Res Function(_$InitImpl) then) =
      __$$InitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitImplCopyWithImpl<$Res>
    extends _$NewsEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'NewsEvent.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() init,
    required TResult Function(String? searchKey) fetchNews,
    required TResult Function(News news) fetchNewsSuccess,
    required TResult Function(String? errorMessage) fetchNewsFailure,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? init,
    TResult? Function(String? searchKey)? fetchNews,
    TResult? Function(News news)? fetchNewsSuccess,
    TResult? Function(String? errorMessage)? fetchNewsFailure,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? init,
    TResult Function(String? searchKey)? fetchNews,
    TResult Function(News news)? fetchNewsSuccess,
    TResult Function(String? errorMessage)? fetchNewsFailure,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NewsEvent value) $default, {
    required TResult Function(_Init value) init,
    required TResult Function(_FetchNews value) fetchNews,
    required TResult Function(_FetchNewsSuccess value) fetchNewsSuccess,
    required TResult Function(_FetchNewsFailure value) fetchNewsFailure,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_NewsEvent value)? $default, {
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchNews value)? fetchNews,
    TResult? Function(_FetchNewsSuccess value)? fetchNewsSuccess,
    TResult? Function(_FetchNewsFailure value)? fetchNewsFailure,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NewsEvent value)? $default, {
    TResult Function(_Init value)? init,
    TResult Function(_FetchNews value)? fetchNews,
    TResult Function(_FetchNewsSuccess value)? fetchNewsSuccess,
    TResult Function(_FetchNewsFailure value)? fetchNewsFailure,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements NewsEvent {
  const factory _Init() = _$InitImpl;
}

/// @nodoc
abstract class _$$FetchNewsImplCopyWith<$Res> {
  factory _$$FetchNewsImplCopyWith(
          _$FetchNewsImpl value, $Res Function(_$FetchNewsImpl) then) =
      __$$FetchNewsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? searchKey});
}

/// @nodoc
class __$$FetchNewsImplCopyWithImpl<$Res>
    extends _$NewsEventCopyWithImpl<$Res, _$FetchNewsImpl>
    implements _$$FetchNewsImplCopyWith<$Res> {
  __$$FetchNewsImplCopyWithImpl(
      _$FetchNewsImpl _value, $Res Function(_$FetchNewsImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKey = freezed,
  }) {
    return _then(_$FetchNewsImpl(
      freezed == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FetchNewsImpl implements _FetchNews {
  const _$FetchNewsImpl(this.searchKey);

  @override
  final String? searchKey;

  @override
  String toString() {
    return 'NewsEvent.fetchNews(searchKey: $searchKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchNewsImpl &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchKey);

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchNewsImplCopyWith<_$FetchNewsImpl> get copyWith =>
      __$$FetchNewsImplCopyWithImpl<_$FetchNewsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() init,
    required TResult Function(String? searchKey) fetchNews,
    required TResult Function(News news) fetchNewsSuccess,
    required TResult Function(String? errorMessage) fetchNewsFailure,
  }) {
    return fetchNews(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? init,
    TResult? Function(String? searchKey)? fetchNews,
    TResult? Function(News news)? fetchNewsSuccess,
    TResult? Function(String? errorMessage)? fetchNewsFailure,
  }) {
    return fetchNews?.call(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? init,
    TResult Function(String? searchKey)? fetchNews,
    TResult Function(News news)? fetchNewsSuccess,
    TResult Function(String? errorMessage)? fetchNewsFailure,
    required TResult orElse(),
  }) {
    if (fetchNews != null) {
      return fetchNews(searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NewsEvent value) $default, {
    required TResult Function(_Init value) init,
    required TResult Function(_FetchNews value) fetchNews,
    required TResult Function(_FetchNewsSuccess value) fetchNewsSuccess,
    required TResult Function(_FetchNewsFailure value) fetchNewsFailure,
  }) {
    return fetchNews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_NewsEvent value)? $default, {
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchNews value)? fetchNews,
    TResult? Function(_FetchNewsSuccess value)? fetchNewsSuccess,
    TResult? Function(_FetchNewsFailure value)? fetchNewsFailure,
  }) {
    return fetchNews?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NewsEvent value)? $default, {
    TResult Function(_Init value)? init,
    TResult Function(_FetchNews value)? fetchNews,
    TResult Function(_FetchNewsSuccess value)? fetchNewsSuccess,
    TResult Function(_FetchNewsFailure value)? fetchNewsFailure,
    required TResult orElse(),
  }) {
    if (fetchNews != null) {
      return fetchNews(this);
    }
    return orElse();
  }
}

abstract class _FetchNews implements NewsEvent {
  const factory _FetchNews(final String? searchKey) = _$FetchNewsImpl;

  String? get searchKey;

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchNewsImplCopyWith<_$FetchNewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchNewsSuccessImplCopyWith<$Res> {
  factory _$$FetchNewsSuccessImplCopyWith(_$FetchNewsSuccessImpl value,
          $Res Function(_$FetchNewsSuccessImpl) then) =
      __$$FetchNewsSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({News news});
}

/// @nodoc
class __$$FetchNewsSuccessImplCopyWithImpl<$Res>
    extends _$NewsEventCopyWithImpl<$Res, _$FetchNewsSuccessImpl>
    implements _$$FetchNewsSuccessImplCopyWith<$Res> {
  __$$FetchNewsSuccessImplCopyWithImpl(_$FetchNewsSuccessImpl _value,
      $Res Function(_$FetchNewsSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? news = null,
  }) {
    return _then(_$FetchNewsSuccessImpl(
      null == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as News,
    ));
  }
}

/// @nodoc

class _$FetchNewsSuccessImpl implements _FetchNewsSuccess {
  const _$FetchNewsSuccessImpl(this.news);

  @override
  final News news;

  @override
  String toString() {
    return 'NewsEvent.fetchNewsSuccess(news: $news)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchNewsSuccessImpl &&
            (identical(other.news, news) || other.news == news));
  }

  @override
  int get hashCode => Object.hash(runtimeType, news);

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchNewsSuccessImplCopyWith<_$FetchNewsSuccessImpl> get copyWith =>
      __$$FetchNewsSuccessImplCopyWithImpl<_$FetchNewsSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() init,
    required TResult Function(String? searchKey) fetchNews,
    required TResult Function(News news) fetchNewsSuccess,
    required TResult Function(String? errorMessage) fetchNewsFailure,
  }) {
    return fetchNewsSuccess(news);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? init,
    TResult? Function(String? searchKey)? fetchNews,
    TResult? Function(News news)? fetchNewsSuccess,
    TResult? Function(String? errorMessage)? fetchNewsFailure,
  }) {
    return fetchNewsSuccess?.call(news);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? init,
    TResult Function(String? searchKey)? fetchNews,
    TResult Function(News news)? fetchNewsSuccess,
    TResult Function(String? errorMessage)? fetchNewsFailure,
    required TResult orElse(),
  }) {
    if (fetchNewsSuccess != null) {
      return fetchNewsSuccess(news);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NewsEvent value) $default, {
    required TResult Function(_Init value) init,
    required TResult Function(_FetchNews value) fetchNews,
    required TResult Function(_FetchNewsSuccess value) fetchNewsSuccess,
    required TResult Function(_FetchNewsFailure value) fetchNewsFailure,
  }) {
    return fetchNewsSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_NewsEvent value)? $default, {
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchNews value)? fetchNews,
    TResult? Function(_FetchNewsSuccess value)? fetchNewsSuccess,
    TResult? Function(_FetchNewsFailure value)? fetchNewsFailure,
  }) {
    return fetchNewsSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NewsEvent value)? $default, {
    TResult Function(_Init value)? init,
    TResult Function(_FetchNews value)? fetchNews,
    TResult Function(_FetchNewsSuccess value)? fetchNewsSuccess,
    TResult Function(_FetchNewsFailure value)? fetchNewsFailure,
    required TResult orElse(),
  }) {
    if (fetchNewsSuccess != null) {
      return fetchNewsSuccess(this);
    }
    return orElse();
  }
}

abstract class _FetchNewsSuccess implements NewsEvent {
  const factory _FetchNewsSuccess(final News news) = _$FetchNewsSuccessImpl;

  News get news;

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchNewsSuccessImplCopyWith<_$FetchNewsSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchNewsFailureImplCopyWith<$Res> {
  factory _$$FetchNewsFailureImplCopyWith(_$FetchNewsFailureImpl value,
          $Res Function(_$FetchNewsFailureImpl) then) =
      __$$FetchNewsFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? errorMessage});
}

/// @nodoc
class __$$FetchNewsFailureImplCopyWithImpl<$Res>
    extends _$NewsEventCopyWithImpl<$Res, _$FetchNewsFailureImpl>
    implements _$$FetchNewsFailureImplCopyWith<$Res> {
  __$$FetchNewsFailureImplCopyWithImpl(_$FetchNewsFailureImpl _value,
      $Res Function(_$FetchNewsFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_$FetchNewsFailureImpl(
      freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FetchNewsFailureImpl implements _FetchNewsFailure {
  const _$FetchNewsFailureImpl([this.errorMessage]);

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'NewsEvent.fetchNewsFailure(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchNewsFailureImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchNewsFailureImplCopyWith<_$FetchNewsFailureImpl> get copyWith =>
      __$$FetchNewsFailureImplCopyWithImpl<_$FetchNewsFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() init,
    required TResult Function(String? searchKey) fetchNews,
    required TResult Function(News news) fetchNewsSuccess,
    required TResult Function(String? errorMessage) fetchNewsFailure,
  }) {
    return fetchNewsFailure(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? init,
    TResult? Function(String? searchKey)? fetchNews,
    TResult? Function(News news)? fetchNewsSuccess,
    TResult? Function(String? errorMessage)? fetchNewsFailure,
  }) {
    return fetchNewsFailure?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? init,
    TResult Function(String? searchKey)? fetchNews,
    TResult Function(News news)? fetchNewsSuccess,
    TResult Function(String? errorMessage)? fetchNewsFailure,
    required TResult orElse(),
  }) {
    if (fetchNewsFailure != null) {
      return fetchNewsFailure(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NewsEvent value) $default, {
    required TResult Function(_Init value) init,
    required TResult Function(_FetchNews value) fetchNews,
    required TResult Function(_FetchNewsSuccess value) fetchNewsSuccess,
    required TResult Function(_FetchNewsFailure value) fetchNewsFailure,
  }) {
    return fetchNewsFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_NewsEvent value)? $default, {
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchNews value)? fetchNews,
    TResult? Function(_FetchNewsSuccess value)? fetchNewsSuccess,
    TResult? Function(_FetchNewsFailure value)? fetchNewsFailure,
  }) {
    return fetchNewsFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NewsEvent value)? $default, {
    TResult Function(_Init value)? init,
    TResult Function(_FetchNews value)? fetchNews,
    TResult Function(_FetchNewsSuccess value)? fetchNewsSuccess,
    TResult Function(_FetchNewsFailure value)? fetchNewsFailure,
    required TResult orElse(),
  }) {
    if (fetchNewsFailure != null) {
      return fetchNewsFailure(this);
    }
    return orElse();
  }
}

abstract class _FetchNewsFailure implements NewsEvent {
  const factory _FetchNewsFailure([final String? errorMessage]) =
      _$FetchNewsFailureImpl;

  String? get errorMessage;

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchNewsFailureImplCopyWith<_$FetchNewsFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NewsState {
  FormzSubmissionStatus get getNewsStatus =>
      throw _privateConstructorUsedError; // News? news,
  List<Article>? get news => throw _privateConstructorUsedError;
  String? get searchKey => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewsStateCopyWith<NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) then) =
      _$NewsStateCopyWithImpl<$Res, NewsState>;
  @useResult
  $Res call(
      {FormzSubmissionStatus getNewsStatus,
      List<Article>? news,
      String? searchKey,
      String? errorMessage});
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res, $Val extends NewsState>
    implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getNewsStatus = null,
    Object? news = freezed,
    Object? searchKey = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      getNewsStatus: null == getNewsStatus
          ? _value.getNewsStatus
          : getNewsStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      news: freezed == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as List<Article>?,
      searchKey: freezed == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsStateImplCopyWith<$Res>
    implements $NewsStateCopyWith<$Res> {
  factory _$$NewsStateImplCopyWith(
          _$NewsStateImpl value, $Res Function(_$NewsStateImpl) then) =
      __$$NewsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzSubmissionStatus getNewsStatus,
      List<Article>? news,
      String? searchKey,
      String? errorMessage});
}

/// @nodoc
class __$$NewsStateImplCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$NewsStateImpl>
    implements _$$NewsStateImplCopyWith<$Res> {
  __$$NewsStateImplCopyWithImpl(
      _$NewsStateImpl _value, $Res Function(_$NewsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getNewsStatus = null,
    Object? news = freezed,
    Object? searchKey = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$NewsStateImpl(
      getNewsStatus: null == getNewsStatus
          ? _value.getNewsStatus
          : getNewsStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      news: freezed == news
          ? _value._news
          : news // ignore: cast_nullable_to_non_nullable
              as List<Article>?,
      searchKey: freezed == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NewsStateImpl extends _NewsState {
  _$NewsStateImpl(
      {this.getNewsStatus = FormzSubmissionStatus.initial,
      final List<Article>? news,
      this.searchKey,
      this.errorMessage})
      : _news = news,
        super._();

  @override
  @JsonKey()
  final FormzSubmissionStatus getNewsStatus;
// News? news,
  final List<Article>? _news;
// News? news,
  @override
  List<Article>? get news {
    final value = _news;
    if (value == null) return null;
    if (_news is EqualUnmodifiableListView) return _news;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? searchKey;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'NewsState(getNewsStatus: $getNewsStatus, news: $news, searchKey: $searchKey, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsStateImpl &&
            (identical(other.getNewsStatus, getNewsStatus) ||
                other.getNewsStatus == getNewsStatus) &&
            const DeepCollectionEquality().equals(other._news, _news) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, getNewsStatus,
      const DeepCollectionEquality().hash(_news), searchKey, errorMessage);

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsStateImplCopyWith<_$NewsStateImpl> get copyWith =>
      __$$NewsStateImplCopyWithImpl<_$NewsStateImpl>(this, _$identity);
}

abstract class _NewsState extends NewsState {
  factory _NewsState(
      {final FormzSubmissionStatus getNewsStatus,
      final List<Article>? news,
      final String? searchKey,
      final String? errorMessage}) = _$NewsStateImpl;
  _NewsState._() : super._();

  @override
  FormzSubmissionStatus get getNewsStatus; // News? news,
  @override
  List<Article>? get news;
  @override
  String? get searchKey;
  @override
  String? get errorMessage;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsStateImplCopyWith<_$NewsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
