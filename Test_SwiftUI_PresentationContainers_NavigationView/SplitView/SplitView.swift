//
//  SplitView.swift
//  TestNavigation
//
//  Created by Jaroslaw Trojanowicz on 19/05/2022.
//

// LINKS:
// https://www.hackingwithswift.com/books/ios-swiftui/working-with-two-side-by-side-views-in-swiftui

import SwiftUI

struct SplitView: View {
    var body: some View {
        NavigationView {
            
            //===============================================================================
            // MARK:       ******* Primary View *******
            //===============================================================================
            VStack {
                Text("Primary layout")
                    .padding()
                // NOTICE: In "columns" navigation style, sub view will always appear in the column on the right
                NavigationLink("Go to SubView") {
                    VStack {
                        Text("This is SubView")
                            .padding()
                        // NOTICE: In "columns" navigation style, sub view will always appear in the column on the right
                        NavigationLink("Go to Sub-SubView") {
                            Text("This is Sub-SubView")
                        }
                    }
                }
            }
            .navigationTitle("Primary")
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    NavigationLink("Sub view") {
//                        Text("The Sub view")
//                            .navigationTitle("SubView toolbar")
//                    }
//                }
//            }
            
            //===============================================================================
            // MARK:       ******* Secondary View *******
            //===============================================================================
            VStack {
                Text("Secondary layout")
                    .padding()
                NavigationLink("Go to another view") {
                    Text("Another view")
                }
            }
                .navigationTitle("Secondary")

            
            //===============================================================================
            // MARK:       ******* Third View *******
            //===============================================================================
            Text("Third layout")
                .navigationTitle("Third")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        //NOTICE: because there is no other column on the right, the SubView will appear on the top of this view
                        NavigationLink("Sub view") {
                            Text("The Sub view")
                                .navigationTitle("SubView toolbar")
                        }
                    }

                    // NOTICE: When you select .navigationBarTitleDisplayMode(.inline), then .navigationTitle("Third") will be hidden behind
                    ToolbarItem(placement: .principal) {
                        Text("Principal")
                    }
                }
                .padding()
//                .navigationBarTitleDisplayMode(.inline)
        }
        
        //===============================================================================
        // MARK:       ******* Navigation View Style *******
        //===============================================================================
        // NOTICE that Secondary and Third views are ignored when .navigationViewStyle(.stack)
//        .navigationViewStyle(.stack) // .automatic (default) .columns .stack
    }
}


struct SplitView_preview: PreviewProvider {
    static var previews: some View {
        Group {
            SplitView()
                .previewLayout(PreviewLayout.sizeThatFits)
            //                .previewLayout(PreviewLayout.fixed(width: <#width#>, height: <#height#>))
                .previewInterfaceOrientation(.landscapeLeft)
                .padding()
                .previewDisplayName("Default preview")
                .environment(\.horizontalSizeClass, .compact)
                .environment(\.verticalSizeClass, .regular)
            
            SplitView()
                .previewDevice(PreviewDevice(rawValue: "iPad mini (6th generation)")) // list of devices, run in Terminal: xcrun simctl list devicetypes
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewInterfaceOrientation(.landscapeLeft)
//                            .previewLayout(PreviewLayout.fixed(width: <#width#>, height: <#height#>))
//                .padding()
//                .background(Color(.systemBackground))
//                .environment(\.colorScheme, .dark)
//                .previewDisplayName("Dark Mode")
        }
    }
}
