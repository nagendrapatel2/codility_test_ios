//
//  UserListCellView.swift
//  DemoApp
//
//  Created by Nagendra on 03/10/23.
//

import SwiftUI
struct UserListCellView: View {
    var user: User
    var body: some View {
        NavigationLink(destination: UserDetailView(selectedUser: user)) {
            UserView(user: user)
        }
    }
}
