//
//  Safari.swift
//  Agenda
//
//  Created by Thiago Cavalcante de Oliveira on 20/11/2018.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit
import SafariServices
class Safari: NSObject {
    
    func abrirPaginaWeb(_ alunoSelecionado:Aluno, _ controller:UIViewController) {
        if let urlDoAluno = alunoSelecionado.site{
            let urlFormatada = "https://\(urlDoAluno)"
            guard let url = URL(string: urlFormatada) else { return }
            let safariViewController = SFSafariViewController(url: url)
            controller.present(safariViewController, animated: true, completion: nil)
        }
    }
}
