//=============================================================================================
// File: /common/apb_mon.sv
// Description: Implements the APB monitor for the APB UVC. This class extends uvm_monitor to
//              observe APB transactions on the interface and send them to the scoreboard via
//              an analysis port.
// Author: Karankumar Nevage (karanpr9423@gmail.com)
// Version: v0.1 - topology print
// Date: 2025-09-10
//=============================================================================================

class apb_mon extends uvm_monitor;

    //====================< Analysis Port >========================
    // Analysis port to send APB transactions to the scoreboard
    uvm_analysis_port #(apb_tx) ap_port;

    //====================< Virtual Interface >========================
    // Reference to the APB interface for monitoring signals
    virtual apb_intf vif;

    //====================< Factory Registration >========================
    // Register the monitor with the UVM factory
    `uvm_component_utils(apb_mon)                   // Factory registration macro

    //====================< Constructor >========================
    // Constructor for the APB monitor
    `NEW_COMP                                       // Use predefined constructor macro

    //====================< Build Phase >========================
    // Initializes the analysis port and retrieves the virtual interface
    function void build();
        // Retrieve virtual interface from the resource database
        if (!uvm_resource_db#(virtual apb_intf)::read_by_name("GLOBAL", "PIF", vif, this))
            `uvm_fatal("NO_VIF", "Virtual interface not set for apb_mon")
        ap_port = new("ap_port", this);             // Create analysis port
    endfunction

    //====================< Run Phase >========================
    // Monitors APB transactions on the interface (to be implemented)
endclass
//=============================================================================================