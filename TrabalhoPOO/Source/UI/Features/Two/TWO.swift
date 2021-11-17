//
//  TWO.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 17/11/21.
//

import Foundation

class Account {
    let number: Int = .random(in: 1000000...9999999)
    var value: Double = 0
    
    func check() -> Double {
        return value
    }
    
    func withdraw(_ value: Double) {
        self.value -= value
    }
    
    func deposit(_ value: Double) {
        self.value += value
    }
    
    func transfer(value: Double, to account: Account) {
        self.value -= value
        account.value += value
    }
}

class Client {
    let name: String
    var account: Account?
    
    init(name: String) {
        self.name = name
    }
    
    func createAccount() -> Account {
        let newAccount = Account()
        self.account = newAccount
        return newAccount
    }
}

class TWO {
    // 1
    func createAccountTo(client: Client) -> String {
        let account = client.createAccount()
        return "O cliente \(client.name) agora possui a conta de dígito \(account.number)"
    }
    
    // 2
    func withdraw(value: Double, from client: Client) -> String {
        if let account = client.account {
            account.withdraw(value)
            return "Sacou \(value) da conta de \(client.name), agora ele possui R$ \(account.value) em conta"
        }
        return "Cliente sem conta :/"
    }
    
    // 3
    func deposit(value: Double, to client: Client) -> String {
        if let account = client.account {
            account.deposit(value)
            return "Depositou \(value) na conta de \(client.name), agora ele possui R$ \(account.value) em conta"
        }
        return "Cliente sem conta :/"
    }
    
    // 4
    func verify(client: Client) -> String {
        if let account = client.account {
            return "O saldo atual de \(client.name) é de R$ \(account.check())"
        }
        return "Cliente sem conta :/"
    }
    
    // 5
    func transfer(value: Double, from client: Client, to anotherClient: Client) -> String {
        guard let account = client.account, let anotherAccount = anotherClient.account else {
            return "Ambos clientes precisam de contas :/"
        }
        account.transfer(value: value, to: anotherAccount)
        return "\(client.name) transferiu R$ \(value) para \(anotherClient.name)"
    }
}
