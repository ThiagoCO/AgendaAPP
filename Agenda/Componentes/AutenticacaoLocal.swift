//
//  AutenticacaoLocal.swift
//  Agenda
//
//  Created by Thiago Cavalcante de Oliveira on 16/11/2018.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit
import LocalAuthentication
class AutenticacaoLocal: NSObject {
    
    var error:NSError?
    
    func autorizaUsuario(completion:@escaping(_ autenticado:Bool)-> Void){
        let contexto = LAContext()
        
        if contexto.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error){
            contexto.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "é necessario autenticação para apagar um aluno") { (resposta, erro) in
                completion(resposta)
                
            }
        }
        
    }
}
