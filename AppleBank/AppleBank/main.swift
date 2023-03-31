//
//  main.swift
//  AppleBank
//
//  Created by user on 31/03/23.
//

import Foundation

func main(){
    print("--=--=--=--=--=--=Apple Bank--=--=--=--=--=--=")
    print("Welcome to Apple Bank")
    print("You would like to sign in as: ")
    print("[1] - Admininstrator")
    print("[2] - Client")
    
    if let ansUser = Int(readLine() ?? ""){
        if ansUser == 1{
            print("Enter your bank branch: ")
            if let input = readLine(), let agencia = Int(input){
                //Testa a agencia do ADM
                if agencia == 12345 {
                    print("Enter your password: ")
                    if let input = readLine(), let senha = Int(input){
                        //Testa a senha do ADM
                        if senha == 12345 {
                            while true{
                                let banco = Banco()
                                print("""
    --=--=--=--=--=--=--=Welcome Admininstrator=--=--=--=--=--=--=--
    What would you like to do?
    [1] - Create account
    [2] - Delete account
    [3] - List all accounts

    Answer:
    """, terminator: "")
                                if let input = readLine(strippingNewline: true), let answerADM = Int(input){
                                    switch answerADM{
                                    case 1:
                                        print("Enter complete name of the account owner: ", terminator: "")
                                        let nome = readLine(strippingNewline: true) ?? ""
                                        
                                        print("Enter CPF of the account ownner: ")
                                        let CPF = readLine(strippingNewline: true) ?? ""
                                        
                                        print("Enter your date of birth: ")
                                        let dataDeNascimento = readLine(strippingNewline: true) ?? ""
                                        
                                        print("""
    Enter the type of account
    [1] - Curruent account
    [2] - Savings acconunt

    answer:
    """, terminator: "")
                                        if let input = readLine(strippingNewline: true), let answer = Int(input){
                                            switch answer{
                                            case 1:
                                                let tipoDeConta = tipoDeContaEnum.ContaCorrente
                                                banco.criarConta(nome: nome, CPF: CPF, dataNascimento: dataDeNascimento, tipoDeConta: tipoDeConta)
                                            case 2:
                                                let tipoDeConta = tipoDeContaEnum.ContaPoupanca
                                                banco.criarConta(nome: nome, CPF: CPF, dataNascimento: dataDeNascimento, tipoDeConta: tipoDeConta)
                                            default:
                                                print("Invalid Option")
                                            }
                    
                                        }else{
                                            
                                        }
    //                                case 2:
    //                                case 3:
                                    default:
                                        print("33333")
                                    }
                                }else{
                                    
                                }
                                
                            //termnina aqui
                            }
                            
                            
                        }else{
                            
                        }
                    }else{
                        
                    }
                }
            }else{
                print("Agencia inválida")
            }
            
            
        }else if ansUser == 2{
            print("")
            var senha = readLine() ?? ""
        }else{
            print("Invalid Input")
        }
        
    
    }else{
        print("Invalid Input")
    }
}
main()
