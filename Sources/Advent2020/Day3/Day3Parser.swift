// Created on 2020/12/11.

import Foundation

struct Day3Parser {
  static func parse(_ input: String) throws -> TreeGrid {
    let lines = input.split(separator: "\n")
    let rows = lines.map({ line -> TreeRow in
      TreeRow( spaces: line.map({ String($0) == "#" ? TreeSpace.tree : .empty }))
    })
    let grid = TreeGrid(rows: rows)
    return grid
  }
}
