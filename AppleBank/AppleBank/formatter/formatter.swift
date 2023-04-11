//
//  formatter.swift
//  AppleBank
//
//  Created by user on 11/04/23.
//

import Foundation
class Formatter{
    let banco = Banco()

    public func welcomeUser(){
        print("""
    --=--=--=--=--=--=Apple Bank--=--=--=--=--=--=
                Welcome to Apple Bank
    You would like to sign in as:
    [1] - Admininstrator
    [2] - Client

    Answer:
    """, terminator: " ")
    }

    public func verificaAgenciaeSenha(){
        
        func verificaAgencia(){
            print("Enter your bank branch: ")
            if let input = readLine(), let agencia = Int(input){
                //Testa a agencia do ADM
                while agencia !=  12345 {
                    print("")
                    print("Invalid bank branch")
                    verificaAgencia()
                }
                verificaSenha()
            }
        }
        verificaAgencia()
        func verificaSenha(){
            print("Enter your password: ")
            if let input = readLine(), let senha = Int(input){
                //Testa a senha do ADM
                while senha != 12345 {
                    print()
                    print("Invalid Password")
                    verificaSenha()
                }
                admThings()
            }else{
                print("Invalid Password")
                verificaSenha()
            }
        }
    }

    public func admThings(){
        
        if let input = readLine(strippingNewline: true), let answerADM = Int(input){
            switch answerADM{
            case 1:
                createAccount()
            case 2:
                deleteAccount()
            case 3:
                
            default:
                print("Invalid Option")
                admThings()
            }
        }else{
            print("Invalid Option")
            admThings()
        }
    }

    public func createAccount(){
        var nome = "";
        var CPF = "";
        var dataDeNascimento = "";
        func getNome(){
            print("Enter complete name of the account owner: ", terminator: "")
            nome = readLine(strippingNewline: true) ?? ""
            
            // MARK: Verifica se a string tem 3 ou mais letras
            if nome.count >= 3{
                // MARK: Do nothing
            }else{
                getNome()
            }
        }
        
        func getCPF(){
            print("Enter CPF of the account ownner: ", terminator: "")
            CPF = readLine(strippingNewline: true) ?? ""
        }
        
        func getBirthday(){
            print("Enter your date of birth in this format(dd/mm/yyyy): ", terminator: "")
            dataDeNascimento = readLine(strippingNewline: true) ?? ""
            
            if dataDeNascimento.count == 10{
                
            }else{
                print("invalid, not in compliance")
                getBirthday()
            }
        }
        
        getNome()
        getBirthday()
        getCPF()
        
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
                
                print("Account Created")
                banco.listarContas()
            case 2:
                let tipoDeConta = tipoDeContaEnum.ContaPoupanca
                banco.criarConta(nome: nome, CPF: CPF, dataNascimento: dataDeNascimento, tipoDeConta: tipoDeConta)
                
                print("Account Created")
            default:
                print("Invalid Option")
            }
        }
    }

    public func deleteAccount(){
        
        print("")
    }

}

