//
//  MainTabView.swift
//  CustomTabBar
//
//  Created by A'zamjon Abdumuxtorov on 01/03/25.
//

import SwiftUI

struct MainTabView: View {
    @State private var activeTab:Tab = .home
    @Namespace private var animation
    @State private var tabPosition:CGPoint = .zero
    
    var body: some View {
        ZStack{
            VStack{
                Group{
                    switch activeTab {
                    case .home:
                        Color.green
                            .ignoresSafeArea()
                    case .time:
                        Color.red
                            .ignoresSafeArea()
                    case .loked:
                        Color.blue
                            .ignoresSafeArea()
                    case .audio:
                        Color.gray
                            .ignoresSafeArea()
                    }
                }
                .transition(.opacity)
                .frame(maxWidth:.infinity,maxHeight:.infinity)
                
                CustomTabBar()
                    .padding(.top,-30)
            }
        }
    }
    
    @ViewBuilder
    func CustomTabBar(_ tint:Color = .blue,_ inactiveTint:Color = .blue.opacity(0.8)) -> some View {
        HStack(alignment:.bottom,spacing: 0) {
            ForEach(Tab.allCases,id: \.rawValue){
                TabItem(
                    tint: tint,
                    inactiveTint: inactiveTint,
                    tab: $0,
                    animation: animation,
                    activeTab: $activeTab,
                    position: $tabPosition
                )
            }
        }
        .padding(.horizontal,15)
        .padding(.top,10)
        .background{
            TabShape(midpoint: tabPosition.x)
                .fill(.white)
                .ignoresSafeArea()
                .shadow(color: tint.opacity(0.2), radius: 10, x: 0, y: -5)
                .blur(radius: 2)
                .padding(.top,25)
        }
        .animation(.interactiveSpring(response: 0.6,dampingFraction: 0.7,blendDuration: 0.7),value: activeTab)
    }
}
