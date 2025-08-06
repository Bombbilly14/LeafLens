//
//  ManageAccount.swift
//  LeafLens
//
//  Created by William German on 7/28/25.
//

import SwiftUI
import Supabase
struct ManageAccount: View {
    @EnvironmentObject var userData: AuthViewModel
    var body: some View {
        VStack() {
            Text(userData.user?.email ?? "No Email")
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Card5"))
    }
    
}


#Preview {
//    let previewClient = SupabaseClient(
//        supabaseURL: URL(string: "https://orcmlvodylvfdqawtjof.supabase.co")!,
//        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9yY21sdm9keWx2ZmRxYXd0am9mIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDU1MjI0ODksImV4cCI6MjA2MTA5ODQ4OX0.w834Zc-5zfo8UP57Ev6-YPNxSgiab6Uvv-S1TChXCSg"
//      )
//        let AuthViewModel = AuthViewModel(client: previewClient)
    ManageAccount()
//    .environmentObject(AuthViewModel)
}
