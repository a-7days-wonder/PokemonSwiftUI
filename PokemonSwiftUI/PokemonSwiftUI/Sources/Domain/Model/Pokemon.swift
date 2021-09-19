import DataStore

public struct Pokemon {
    public let name: String
    public let url: String

    init(from resource: NamedUrlResource) {
        name = resource.name
        url = resource.url
    }
}
