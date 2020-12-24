//
//  TabView.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 19/12/2020.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
		TabView {
			FeedView()
				.tabItem {
					Image(systemName: "house.fill")
				}
			Rectangle()
				.tabItem {
					Image(systemName: "magnifyingglass")
				}
			Rectangle()
				.tabItem {
					Image(systemName: "bag")
				}
			Rectangle()
				.tabItem {
					Image(systemName: "person.crop.circle")
				}
		}
		.accentColor(.primary)
		.background(Color.red)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
			.environmentObject(AppState())
    }
}
