//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Jordan Haynes on 7/12/22.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }

            Section {
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    HStack {
                        padding()
                        Text("Check out")
                            .font(.title3)
                        padding()
                    }
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(order: Order())
                .preferredColorScheme(.dark)
        }
        NavigationView {
            AddressView(order: Order())
                .preferredColorScheme(.light)
        }
    }
}
