//
//  Localizacao.swift
//  Agenda
//
//  Created by Thiago Cavalcante de Oliveira on 15/11/2018.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit
import CoreLocation
class Localizacao: NSObject {
    
    func LocalizacaoWaze(_ alunoSelecionado:Aluno) {
        if  UIApplication.shared.canOpenURL(URL(string: "waze://")!){
            guard let endereco = alunoSelecionado.endereco else {return}
            Localizacao().converteEnderecoCordenadas(endereco: endereco, local:
                { (localizacaoEncontrada) in
                    let latitudade = String(describing: localizacaoEncontrada.location!.coordinate.latitude)
                    let longitude = String(describing: localizacaoEncontrada.location!.coordinate.longitude)
                    let url:String = "waze://?ll=\(latitudade),\(longitude)&navigate=yes"
                    UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
            })
        }
    }
    
    func converteEnderecoCordenadas(endereco:String, local:@escaping(_ local:CLPlacemark) -> Void){
        let conversor = CLGeocoder()
        conversor.geocodeAddressString(endereco) { (listaDeLocalizacao, error) in
            if let localizacao = listaDeLocalizacao?.first {
                local(localizacao)
            }
        }
    }
}
