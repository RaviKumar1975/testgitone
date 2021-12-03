({
    css1 : function(component, event, helper) {
        component.set('v.mycolumns', [
            {label: 'Account Name', fieldName: 'Name', type: 'text'},
            {label: 'id', fieldName: 'id', type: 'text'},
            {label: 'Phone', fieldName: 'Phone', type: 'Phone'},
            {label: 'type', fieldName: 'type', type: 'Picklist '},
            {type: "button", typeAttributes: {
                label: 'View',
                name: 'View',
                disabled: false,
                value: 'view',
                }},
        ]);
            var action = component.get("c.getAccountlist");
           console.log("Action = "+action);
            action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
            component.set("v.acctList", response.getReturnValue());
            }
            
            });
            $A.enqueueAction(action);
            },
       viewRecordHelper:function(component, event, helper){
            var recId = event.getParam('row').Id;
            console.log("Rec Id = "+recId);
            var actionName = event.getParam('action').name;
            if ( actionName === 'View') {
            window.open('/'+recId,'_blank');
            }
            }
            })