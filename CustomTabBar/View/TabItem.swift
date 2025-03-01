//
//  TabItem.swift
//  CustomTabBar
//
//  Created by A'zamjon Abdumuxtorov on 01/03/25.
//

import SwiftUI

struct TabItem:View {
    var tint:Color
    var inactiveTint:Color
    var tab:Tab
    var animation:Namespace.ID
    @Binding var activeTab:Tab
    @Binding var position: CGPoint
    
    @State private var tabPosition:CGPoint = .zero
    
    var body: some View {
        VStack(alignment:.center ,spacing: 5) {
            Image(systemName: tab.imageName)
                .font(.title2)
                .foregroundColor(activeTab == tab ? .white : inactiveTint)
                .frame(width:activeTab == tab ? 58:  35, height:activeTab == tab ? 58:35)
                .background{
                    if activeTab == tab {
                        Circle()
                            .fill(tint.gradient)
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }
               
            Text(LocalizedStringKey(tab.rawValue))
                .font(.caption2)
                .foregroundColor(activeTab == tab ? tint : .gray)
                .lineLimit(1)
        }
        .frame(maxWidth:.infinity)
        .contentShape(Rectangle())
        .viewPosition(completion: { rect in
            tabPosition.x = rect.midX
            
            if activeTab == tab{
                position.x = rect.midX
            }
        })
        .onTapGesture {
            withAnimation {
                activeTab = tab
            }
            
            withAnimation(.interactiveSpring(response: 0.6,dampingFraction: 0.7,blendDuration: 0.7)){
                position.x = tabPosition.x
            }
        }
    }
}
