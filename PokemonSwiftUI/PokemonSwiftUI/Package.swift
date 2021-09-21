// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PokemonSwiftUI",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AppRoot",
            targets: ["AppRoot"]
        )
    ],
    dependencies: [
        .package(
            name: "Alamofire",
            url: "https://github.com/Alamofire/Alamofire",
            from: "5.4.3"
        )
    ],
    targets: [
        .target(
            name: "DataStore",
            dependencies: [
                .product(
                    name: "Alamofire",
                    package: "Alamofire",
                    condition: .when(platforms: [.iOS])
                )
            ]
        ),
        .target(
            name: "Domain",
            dependencies: ["DataStore"]
        ),
        .target(
            name: "AppRoot",
            dependencies: [
                "Domain",
                "PokemonList"
            ],
            path: "Sources/Presentation/Modules/AppRoot"
        ),
        .target(
            name: "PokemonDetail",
            dependencies: ["Domain"],
            path: "Sources/Presentation/Modules/PokemonDetail"
        ),
        .target(
            name: "PokemonList",
            dependencies: [
                "Domain",
                "PokemonDetail"
            ],
            path: "Sources/Presentation/Modules/PokemonList"
        ),
        .target(
            name: "WebView",
            dependencies: [],
            path: "Sources/Presentation/Modules/WebView"
        )
    ]
)
