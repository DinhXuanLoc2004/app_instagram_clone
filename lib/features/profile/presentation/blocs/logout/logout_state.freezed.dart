// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LogoutState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogoutState()';
}


}

/// @nodoc
class $LogoutStateCopyWith<$Res>  {
$LogoutStateCopyWith(LogoutState _, $Res Function(LogoutState) __);
}


/// Adds pattern-matching-related methods to [LogoutState].
extension LogoutStatePatterns on LogoutState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _Failrue value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failrue() when failure != null:
return failure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _Failrue value)  failure,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _Failrue():
return failure(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _Failrue value)?  failure,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failrue() when failure != null:
return failure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function()?  loading,TResult Function()?  success,TResult Function( FailureType failureType,  String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success();case _Failrue() when failure != null:
return failure(_that.failureType,_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function()  loading,required TResult Function()  success,required TResult Function( FailureType failureType,  String message)  failure,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _Loading():
return loading();case _Success():
return success();case _Failrue():
return failure(_that.failureType,_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( FailureType failureType,  String message)?  failure,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success();case _Failrue() when failure != null:
return failure(_that.failureType,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Init implements LogoutState {
  const _Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogoutState.init()';
}


}




/// @nodoc


class _Loading implements LogoutState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogoutState.loading()';
}


}




/// @nodoc


class _Success implements LogoutState {
  const _Success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogoutState.success()';
}


}




/// @nodoc


class _Failrue implements LogoutState {
  const _Failrue(this.failureType, this.message);
  

 final  FailureType failureType;
 final  String message;

/// Create a copy of LogoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailrueCopyWith<_Failrue> get copyWith => __$FailrueCopyWithImpl<_Failrue>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failrue&&(identical(other.failureType, failureType) || other.failureType == failureType)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,failureType,message);

@override
String toString() {
  return 'LogoutState.failure(failureType: $failureType, message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailrueCopyWith<$Res> implements $LogoutStateCopyWith<$Res> {
  factory _$FailrueCopyWith(_Failrue value, $Res Function(_Failrue) _then) = __$FailrueCopyWithImpl;
@useResult
$Res call({
 FailureType failureType, String message
});




}
/// @nodoc
class __$FailrueCopyWithImpl<$Res>
    implements _$FailrueCopyWith<$Res> {
  __$FailrueCopyWithImpl(this._self, this._then);

  final _Failrue _self;
  final $Res Function(_Failrue) _then;

/// Create a copy of LogoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failureType = null,Object? message = null,}) {
  return _then(_Failrue(
null == failureType ? _self.failureType : failureType // ignore: cast_nullable_to_non_nullable
as FailureType,null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
