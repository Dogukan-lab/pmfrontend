import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/entities/profile.dart';
import 'package:pmfrontend/presentation/states/chat_list_state.dart';

void getChatList(WidgetRef ref) async {
  await Future.delayed(const Duration(seconds: 1));

  ref.read(chatListState.notifier).state = Map.of({
    const Profile('Heirloomless', '', 5, false): 'chatlog 1',
    const Profile('LarsingDash', '', 4, true): 'chatlog 2',
    const Profile('Owon', '', 0, false): 'chatlog 3',
    const Profile('Owon', '.', 0, false): 'chatlog 3',
    const Profile('Owon', '..', 0, false): 'chatlog 3',
    const Profile('Owon', '...', 0, false): 'chatlog 3',
    const Profile('Owon', '....', 0, false): 'chatlog 3',
    const Profile('Owon', '.....', 0, false): 'chatlog 3',
    const Profile('Owon', '......', 0, false): 'chatlog 3',
  });
}
