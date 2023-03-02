//
//  SubscriptionView.swift
//  storekit2-youtube-demo-part-2
//
//  Created by Paulo Orquillo on 2/03/23.
//

import SwiftUI
import StoreKit

struct SubscriptionView: View {
    @EnvironmentObject var storeVM: StoreVM
    @State var isPurchased = false

    var body: some View {
        Group {
            Section("Upgrade to Premium") {
                ForEach(storeVM.subscriptions) { product in
                    Button(action: {
                        Task {
                            await buy(product: product)
                        }
                    }
                    )
                    {
                        
                        HStack {
                            Text(product.displayPrice)
                            Text(product.description)
                        }
                    }
                    
                }
            }
        }
    }
    
    func buy(product: Product) async {
        do {
            if try await storeVM.purchase(product) != nil {
                isPurchased = true
            }
        } catch {
            print("purchase failed")
        }
    }
}

struct SubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionView().environmentObject( StoreVM())
    }
}
