// Created on 2020/12/11.

import Foundation

struct Day20Parser {
  static func parse(_ input: String) throws -> [Tile] {
    input
      .components(separatedBy: "\n\n")
      .compactMap(Self.parseTile)
  }

  private static func parseTile(_ string: String) -> Tile? {
    guard !string.isEmpty else { return nil }
    let lines = string.split(separator: "\n").map({ String($0) }).filter({ !$0.isEmpty })
    let id = String(lines[0].split(separator: " ")[1].split(separator: ":")[0])

    let tileLines = Array(lines.dropFirst())
    let leftLine = tileLines.map({ String($0.first!) }).joined()
    let rightLine = tileLines.map({ String($0.last!) }).joined()
    return Tile(
      id: id,
      hEdges: [
        String(tileLines[0]),
        String(tileLines[0].reversed()),
        String(tileLines.last!),
        String(tileLines.last!.reversed()),
      ],
      vEdges: [
        leftLine,
        String(leftLine.reversed()),
        rightLine,
        String(rightLine.reversed()),
      ],
      lines: tileLines
    )
  }
}
