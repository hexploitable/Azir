import PackageDescription

let package = Package(
    name: "Azir",
    dependencies: [
      .Package(
        url: "https://github.com/vapor/redbird",
        majorVersion: 1
      )
    ]
)
