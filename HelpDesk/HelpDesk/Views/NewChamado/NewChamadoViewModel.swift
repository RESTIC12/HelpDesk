//
//  NewChamadoViewModel.swift
//  HelpDesk
//
//  Created by Joao Rocha on 01/08/24.
//

import Foundation

final class NewChamadoViewModel : ObservableObject {

    private var service: HelpService
    
    init(service: HelpService) {
        self.service = service
    }
    
    func createChamado(help: HelpDesk, completion: @escaping () -> Void) {
        service.createHelp(help, method: "POST") { value in
            if value {
                completion()
            } else {
                print("erro")
            }
        }
    }

}
