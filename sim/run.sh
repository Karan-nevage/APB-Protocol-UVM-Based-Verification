#=======================================================================================
# File: /sim/run.sh
# Description: Shell script for compiling and simulating the apb UVM testbench using VCS and Verdi.
#=======================================================================================

#========================= Compilation and Elaboration ==================================
#    -sverilog: Specifies SystemVerilog file compilation
#    -full64: Uses 64-bit VCS tool (supports 32-bit and 64-bit tools)
#    -debug_access+all: Enables full debug access for all components
#    -kdb: Generates a database for Verdi waveform viewing
#=======================================================================================

vcs -sverilog -full64 -debug_access+all -kdb \
        +incdir+../top \
        +incdir+../master \
        +incdir+../slave \
        +incdir+../common \
        +incdir+../src \
        +define+UVM_NO_DPI \
        -l comp.log \
        -cm line+cond+tgl+fsm+assert+branch \
        list.sv
#---------------------------------------------------------------------------------------

#================================ Simulation ===========================================
#    Executes simulation with specified test and random seed
#    Generates coverage metrics for line, condition, toggle, FSM, assertion, and branch
#=======================================================================================

./simv -l sim.log +ntb_random_seed=4380470 +UVM_TESTNAME=apb_base_test \
        -cm line+cond+tgl+fsm+assert+branch
#---------------------------------------------------------------------------------------
