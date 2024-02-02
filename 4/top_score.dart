import 'package:test/test.dart';

class ScorerDto {
  final String name;
  final int goal;

  ScorerDto({
    required this.name,
    required this.goal,
  });

  factory ScorerDto.fromJson(Map<String, dynamic> json) {
    return ScorerDto(
      name: json['name'],
      goal: json['goal'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'goal': goal,
    };
  }

  @override
  String toString() {
    return 'ScorerDto{name: $name, goal: $goal}';
  }
}

class RankScoreDto {
  final int rank;
  final String name;
  final int score;

  RankScoreDto({
    required this.rank,
    required this.name,
    required this.score,
  });

  factory RankScoreDto.fromJson(Map<String, dynamic> json) {
    return RankScoreDto(
      rank: json['rank'],
      name: json['name'],
      score: json['score'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'rank': rank,
      'name': name,
      'score': score,
    };
  }

  @override
  String toString() {
    return 'RankScoreDto{rank, $rank, name: $name, score: $score}';
  }
}

List<RankScoreDto> getTopScore(List<ScorerDto> scorer) {
  scorer.sort((a, b) {
    int compareGoal = b.goal.compareTo(a.goal);
    if (compareGoal == 0) {
      return a.name.compareTo(b.name);
    } else {
      return compareGoal;
    }
  });

  List<RankScoreDto> result = [];
  int currentRank = 1;
  int currentGoal = scorer.first.goal;
  for (var i = 0; i < scorer.length; i++) {
    if (currentGoal > scorer[i].goal) {
      currentRank = i + 1;
      currentGoal = scorer[i].goal;
    }
    result.add(RankScoreDto(
        rank: currentRank, name: scorer[i].name, score: scorer[i].goal));
  }
  return result;
}

void main() {
  test('test find top score 1', () {
    final List<ScorerDto> scorer = [
      ScorerDto(name: "A", goal: 10),
      ScorerDto(name: "B", goal: 6),
      ScorerDto(name: "C", goal: 6),
      ScorerDto(name: "D", goal: 2),
    ];
    final List<RankScoreDto> result = getTopScore(scorer);

    expect(result[0].rank, equals(1));
    expect(result[1].rank, equals(2));
    expect(result[2].rank, equals(2));
    expect(result[3].rank, equals(4));
  });

  test('test find top score 2', () {
    final List<ScorerDto> scorer = [
      ScorerDto(name: "Bob", goal: 4),
      ScorerDto(name: "John", goal: 8),
      ScorerDto(name: "Bill", goal: 7),
      ScorerDto(name: "Lauda", goal: 1),
    ];
    final List<RankScoreDto> result = getTopScore(scorer);

    expect(result[0].rank, equals(1));
    expect(result[0].name, equals('John'));
    expect(result[1].rank, equals(2));
    expect(result[1].name, equals('Bill'));
    expect(result[2].rank, equals(3));
    expect(result[2].name, equals('Bob'));
    expect(result[3].rank, equals(4));
    expect(result[3].name, equals('Lauda'));
  });

  test('test find top score 3', () {
    final List<ScorerDto> scorer = [
      ScorerDto(name: "Erling Haaland", goal: 14),
      ScorerDto(name: "Mohamed Salah", goal: 14),
      ScorerDto(name: "Dominic Solanke", goal: 12),
      ScorerDto(name: "Son Heung-Min", goal: 12),
      ScorerDto(name: "Jarrod Bowen", goal: 11),
      ScorerDto(name: "Hwang Hee-Chan", goal: 10),
      ScorerDto(name: "Alexander Isak", goal: 10),
      ScorerDto(name: "Cole Palmer", goal: 9),
      ScorerDto(name: "Ollie Watkins", goal: 9),
      ScorerDto(name: "Chris Wood", goal: 8),
    ];
    final List<RankScoreDto> result = getTopScore(scorer);

    expect(result[0].rank, equals(1));
    expect(result[1].rank, equals(1));
    expect(result[2].rank, equals(3));
    expect(result[3].rank, equals(3));
    expect(result[4].rank, equals(5));
  });
}
