//
//  NewChamadoViewModel.swift
//  HelpDesk
//
//  Created by Joao Rocha on 30/07/24.
//

import Foundation

final class NewChamadoViewModel : ObservableObject {
    @Published var helps: [HelpDesk] = []
    
    private var service: HelpService
    
    init(service: HelpService) {
        self.service = service
    }
    
    func createChamado(help: HelpDesk) {
        service.createHelp(help, method: "POST")
    }
    
}
