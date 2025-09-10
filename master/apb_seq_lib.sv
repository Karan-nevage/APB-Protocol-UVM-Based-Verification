//=============================================================================================
// File: /master/apb_seq_lib.sv
// Description: Defines the base sequence class for the APB UVC master. This class extends
//              uvm_sequence to provide common sequence functionality, including objection
//              handling for phase synchronization.
// Author: Karankumar Nevage (karanpr9423@gmail.com)
// Version: v0.1 - topology print
// Date: 2025-09-10
//=============================================================================================

class apb_base_seq extends uvm_sequence#(apb_tx);

    //====================< Class Members >========================
    uvm_phase phase;                                // Reference to the current UVM phase
    `uvm_object_utils(apb_base_seq)                 // Register with UVM factory
    `NEW_OBJ                                        // Use predefined object constructor macro

    //====================< Pre-Body Task >========================
    // Handles phase objections before sequence execution
    task pre_body();
        phase = get_starting_phase();
        if (phase != null) begin
            phase.raise_objection(this);            // Raise objection to keep phase active
            phase.phase_done.set_drain_time(this, 150); // Set drain time for phase completion
        end
        else begin
            `uvm_info("APB_BASE_SEQ", "Null Phase Occured In Pre-Body", UVM_NONE)
        end
    endtask

    //====================< Post-Body Task >========================
    // Handles phase objections after sequence execution
    task post_body();
        if (phase != null) begin
            phase.drop_objection(this);             // Drop objection to allow phase to complete
        end
        else begin
            `uvm_info("APB_BASE_SEQ", "NULL Phase Occured In Post-Body", UVM_NONE)
        end
    endtask

endclass
//=============================================================================================