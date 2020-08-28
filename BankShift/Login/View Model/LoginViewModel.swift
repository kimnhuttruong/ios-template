//  
//  LoginViewModel.swift
//  BankShift
//
//  Created by Parth on 27/08/20.
//  Copyright © 2020 Wednesday. All rights reserved.
//

import Foundation
import Apollo

class LoginViewModel {

    private let service: LoginServiceProtocol

    var alertMessage: String?
    
    //MARK: -- Closure Collection
    var showAlertClosure: ((_ alertMessage:String) -> ())?
    var updateLoadingStatus: ((_ isLoading:Bool) -> ())?
    var didGetData: ((User) -> ())?

    init(withLogin serviceProtocol: LoginServiceProtocol = LoginService() ) {
        self.service = serviceProtocol
        //MARK: TEST
        ///Static path remove once test finish
//        let graphQLEndpoint = "https://pet-library.moonhighway.com "
//        let apollo = ApolloClient(url: URL(string: graphQLEndpoint)!)
    }

    //MARK: -- Example Func
    func loginRequest() {
        updateLoadingStatus?(true)
        self.service.login(success: { (user) in
            self.updateLoadingStatus?(false)
            self.didGetData?(user)
        }) {
            ///API failed
            self.updateLoadingStatus?(true)
        }
    }

}
