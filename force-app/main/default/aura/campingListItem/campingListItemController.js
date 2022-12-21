({
    packItem : function(component, event, helper) {
        component.set("v.item.Packed__c", true);
        // console.log("disabeld before"+component.get(disabled));
        component.set("v.disabled", true);
        // console.log("disabeld after"+component.get(disabled));
    }
})