//
//  PurchaseView.swift
//  Units Engineered
//
//  Created by Madison Carlson on 11/24/22.
//

import SwiftUI
import RevenueCat

struct PurchaseView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State var viewModel: UnitsSession
    @State private var showAlert = false
    @Binding var purchaseView: Bool
    
    var body: some View {
        Button(action: {
            purchaseView = !purchaseView
        }, label: {
            Text("Back")
        })
        .padding()
        
        if userViewModel.isSubscriptionActive != true {
            if userViewModel.package != nil {
                Button(action: {
                    showAlert = true
                }, label: {
                    Text("Go Pro")
                        .foregroundColor(Color(UIColor.systemBackground))
                        .background(Rectangle()
                            .frame(width: 100, height: 30)
                            .foregroundColor(.blue)
                            .cornerRadius(15))
                })
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("All-Access Annual Subscription"),
                        message: Text("Would you like to purchase the Annual All-Access subscription unlocking all 200+ unit conversions for $9.99/yr?"),
                        primaryButton: .default(
                            Text("Purchase"),
                            action: {Purchases.shared.purchase(package: userViewModel.package!.availablePackages[0]) { (transaction, customerInfo, error, userCancelled) in
                                if customerInfo?.entitlements["allaccess"]?.isActive == true {
                                    userViewModel.isSubscriptionActive = true
                                }
                                viewModel.allAccess = userViewModel.isSubscriptionActive
                              }}
                        ),
                        secondaryButton: .destructive(
                            Text("Cancel")
                        )
                    )
                }
//                Button(action: {
//                    Purchases.shared.purchase(package: userViewModel.package!.availablePackages[0]) { (transaction, customerInfo, error, userCancelled) in
//                      if customerInfo?.entitlements["allaccess"]?.isActive == true {
//                          userViewModel.isSubscriptionActive = true
//                      }
//                    }
//                    viewModel.allAccess = userViewModel.isSubscriptionActive
//                }, label: {
//                    ZStack {
//                        Text("Go Pro")
//                            .foregroundColor(Color(UIColor.systemBackground))
//                            .background(Rectangle()
//                                .frame(width: 100, height: 30)
//                                .foregroundColor(.blue)
//                                .cornerRadius(15))
//
//
//                    }
//                    .padding([.top, .trailing, .leading])
//
//
//                })
            }
            
        }
        Button(action: {
            Purchases.shared.restorePurchases { (customerInfo, error) in
                if customerInfo?.entitlements["allaccess"]?.isActive == true {
                    userViewModel.isSubscriptionActive = true
                }
                viewModel.allAccess = userViewModel.isSubscriptionActive
            }
        }, label: {
            ZStack {
                Text("Restore Purchases")
                    .foregroundColor(Color(UIColor.systemBackground))
                    .background(Rectangle()
                        .frame(width: 160, height: 30)
                        .foregroundColor(.blue)
                        .cornerRadius(15))
                
                
            }
            .padding([.top, .trailing, .leading])
        })
        
        Spacer()
        
        HStack {
            Text("[Privacy Policy](https://sites.google.com/view/unitsengineered/privacy-policy)")
            Text("[Terms of Use](https://www.apple.com/legal/internet-services/itunes/dev/stdeula/)")
        }
    }
}
