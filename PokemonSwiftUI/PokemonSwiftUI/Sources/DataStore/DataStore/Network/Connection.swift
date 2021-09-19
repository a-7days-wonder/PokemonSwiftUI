import Alamofire

enum Connection {
    case cellular
    case ethernetOrWifi
    case offline
}

enum ConnectionMapper {
    static func map(_ status: Alamofire.NetworkReachabilityManager.NetworkReachabilityStatus) -> Connection {
        switch status {
        case .unknown:
            return .offline

        case .notReachable:
            return .offline

        case let .reachable(connection):
            switch connection {
            case .ethernetOrWiFi:
                return .ethernetOrWifi

            case .cellular:
                return .cellular
            }
        }
    }
}
