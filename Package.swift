// swift-tools-version:6.0

import Foundation
import PackageDescription

extension String {
    static let github: Self = "GitHub"
}

extension Target.Dependency {
    static var github: Self { .target(name: .github) }
}

extension Target.Dependency {
    static var coenttbWeb: Self { .product(name: "Coenttb Web", package: "coenttb-web") }
    static var dependenciesMacros: Self { .product(name: "DependenciesMacros", package: "swift-dependencies") }
}

let package = Package(
    name: "coenttb-github",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(name: .github, targets: [.github]),
    ],
    dependencies: [
        .package(url: "https://github.com/coenttb/coenttb-web", branch: "main"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.6.0"),
    ],
    targets: [
        .target(
            name: .github,
            dependencies: [
                .coenttbWeb,
                .dependenciesMacros,
            ]
        ),
        .testTarget(
            name: .github + " Tests",
            dependencies: [
                .github
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)
