class Banco{
    
    public let agencia: Int = 12345
    private var contas: [Int: Conta]
    private let senha: Int = 12345
    
    init() {
        self.contas = [:]
    }
    
    func criarConta(nome: String, CPF: String, dataNascimento: String, tipoDeConta: tipoDeContaEnum){
        let ID: Int = Int.random(in:10000...99999)
        var titular: Titular = Titular(CPF: CPF, nome: nome, dataDeNascimento: dataNascimento)
        var senha: String = String(Int.random(in: 1000...9999))
        
        let conta = Conta(
            titular: titular,
            ID: ID,
            senha: senha,
            agencia: agencia,
            tipoDeConta: tipoDeConta)
        
        self.contas[ID] = conta
        
    }
    
    
    func deletarConta(_ ID: Int) -> Bool{
        guard let contaRemovida = self.contas.removeValue(forKey: ID) else{
            return false
        }
        return true
    }
    
    func listarContas() -> Void{
        for (index, conta) in self.contas.enumerated(){
            print("""
--- \(index)˚ Conta ---
Agência: \(conta.value.agencia)
Número da conta: \(conta.key)
""")
        }
    }
    func pegarConta(_ ID: Int) -> Conta?{
        guard let conta = self.contas[ID] else {
            return nil
        }
        return conta
    }
    
    
}
