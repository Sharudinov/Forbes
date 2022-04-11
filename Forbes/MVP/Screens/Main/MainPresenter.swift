//
//  MainPresenter.swift
//  Forbes
//
//  Created by Мурад on 14.03.2022.
//

import Foundation

protocol MainPresenterInput {
    func viewDidLoad ()
}

class MainPresenter: MainPresenterInput {
    
    let networkService = NetworkService()
    weak var view: MainViewInput?
    
    init(view: MainViewInput) {
        self.view = view
    }
    
    func viewDidLoad() {
        
        loadData()
}
    private func loadData() {
        networkService.loadData { [weak self] (personArray) in
            self?.view?.displayData(personArray)
        }
}
}
