//
//  Notificacao.swift
//  Agenda
//
//  Created by Thiago Cavalcante de Oliveira on 16/11/2018.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit

class Notificacao: NSObject {
    
    func exebiNotificacaoDeMediaAlunos(dicionarioDeMedia:Dictionary<String,Any>) -> UIAlertController? {
        if let media = dicionarioDeMedia["media"] as? String {
            let alerta = UIAlertController(title: "Atenção", message: "a media geral dos alunos é: \(media)", preferredStyle: .alert)
            
            let botao = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alerta.addAction(botao)
            return alerta
        }
        return nil
    }
}
