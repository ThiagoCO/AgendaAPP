//
//  Repositorio.swift
//  Agenda
//
//  Created by Thiago Cavalcante de Oliveira on 18/11/2018.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit

class Repositorio: NSObject {
    
    func recuperaAlunos(completion:@escaping(_ listaAlunos:Array<Aluno>) -> Void) {
        var alunos = AlunoDAO().recuperarAluno()
        if alunos.count == 0 {
            AlunoAPI().recuperaAlunos {
                alunos = AlunoDAO().recuperarAluno()
                completion(alunos)
            }
        }
        else{
            completion(alunos)
        }
    }
    
    func salvarAluno(dicionarioAluno:Dictionary<String,String>){
        AlunoAPI().salvarAlunoServidor(parametros: [dicionarioAluno])
        AlunoDAO().salvarAluno(dicionarioAluno: dicionarioAluno)
    }
    
    func deletaAluno(aluno:Aluno){
        guard let alunoId = aluno.id else { return }
        AlunoAPI().deletaAluno(id: String(describing: alunoId).lowercased())
    }
    
    func sincronizaAluno() {
        let alunos = AlunoDAO().recuperarAluno()
        var listaDeParametros:Array<Dictionary<String,String>> = []
        for aluno in alunos {
            guard let id = aluno.id else { return }
            let parametro:Dictionary<String,String> = [
                "id": String(describing:id) ,
                "nome": aluno.nome ?? " ",
                "endereco": aluno.endereco ?? " ",
                "telefone": aluno.telefone ?? " ",
                "site": aluno.site ?? " ",
                "nota": "\(aluno.nota)"
            ]
            listaDeParametros.append(parametro)
            AlunoAPI().salvarAlunoServidor(parametros: listaDeParametros)
        }
    }
}
