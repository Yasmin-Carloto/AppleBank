import Foundation

public class Titular {
    var nome: String
    private var CPF: String
    private var dataDeNascimento: String
    
    init(CPF: String, nome: String, dataDeNascimento: String){
        self.nome = nome
        self.CPF = CPF
        self.dataDeNascimento = dataDeNascimento
    }
}
