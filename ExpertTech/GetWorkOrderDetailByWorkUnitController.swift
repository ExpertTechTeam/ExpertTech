//
//  GetWorkOrderDetailByWorkUnitController.swift
//  ExpertTech
//
//  Created by Pannray Samanphanchai on 8/13/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import Foundation


class GetWorkOrderDetailByWorkUnitController : NSObject, WLDelegate{
    
//    var callerView : LoginViewController = LoginViewController()
    
    func get(workOrderId: String, uiView: LoginViewController){
        
//        parameters : [workorderid]
        
        let invocationData = WLProcedureInvocationData(adapterName: "MySQLDBAdapter", procedureName: "getWorkOrderDetailByWorkUnit")
        invocationData.parameters = [workOrderId]
        WLClient.sharedInstance().invokeProcedure(invocationData, withDelegate: self)
        
//        callerView = uiView
        
    }
    
    func onSuccess(response: WLResponse!) {
        print("[GetWorkOrderDetailByWorkUnitController] OnSuccess")
        
//        callerView.updateView(response)
        
    }
    
    func onFailure(response: WLFailResponse!) {
         print("[GetWorkOrderDetailByWorkUnitController] OnFailure")
    }
    
}