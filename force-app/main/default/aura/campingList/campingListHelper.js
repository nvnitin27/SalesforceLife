({
    createItem : function(component, campingItem) {
        let action = component.get("c.saveItem");
        action.setParams({
            "campItem": campingItem
        });
        action.setCallback(this, function(response){
            let state = response.getState();
            if (state === "SUCCESS") {
                let listOfcampingitem = component.get("v.items");
                listOfcampingitem.push(response.getReturnValue());
                component.set("v.items", listOfcampingitem);
            }
        });
        $A.enqueueAction(action);
    }
})