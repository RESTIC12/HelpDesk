//
//  ChamadoDetailViewModel.swift
//  HelpDesk
//
//  Created by Joao Rocha on 06/08/24.
//

import Foundation

@MainActor
final class ChamadoDetailViewModel : ObservableObject {
    @Published var help: HelpDesk
    private var service: HelpService
    
    init(help: HelpDesk, service: HelpService = HelpServiceImp()) {
            self.help = help
            self.service = service
        }
    
    func updateHelp(completion: @escaping (Bool) -> Void) {
        let helpCopy = HelpDesk(
            id: help.id,
            uid: help.uid,
            details: HelpRoot(
                solicitante: help.details.solicitante,
                titulo: help.details.titulo,
                texto: help.details.texto,
                departamento: help.details.departamento,
                prioridade: help.details.prioridade,
                solucionado: true
            )
        )
        service.createHelp(helpCopy, method: "PUT") { value in
            completion(value)
        }
    }
    
}
