//=============================================================================================
// File: /slave/apb_sagent.sv
// Description: Defines the APB slave agent for the APB UVC. This class extends uvm_agent to
//              integrate the responder and monitor components for slave-side transaction handling
//              and observation.
// Author: Karankumar Nevage (karanpr9423@gmail.com)
// Version: v0.1 - topology print
// Date: 2025-09-10
//=============================================================================================

class apb_sagent extends uvm_agent;

    //====================< Class Members >========================
    apb_rsp rsp;                            // Responder for handling slave transactions
    apb_mon mon;                            // Monitor for observing APB transactions
    `uvm_component_utils(apb_sagent)        // Register with UVM factory
    `NEW_COMP                               // Use predefined component constructor macro

    //====================< Build Phase >========================
    // Creates responder and monitor components
    function void build();
        rsp = apb_rsp::type_id::create("rsp", this);    // Create responder instance
        mon = apb_mon::type_id::create("mon", this);    // Create monitor instance
    endfunction

endclass
//=============================================================================================