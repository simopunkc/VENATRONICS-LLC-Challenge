import 'package:test/test.dart';

class PlayerStateDto {
  final int? prev;
  final bool isPlayed;
  final int playerIndex;
  final int? next;

  PlayerStateDto({
    this.prev = null,
    required this.isPlayed,
    required this.playerIndex,
    this.next = null,
  });

  factory PlayerStateDto.fromJson(Map<String, dynamic> json) {
    return PlayerStateDto(
      prev: json['prev'],
      isPlayed: json['isPlayed'],
      playerIndex: json['playerIndex'],
      next: json['next'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'prev': prev,
      'isPlayed': isPlayed,
      'playerIndex': playerIndex,
      'next': next,
    };
  }

  @override
  String toString() {
    return 'PlayerStateDto{prev: $prev, isPlayed: $isPlayed, playerIndex: $playerIndex, next: $next}';
  }
}

Map<int, PlayerStateDto> getPlayerState(
    List<int> playlist, int currentPlayerId) {
  List<int> uniquePlaylist = playlist.toSet().toList();
  Map<int, PlayerStateDto> currentPlayerState = {};

  if (currentPlayerId == uniquePlaylist.last) {
    uniquePlaylist.removeLast();
    uniquePlaylist.shuffle();
    uniquePlaylist.add(currentPlayerId);
    uniquePlaylist = uniquePlaylist.reversed.toList();
  }
  for (var i = 0; i < uniquePlaylist.length; i++) {
    final int e = uniquePlaylist[i];
    if (!currentPlayerState.containsKey(e)) {
      final bool isPlayed =
          (i <= uniquePlaylist.indexOf(currentPlayerId)) ? true : false;
      final int? prev = (i - 1 >= 0) ? uniquePlaylist[i - 1] : null;
      final int? next =
          (i + 1 >= uniquePlaylist.length) ? null : uniquePlaylist[i + 1];
      currentPlayerState[e] = PlayerStateDto(
        prev: prev,
        isPlayed: isPlayed,
        playerIndex: i,
        next: next,
      );
    } else {
      continue;
    }
  }
  return currentPlayerState;
}

void main() {
  const List<int> playlist = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  test('test play id first', () {
    final int playerId = playlist.first;
    final int nextPlayerId = playerId + 1;
    final Map<int, PlayerStateDto> result = getPlayerState(playlist, playerId);

    expect(result[playerId]?.prev, equals(null));
    expect(result[playerId]?.isPlayed, equals(true));
    expect(result[playerId]?.playerIndex, equals(0));
    expect(result[playerId]?.next, equals(2));

    expect(result[nextPlayerId]?.prev, equals(1));
    expect(result[nextPlayerId]?.isPlayed, equals(false));
    expect(result[nextPlayerId]?.playerIndex, equals(1));
    expect(result[nextPlayerId]?.next, equals(3));
  });

  test('test play id 2', () {
    const int playerId = 2;
    const int nextPlayerId = playerId + 1;
    final Map<int, PlayerStateDto> result = getPlayerState(playlist, playerId);

    expect(result[playerId]?.prev, equals(1));
    expect(result[playerId]?.isPlayed, equals(true));
    expect(result[playerId]?.playerIndex, equals(1));
    expect(result[playerId]?.next, equals(3));

    expect(result[nextPlayerId]?.prev, equals(2));
    expect(result[nextPlayerId]?.isPlayed, equals(false));
    expect(result[nextPlayerId]?.playerIndex, equals(2));
    expect(result[nextPlayerId]?.next, equals(4));
  });

  test('test play id 4', () {
    const int playerId = 4;
    const int currentPlayerId = playerId - 1;
    final Map<int, PlayerStateDto> result =
        getPlayerState(playlist, currentPlayerId);

    expect(result[playerId]?.prev, isNot(equals(1)));
    expect(result[playerId]?.isPlayed, isNot(equals(true)));
    expect(result[playerId]?.playerIndex, isNot(equals(1)));
    expect(result[playerId]?.next, isNot(equals(3)));
  });

  test('test play id last', () {
    int playerId = playlist.last;
    final Map<int, PlayerStateDto> result = getPlayerState(playlist, playerId);

    expect(result[playerId]?.prev, equals(null));
    expect(result[playerId]?.isPlayed, equals(true));
    expect(result[playerId]?.playerIndex, equals(0));
    expect(result[playerId]?.next, isNot(equals(playerId)));

    List<int> currentPlaylist = result.keys.toList();
    expect(currentPlaylist, isNot(equals(playlist)));

    PlayerStateDto? lastPlayer = result[result.keys.last];
    expect(lastPlayer?.prev, isNot(equals(result.keys.last)));
    expect(lastPlayer?.isPlayed, equals(false));
    expect(lastPlayer?.playerIndex, equals(playlist.length - 1));
    expect(lastPlayer?.next, equals(null));
  });
}
