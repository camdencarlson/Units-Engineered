//
//  PurchaseService.swift
//  Units Engineered
//
//  Created by Madison Carlson on 11/19/22.
//

import Foundation
import RevenueCat

class PurchaseService {
    @Published var allAccess = false;
    init() {
        Purchases.shared.getCustomerInfo { (customerInfo, error) in
            if customerInfo?.entitlements.all["allaccess"]?.isActive == true, error == nil {
                self.allAccess = true;
            }
        }
    }
    static func purchase(productID:String?) {
        guard productID != nil else {
            return
        }
        
        
//        Purchases.shared.products([productID!]) { products in
//            if !products.isEmpty {
//                skProduct = products[0]
//                
//                Purchases.shared.purchaseProduct(skProduct!) { (transaction, customerInfo, error, userCancelled) in
////                    if customerInfo?.entitlements.all["allaccess"]?.isActive == true {
////                        // Unlock that great "pro" content
////                    }
//                }
//                
//            }
//        }
        
    }
}
