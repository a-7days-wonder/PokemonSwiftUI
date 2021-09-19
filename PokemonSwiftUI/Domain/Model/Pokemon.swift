struct Pokemon {
    let name: String
    let url: String

    init(from resource: NamedUrlResource) {
        name = resource.name
        url = resource.url
    }
}
