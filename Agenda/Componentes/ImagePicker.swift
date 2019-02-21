//
//  ImagePicker.swift
//  Agenda
//
//  Created by Thiago Cavalcante de Oliveira on 02/11/2018.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit
enum MenuOpcoes {
    case camera
    case biblioteca
}

protocol imagePickerFotoSelecionada{
    func imagePickerSelecionada(_ foto:UIImage)
}
class ImagePicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK - Atributos
    var delegate:imagePickerFotoSelecionada?
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let foto = info[UIImagePickerControllerOriginalImage] as! UIImage
        delegate?.imagePickerSelecionada(foto)
        picker.dismiss(animated: true, completion: nil)
    }
    
    func menuOpcoes(completion: @escaping(_ opcao:MenuOpcoes) -> Void) -> UIAlertController {
        let menu = UIAlertController(title: "Atenção", message: "Escolha uma das opições abaixo", preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "Tirar Foto", style: .default){(acao) in
            completion(.camera)
        }
        menu.addAction(camera)
        
        let biblioteca = UIAlertAction(title: "Biblioteca", style: .default){(acao) in
            completion(.biblioteca)
        }
        menu.addAction(biblioteca)
        
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel,handler: nil)
        menu.addAction(cancelar)
        return menu
    }
}
