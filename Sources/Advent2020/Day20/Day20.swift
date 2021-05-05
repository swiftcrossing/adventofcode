// Created on 2020/12/11.

import ArgumentParser

struct Day20: Solution {
  func solve1(for input: String, verbose: Bool) throws -> String {
    let parsed = try Day20Parser.parse(input)
    parsed.printContents(verbose: verbose)
    let sum = parsed
      .map(compareEdges(tiles: parsed))
      .compactMap({ pair -> Int? in
        guard pair.1 == 2 else { return nil }
        return Int(pair.0)!
      })
      .reduce(1, *)
    return String(sum)
  }

  func solve2(for input: String, verbose: Bool) throws -> String {
    let parsed = try Day20Parser.parse(input)
    parsed.printContents(verbose: verbose)
    return String(parsed.count * 2)
  }

  private func compareEdges(tiles: [Tile]) -> (Tile) -> (String, Int) {
    return { tile in
      tiles.reduce((tile.id, 0)) { (acc, next) -> (String, Int) in
        guard tile.id != next.id else { return acc }

        var acc = acc
        acc.1 += tile.hEdges.intersection(next.hEdges).isEmpty ? 0 : 1
        acc.1 += tile.vEdges.intersection(next.vEdges).isEmpty ? 0 : 1
        acc.1 += tile.hEdges.intersection(next.vEdges).isEmpty ? 0 : 1
        acc.1 += tile.vEdges.intersection(next.hEdges).isEmpty ? 0 : 1
        return acc
      }
    }
  }
}
