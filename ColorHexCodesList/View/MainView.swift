//
//  ContentView.swift
//  ColorHexCodesList
//
//  Created by Hamit Seyrek on 16.02.2022.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var colorListViewModel : ColorListViewModel
    
    init() {
        self.colorListViewModel = ColorListViewModel()
    }
    
    var body: some View {
        NavigationView {
            List(colorListViewModel.colorList, id: \.id) { color in
                VStack {
                    Text(color.name)
                        .font(.title3)
                        .frame(maxWidth:.infinity, alignment: .leading)
                    Text(color.hexCode)
                        .font(.body)
                        .foregroundColor(.green)
                        .frame(maxWidth:.infinity, alignment: .leading)
                }
            }.toolbar(content: {
                Button {
                    Task.init {
                        await colorListViewModel.downloadAsyncColors(url: URL(string: "https://raw.githubusercontent.com/hamitseyrek/ColorHexCodesList/hamitseyrek/colors.json")!)
                    }
                } label: {
                    Text("Refresh")
                }

            })
            .navigationTitle("Color List")
                .font(.title3)
        }
        /*
        // first solution
        .task {
            await colorListViewModel.downloadAsyncColors(url: URL(string: "https://raw.githubusercontent.com/hamitseyrek/ColorHexCodesList/hamitseyrek/colors.json")!)
        }
         */
        
        /*
         // second solution
        .onAppear {
            colorListViewModel.downloadColors(url: URL(string: "https://raw.githubusercontent.com/hamitseyrek/ColorHexCodesList/hamitseyrek/colors.json")!)
        }
         */
        
        // first solution
        .task {
            await colorListViewModel.downloadColorsContinuation(url: URL(string: "https://raw.githubusercontent.com/hamitseyrek/ColorHexCodesList/hamitseyrek/colors.json")!)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
