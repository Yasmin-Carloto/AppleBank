import Foundation

public class Titular {
    var nome: String
    private var CPF: Int
    private var dataDeNascimento: String
    
    init(nome: String, CPF: Int, dataDeNascimento: String){
        self.nome = nome
        self.CPF = CPF
        self.dataDeNascimento = dataDeNascimento
    }
}
