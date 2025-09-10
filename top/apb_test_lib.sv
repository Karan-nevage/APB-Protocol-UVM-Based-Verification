//=============================================================================================
// File: /top/apb_test_lib.sv
// Description: Defines the base UVM test class for APB protocol verification.
//              Creates the environment and implements topology printing in the
//              end_of_elaboration_phase for the v0.1 topology print goal.
// Author: Karankumar Nevage (karanpr9423@gmail.com)
// Version: v0.1 - topology print
// Date: 2025-09-10
//=============================================================================================

class apb_base_test extends uvm_test;

    //====================< Class Members >========================
    apb_env env;                                // APB environment instance
    apb_base_seq seq;                           // APB base sequence instance
    `uvm_component_utils(apb_base_test)         // Register with UVM factory
    `NEW_COMP                                   // Macro for constructor

    //====================< Build Phase >========================
    // Build method for the env components
    function void build();
        `uvm_info("BASE_TEST", "Build Method Hitted", UVM_HIGH)
        env = apb_env::type_id::create("env", this);    // Create environment instance
    endfunction

    //====================< End of Elaboration Phase >========================
    // Prints UVM component hierarchy for topology verification
    function void end_of_elaboration_phase(uvm_phase phase);
        `uvm_info("BASE_TEST", "End of Elaboration Phase Hitted", UVM_HIGH)
        uvm_top.print_topology();                   // Print UVM component hierarchy
    endfunction

    //====================< Run Phase >========================
    // Executes the base sequence
    task run_phase(uvm_phase phase);
        phase.raise_objection(this);                // Raise objection to keep phase active
        phase.phase_done.set_drain_time(this, 150); // Set drain time to 150ns
        seq.start(env.magent.sqr);                  // Start sequence on master agent’s sequencer
        phase.drop_objection(this);                 // Drop objection to end phase
    endtask

endclass
//=============================================================================================