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
    
    func fetchChamados(filter: String, solucionado: Bool, completion: @escaping () -> Void) {
        service.load { result in
            switch result {
            case .success(let helps):
                DispatchQueue.main.async {
                    if !filter.isEmpty {
                        self.helps = helps.filter { call in
                            return call.details.titulo.contains(filter) && call.details.solucionado == solucionado
                        }
                        return
                    }
                    self.helps = helps.filter { $0.details.solucionado == solucionado}
                }
            case .failure(_):
                completion()
            }
        }
    }
    
}
