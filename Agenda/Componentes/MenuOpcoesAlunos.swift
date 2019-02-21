//
//  MenuOpcoesAlunos.swift
//  Agenda
//
//  Created by Thiago Cavalcante de Oliveira on 11/11/2018.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit

class MenuOpcoesAlunos: NSObject {
    
    func configurarMenu(aluno:Aluno, navigation:UINavigationController) -> UIAlertController{
        let menu = UIAlertController(title: "Atenção", message: "Escolha alguma das opções abaixo", preferredStyle: .actionSheet)
        
        guard let controller = navigation.viewControllers.last else { return menu }
        
        let sms = UIAlertAction(title: "Enviar SMS", style: .default) { (acao) in
            Mensagem().enviarSMS(aluno, controller: controller)
        }
        menu.addAction(sms)
        
        let ligacao = UIAlertAction(title: "Ligação", style: .default) { (acao) in
            LigacaoTelefonica().fazLigacao(aluno)
        }
        menu.addAction(ligacao)
        
        let waze = UIAlertAction(title: "Localizar no Waze", style: .default) { (acao) in
            Localizacao().LocalizacaoWaze(aluno)
        }
        menu.addAction(waze)
        
        let mapa = UIAlertAction(title: "Localizar no mapa", style: .default) { (acao) in
            let mapa = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mapa") as! MapaViewController
            mapa.aluno = aluno
            navigation.pushViewController(mapa, animated: true)
        }
        menu.addAction(mapa)
        
        let abrirPagina = UIAlertAction(title: "Abrir Pagina na Web", style: .default) { (acao) in
            Safari().abrirPaginaWeb(aluno,controller)
        }
        menu.addAction(abrirPagina)
        
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        menu.addAction(cancelar)
        
        
        return menu
    }
}
