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
    let images = ["3","2","1","6"]
    
    var body: some View {
        ZStack {
            HStack {
                Button(action: {
                    purchaseView = !purchaseView
                }, label: {
                    Label("", systemImage: "arrow.backward")
                })
                .padding()
                
                Spacer()
            }
            .frame(alignment: .leading)
            
            HStack {
                Text("Go Pro - All Access")
                    .font(.title)
                    .bold()
            }
            .frame(alignment: .center)
        }
        
        TabView {
            
            ForEach(images, id: \.self) { item in
                 //3
                 Image(item)
                    .resizable()
                    .scaledToFill()
                    
                    
            }
        }
        .cornerRadius(20)
        .tabViewStyle(PageTabViewStyle())
        .padding()
        
        Text("Unlock all 200+ unit conversions, 20+ measurements, and access to all future features and custom functionality")
            .font(.body)
            .padding()
            .multilineTextAlignment(.center)
        
        if userViewModel.isSubscriptionActive != true {
            if userViewModel.package != nil {
                Button(action: {
                    showAlert = true
                }, label: {
                    Text("Try Free")
                        .foregroundColor(.white)
                        .bold()
                        .background(Rectangle()
                            .frame(width: 200, height: 30)
                            .foregroundColor(.blue)
                            .cornerRadius(15))
                })
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("All-Access Annual Subscription"),
                        message: Text("Would you like to try for free the Annual All-Access subscription unlocking all 200+ unit conversions for $9.99/yr?"),
                        primaryButton: .default(
                            Text("Try Free"),
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
//                    .foregroundColor(Color(UIColor.systemBackground))
//                    .background(Rectangle()
//                        .frame(width: 160, height: 30)
//                        .foregroundColor(.blue)
//                        .cornerRadius(15))
                
                
            }
            .padding()
        })
        
        Spacer()
        
        HStack {
            Text("[Privacy Policy](https://sites.google.com/view/unitsengineered/privacy-policy)")
            Text("[Terms of Use](https://www.apple.com/legal/internet-services/itunes/dev/stdeula/)")
        }
    }
}
