//
//  Filtro.swift
//  Agenda
//
//  Created by Thiago Cavalcante de Oliveira on 20/11/2018.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit

class Filtro: NSObject {
    
    func filtraAluno(listaDeAlunos:Array<Aluno>, texto:String) -> Array<Aluno> {
        
        let alunosEncontrados = listaDeAlunos.filter { (aluno) -> Bool in
            if let nome = aluno.nome {
                return nome.contains(texto)
            }
            return false
        }
        return alunosEncontrados
    }
}
