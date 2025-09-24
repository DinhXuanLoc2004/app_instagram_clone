// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;

import '../../../../cores/storage/model/auth_token_model.dart' as _i6;
import '../../domain/entities/auth_token_entity.dart' as _i5;
import '../../domain/ports/inputs/sign-in/extendtions/sign_in_with_userpass_input.dart'
    as _i3;
import '../DTOs/requests/sign_in_with_userpass_request.dart' as _i2;
import '../DTOs/responses/auth_token_response.dart' as _i4;

/// {@template package:app_instagram_clone/features/auth/data/mappers/auth_mapper.dart}
/// Available mappings:
/// - `SignInWithUserpassRequest` → `SignInWithUserpassInput`.
/// - `SignInWithUserpassInput` → `SignInWithUserpassRequest`.
/// - `AuthTokenResponse` → `AuthTokenEntity`.
/// - `AuthTokenEntity` → `AuthTokenResponse`.
/// - `AuthTokenEntity` → `AuthTokenModel`.
/// {@endtemplate}
class $AuthMapper implements _i1.AutoMapprInterface {
  const $AuthMapper();

  Type _typeOf<T>() => T;

  List<_i1.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:app_instagram_clone/features/auth/data/mappers/auth_mapper.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.SignInWithUserpassRequest>() ||
            sourceTypeOf == _typeOf<_i2.SignInWithUserpassRequest?>()) &&
        (targetTypeOf == _typeOf<_i3.SignInWithUserpassInput>() ||
            targetTypeOf == _typeOf<_i3.SignInWithUserpassInput?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.SignInWithUserpassInput>() ||
            sourceTypeOf == _typeOf<_i3.SignInWithUserpassInput?>()) &&
        (targetTypeOf == _typeOf<_i2.SignInWithUserpassRequest>() ||
            targetTypeOf == _typeOf<_i2.SignInWithUserpassRequest?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i4.AuthTokenResponse>() ||
            sourceTypeOf == _typeOf<_i4.AuthTokenResponse?>()) &&
        (targetTypeOf == _typeOf<_i5.AuthTokenEntity>() ||
            targetTypeOf == _typeOf<_i5.AuthTokenEntity?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i5.AuthTokenEntity>() ||
            sourceTypeOf == _typeOf<_i5.AuthTokenEntity?>()) &&
        (targetTypeOf == _typeOf<_i4.AuthTokenResponse>() ||
            targetTypeOf == _typeOf<_i4.AuthTokenResponse?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i5.AuthTokenEntity>() ||
            sourceTypeOf == _typeOf<_i5.AuthTokenEntity?>()) &&
        (targetTypeOf == _typeOf<_i6.AuthTokenModel>() ||
            targetTypeOf == _typeOf<_i6.AuthTokenModel?>())) {
      return true;
    }
    if (recursive) {
      for (final mappr in _delegates) {
        if (mappr.canConvert<SOURCE, TARGET>()) {
          return true;
        }
      }
    }
    return false;
  }

  /// {@macro AutoMapprInterface:convert}
  /// {@macro package:app_instagram_clone/features/auth/data/mappers/auth_mapper.dart}
  @override
  TARGET convert<SOURCE, TARGET>(SOURCE? model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _convert(model)!;
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convert(model)!;
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:tryConvert}
  /// {@macro package:app_instagram_clone/features/auth/data/mappers/auth_mapper.dart}
  @override
  TARGET? tryConvert<SOURCE, TARGET>(
    SOURCE? model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
    onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _safeConvert(model, onMappingError: onMappingError);
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvert(model, onMappingError: onMappingError);
      }
    }

    return null;
  }

  /// {@macro AutoMapprInterface:convertIterable}
  /// {@macro package:app_instagram_clone/features/auth/data/mappers/auth_mapper.dart}
  @override
  Iterable<TARGET> convertIterable<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET>((item) => _convert(item)!);
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertIterable(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Iterable.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:app_instagram_clone/features/auth/data/mappers/auth_mapper.dart}
  @override
  Iterable<TARGET?> tryConvertIterable<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
    onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET?>(
        (item) => _safeConvert(item, onMappingError: onMappingError),
      );
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertIterable(model, onMappingError: onMappingError);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertList}
  /// {@macro package:app_instagram_clone/features/auth/data/mappers/auth_mapper.dart}
  @override
  List<TARGET> convertList<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toList();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertList(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into List.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:app_instagram_clone/features/auth/data/mappers/auth_mapper.dart}
  @override
  List<TARGET?> tryConvertList<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
    onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(
        model,
        onMappingError: onMappingError,
      ).toList();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertList(model, onMappingError: onMappingError);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertSet}
  /// {@macro package:app_instagram_clone/features/auth/data/mappers/auth_mapper.dart}
  @override
  Set<TARGET> convertSet<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toSet();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertSet(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Set.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:app_instagram_clone/features/auth/data/mappers/auth_mapper.dart}
  @override
  Set<TARGET?> tryConvertSet<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
    onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(
        model,
        onMappingError: onMappingError,
      ).toSet();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertSet(model, onMappingError: onMappingError);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  TARGET? _convert<SOURCE, TARGET>(
    SOURCE? model, {
    bool canReturnNull = false,
  }) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.SignInWithUserpassRequest>() ||
            sourceTypeOf == _typeOf<_i2.SignInWithUserpassRequest?>()) &&
        (targetTypeOf == _typeOf<_i3.SignInWithUserpassInput>() ||
            targetTypeOf == _typeOf<_i3.SignInWithUserpassInput?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$SignInWithUserpassRequest_To__i3$SignInWithUserpassInput(
            (model as _i2.SignInWithUserpassRequest?),
          )
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.SignInWithUserpassInput>() ||
            sourceTypeOf == _typeOf<_i3.SignInWithUserpassInput?>()) &&
        (targetTypeOf == _typeOf<_i2.SignInWithUserpassRequest>() ||
            targetTypeOf == _typeOf<_i2.SignInWithUserpassRequest?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$SignInWithUserpassInput_To__i2$SignInWithUserpassRequest(
            (model as _i3.SignInWithUserpassInput?),
          )
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i4.AuthTokenResponse>() ||
            sourceTypeOf == _typeOf<_i4.AuthTokenResponse?>()) &&
        (targetTypeOf == _typeOf<_i5.AuthTokenEntity>() ||
            targetTypeOf == _typeOf<_i5.AuthTokenEntity?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i4$AuthTokenResponse_To__i5$AuthTokenEntity(
            (model as _i4.AuthTokenResponse?),
          )
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i5.AuthTokenEntity>() ||
            sourceTypeOf == _typeOf<_i5.AuthTokenEntity?>()) &&
        (targetTypeOf == _typeOf<_i4.AuthTokenResponse>() ||
            targetTypeOf == _typeOf<_i4.AuthTokenResponse?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i5$AuthTokenEntity_To__i4$AuthTokenResponse(
            (model as _i5.AuthTokenEntity?),
          )
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i5.AuthTokenEntity>() ||
            sourceTypeOf == _typeOf<_i5.AuthTokenEntity?>()) &&
        (targetTypeOf == _typeOf<_i6.AuthTokenModel>() ||
            targetTypeOf == _typeOf<_i6.AuthTokenModel?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i5$AuthTokenEntity_To__i6$AuthTokenModel(
            (model as _i5.AuthTokenEntity?),
          )
          as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  TARGET? _safeConvert<SOURCE, TARGET>(
    SOURCE? model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
    onMappingError,
  }) {
    if (!useSafeMapping<SOURCE, TARGET>()) {
      return _convert(model, canReturnNull: true);
    }
    try {
      return _convert(model, canReturnNull: true);
    } catch (e, s) {
      onMappingError?.call(e, s, model);
      return null;
    }
  }

  /// {@macro AutoMapprInterface:useSafeMapping}
  /// {@macro package:app_instagram_clone/features/auth/data/mappers/auth_mapper.dart}
  @override
  bool useSafeMapping<SOURCE, TARGET>() {
    return false;
  }

  _i3.SignInWithUserpassInput
  _map__i2$SignInWithUserpassRequest_To__i3$SignInWithUserpassInput(
    _i2.SignInWithUserpassRequest? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping SignInWithUserpassRequest → SignInWithUserpassInput failed because SignInWithUserpassRequest was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<SignInWithUserpassRequest, SignInWithUserpassInput> to handle null values during mapping.',
      );
    }
    return _i3.SignInWithUserpassInput(
      email: model.email,
      password: model.password,
    );
  }

  _i2.SignInWithUserpassRequest
  _map__i3$SignInWithUserpassInput_To__i2$SignInWithUserpassRequest(
    _i3.SignInWithUserpassInput? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping SignInWithUserpassInput → SignInWithUserpassRequest failed because SignInWithUserpassInput was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<SignInWithUserpassInput, SignInWithUserpassRequest> to handle null values during mapping.',
      );
    }
    return _i2.SignInWithUserpassRequest(
      email: model.email,
      password: model.password,
    );
  }

  _i5.AuthTokenEntity _map__i4$AuthTokenResponse_To__i5$AuthTokenEntity(
    _i4.AuthTokenResponse? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping AuthTokenResponse → AuthTokenEntity failed because AuthTokenResponse was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<AuthTokenResponse, AuthTokenEntity> to handle null values during mapping.',
      );
    }
    return _i5.AuthTokenEntity(
      accessToken: model.accessToken,
      refreshToken: model.refreshToken,
    );
  }

  _i4.AuthTokenResponse _map__i5$AuthTokenEntity_To__i4$AuthTokenResponse(
    _i5.AuthTokenEntity? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping AuthTokenEntity → AuthTokenResponse failed because AuthTokenEntity was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<AuthTokenEntity, AuthTokenResponse> to handle null values during mapping.',
      );
    }
    return _i4.AuthTokenResponse(
      accessToken: model.accessToken,
      refreshToken: model.refreshToken,
    );
  }

  _i6.AuthTokenModel _map__i5$AuthTokenEntity_To__i6$AuthTokenModel(
    _i5.AuthTokenEntity? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping AuthTokenEntity → AuthTokenModel failed because AuthTokenEntity was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<AuthTokenEntity, AuthTokenModel> to handle null values during mapping.',
      );
    }
    return _i6.AuthTokenModel(
      accessToken: model.accessToken,
      refreshToken: model.refreshToken,
    );
  }
}
