//
//  MapaViewController.swift
//  Agenda
//
//  Created by Thiago Cavalcante de Oliveira on 15/11/2018.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController {
    // MARK: - IBOutlet
    
    @IBOutlet weak var mapa: MKMapView!
    
    // MARK: - Variavel
    
    var aluno:Aluno?
    
    // MARK: - View lifeCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = self.getTitulo()
        self.localizacaoInicial()
        self.localizarAluno()
    }
    func getTitulo() -> String {
        
        return "Localizar Alunos"
    }
    func localizacaoInicial(){
        Localizacao().converteEnderecoCordenadas(endereco: "Caelum - São Paulo") { (localizacaoEncontrada) in
            let pino = self.configurarPinoDeLocalizacao(titulo: "Caelum", localizacao: localizacaoEncontrada)
            let regiao = MKCoordinateRegionMakeWithDistance(pino.coordinate, 5000, 5000)
            self.mapa.setRegion(regiao, animated: true)
            self.mapa.addAnnotation(pino)
        }
    }
    func localizarAluno(){
        if let endereco = aluno?.endereco, let nome = aluno?.nome {
            Localizacao().converteEnderecoCordenadas(endereco: endereco) { (localizacaoEncontrada) in
                let pino = self.configurarPinoDeLocalizacao(titulo: nome, localizacao: localizacaoEncontrada)
                let regiao = MKCoordinateRegionMakeWithDistance(pino.coordinate, 5000, 5000)
                self.mapa.setRegion(regiao, animated: true)
                self.mapa.addAnnotation(pino)
            }
        }
    }
    func configurarPinoDeLocalizacao(titulo:String, localizacao:CLPlacemark) -> MKPointAnnotation {
        let pino = MKPointAnnotation()
        pino.title = titulo
        pino.coordinate = localizacao.location!.coordinate
        return pino
    }
}
