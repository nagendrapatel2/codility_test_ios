//
//  UserWebService.swift
//  DemoApp
//
//  Created by Nagendra Patel  on 03/10/23.
//

import Foundation

protocol UserListRepository: WebRepository {
    func fetchUserList() async throws -> [User]
}

struct UserListWebService: UserListRepository {
    
    let baseURL: String = AppEnvironment.baseURL
    let session: URLSession
    init(session: URLSession = .shared) {
        self.session = session
    }
    func fetchUserList() async throws -> [User] {
        let response: Users = try await request(
            endpoint: MyUserAPI.fetchUserList
        )
        return response.users
    }
}

extension UserListWebService {
    enum MyUserAPI: APIClient {
        case fetchUserList
        var path: String {
            switch self {
            case .fetchUserList:
                return   Constants.APIEndPoint.users
            }
        }
        var method: String {
            switch self {
            case .fetchUserList: return Constants.RequestMethod.get
            }
        }
        var headers: [String : String]? {
            nil
        }
        
        func body() throws -> Data? {
            nil
        }
    }
}

