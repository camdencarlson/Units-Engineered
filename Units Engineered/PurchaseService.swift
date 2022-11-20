//
//  PurchaseService.swift
//  Units Engineered
//
//  Created by Madison Carlson on 11/19/22.
//

import Foundation
import Purchases

class PurchaseService {
    @Published var allAccess = false;
    static func purchase(productID:String?) {
        guard productID != nil else {
            return
        }
        var skProduct:SKProduct?
        
        Purchases.shared.products([productID!]) { products in
            if !products.isEmpty {
                skProduct = products[0]
                
                Purchases.shared.purchaseProduct(skProduct!) { (transaction, customerInfo, error, userCancelled) in
//                    if customerInfo?.entitlements.all["allaccess"]?.isActive == true {
//                        // Unlock that great "pro" content
//                    }
                }
                
            }
        }
        
    }
}
