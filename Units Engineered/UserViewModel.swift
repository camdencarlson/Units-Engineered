//
//  UserViewModel.swift
//  Units Engineered
//
//  Created by Madison Carlson on 11/20/22.
//

import SwiftUI
import RevenueCat

class UserViewModel: ObservableObject {
    @Published var isSubscriptionActive = false
    @Published var package:Offering? = nil
    
    init() {
        Purchases.shared.getCustomerInfo {(customerInfo, error) in
            self.isSubscriptionActive = customerInfo?.entitlements.all["allaccess"]?.isActive == true
        }
        Purchases.shared.getOfferings { (offerings, error) in
            if (offerings?.current?.availablePackages) != nil {
                self.package = offerings?.current
            }
        }
    }
}
