//
//  ColorViewModel.swift
//  ColorHexCodesList
//
//  Created by Hamit Seyrek on 17.02.2022.
//

import Foundation

class ColorListViewModel : ObservableObject {
    let webService = WebService()
    @Published var colorList = [ColorViewModel]()
    
    func downloadColors(url : URL){
        webService.downloadColors(url: url) { result in
            switch result {
            case  .failure(let error) :
                print(error)
            case .success(let colors) :
                if let colors = colors {
                    DispatchQueue.main.async {
                        self.colorList = colors.map(ColorViewModel.init)
                    }
                }
            }
        }
    }
}

struct ColorViewModel {
    
    let color : Color
    
    var id : UUID? { color.id }
    
    var name : String { color.name }
    
    var hexCode : String { color.hexCode }
}
