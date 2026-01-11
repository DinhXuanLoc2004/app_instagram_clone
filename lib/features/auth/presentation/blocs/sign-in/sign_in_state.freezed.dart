// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignInState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignInState()';
}


}

/// @nodoc
class $SignInStateCopyWith<$Res>  {
$SignInStateCopyWith(SignInState _, $Res Function(SignInState) __);
}


/// Adds pattern-matching-related methods to [SignInState].
extension SignInStatePatterns on SignInState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  inittial,TResult Function( _UserpassLoading value)?  userpassLoading,TResult Function( _FacebookLoading value)?  facebookLoading,TResult Function( _Success value)?  success,TResult Function( _UserpassFailure value)?  userpassFailure,TResult Function( _FacebookFailure value)?  facebookFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when inittial != null:
return inittial(_that);case _UserpassLoading() when userpassLoading != null:
return userpassLoading(_that);case _FacebookLoading() when facebookLoading != null:
return facebookLoading(_that);case _Success() when success != null:
return success(_that);case _UserpassFailure() when userpassFailure != null:
return userpassFailure(_that);case _FacebookFailure() when facebookFailure != null:
return facebookFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  inittial,required TResult Function( _UserpassLoading value)  userpassLoading,required TResult Function( _FacebookLoading value)  facebookLoading,required TResult Function( _Success value)  success,required TResult Function( _UserpassFailure value)  userpassFailure,required TResult Function( _FacebookFailure value)  facebookFailure,}){
final _that = this;
switch (_that) {
case _Initial():
return inittial(_that);case _UserpassLoading():
return userpassLoading(_that);case _FacebookLoading():
return facebookLoading(_that);case _Success():
return success(_that);case _UserpassFailure():
return userpassFailure(_that);case _FacebookFailure():
return facebookFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  inittial,TResult? Function( _UserpassLoading value)?  userpassLoading,TResult? Function( _FacebookLoading value)?  facebookLoading,TResult? Function( _Success value)?  success,TResult? Function( _UserpassFailure value)?  userpassFailure,TResult? Function( _FacebookFailure value)?  facebookFailure,}){
final _that = this;
switch (_that) {
case _Initial() when inittial != null:
return inittial(_that);case _UserpassLoading() when userpassLoading != null:
return userpassLoading(_that);case _FacebookLoading() when facebookLoading != null:
return facebookLoading(_that);case _Success() when success != null:
return success(_that);case _UserpassFailure() when userpassFailure != null:
return userpassFailure(_that);case _FacebookFailure() when facebookFailure != null:
return facebookFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  inittial,TResult Function()?  userpassLoading,TResult Function()?  facebookLoading,TResult Function()?  success,TResult Function( FailureType failureType,  String message)?  userpassFailure,TResult Function( FailureType failureType,  String message)?  facebookFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when inittial != null:
return inittial();case _UserpassLoading() when userpassLoading != null:
return userpassLoading();case _FacebookLoading() when facebookLoading != null:
return facebookLoading();case _Success() when success != null:
return success();case _UserpassFailure() when userpassFailure != null:
return userpassFailure(_that.failureType,_that.message);case _FacebookFailure() when facebookFailure != null:
return facebookFailure(_that.failureType,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  inittial,required TResult Function()  userpassLoading,required TResult Function()  facebookLoading,required TResult Function()  success,required TResult Function( FailureType failureType,  String message)  userpassFailure,required TResult Function( FailureType failureType,  String message)  facebookFailure,}) {final _that = this;
switch (_that) {
case _Initial():
return inittial();case _UserpassLoading():
return userpassLoading();case _FacebookLoading():
return facebookLoading();case _Success():
return success();case _UserpassFailure():
return userpassFailure(_that.failureType,_that.message);case _FacebookFailure():
return facebookFailure(_that.failureType,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  inittial,TResult? Function()?  userpassLoading,TResult? Function()?  facebookLoading,TResult? Function()?  success,TResult? Function( FailureType failureType,  String message)?  userpassFailure,TResult? Function( FailureType failureType,  String message)?  facebookFailure,}) {final _that = this;
switch (_that) {
case _Initial() when inittial != null:
return inittial();case _UserpassLoading() when userpassLoading != null:
return userpassLoading();case _FacebookLoading() when facebookLoading != null:
return facebookLoading();case _Success() when success != null:
return success();case _UserpassFailure() when userpassFailure != null:
return userpassFailure(_that.failureType,_that.message);case _FacebookFailure() when facebookFailure != null:
return facebookFailure(_that.failureType,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SignInState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignInState.inittial()';
}


}




/// @nodoc


class _UserpassLoading implements SignInState {
  const _UserpassLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserpassLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignInState.userpassLoading()';
}


}




/// @nodoc


class _FacebookLoading implements SignInState {
  const _FacebookLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacebookLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignInState.facebookLoading()';
}


}




/// @nodoc


class _Success implements SignInState {
  const _Success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignInState.success()';
}


}




/// @nodoc


class _UserpassFailure implements SignInState {
  const _UserpassFailure(this.failureType, this.message);
  

 final  FailureType failureType;
 final  String message;

/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserpassFailureCopyWith<_UserpassFailure> get copyWith => __$UserpassFailureCopyWithImpl<_UserpassFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserpassFailure&&(identical(other.failureType, failureType) || other.failureType == failureType)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,failureType,message);

@override
String toString() {
  return 'SignInState.userpassFailure(failureType: $failureType, message: $message)';
}


}

/// @nodoc
abstract mixin class _$UserpassFailureCopyWith<$Res> implements $SignInStateCopyWith<$Res> {
  factory _$UserpassFailureCopyWith(_UserpassFailure value, $Res Function(_UserpassFailure) _then) = __$UserpassFailureCopyWithImpl;
@useResult
$Res call({
 FailureType failureType, String message
});




}
/// @nodoc
class __$UserpassFailureCopyWithImpl<$Res>
    implements _$UserpassFailureCopyWith<$Res> {
  __$UserpassFailureCopyWithImpl(this._self, this._then);

  final _UserpassFailure _self;
  final $Res Function(_UserpassFailure) _then;

/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failureType = null,Object? message = null,}) {
  return _then(_UserpassFailure(
null == failureType ? _self.failureType : failureType // ignore: cast_nullable_to_non_nullable
as FailureType,null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _FacebookFailure implements SignInState {
  const _FacebookFailure(this.failureType, this.message);
  

 final  FailureType failureType;
 final  String message;

/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacebookFailureCopyWith<_FacebookFailure> get copyWith => __$FacebookFailureCopyWithImpl<_FacebookFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacebookFailure&&(identical(other.failureType, failureType) || other.failureType == failureType)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,failureType,message);

@override
String toString() {
  return 'SignInState.facebookFailure(failureType: $failureType, message: $message)';
}


}

/// @nodoc
abstract mixin class _$FacebookFailureCopyWith<$Res> implements $SignInStateCopyWith<$Res> {
  factory _$FacebookFailureCopyWith(_FacebookFailure value, $Res Function(_FacebookFailure) _then) = __$FacebookFailureCopyWithImpl;
@useResult
$Res call({
 FailureType failureType, String message
});




}
/// @nodoc
class __$FacebookFailureCopyWithImpl<$Res>
    implements _$FacebookFailureCopyWith<$Res> {
  __$FacebookFailureCopyWithImpl(this._self, this._then);

  final _FacebookFailure _self;
  final $Res Function(_FacebookFailure) _then;

/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failureType = null,Object? message = null,}) {
  return _then(_FacebookFailure(
null == failureType ? _self.failureType : failureType // ignore: cast_nullable_to_non_nullable
as FailureType,null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
