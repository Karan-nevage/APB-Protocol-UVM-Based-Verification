//=============================================================================================
// File: /top/apb_env.sv
// Description: Defines the UVM environment class for APB protocol verification.
//              Integrates master and slave agents, with optional scoreboard integration.
// Author: Karankumar Nevage (karanpr9423@gmail.com)
// Version: v0.1 - topology print
// Date: 2025-09-10
//=============================================================================================

class apb_env extends uvm_env;

    //====================< Class Members >========================
    apb_magent magent;                      // Master agent for driving and monitoring
    apb_sagent sagent;                      // Slave agent for responding and monitoring
    //apb_sbd sbd;                          // Scoreboard for transaction comparison (disabled)
    `uvm_component_utils(apb_env)           // Register with UVM factory
    `NEW_COMP                               // Macro for constructor

    //====================< Build Phase >========================
    // Build method for the env components
    function void build();
        `uvm_info("ENV", "Build Method Hitted", UVM_HIGH)
        magent = apb_magent::type_id::create("magent", this);   // Create master agent
        sagent = apb_sagent::type_id::create("sagent", this);   // Create slave agent
        //sbd    = apb_sbd::type_id::create("sbd", this);       // Create scoreboard (disabled)
    endfunction

    //====================< Connect Phase >========================
    // Connect method
    function void connect();
        `uvm_info("ENV", "Connect Method Hitted", UVM_HIGH)
        //magent.mon.ap_port.connect(sbd.imp_master);           // Connect master monitor to scoreboard (disabled)
        //sagent.mon.ap_port.connect(sbd.imp_slave);            // Connect slave monitor to scoreboard (disabled)
    endfunction

endclass
//=============================================================================================