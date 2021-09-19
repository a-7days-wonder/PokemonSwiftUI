import Alamofire

enum ReachabilityDataStoreProvider {
    static func provide() -> ReachabilityDataStore {
        ReachabilityDataStoreImpl()
    }
}

protocol ReachabilityDataStore {
    var connection: Connection { get }
    var isReachable: Bool { get }
}

struct ReachabilityDataStoreImpl {
}

extension ReachabilityDataStoreImpl: ReachabilityDataStore {
    var connection: Connection {
        guard let status = Alamofire.NetworkReachabilityManager.default?.status else {
            return .offline
        }
        return ConnectionMapper.map(status)
    }

    var isReachable: Bool {
        connection != .offline
    }
}
