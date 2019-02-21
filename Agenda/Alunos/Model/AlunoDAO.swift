//
//  AlunoDAO.swift
//  Agenda
//
//  Created by Thiago Cavalcante de Oliveira on 18/11/2018.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit
import CoreData
class AlunoDAO: NSObject {

    var gerenciadorDeResultados:NSFetchedResultsController<Aluno>?
    
    var contexto:NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    func recuperarAluno() -> Array<Aluno> {
        let pesquisaAluno:NSFetchRequest<Aluno> = Aluno.fetchRequest()
        let ordenaPornome = NSSortDescriptor(key: "nome", ascending: true)
        pesquisaAluno.sortDescriptors = [ordenaPornome]
        
      
        gerenciadorDeResultados = NSFetchedResultsController(fetchRequest: pesquisaAluno, managedObjectContext: contexto, sectionNameKeyPath: nil, cacheName: nil)
        do{
            try gerenciadorDeResultados?.performFetch()
        }catch {
            print(error.localizedDescription)
        }
        guard let listaAlunos = gerenciadorDeResultados?.fetchedObjects else { return [] }
        return listaAlunos
    }
    
    func salvarAluno(dicionarioAluno:Dictionary<String,Any>){
        var aluno:NSManagedObject?
        guard let id = UUID(uuidString: dicionarioAluno["id"] as! String) else { return }
        
        let alunos = recuperarAluno().filter(){ $0.id == id }
        
        if alunos.count > 0 {
            guard let alunoEncontrado = alunos.first else { return }
            aluno = alunoEncontrado
        }
        else {
            let entidade = NSEntityDescription.entity(forEntityName: "Aluno", in: contexto)
            aluno = NSManagedObject(entity: entidade!, insertInto: contexto)
        }
//        aluno.id = id
//        aluno.nome = dicionarioAluno["nome"] as? String
//        aluno.endereco = dicionarioAluno["endereco"] as? String
//        aluno.telefone = dicionarioAluno["telefone"] as? String
//        aluno.site = dicionarioAluno["site"] as? String
        
        aluno?.setValue(id, forKey: "id")
        aluno?.setValue(dicionarioAluno["nome"] as? String, forKey: "nome")
        aluno?.setValue(dicionarioAluno["endereco"] as? String, forKey: "endereco")
        aluno?.setValue(dicionarioAluno["telefone"] as? String, forKey: "telefone")
        aluno?.setValue(dicionarioAluno["site"] as? String, forKey: "site")
        
        
        guard let nota = dicionarioAluno["nota"] else { return }
        if(nota is String){
            //aluno.nota = (nota as! NSString).doubleValue
            aluno?.setValue((nota as! NSString).doubleValue, forKey: "nota")
        }
        else{
            let conversaoNota = String(describing: nota)
           // aluno.nota = (conversaoNota as NSString).doubleValue
            aluno?.setValue((conversaoNota as NSString).doubleValue, forKey: "nota")
        }
            
        atualizaContexto()
    }
    
    func deletarAluno(aluno:Aluno){
        contexto.delete(aluno)
        atualizaContexto()
    }
    
    func atualizaContexto(){
        do {
            try contexto.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    
}
