import Foundation

public enum tipoDeContaEnum{
    case ContaCorrente
    case ContaPoupanca
}

public class Conta {
    
    var titular: Titular
    var ID: Int
    private var senha: String
    var saldo: Double
    var tipoDeContaVariavel: tipoDeContaEnum
    public let agencia: Int
    
    init(titular: Titular, ID: Int, senha: String, agencia: Int, tipoDeConta: tipoDeContaEnum) {
        self.titular = titular
        self.ID = ID
        self.senha = senha
        self.saldo = 0.0
        self.tipoDeContaVariavel = tipoDeConta
        self.agencia = agencia
    }
    
    func autentica(senhaLogin: String) -> Bool {
        senhaLogin == senha
    }
    
    public func deposita(valor: Double, senha: String) -> Bool {
        switch tipoDeContaVariavel {
        case .ContaCorrente:
            if self.autentica(senhaLogin: senha){
                saldo += valor - 2.60
                return true
            }else{ return false }
        case .ContaPoupanca:
            if self.autentica(senhaLogin: senha){
                saldo += valor
                return true
            }else{ return false }
        default:
            break
        }
    }
    
    public func saque(valor: Double, senha: String) -> Bool{
        switch tipoDeContaVariavel {
        case .ContaCorrente:
            let valorComTaxaSaque = valor + 2.60
            if saldo >= valor && self.autentica(senhaLogin: senha){
                saldo -= valorComTaxaSaque
                return true
            }else{
                print("Saldo insuficiente!")
                return false
            }
        case .ContaPoupanca:
            if saldo >= valor && self.autentica(senhaLogin: senha){
                saldo -= valor
                return true
            }else{
                print("Saldo insuficiente!")
                return false
            }
        default:
            break
        }
    }
    
    func transfere(valor: Double, destino: Conta, senha: String) -> Bool{
        switch tipoDeContaVariavel{
        case .ContaCorrente:
            let valorComTaxaTransferencia = valor + 11.60
            if saldo >= valor && self.autentica(senhaLogin: senha) {
                saldo -= valorComTaxaTransferencia
                destino.deposita(valor: valor, senha: senha)
                return true
            }else{
                print("Senha incorreta. Tente novamente!")
                return false
            }
        case .ContaPoupanca:
            if saldo >= valor && self.autentica(senhaLogin: senha){
                saldo -= valor
                destino.deposita(valor: valor, senha: senha)
                return true
            }else{
                print("Senha incorreta. Tente novamente!")
                return false
            }
        default:
            break
        }
    }
}

