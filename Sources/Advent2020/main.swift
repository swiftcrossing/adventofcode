import ArgumentParser

struct Advent: ParsableCommand {
  static let configuration = CommandConfiguration(
    abstract: "Execute the solutions to the 2020 Advent of Code challenge",
    subcommands: []
  )

  @Option(name: .shortAndLong, parsing: .unconditional, help: "Day to solve\nPossible values: \(Day.possibleValues)")
  private var day: Int

  @Option(name: .shortAndLong, parsing: .unconditional, help: "Part to solve in day\nPossible values: 1, 2")
  private var part: Int

  @Option(name: .shortAndLong, parsing: .unconditional, help: "Path to the problem input file")
  private var inputFile: String

  @Option(name: .shortAndLong, parsing: .unconditional, help: "Path to which output will be written")
  private var outputFile: String?

  @Flag(name: .shortAndLong, help: "Show extra logging for debugging purposes")
  private var verbose: Bool = false

  var solution: Solution? { Day(intValue: day)?.solution }

  init() { }

  func run() throws {
    let outputDestination = outputFile ?? "stdout"
    print("Reading from \(inputFile)", verbose: verbose)
    print("Outputting to \(outputDestination)", verbose: verbose)

    do {
      let input = try FileReader.read(file: inputFile)
      print("Input file contents:\n\(input)", verbose: verbose)

      guard let solution = solution else {
        throw ParameterError.day(day)
      }

      let output = try solution.solve(for: input, part: part, verbose: verbose)
      try OutputWriter.write(contents: output, to: outputFile)
    } catch ParameterError.day(let value) {
      print("Invalid day <\(value)>.\n\n\(Advent.helpMessage())")
    } catch ParameterError.part(let value) {
      print("Invalid part <\(value)>.\n\n\(Advent.helpMessage())")
    }
  }
}

Advent.main()
