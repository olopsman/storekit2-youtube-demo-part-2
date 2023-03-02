//
//  ContentView.swift
//  storekit2-youtube-demo-part-2
//
//  Created by Paulo Orquillo on 28/02/23.
//

import SwiftUI
import StoreKit

struct ContentView: View {
    @StateObject var storeVM = StoreVM()
    var body: some View {
        VStack {
            // what the fuck is this
            if let subscriptionGroupStatus = storeVM.subscriptionGroupStatus {
                if subscriptionGroupStatus == .expired || subscriptionGroupStatus == .revoked {
                    Text("Welcome back, give the subscription another try.")
                    //display products
                }
            }
            if storeVM.purchasedSubscriptions.isEmpty {
                SubscriptionView()
                
            } else {
                Text("Premium Content")
            }
        }
        .environmentObject(storeVM)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
