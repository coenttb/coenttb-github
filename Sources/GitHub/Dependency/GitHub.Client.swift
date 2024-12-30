import Coenttb_Web
import DependenciesMacros

@DependencyClient
public struct Client: Sendable {

}

extension GitHub.Client {
    public struct EnvVars: Codable {
        public var clientId: GitHub.Client.ID
        public var clientSecret: GitHub.Client.Secret
        
        public init(
            clientId: GitHub.Client.ID,
            clientSecret: GitHub.Client.Secret
        ) {
            self.clientId = clientId
            self.clientSecret = clientSecret
        }
    }
}

extension Client {
    public typealias ID = Tagged<(Self, id: ()), String>
    public typealias Secret = Tagged<(Self, secret: ()), String>
}
