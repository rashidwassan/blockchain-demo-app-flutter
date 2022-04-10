class Block {
  final String hash;
  final String previousHash;
  final String data;
  final String timestamp;
  final int nonce;
  final int? difficulty;

  Block({
    required this.hash,
    required this.previousHash,
    required this.data,
    required this.timestamp,
    required this.nonce,
    this.difficulty,
  });
}
