//
//  NavigationView2.swift
//  TestNavigation
//
//  Created by Jaroslaw Trojanowicz on 18/05/2022.
//

// LINKS:
// https://swiftwithmajid.com/2019/07/24/alerts-actionsheets-modals-and-popovers-in-swiftui/

import SwiftUI

struct ModalsPopoversOthers: View {
    @EnvironmentObject var tabController: TabController
    @State private var isShowingSheet = false
    @State private var isShowingFullScreenCover = false
    @State private var isShowingActiveSheet = false
    @State private var isShowingAlert = false
    @State private var isShowingPopover = false
    
    var body: some View {
        VStack {
            //===============================================================================
            // MARK:       ******* Navigating to another tab programatically *******
            //===============================================================================
            Button("Go to NavView1 using @EnvironmentObject") {
                tabController.open(.navView1)
            }
            
            //===============================================================================
            // MARK:       ******* Sheet *******
            //===============================================================================
            Button("Show sheet") {
                isShowingSheet.toggle()
            }
            // NOTICE: you can put .sheet modifier anywhere inside the body
            .sheet(isPresented: $isShowingSheet, onDismiss: {
                print("Perform onDissmiss action")
            }) {
                SheetView(isShowing: $isShowingSheet)
            }
            .padding()
            
            //===============================================================================
            // MARK:       ******* Full cover *******
            //===============================================================================
            // NOTICE: This could be useful e.g. when opening the app first time and you want user to log in
            Button("Show full screen cover (without possiblity of dragging down)") {
                isShowingFullScreenCover.toggle()
            }
            .fullScreenCover(isPresented: $isShowingFullScreenCover) {
                VStack {
                    Text("Full screen cover")
                        .padding()
                    Button("Dismiss using @State") {
                        isShowingFullScreenCover = false
                    }
                }
            }
            
            //===============================================================================
            // MARK:       ******* Action sheet *******
            //===============================================================================
            Button("Show action sheet") {
                isShowingActiveSheet = true
            }
            .actionSheet(isPresented: $isShowingActiveSheet) {
                ActionSheet(
                    title: Text("Actions"),
                    message: Text("Available actions"),
                    buttons: [
                        .cancel { print("Action sheet was canceled")},
                        .default(Text("Action")) {
                            print("Perform default action")
                        },
                        .destructive(Text("Delete")) {
                            print("Perform delete")
                        }
                    ]
                )
            }
            .padding()
            
            //===============================================================================
            // MARK:       ******* Alert *******
            //===============================================================================
            Button("Show alert") {
                isShowingAlert = true
            }
            .alert("Alert title", isPresented: $isShowingAlert) {
                Button("Yes") {
                    print("Perform action")
                }
                Button("No") {
                    print("Perform another action")
                }
                // NOTICE: It looks like Alert cannot accept images or text colors/attributes, but only text buttons
            } message: {
                Text("Message text")
            }
            
            //===============================================================================
            // MARK:       ******* Popover *******
            // Popover is show on iPad, but on iPhone it behaves as a sheet
            //===============================================================================
            Button("Show popover") {
                isShowingPopover = true
            }
            .popover(isPresented: $isShowingPopover, arrowEdge: .bottom) {
                Text("Popover")
                    .frame(width: 300) // NOTICE: if showing on iPhone, it will behave as a sheet and this modifier will be ignored
                Button("Dismiss") {
                    isShowingPopover = false
                }
            }
            .padding()
        }
    }
}

struct NavView2_preview: PreviewProvider {
    static var previews: some View {
        ModalsPopoversOthers()
            .previewDevice(PreviewDevice(rawValue: "iPad mini (6th generation)")) // list of devices, run in Terminal: xcrun simctl list devicetypes
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewInterfaceOrientation(.portrait)
            .padding()
            .previewDisplayName("Default preview")
            .environment(\.horizontalSizeClass, .compact)
            .environment(\.verticalSizeClass, .regular)
    }
}
