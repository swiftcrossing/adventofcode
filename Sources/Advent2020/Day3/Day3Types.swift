// Created on 2020/12/11.

import Foundation

struct TreeGrid {
  let rows: [TreeRow]

  var width: Int { rows.first?.spaces.count ?? 0 }

  func treeCount(right: Int, down: Int) -> Int {
    var treeCount = 0
    var hIndex = 0

    for vIndex in stride(from: 0, to: rows.count, by: down) {
      let row = rows[vIndex]
      treeCount += row.spaces[hIndex] == .tree ? 1 : 0
      hIndex = (hIndex + right) % width
    }

    return treeCount
  }

  func printContents(verbose: Bool) {
    print("Parsed contents:", verbose: verbose)
    for row in rows {
      print("\(row)", verbose: verbose)
    }
    print("", verbose: verbose)
  }
}

struct TreeRow {
  let spaces: [TreeSpace]
}

enum TreeSpace: Equatable {
  case empty
  case tree
}
