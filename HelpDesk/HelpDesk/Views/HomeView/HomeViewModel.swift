//
//  HomeViewModel.swift
//  HelpDesk
//
//  Created by Joao Rocha on 01/08/24.
//

import Foundation

@MainActor
final class HomeViewModel : ObservableObject {
    @Published var helps: [HelpDesk] = []
    
    private var service: HelpService
    
    init(service: HelpService) {
        self.service = service
    }
    
    func fetchChamados(filter: String) {
        service.load { result in
            switch result {
            case .success(let helps):
                DispatchQueue.main.async {
                    if !filter.isEmpty {
                        self.helps = helps.filter { $0.help.titulo.contains(filter) }
                        return
                    }
                    self.helps = helps
                }
            case .failure(_):
                print("erro")
            }
        }
    }
    
}
