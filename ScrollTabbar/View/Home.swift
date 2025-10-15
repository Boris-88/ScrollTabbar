//
//  Home.swift
//  ScrollTabbar
//
//  Created by Зверик Борис Станиславович on 22.04.2024.
//

import SwiftUI

struct Home: View {
    @State private var tabs: [TabModel] = [
        .init(id: TabModel.Tab.research),
        .init(id: TabModel.Tab.privacy),
        .init(id: TabModel.Tab.deployment),
        .init(id: TabModel.Tab.analytics),
        .init(id: TabModel.Tab.audience)
    ]
    @State var activeTab: TabModel.Tab = .research
    @State var mainViewScrollState: TabModel.Tab?
    @State var tabbarScrollState: TabModel.Tab?
    var body: some View {
        VStack {
            HeaderView()
            CustomTabBar()
            GeometryReader {
                let size = $0.size
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 0) {
                        ForEach(tabs) { tab in
                            Text(tab.id.rawValue)
                                .frame(width: size.width, height: size.height)
                                .contentShape(.rect)
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollPosition(id: $mainViewScrollState)
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.paging)
                .onChange(of: mainViewScrollState) { oldValue, newValue in
                    if let newValue {
                        withAnimation(.snappy) {
                            tabbarScrollState = newValue
                            activeTab = newValue
                        }
                    }
                }
            }
            
        }
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        HStack {
            Image(.logo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
            
            Spacer(minLength: 0)
            
            Button("", systemImage: "plus.circle") {
                
            }
            .font(.title2)
            .tint(.primary)
            
            Button("", systemImage: "bell") {
                
            }
            .font(.title2)
            .tint(.primary)
            
            Button(action: {}) {
                Image(.profile)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                    .clipShape(.circle)
            }
            
        }
        .padding(15)
        .overlay(alignment: .bottom) {
            Rectangle()
                .fill(.gray.opacity(0.3))
                .frame(height: 1)
        }
    }
    
    @ViewBuilder
    func CustomTabBar() -> some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(tabs) { tab in
                    Button(action: {
                        withAnimation(.snappy) {
                            activeTab = tab.id
                            tabbarScrollState = tab.id
                            mainViewScrollState = tab.id
                        }
                    }) {
                        Text(tab.id.rawValue)
                            .padding(.vertical, 12)
                            .foregroundColor(activeTab == tab.id ? Color.primary : .gray)
                            .contentShape(.rect)
                    }
                    .buttonStyle(.automatic)
                }
            }
        }
        .scrollPosition(
            id: .init(get: {
                return tabbarScrollState
            }, set: { _ in
                
            }), anchor: .center)
        .safeAreaPadding(.horizontal, 15)
        .scrollIndicators(.hidden)
    }
    
}

#Preview {
    ContentView()
}
