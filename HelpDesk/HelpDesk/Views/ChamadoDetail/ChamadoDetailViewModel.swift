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
    
    init(help: HelpDesk, service: HelpService) {
        self.help = help
        self.service = service
    }
    
}
