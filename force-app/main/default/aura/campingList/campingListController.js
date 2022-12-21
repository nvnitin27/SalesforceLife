({
    clickCreateItem : function(component, event, helper) {
        let validCampingItem = component.find('campingForm').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validCampingItem){
            let newCampingItem = component.get("v.newItem");
            console.log("Create camping Item: " + JSON.stringify(newCampingItem));
            helper.createItem(component, newCampingItem);
            // let listOfcampingitem = component.get("v.items");
            // let campingItem = JSON.parse(JSON.stringify(newCampingItem));
            // listOfcampingitem.push(campingItem);
            // component.set("v.items", listOfcampingitem);
            // component.set("v.newItem",{'sobjectType':'Camping_Item__c',
            //     'Name': '',
            //     'Quantity__c': 0,
            //     'Price__c': 0,
            //     'Packed__c': false});
        }
    },
    doInit : function(component, event, helper) {
        let action = component.get("c.getItems");
        action.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCES") {
                component.set("v.items", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    }
})