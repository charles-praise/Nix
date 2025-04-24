part of 'chat_cubit.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatState {}

final class ChatSignedIn extends ChatState {
  final Usermodel user;
  const ChatSignedIn(this.user);
}

final class ChatLoaded extends ChatState {
  final List<Map<String, dynamic>> messages;
  const ChatLoaded(this.messages);
}

final class ChatError extends ChatState {
  final String error;
  const ChatError(this.error);
}
