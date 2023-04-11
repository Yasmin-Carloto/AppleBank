//
//  main.swift
//  AppleBank
//f
//  Created by user on 31/03/23.
//

import Foundation
let formatter = Formatter();
func main(){
    formatter.welcomeUser()
    if let ansUser = Int(readLine(strippingNewline: true) ?? ""){
        switch ansUser{
        case 1:
            formatter.verificaAgenciaeSenha()
        case 2:
        
        }
       
    }
}

main()
