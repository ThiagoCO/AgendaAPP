//
//  LigacaoTelefonica.swift
//  Agenda
//
//  Created by Thiago Cavalcante de Oliveira on 20/11/2018.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit

class LigacaoTelefonica: NSObject {
    
    func fazLigacao(_ alunoSelecionado:Aluno){
        guard let telefone = alunoSelecionado.telefone else {return }
        if let url = URL(string: "tel://\(telefone)"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
