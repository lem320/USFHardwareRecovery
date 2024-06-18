-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 21.1 (Release Build #842)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2021 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from FP_LOG_0002
-- VHDL created on Tue Feb 27 15:25:22 2024


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity FP_LOG_0002 is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        en : in std_logic_vector(0 downto 0);  -- ufix1
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end FP_LOG_0002;

architecture normal of FP_LOG_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid6_fpLogETest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal signX_uid7_fpLogETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllZWF_uid8_fpLogETest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstBias_uid10_fpLogETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstBiasMO_uid11_fpLogETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstAllOWE_uid13_fpLogETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstAllZWE_uid15_fpLogETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_x_uid17_fpLogETest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_x_uid18_fpLogETest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid18_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid19_fpLogETest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid19_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid20_fpLogETest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid20_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid21_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid22_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid23_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid24_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid25_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid26_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal e_uid29_fpLogETest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal e_uid29_fpLogETest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal e_uid29_fpLogETest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal e_uid29_fpLogETest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal c_uid31_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal addrFull_uid32_fpLogETest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal yAddr_uid34_fpLogETest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal zPPolyEval_uid35_fpLogETest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal zPPolyEval_uid35_fpLogETest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal peOR_uid37_fpLogETest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal peOR_uid37_fpLogETest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal aPostPad_uid39_fpLogETest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal oMz_uid40_fpLogETest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal oMz_uid40_fpLogETest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal oMz_uid40_fpLogETest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal oMz_uid40_fpLogETest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal z2_uid41_fpLogETest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sEz_uid42_fpLogETest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal multTermOne_uid44_fpLogETest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal multTermOne_uid44_fpLogETest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal wideZero_uid46_fpLogETest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal addTermOne_uid47_fpLogETest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal addTermOne_uid47_fpLogETest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal lowRangeB_uid48_fpLogETest_in : STD_LOGIC_VECTOR (20 downto 0);
    signal lowRangeB_uid48_fpLogETest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal highBBits_uid49_fpLogETest_b : STD_LOGIC_VECTOR (29 downto 0);
    signal finalSumsumAHighB_uid50_fpLogETest_a : STD_LOGIC_VECTOR (35 downto 0);
    signal finalSumsumAHighB_uid50_fpLogETest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal finalSumsumAHighB_uid50_fpLogETest_o : STD_LOGIC_VECTOR (35 downto 0);
    signal finalSumsumAHighB_uid50_fpLogETest_q : STD_LOGIC_VECTOR (35 downto 0);
    signal finalSum_uid51_fpLogETest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal msbUFinalSum_uid52_fpLogETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal finalSumOneComp_uid54_fpLogETest_b : STD_LOGIC_VECTOR (56 downto 0);
    signal finalSumOneComp_uid54_fpLogETest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal finalSumAbs_uid55_fpLogETest_a : STD_LOGIC_VECTOR (57 downto 0);
    signal finalSumAbs_uid55_fpLogETest_b : STD_LOGIC_VECTOR (57 downto 0);
    signal finalSumAbs_uid55_fpLogETest_o : STD_LOGIC_VECTOR (57 downto 0);
    signal finalSumAbs_uid55_fpLogETest_q : STD_LOGIC_VECTOR (57 downto 0);
    signal cstMSBFinalSumPBias_uid58_fpLogETest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expRExt_uid59_fpLogETest_a : STD_LOGIC_VECTOR (9 downto 0);
    signal expRExt_uid59_fpLogETest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expRExt_uid59_fpLogETest_o : STD_LOGIC_VECTOR (9 downto 0);
    signal expRExt_uid59_fpLogETest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal fracR_uid60_fpLogETest_in : STD_LOGIC_VECTOR (56 downto 0);
    signal fracR_uid60_fpLogETest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal expFracConc_uid61_fpLogETest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal expFracPostRnd_uid63_fpLogETest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal expFracPostRnd_uid63_fpLogETest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal expFracPostRnd_uid63_fpLogETest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal expFracPostRnd_uid63_fpLogETest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal FPOne_uid66_fpLogETest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal excRZero_uid68_fpLogETest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid68_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignX_uid69_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfC1_uid70_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid71_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal negNonZero_uid73_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid74_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal notC_uid75_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signTerm2_uid76_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRC1_uid77_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRC11_uid78_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid79_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaN_uid80_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRFull_uid81_fpLogETest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRFull_uid81_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid82_fpLogETest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid83_fpLogETest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal oneFracRPostExc2_uid84_fpLogETest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid87_fpLogETest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid87_fpLogETest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid91_fpLogETest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid91_fpLogETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal RLn_uid92_fpLogETest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xv0_uid94_eLn2_uid30_fpLogETest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal xv0_uid94_eLn2_uid30_fpLogETest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal xv1_uid95_eLn2_uid30_fpLogETest_b : STD_LOGIC_VECTOR (2 downto 0);
    signal p1_uid96_eLn2_uid30_fpLogETest_q : STD_LOGIC_VECTOR (37 downto 0);
    signal p0_uid97_eLn2_uid30_fpLogETest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal lev1_a0sumAHighB_uid100_eLn2_uid30_fpLogETest_a : STD_LOGIC_VECTOR (39 downto 0);
    signal lev1_a0sumAHighB_uid100_eLn2_uid30_fpLogETest_b : STD_LOGIC_VECTOR (39 downto 0);
    signal lev1_a0sumAHighB_uid100_eLn2_uid30_fpLogETest_o : STD_LOGIC_VECTOR (39 downto 0);
    signal lev1_a0sumAHighB_uid100_eLn2_uid30_fpLogETest_q : STD_LOGIC_VECTOR (38 downto 0);
    signal lev1_a0_uid101_eLn2_uid30_fpLogETest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal maxValInOutFormat_uid102_eLn2_uid30_fpLogETest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal minValueInFormat_uid103_eLn2_uid30_fpLogETest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal paddingX_uid104_eLn2_uid30_fpLogETest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal updatedX_uid105_eLn2_uid30_fpLogETest_q : STD_LOGIC_VECTOR (37 downto 0);
    signal ovf_uid104_eLn2_uid30_fpLogETest_a : STD_LOGIC_VECTOR (41 downto 0);
    signal ovf_uid104_eLn2_uid30_fpLogETest_b : STD_LOGIC_VECTOR (41 downto 0);
    signal ovf_uid104_eLn2_uid30_fpLogETest_o : STD_LOGIC_VECTOR (41 downto 0);
    signal ovf_uid104_eLn2_uid30_fpLogETest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal updatedY_uid108_eLn2_uid30_fpLogETest_q : STD_LOGIC_VECTOR (37 downto 0);
    signal udf_uid107_eLn2_uid30_fpLogETest_a : STD_LOGIC_VECTOR (41 downto 0);
    signal udf_uid107_eLn2_uid30_fpLogETest_b : STD_LOGIC_VECTOR (41 downto 0);
    signal udf_uid107_eLn2_uid30_fpLogETest_o : STD_LOGIC_VECTOR (41 downto 0);
    signal udf_uid107_eLn2_uid30_fpLogETest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfudfcond_uid110_eLn2_uid30_fpLogETest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sR_uid111_eLn2_uid30_fpLogETest_in : STD_LOGIC_VECTOR (37 downto 0);
    signal sR_uid111_eLn2_uid30_fpLogETest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal sRA0_uid112_eLn2_uid30_fpLogETest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal sRA0_uid112_eLn2_uid30_fpLogETest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal os_uid136_lnTables_q : STD_LOGIC_VECTOR (30 downto 0);
    signal os_uid140_lnTables_q : STD_LOGIC_VECTOR (20 downto 0);
    signal yT1_uid148_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal lowRangeB_uid150_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid150_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid151_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal s1sumAHighB_uid152_invPolyEval_a : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid152_invPolyEval_b : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid152_invPolyEval_o : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid152_invPolyEval_q : STD_LOGIC_VECTOR (21 downto 0);
    signal s1_uid153_invPolyEval_q : STD_LOGIC_VECTOR (22 downto 0);
    signal lowRangeB_uid156_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid156_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid157_invPolyEval_b : STD_LOGIC_VECTOR (21 downto 0);
    signal s2sumAHighB_uid158_invPolyEval_a : STD_LOGIC_VECTOR (31 downto 0);
    signal s2sumAHighB_uid158_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal s2sumAHighB_uid158_invPolyEval_o : STD_LOGIC_VECTOR (31 downto 0);
    signal s2sumAHighB_uid158_invPolyEval_q : STD_LOGIC_VECTOR (31 downto 0);
    signal s2_uid159_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal zs_uid161_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rVStage_uid162_countZ_uid56_fpLogETest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid163_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mO_uid164_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal vStage_uid165_countZ_uid56_fpLogETest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal vStage_uid165_countZ_uid56_fpLogETest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal cStage_uid166_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vStagei_uid168_countZ_uid56_fpLogETest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid168_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid169_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid171_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid174_countZ_uid56_fpLogETest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid174_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid177_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid180_countZ_uid56_fpLogETest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid180_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid181_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid183_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid186_countZ_uid56_fpLogETest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid186_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid189_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid192_countZ_uid56_fpLogETest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid192_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid194_countZ_uid56_fpLogETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid195_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid196_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal osig_uid199_pT1_uid149_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal osig_uid202_pT2_uid155_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal memoryC1_uid139_lnTables_q_const_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0Idx1Rng16_uid208_normVal_uid57_fpLogETest_in : STD_LOGIC_VECTOR (41 downto 0);
    signal leftShiftStage0Idx1Rng16_uid208_normVal_uid57_fpLogETest_b : STD_LOGIC_VECTOR (41 downto 0);
    signal leftShiftStage0Idx1_uid209_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (57 downto 0);
    signal leftShiftStage0Idx2_uid212_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (57 downto 0);
    signal leftShiftStage0Idx3Pad48_uid213_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal leftShiftStage0Idx3Rng48_uid214_normVal_uid57_fpLogETest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal leftShiftStage0Idx3Rng48_uid214_normVal_uid57_fpLogETest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal leftShiftStage0Idx3_uid215_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (57 downto 0);
    signal leftShiftStage0_uid217_normVal_uid57_fpLogETest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid217_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (57 downto 0);
    signal leftShiftStage1Idx1Rng4_uid219_normVal_uid57_fpLogETest_in : STD_LOGIC_VECTOR (53 downto 0);
    signal leftShiftStage1Idx1Rng4_uid219_normVal_uid57_fpLogETest_b : STD_LOGIC_VECTOR (53 downto 0);
    signal leftShiftStage1Idx1_uid220_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (57 downto 0);
    signal leftShiftStage1Idx2Rng8_uid222_normVal_uid57_fpLogETest_in : STD_LOGIC_VECTOR (49 downto 0);
    signal leftShiftStage1Idx2Rng8_uid222_normVal_uid57_fpLogETest_b : STD_LOGIC_VECTOR (49 downto 0);
    signal leftShiftStage1Idx2_uid223_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (57 downto 0);
    signal leftShiftStage1Idx3Pad12_uid224_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal leftShiftStage1Idx3Rng12_uid225_normVal_uid57_fpLogETest_in : STD_LOGIC_VECTOR (45 downto 0);
    signal leftShiftStage1Idx3Rng12_uid225_normVal_uid57_fpLogETest_b : STD_LOGIC_VECTOR (45 downto 0);
    signal leftShiftStage1Idx3_uid226_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (57 downto 0);
    signal leftShiftStage1_uid228_normVal_uid57_fpLogETest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid228_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (57 downto 0);
    signal leftShiftStage2Idx1Rng1_uid230_normVal_uid57_fpLogETest_in : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2Idx1Rng1_uid230_normVal_uid57_fpLogETest_b : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2Idx1_uid231_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (57 downto 0);
    signal leftShiftStage2Idx2Rng2_uid233_normVal_uid57_fpLogETest_in : STD_LOGIC_VECTOR (55 downto 0);
    signal leftShiftStage2Idx2Rng2_uid233_normVal_uid57_fpLogETest_b : STD_LOGIC_VECTOR (55 downto 0);
    signal leftShiftStage2Idx2_uid234_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (57 downto 0);
    signal leftShiftStage2Idx3Rng3_uid236_normVal_uid57_fpLogETest_in : STD_LOGIC_VECTOR (54 downto 0);
    signal leftShiftStage2Idx3Rng3_uid236_normVal_uid57_fpLogETest_b : STD_LOGIC_VECTOR (54 downto 0);
    signal leftShiftStage2Idx3_uid237_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (57 downto 0);
    signal leftShiftStage2_uid239_normVal_uid57_fpLogETest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage2_uid239_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (57 downto 0);
    signal memoryC0_uid134_lnTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid134_lnTables_lutmem_ia : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC0_uid134_lnTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid134_lnTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid134_lnTables_lutmem_ir : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC0_uid134_lnTables_lutmem_r : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC0_uid135_lnTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid135_lnTables_lutmem_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid135_lnTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid135_lnTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid135_lnTables_lutmem_ir : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid135_lnTables_lutmem_r : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid138_lnTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid138_lnTables_lutmem_ia : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC1_uid138_lnTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid138_lnTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid138_lnTables_lutmem_ir : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC1_uid138_lnTables_lutmem_r : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC2_uid142_lnTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid142_lnTables_lutmem_ia : STD_LOGIC_VECTOR (12 downto 0);
    signal memoryC2_uid142_lnTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid142_lnTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid142_lnTables_lutmem_ir : STD_LOGIC_VECTOR (12 downto 0);
    signal memoryC2_uid142_lnTables_lutmem_r : STD_LOGIC_VECTOR (12 downto 0);
    signal postPEMul_uid45_fpLogETest_cma_reset : std_logic;
    type postPEMul_uid45_fpLogETest_cma_a0type is array(NATURAL range <>) of SIGNED(24 downto 0);
    signal postPEMul_uid45_fpLogETest_cma_a0 : postPEMul_uid45_fpLogETest_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of postPEMul_uid45_fpLogETest_cma_a0 : signal is true;
    type postPEMul_uid45_fpLogETest_cma_c0type is array(NATURAL range <>) of SIGNED(25 downto 0);
    signal postPEMul_uid45_fpLogETest_cma_c0 : postPEMul_uid45_fpLogETest_cma_c0type(0 to 0);
    attribute preserve of postPEMul_uid45_fpLogETest_cma_c0 : signal is true;
    type postPEMul_uid45_fpLogETest_cma_ptype is array(NATURAL range <>) of SIGNED(50 downto 0);
    signal postPEMul_uid45_fpLogETest_cma_p : postPEMul_uid45_fpLogETest_cma_ptype(0 to 0);
    signal postPEMul_uid45_fpLogETest_cma_u : postPEMul_uid45_fpLogETest_cma_ptype(0 to 0);
    signal postPEMul_uid45_fpLogETest_cma_w : postPEMul_uid45_fpLogETest_cma_ptype(0 to 0);
    signal postPEMul_uid45_fpLogETest_cma_x : postPEMul_uid45_fpLogETest_cma_ptype(0 to 0);
    signal postPEMul_uid45_fpLogETest_cma_y : postPEMul_uid45_fpLogETest_cma_ptype(0 to 0);
    signal postPEMul_uid45_fpLogETest_cma_s : postPEMul_uid45_fpLogETest_cma_ptype(0 to 0);
    signal postPEMul_uid45_fpLogETest_cma_qq : STD_LOGIC_VECTOR (50 downto 0);
    signal postPEMul_uid45_fpLogETest_cma_q : STD_LOGIC_VECTOR (50 downto 0);
    signal postPEMul_uid45_fpLogETest_cma_ena0 : std_logic;
    signal postPEMul_uid45_fpLogETest_cma_ena1 : std_logic;
    signal prodXY_uid198_pT1_uid149_invPolyEval_cma_reset : std_logic;
    type prodXY_uid198_pT1_uid149_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(12 downto 0);
    signal prodXY_uid198_pT1_uid149_invPolyEval_cma_a0 : prodXY_uid198_pT1_uid149_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid198_pT1_uid149_invPolyEval_cma_a0 : signal is true;
    type prodXY_uid198_pT1_uid149_invPolyEval_cma_c0type is array(NATURAL range <>) of SIGNED(12 downto 0);
    signal prodXY_uid198_pT1_uid149_invPolyEval_cma_c0 : prodXY_uid198_pT1_uid149_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid198_pT1_uid149_invPolyEval_cma_c0 : signal is true;
    type prodXY_uid198_pT1_uid149_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(13 downto 0);
    signal prodXY_uid198_pT1_uid149_invPolyEval_cma_l : prodXY_uid198_pT1_uid149_invPolyEval_cma_ltype(0 to 0);
    type prodXY_uid198_pT1_uid149_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(26 downto 0);
    signal prodXY_uid198_pT1_uid149_invPolyEval_cma_p : prodXY_uid198_pT1_uid149_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid198_pT1_uid149_invPolyEval_cma_u : prodXY_uid198_pT1_uid149_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid198_pT1_uid149_invPolyEval_cma_w : prodXY_uid198_pT1_uid149_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid198_pT1_uid149_invPolyEval_cma_x : prodXY_uid198_pT1_uid149_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid198_pT1_uid149_invPolyEval_cma_y : prodXY_uid198_pT1_uid149_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid198_pT1_uid149_invPolyEval_cma_s : prodXY_uid198_pT1_uid149_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid198_pT1_uid149_invPolyEval_cma_qq : STD_LOGIC_VECTOR (25 downto 0);
    signal prodXY_uid198_pT1_uid149_invPolyEval_cma_q : STD_LOGIC_VECTOR (25 downto 0);
    signal prodXY_uid198_pT1_uid149_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid198_pT1_uid149_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid201_pT2_uid155_invPolyEval_cma_reset : std_logic;
    type prodXY_uid201_pT2_uid155_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(14 downto 0);
    signal prodXY_uid201_pT2_uid155_invPolyEval_cma_a0 : prodXY_uid201_pT2_uid155_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid201_pT2_uid155_invPolyEval_cma_a0 : signal is true;
    type prodXY_uid201_pT2_uid155_invPolyEval_cma_c0type is array(NATURAL range <>) of SIGNED(22 downto 0);
    signal prodXY_uid201_pT2_uid155_invPolyEval_cma_c0 : prodXY_uid201_pT2_uid155_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid201_pT2_uid155_invPolyEval_cma_c0 : signal is true;
    type prodXY_uid201_pT2_uid155_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(15 downto 0);
    signal prodXY_uid201_pT2_uid155_invPolyEval_cma_l : prodXY_uid201_pT2_uid155_invPolyEval_cma_ltype(0 to 0);
    type prodXY_uid201_pT2_uid155_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(38 downto 0);
    signal prodXY_uid201_pT2_uid155_invPolyEval_cma_p : prodXY_uid201_pT2_uid155_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid201_pT2_uid155_invPolyEval_cma_u : prodXY_uid201_pT2_uid155_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid201_pT2_uid155_invPolyEval_cma_w : prodXY_uid201_pT2_uid155_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid201_pT2_uid155_invPolyEval_cma_x : prodXY_uid201_pT2_uid155_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid201_pT2_uid155_invPolyEval_cma_y : prodXY_uid201_pT2_uid155_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid201_pT2_uid155_invPolyEval_cma_s : prodXY_uid201_pT2_uid155_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid201_pT2_uid155_invPolyEval_cma_qq : STD_LOGIC_VECTOR (37 downto 0);
    signal prodXY_uid201_pT2_uid155_invPolyEval_cma_q : STD_LOGIC_VECTOR (37 downto 0);
    signal prodXY_uid201_pT2_uid155_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid201_pT2_uid155_invPolyEval_cma_ena1 : std_logic;
    signal fracR_uid64_fpLogETest_merged_bit_select_in : STD_LOGIC_VECTOR (31 downto 0);
    signal fracR_uid64_fpLogETest_merged_bit_select_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracR_uid64_fpLogETest_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal lowRangeB_uid98_eLn2_uid30_fpLogETest_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid98_eLn2_uid30_fpLogETest_merged_bit_select_c : STD_LOGIC_VECTOR (33 downto 0);
    signal rVStage_uid170_countZ_uid56_fpLogETest_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid170_countZ_uid56_fpLogETest_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid176_countZ_uid56_fpLogETest_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid176_countZ_uid56_fpLogETest_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid182_countZ_uid56_fpLogETest_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid182_countZ_uid56_fpLogETest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid188_countZ_uid56_fpLogETest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid188_countZ_uid56_fpLogETest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto4_uid216_normVal_uid57_fpLogETest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto4_uid216_normVal_uid57_fpLogETest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto4_uid216_normVal_uid57_fpLogETest_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal redist0_vCount_uid171_countZ_uid56_fpLogETest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_vStage_uid165_countZ_uid56_fpLogETest_b_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist2_vCount_uid163_countZ_uid56_fpLogETest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_excRZero_uid68_fpLogETest_q_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_finalSumAbs_uid55_fpLogETest_q_1_q : STD_LOGIC_VECTOR (57 downto 0);
    signal redist5_zPPolyEval_uid35_fpLogETest_b_2_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist6_yAddr_uid34_fpLogETest_b_2_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist7_yAddr_uid34_fpLogETest_b_4_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist8_c_uid31_fpLogETest_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_c_uid31_fpLogETest_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_c_uid31_fpLogETest_q_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_fracXIsZero_uid20_fpLogETest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_frac_x_uid17_fpLogETest_b_2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist14_signX_uid7_fpLogETest_b_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_frac_x_uid17_fpLogETest_b_6_mem_reset0 : std_logic;
    signal redist13_frac_x_uid17_fpLogETest_b_6_mem_ia : STD_LOGIC_VECTOR (22 downto 0);
    signal redist13_frac_x_uid17_fpLogETest_b_6_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist13_frac_x_uid17_fpLogETest_b_6_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist13_frac_x_uid17_fpLogETest_b_6_mem_iq : STD_LOGIC_VECTOR (22 downto 0);
    signal redist13_frac_x_uid17_fpLogETest_b_6_mem_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist13_frac_x_uid17_fpLogETest_b_6_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist13_frac_x_uid17_fpLogETest_b_6_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist13_frac_x_uid17_fpLogETest_b_6_rdcnt_i : signal is true;
    signal redist13_frac_x_uid17_fpLogETest_b_6_rdcnt_eq : std_logic;
    attribute preserve of redist13_frac_x_uid17_fpLogETest_b_6_rdcnt_eq : signal is true;
    signal redist13_frac_x_uid17_fpLogETest_b_6_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_frac_x_uid17_fpLogETest_b_6_rdmux_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist13_frac_x_uid17_fpLogETest_b_6_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist13_frac_x_uid17_fpLogETest_b_6_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist13_frac_x_uid17_fpLogETest_b_6_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_frac_x_uid17_fpLogETest_b_6_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_frac_x_uid17_fpLogETest_b_6_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_frac_x_uid17_fpLogETest_b_6_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_frac_x_uid17_fpLogETest_b_6_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist13_frac_x_uid17_fpLogETest_b_6_sticky_ena_q : signal is true;
    signal redist13_frac_x_uid17_fpLogETest_b_6_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_expX_uid6_fpLogETest_b_7_mem_reset0 : std_logic;
    signal redist15_expX_uid6_fpLogETest_b_7_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist15_expX_uid6_fpLogETest_b_7_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist15_expX_uid6_fpLogETest_b_7_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist15_expX_uid6_fpLogETest_b_7_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist15_expX_uid6_fpLogETest_b_7_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist15_expX_uid6_fpLogETest_b_7_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist15_expX_uid6_fpLogETest_b_7_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist15_expX_uid6_fpLogETest_b_7_rdcnt_i : signal is true;
    signal redist15_expX_uid6_fpLogETest_b_7_rdcnt_eq : std_logic;
    attribute preserve of redist15_expX_uid6_fpLogETest_b_7_rdcnt_eq : signal is true;
    signal redist15_expX_uid6_fpLogETest_b_7_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_expX_uid6_fpLogETest_b_7_rdmux_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist15_expX_uid6_fpLogETest_b_7_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist15_expX_uid6_fpLogETest_b_7_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist15_expX_uid6_fpLogETest_b_7_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist15_expX_uid6_fpLogETest_b_7_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_expX_uid6_fpLogETest_b_7_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_expX_uid6_fpLogETest_b_7_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_expX_uid6_fpLogETest_b_7_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_expX_uid6_fpLogETest_b_7_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist15_expX_uid6_fpLogETest_b_7_sticky_ena_q : signal is true;
    signal redist15_expX_uid6_fpLogETest_b_7_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- cstBiasMO_uid11_fpLogETest(CONSTANT,10)
    cstBiasMO_uid11_fpLogETest_q <= "01111110";

    -- expX_uid6_fpLogETest(BITSELECT,5)@0
    expX_uid6_fpLogETest_b <= a(30 downto 23);

    -- c_uid31_fpLogETest(LOGICAL,30)@0
    c_uid31_fpLogETest_q <= "1" WHEN expX_uid6_fpLogETest_b = cstBiasMO_uid11_fpLogETest_q ELSE "0";

    -- frac_x_uid17_fpLogETest(BITSELECT,16)@0
    frac_x_uid17_fpLogETest_b <= a(22 downto 0);

    -- addrFull_uid32_fpLogETest(BITJOIN,31)@0
    addrFull_uid32_fpLogETest_q <= c_uid31_fpLogETest_q & frac_x_uid17_fpLogETest_b;

    -- yAddr_uid34_fpLogETest(BITSELECT,33)@0
    yAddr_uid34_fpLogETest_b <= addrFull_uid32_fpLogETest_q(23 downto 15);

    -- memoryC2_uid142_lnTables_lutmem(DUALMEM,243)@0 + 2
    -- in j@20000000
    memoryC2_uid142_lnTables_lutmem_aa <= yAddr_uid34_fpLogETest_b;
    memoryC2_uid142_lnTables_lutmem_reset0 <= areset;
    memoryC2_uid142_lnTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 13,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "FP_LOG_0002_memoryC2_uid142_lnTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => en(0),
        aclr0 => memoryC2_uid142_lnTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid142_lnTables_lutmem_aa,
        q_a => memoryC2_uid142_lnTables_lutmem_ir
    );
    memoryC2_uid142_lnTables_lutmem_r <= memoryC2_uid142_lnTables_lutmem_ir(12 downto 0);

    -- redist12_frac_x_uid17_fpLogETest_b_2(DELAY,266)
    redist12_frac_x_uid17_fpLogETest_b_2 : dspba_delay
    GENERIC MAP ( width => 23, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_x_uid17_fpLogETest_b, xout => redist12_frac_x_uid17_fpLogETest_b_2_q, ena => en(0), clk => clk, aclr => areset );

    -- zPPolyEval_uid35_fpLogETest(BITSELECT,34)@2
    zPPolyEval_uid35_fpLogETest_in <= redist12_frac_x_uid17_fpLogETest_b_2_q(14 downto 0);
    zPPolyEval_uid35_fpLogETest_b <= zPPolyEval_uid35_fpLogETest_in(14 downto 0);

    -- yT1_uid148_invPolyEval(BITSELECT,147)@2
    yT1_uid148_invPolyEval_b <= zPPolyEval_uid35_fpLogETest_b(14 downto 2);

    -- prodXY_uid198_pT1_uid149_invPolyEval_cma(CHAINMULTADD,245)@2 + 2
    prodXY_uid198_pT1_uid149_invPolyEval_cma_reset <= areset;
    prodXY_uid198_pT1_uid149_invPolyEval_cma_ena0 <= en(0);
    prodXY_uid198_pT1_uid149_invPolyEval_cma_ena1 <= prodXY_uid198_pT1_uid149_invPolyEval_cma_ena0;
    prodXY_uid198_pT1_uid149_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid198_pT1_uid149_invPolyEval_cma_a0(0),14));
    prodXY_uid198_pT1_uid149_invPolyEval_cma_p(0) <= prodXY_uid198_pT1_uid149_invPolyEval_cma_l(0) * prodXY_uid198_pT1_uid149_invPolyEval_cma_c0(0);
    prodXY_uid198_pT1_uid149_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid198_pT1_uid149_invPolyEval_cma_p(0),27);
    prodXY_uid198_pT1_uid149_invPolyEval_cma_w(0) <= prodXY_uid198_pT1_uid149_invPolyEval_cma_u(0);
    prodXY_uid198_pT1_uid149_invPolyEval_cma_x(0) <= prodXY_uid198_pT1_uid149_invPolyEval_cma_w(0);
    prodXY_uid198_pT1_uid149_invPolyEval_cma_y(0) <= prodXY_uid198_pT1_uid149_invPolyEval_cma_x(0);
    prodXY_uid198_pT1_uid149_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid198_pT1_uid149_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid198_pT1_uid149_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid198_pT1_uid149_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid198_pT1_uid149_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(yT1_uid148_invPolyEval_b),13);
                prodXY_uid198_pT1_uid149_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(memoryC2_uid142_lnTables_lutmem_r),13);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid198_pT1_uid149_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid198_pT1_uid149_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid198_pT1_uid149_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid198_pT1_uid149_invPolyEval_cma_s(0) <= prodXY_uid198_pT1_uid149_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid198_pT1_uid149_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 26, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid198_pT1_uid149_invPolyEval_cma_s(0)(25 downto 0)), xout => prodXY_uid198_pT1_uid149_invPolyEval_cma_qq, ena => en(0), clk => clk, aclr => areset );
    prodXY_uid198_pT1_uid149_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid198_pT1_uid149_invPolyEval_cma_qq(25 downto 0));

    -- osig_uid199_pT1_uid149_invPolyEval(BITSELECT,198)@4
    osig_uid199_pT1_uid149_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid198_pT1_uid149_invPolyEval_cma_q(25 downto 12));

    -- highBBits_uid151_invPolyEval(BITSELECT,150)@4
    highBBits_uid151_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid199_pT1_uid149_invPolyEval_b(13 downto 1));

    -- memoryC1_uid139_lnTables_q_const(CONSTANT,203)
    memoryC1_uid139_lnTables_q_const_q <= "1";

    -- redist6_yAddr_uid34_fpLogETest_b_2(DELAY,260)
    redist6_yAddr_uid34_fpLogETest_b_2 : dspba_delay
    GENERIC MAP ( width => 9, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid34_fpLogETest_b, xout => redist6_yAddr_uid34_fpLogETest_b_2_q, ena => en(0), clk => clk, aclr => areset );

    -- memoryC1_uid138_lnTables_lutmem(DUALMEM,242)@2 + 2
    -- in j@20000000
    memoryC1_uid138_lnTables_lutmem_aa <= redist6_yAddr_uid34_fpLogETest_b_2_q;
    memoryC1_uid138_lnTables_lutmem_reset0 <= areset;
    memoryC1_uid138_lnTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 20,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "FP_LOG_0002_memoryC1_uid138_lnTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => en(0),
        aclr0 => memoryC1_uid138_lnTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid138_lnTables_lutmem_aa,
        q_a => memoryC1_uid138_lnTables_lutmem_ir
    );
    memoryC1_uid138_lnTables_lutmem_r <= memoryC1_uid138_lnTables_lutmem_ir(19 downto 0);

    -- os_uid140_lnTables(BITJOIN,139)@4
    os_uid140_lnTables_q <= memoryC1_uid139_lnTables_q_const_q & memoryC1_uid138_lnTables_lutmem_r;

    -- s1sumAHighB_uid152_invPolyEval(ADD,151)@4
    s1sumAHighB_uid152_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => os_uid140_lnTables_q(20)) & os_uid140_lnTables_q));
    s1sumAHighB_uid152_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 13 => highBBits_uid151_invPolyEval_b(12)) & highBBits_uid151_invPolyEval_b));
    s1sumAHighB_uid152_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid152_invPolyEval_a) + SIGNED(s1sumAHighB_uid152_invPolyEval_b));
    s1sumAHighB_uid152_invPolyEval_q <= s1sumAHighB_uid152_invPolyEval_o(21 downto 0);

    -- lowRangeB_uid150_invPolyEval(BITSELECT,149)@4
    lowRangeB_uid150_invPolyEval_in <= osig_uid199_pT1_uid149_invPolyEval_b(0 downto 0);
    lowRangeB_uid150_invPolyEval_b <= lowRangeB_uid150_invPolyEval_in(0 downto 0);

    -- s1_uid153_invPolyEval(BITJOIN,152)@4
    s1_uid153_invPolyEval_q <= s1sumAHighB_uid152_invPolyEval_q & lowRangeB_uid150_invPolyEval_b;

    -- redist5_zPPolyEval_uid35_fpLogETest_b_2(DELAY,259)
    redist5_zPPolyEval_uid35_fpLogETest_b_2 : dspba_delay
    GENERIC MAP ( width => 15, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => zPPolyEval_uid35_fpLogETest_b, xout => redist5_zPPolyEval_uid35_fpLogETest_b_2_q, ena => en(0), clk => clk, aclr => areset );

    -- prodXY_uid201_pT2_uid155_invPolyEval_cma(CHAINMULTADD,246)@4 + 2
    prodXY_uid201_pT2_uid155_invPolyEval_cma_reset <= areset;
    prodXY_uid201_pT2_uid155_invPolyEval_cma_ena0 <= en(0);
    prodXY_uid201_pT2_uid155_invPolyEval_cma_ena1 <= prodXY_uid201_pT2_uid155_invPolyEval_cma_ena0;
    prodXY_uid201_pT2_uid155_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid201_pT2_uid155_invPolyEval_cma_a0(0),16));
    prodXY_uid201_pT2_uid155_invPolyEval_cma_p(0) <= prodXY_uid201_pT2_uid155_invPolyEval_cma_l(0) * prodXY_uid201_pT2_uid155_invPolyEval_cma_c0(0);
    prodXY_uid201_pT2_uid155_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid201_pT2_uid155_invPolyEval_cma_p(0),39);
    prodXY_uid201_pT2_uid155_invPolyEval_cma_w(0) <= prodXY_uid201_pT2_uid155_invPolyEval_cma_u(0);
    prodXY_uid201_pT2_uid155_invPolyEval_cma_x(0) <= prodXY_uid201_pT2_uid155_invPolyEval_cma_w(0);
    prodXY_uid201_pT2_uid155_invPolyEval_cma_y(0) <= prodXY_uid201_pT2_uid155_invPolyEval_cma_x(0);
    prodXY_uid201_pT2_uid155_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid201_pT2_uid155_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid201_pT2_uid155_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid201_pT2_uid155_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid201_pT2_uid155_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(redist5_zPPolyEval_uid35_fpLogETest_b_2_q),15);
                prodXY_uid201_pT2_uid155_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(s1_uid153_invPolyEval_q),23);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid201_pT2_uid155_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid201_pT2_uid155_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid201_pT2_uid155_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid201_pT2_uid155_invPolyEval_cma_s(0) <= prodXY_uid201_pT2_uid155_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid201_pT2_uid155_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 38, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid201_pT2_uid155_invPolyEval_cma_s(0)(37 downto 0)), xout => prodXY_uid201_pT2_uid155_invPolyEval_cma_qq, ena => en(0), clk => clk, aclr => areset );
    prodXY_uid201_pT2_uid155_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid201_pT2_uid155_invPolyEval_cma_qq(37 downto 0));

    -- osig_uid202_pT2_uid155_invPolyEval(BITSELECT,201)@6
    osig_uid202_pT2_uid155_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid201_pT2_uid155_invPolyEval_cma_q(37 downto 14));

    -- highBBits_uid157_invPolyEval(BITSELECT,156)@6
    highBBits_uid157_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid202_pT2_uid155_invPolyEval_b(23 downto 2));

    -- redist7_yAddr_uid34_fpLogETest_b_4(DELAY,261)
    redist7_yAddr_uid34_fpLogETest_b_4 : dspba_delay
    GENERIC MAP ( width => 9, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist6_yAddr_uid34_fpLogETest_b_2_q, xout => redist7_yAddr_uid34_fpLogETest_b_4_q, ena => en(0), clk => clk, aclr => areset );

    -- memoryC0_uid135_lnTables_lutmem(DUALMEM,241)@4 + 2
    -- in j@20000000
    memoryC0_uid135_lnTables_lutmem_aa <= redist7_yAddr_uid34_fpLogETest_b_4_q;
    memoryC0_uid135_lnTables_lutmem_reset0 <= areset;
    memoryC0_uid135_lnTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 11,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "FP_LOG_0002_memoryC0_uid135_lnTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => en(0),
        aclr0 => memoryC0_uid135_lnTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid135_lnTables_lutmem_aa,
        q_a => memoryC0_uid135_lnTables_lutmem_ir
    );
    memoryC0_uid135_lnTables_lutmem_r <= memoryC0_uid135_lnTables_lutmem_ir(10 downto 0);

    -- memoryC0_uid134_lnTables_lutmem(DUALMEM,240)@4 + 2
    -- in j@20000000
    memoryC0_uid134_lnTables_lutmem_aa <= redist7_yAddr_uid34_fpLogETest_b_4_q;
    memoryC0_uid134_lnTables_lutmem_reset0 <= areset;
    memoryC0_uid134_lnTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 20,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "FP_LOG_0002_memoryC0_uid134_lnTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => en(0),
        aclr0 => memoryC0_uid134_lnTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid134_lnTables_lutmem_aa,
        q_a => memoryC0_uid134_lnTables_lutmem_ir
    );
    memoryC0_uid134_lnTables_lutmem_r <= memoryC0_uid134_lnTables_lutmem_ir(19 downto 0);

    -- os_uid136_lnTables(BITJOIN,135)@6
    os_uid136_lnTables_q <= memoryC0_uid135_lnTables_lutmem_r & memoryC0_uid134_lnTables_lutmem_r;

    -- s2sumAHighB_uid158_invPolyEval(ADD,157)@6
    s2sumAHighB_uid158_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 31 => os_uid136_lnTables_q(30)) & os_uid136_lnTables_q));
    s2sumAHighB_uid158_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 22 => highBBits_uid157_invPolyEval_b(21)) & highBBits_uid157_invPolyEval_b));
    s2sumAHighB_uid158_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid158_invPolyEval_a) + SIGNED(s2sumAHighB_uid158_invPolyEval_b));
    s2sumAHighB_uid158_invPolyEval_q <= s2sumAHighB_uid158_invPolyEval_o(31 downto 0);

    -- lowRangeB_uid156_invPolyEval(BITSELECT,155)@6
    lowRangeB_uid156_invPolyEval_in <= osig_uid202_pT2_uid155_invPolyEval_b(1 downto 0);
    lowRangeB_uid156_invPolyEval_b <= lowRangeB_uid156_invPolyEval_in(1 downto 0);

    -- s2_uid159_invPolyEval(BITJOIN,158)@6
    s2_uid159_invPolyEval_q <= s2sumAHighB_uid158_invPolyEval_q & lowRangeB_uid156_invPolyEval_b;

    -- peOR_uid37_fpLogETest(BITSELECT,36)@6
    peOR_uid37_fpLogETest_in <= STD_LOGIC_VECTOR(s2_uid159_invPolyEval_q(32 downto 0));
    peOR_uid37_fpLogETest_b <= STD_LOGIC_VECTOR(peOR_uid37_fpLogETest_in(32 downto 7));

    -- redist13_frac_x_uid17_fpLogETest_b_6_notEnable(LOGICAL,277)
    redist13_frac_x_uid17_fpLogETest_b_6_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist13_frac_x_uid17_fpLogETest_b_6_nor(LOGICAL,278)
    redist13_frac_x_uid17_fpLogETest_b_6_nor_q <= not (redist13_frac_x_uid17_fpLogETest_b_6_notEnable_q or redist13_frac_x_uid17_fpLogETest_b_6_sticky_ena_q);

    -- redist13_frac_x_uid17_fpLogETest_b_6_mem_last(CONSTANT,274)
    redist13_frac_x_uid17_fpLogETest_b_6_mem_last_q <= "01";

    -- redist13_frac_x_uid17_fpLogETest_b_6_cmp(LOGICAL,275)
    redist13_frac_x_uid17_fpLogETest_b_6_cmp_q <= "1" WHEN redist13_frac_x_uid17_fpLogETest_b_6_mem_last_q = redist13_frac_x_uid17_fpLogETest_b_6_rdmux_q ELSE "0";

    -- redist13_frac_x_uid17_fpLogETest_b_6_cmpReg(REG,276)
    redist13_frac_x_uid17_fpLogETest_b_6_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist13_frac_x_uid17_fpLogETest_b_6_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist13_frac_x_uid17_fpLogETest_b_6_cmpReg_q <= STD_LOGIC_VECTOR(redist13_frac_x_uid17_fpLogETest_b_6_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist13_frac_x_uid17_fpLogETest_b_6_sticky_ena(REG,279)
    redist13_frac_x_uid17_fpLogETest_b_6_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist13_frac_x_uid17_fpLogETest_b_6_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist13_frac_x_uid17_fpLogETest_b_6_nor_q = "1") THEN
                redist13_frac_x_uid17_fpLogETest_b_6_sticky_ena_q <= STD_LOGIC_VECTOR(redist13_frac_x_uid17_fpLogETest_b_6_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist13_frac_x_uid17_fpLogETest_b_6_enaAnd(LOGICAL,280)
    redist13_frac_x_uid17_fpLogETest_b_6_enaAnd_q <= redist13_frac_x_uid17_fpLogETest_b_6_sticky_ena_q and en;

    -- redist13_frac_x_uid17_fpLogETest_b_6_rdcnt(COUNTER,271)
    -- low=0, high=2, step=1, init=0
    redist13_frac_x_uid17_fpLogETest_b_6_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist13_frac_x_uid17_fpLogETest_b_6_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist13_frac_x_uid17_fpLogETest_b_6_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                IF (redist13_frac_x_uid17_fpLogETest_b_6_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                    redist13_frac_x_uid17_fpLogETest_b_6_rdcnt_eq <= '1';
                ELSE
                    redist13_frac_x_uid17_fpLogETest_b_6_rdcnt_eq <= '0';
                END IF;
                IF (redist13_frac_x_uid17_fpLogETest_b_6_rdcnt_eq = '1') THEN
                    redist13_frac_x_uid17_fpLogETest_b_6_rdcnt_i <= redist13_frac_x_uid17_fpLogETest_b_6_rdcnt_i + 2;
                ELSE
                    redist13_frac_x_uid17_fpLogETest_b_6_rdcnt_i <= redist13_frac_x_uid17_fpLogETest_b_6_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist13_frac_x_uid17_fpLogETest_b_6_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist13_frac_x_uid17_fpLogETest_b_6_rdcnt_i, 2)));

    -- redist13_frac_x_uid17_fpLogETest_b_6_rdmux(MUX,272)
    redist13_frac_x_uid17_fpLogETest_b_6_rdmux_s <= en;
    redist13_frac_x_uid17_fpLogETest_b_6_rdmux_combproc: PROCESS (redist13_frac_x_uid17_fpLogETest_b_6_rdmux_s, redist13_frac_x_uid17_fpLogETest_b_6_wraddr_q, redist13_frac_x_uid17_fpLogETest_b_6_rdcnt_q)
    BEGIN
        CASE (redist13_frac_x_uid17_fpLogETest_b_6_rdmux_s) IS
            WHEN "0" => redist13_frac_x_uid17_fpLogETest_b_6_rdmux_q <= redist13_frac_x_uid17_fpLogETest_b_6_wraddr_q;
            WHEN "1" => redist13_frac_x_uid17_fpLogETest_b_6_rdmux_q <= redist13_frac_x_uid17_fpLogETest_b_6_rdcnt_q;
            WHEN OTHERS => redist13_frac_x_uid17_fpLogETest_b_6_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist13_frac_x_uid17_fpLogETest_b_6_wraddr(REG,273)
    redist13_frac_x_uid17_fpLogETest_b_6_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist13_frac_x_uid17_fpLogETest_b_6_wraddr_q <= "10";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist13_frac_x_uid17_fpLogETest_b_6_wraddr_q <= STD_LOGIC_VECTOR(redist13_frac_x_uid17_fpLogETest_b_6_rdmux_q);
        END IF;
    END PROCESS;

    -- redist13_frac_x_uid17_fpLogETest_b_6_mem(DUALMEM,270)
    redist13_frac_x_uid17_fpLogETest_b_6_mem_ia <= STD_LOGIC_VECTOR(redist12_frac_x_uid17_fpLogETest_b_2_q);
    redist13_frac_x_uid17_fpLogETest_b_6_mem_aa <= redist13_frac_x_uid17_fpLogETest_b_6_wraddr_q;
    redist13_frac_x_uid17_fpLogETest_b_6_mem_ab <= redist13_frac_x_uid17_fpLogETest_b_6_rdmux_q;
    redist13_frac_x_uid17_fpLogETest_b_6_mem_reset0 <= areset;
    redist13_frac_x_uid17_fpLogETest_b_6_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 23,
        widthad_b => 2,
        numwords_b => 3,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist13_frac_x_uid17_fpLogETest_b_6_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist13_frac_x_uid17_fpLogETest_b_6_mem_reset0,
        clock1 => clk,
        address_a => redist13_frac_x_uid17_fpLogETest_b_6_mem_aa,
        data_a => redist13_frac_x_uid17_fpLogETest_b_6_mem_ia,
        wren_a => en(0),
        address_b => redist13_frac_x_uid17_fpLogETest_b_6_mem_ab,
        q_b => redist13_frac_x_uid17_fpLogETest_b_6_mem_iq
    );
    redist13_frac_x_uid17_fpLogETest_b_6_mem_q <= redist13_frac_x_uid17_fpLogETest_b_6_mem_iq(22 downto 0);

    -- cstAllZWF_uid8_fpLogETest(CONSTANT,7)
    cstAllZWF_uid8_fpLogETest_q <= "00000000000000000000000";

    -- aPostPad_uid39_fpLogETest(BITJOIN,38)@6
    aPostPad_uid39_fpLogETest_q <= VCC_q & cstAllZWF_uid8_fpLogETest_q;

    -- oMz_uid40_fpLogETest(SUB,39)@6
    oMz_uid40_fpLogETest_a <= STD_LOGIC_VECTOR("0" & aPostPad_uid39_fpLogETest_q);
    oMz_uid40_fpLogETest_b <= STD_LOGIC_VECTOR("00" & redist13_frac_x_uid17_fpLogETest_b_6_mem_q);
    oMz_uid40_fpLogETest_o <= STD_LOGIC_VECTOR(UNSIGNED(oMz_uid40_fpLogETest_a) - UNSIGNED(oMz_uid40_fpLogETest_b));
    oMz_uid40_fpLogETest_q <= oMz_uid40_fpLogETest_o(24 downto 0);

    -- z2_uid41_fpLogETest(CONSTANT,40)
    z2_uid41_fpLogETest_q <= "00";

    -- sEz_uid42_fpLogETest(BITJOIN,41)@6
    sEz_uid42_fpLogETest_q <= z2_uid41_fpLogETest_q & redist13_frac_x_uid17_fpLogETest_b_6_mem_q;

    -- redist8_c_uid31_fpLogETest_q_6(DELAY,262)
    redist8_c_uid31_fpLogETest_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => c_uid31_fpLogETest_q, xout => redist8_c_uid31_fpLogETest_q_6_q, ena => en(0), clk => clk, aclr => areset );

    -- multTermOne_uid44_fpLogETest(MUX,43)@6
    multTermOne_uid44_fpLogETest_s <= redist8_c_uid31_fpLogETest_q_6_q;
    multTermOne_uid44_fpLogETest_combproc: PROCESS (multTermOne_uid44_fpLogETest_s, en, sEz_uid42_fpLogETest_q, oMz_uid40_fpLogETest_q)
    BEGIN
        CASE (multTermOne_uid44_fpLogETest_s) IS
            WHEN "0" => multTermOne_uid44_fpLogETest_q <= sEz_uid42_fpLogETest_q;
            WHEN "1" => multTermOne_uid44_fpLogETest_q <= oMz_uid40_fpLogETest_q;
            WHEN OTHERS => multTermOne_uid44_fpLogETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- postPEMul_uid45_fpLogETest_cma(CHAINMULTADD,244)@6 + 2
    postPEMul_uid45_fpLogETest_cma_reset <= areset;
    postPEMul_uid45_fpLogETest_cma_ena0 <= en(0);
    postPEMul_uid45_fpLogETest_cma_ena1 <= postPEMul_uid45_fpLogETest_cma_ena0;
    postPEMul_uid45_fpLogETest_cma_p(0) <= postPEMul_uid45_fpLogETest_cma_a0(0) * postPEMul_uid45_fpLogETest_cma_c0(0);
    postPEMul_uid45_fpLogETest_cma_u(0) <= RESIZE(postPEMul_uid45_fpLogETest_cma_p(0),51);
    postPEMul_uid45_fpLogETest_cma_w(0) <= postPEMul_uid45_fpLogETest_cma_u(0);
    postPEMul_uid45_fpLogETest_cma_x(0) <= postPEMul_uid45_fpLogETest_cma_w(0);
    postPEMul_uid45_fpLogETest_cma_y(0) <= postPEMul_uid45_fpLogETest_cma_x(0);
    postPEMul_uid45_fpLogETest_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid45_fpLogETest_cma_a0 <= (others => (others => '0'));
            postPEMul_uid45_fpLogETest_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (postPEMul_uid45_fpLogETest_cma_ena0 = '1') THEN
                postPEMul_uid45_fpLogETest_cma_a0(0) <= RESIZE(SIGNED(multTermOne_uid44_fpLogETest_q),25);
                postPEMul_uid45_fpLogETest_cma_c0(0) <= RESIZE(SIGNED(peOR_uid37_fpLogETest_b),26);
            END IF;
        END IF;
    END PROCESS;
    postPEMul_uid45_fpLogETest_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid45_fpLogETest_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (postPEMul_uid45_fpLogETest_cma_ena1 = '1') THEN
                postPEMul_uid45_fpLogETest_cma_s(0) <= postPEMul_uid45_fpLogETest_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    postPEMul_uid45_fpLogETest_cma_delay : dspba_delay
    GENERIC MAP ( width => 51, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(postPEMul_uid45_fpLogETest_cma_s(0)(50 downto 0)), xout => postPEMul_uid45_fpLogETest_cma_qq, ena => en(0), clk => clk, aclr => areset );
    postPEMul_uid45_fpLogETest_cma_q <= STD_LOGIC_VECTOR(postPEMul_uid45_fpLogETest_cma_qq(50 downto 0));

    -- highBBits_uid49_fpLogETest(BITSELECT,48)@8
    highBBits_uid49_fpLogETest_b <= STD_LOGIC_VECTOR(postPEMul_uid45_fpLogETest_cma_q(50 downto 21));

    -- wideZero_uid46_fpLogETest(CONSTANT,45)
    wideZero_uid46_fpLogETest_q <= "00000000000000000000000000000000000";

    -- maxValInOutFormat_uid102_eLn2_uid30_fpLogETest(CONSTANT,101)
    maxValInOutFormat_uid102_eLn2_uid30_fpLogETest_q <= "01111111111111111111111111111111111";

    -- minValueInFormat_uid103_eLn2_uid30_fpLogETest(CONSTANT,102)
    minValueInFormat_uid103_eLn2_uid30_fpLogETest_q <= "10000000000000000000000000000000000";

    -- cstBias_uid10_fpLogETest(CONSTANT,9)
    cstBias_uid10_fpLogETest_q <= "01111111";

    -- redist15_expX_uid6_fpLogETest_b_7_notEnable(LOGICAL,288)
    redist15_expX_uid6_fpLogETest_b_7_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist15_expX_uid6_fpLogETest_b_7_nor(LOGICAL,289)
    redist15_expX_uid6_fpLogETest_b_7_nor_q <= not (redist15_expX_uid6_fpLogETest_b_7_notEnable_q or redist15_expX_uid6_fpLogETest_b_7_sticky_ena_q);

    -- redist15_expX_uid6_fpLogETest_b_7_mem_last(CONSTANT,285)
    redist15_expX_uid6_fpLogETest_b_7_mem_last_q <= "0100";

    -- redist15_expX_uid6_fpLogETest_b_7_cmp(LOGICAL,286)
    redist15_expX_uid6_fpLogETest_b_7_cmp_b <= STD_LOGIC_VECTOR("0" & redist15_expX_uid6_fpLogETest_b_7_rdmux_q);
    redist15_expX_uid6_fpLogETest_b_7_cmp_q <= "1" WHEN redist15_expX_uid6_fpLogETest_b_7_mem_last_q = redist15_expX_uid6_fpLogETest_b_7_cmp_b ELSE "0";

    -- redist15_expX_uid6_fpLogETest_b_7_cmpReg(REG,287)
    redist15_expX_uid6_fpLogETest_b_7_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_expX_uid6_fpLogETest_b_7_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist15_expX_uid6_fpLogETest_b_7_cmpReg_q <= STD_LOGIC_VECTOR(redist15_expX_uid6_fpLogETest_b_7_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist15_expX_uid6_fpLogETest_b_7_sticky_ena(REG,290)
    redist15_expX_uid6_fpLogETest_b_7_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_expX_uid6_fpLogETest_b_7_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist15_expX_uid6_fpLogETest_b_7_nor_q = "1") THEN
                redist15_expX_uid6_fpLogETest_b_7_sticky_ena_q <= STD_LOGIC_VECTOR(redist15_expX_uid6_fpLogETest_b_7_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist15_expX_uid6_fpLogETest_b_7_enaAnd(LOGICAL,291)
    redist15_expX_uid6_fpLogETest_b_7_enaAnd_q <= redist15_expX_uid6_fpLogETest_b_7_sticky_ena_q and en;

    -- redist15_expX_uid6_fpLogETest_b_7_rdcnt(COUNTER,282)
    -- low=0, high=5, step=1, init=0
    redist15_expX_uid6_fpLogETest_b_7_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_expX_uid6_fpLogETest_b_7_rdcnt_i <= TO_UNSIGNED(0, 3);
            redist15_expX_uid6_fpLogETest_b_7_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                IF (redist15_expX_uid6_fpLogETest_b_7_rdcnt_i = TO_UNSIGNED(4, 3)) THEN
                    redist15_expX_uid6_fpLogETest_b_7_rdcnt_eq <= '1';
                ELSE
                    redist15_expX_uid6_fpLogETest_b_7_rdcnt_eq <= '0';
                END IF;
                IF (redist15_expX_uid6_fpLogETest_b_7_rdcnt_eq = '1') THEN
                    redist15_expX_uid6_fpLogETest_b_7_rdcnt_i <= redist15_expX_uid6_fpLogETest_b_7_rdcnt_i + 3;
                ELSE
                    redist15_expX_uid6_fpLogETest_b_7_rdcnt_i <= redist15_expX_uid6_fpLogETest_b_7_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist15_expX_uid6_fpLogETest_b_7_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist15_expX_uid6_fpLogETest_b_7_rdcnt_i, 3)));

    -- redist15_expX_uid6_fpLogETest_b_7_rdmux(MUX,283)
    redist15_expX_uid6_fpLogETest_b_7_rdmux_s <= en;
    redist15_expX_uid6_fpLogETest_b_7_rdmux_combproc: PROCESS (redist15_expX_uid6_fpLogETest_b_7_rdmux_s, redist15_expX_uid6_fpLogETest_b_7_wraddr_q, redist15_expX_uid6_fpLogETest_b_7_rdcnt_q)
    BEGIN
        CASE (redist15_expX_uid6_fpLogETest_b_7_rdmux_s) IS
            WHEN "0" => redist15_expX_uid6_fpLogETest_b_7_rdmux_q <= redist15_expX_uid6_fpLogETest_b_7_wraddr_q;
            WHEN "1" => redist15_expX_uid6_fpLogETest_b_7_rdmux_q <= redist15_expX_uid6_fpLogETest_b_7_rdcnt_q;
            WHEN OTHERS => redist15_expX_uid6_fpLogETest_b_7_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist15_expX_uid6_fpLogETest_b_7_wraddr(REG,284)
    redist15_expX_uid6_fpLogETest_b_7_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_expX_uid6_fpLogETest_b_7_wraddr_q <= "101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist15_expX_uid6_fpLogETest_b_7_wraddr_q <= STD_LOGIC_VECTOR(redist15_expX_uid6_fpLogETest_b_7_rdmux_q);
        END IF;
    END PROCESS;

    -- redist15_expX_uid6_fpLogETest_b_7_mem(DUALMEM,281)
    redist15_expX_uid6_fpLogETest_b_7_mem_ia <= STD_LOGIC_VECTOR(expX_uid6_fpLogETest_b);
    redist15_expX_uid6_fpLogETest_b_7_mem_aa <= redist15_expX_uid6_fpLogETest_b_7_wraddr_q;
    redist15_expX_uid6_fpLogETest_b_7_mem_ab <= redist15_expX_uid6_fpLogETest_b_7_rdmux_q;
    redist15_expX_uid6_fpLogETest_b_7_mem_reset0 <= areset;
    redist15_expX_uid6_fpLogETest_b_7_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 8,
        widthad_b => 3,
        numwords_b => 6,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist15_expX_uid6_fpLogETest_b_7_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist15_expX_uid6_fpLogETest_b_7_mem_reset0,
        clock1 => clk,
        address_a => redist15_expX_uid6_fpLogETest_b_7_mem_aa,
        data_a => redist15_expX_uid6_fpLogETest_b_7_mem_ia,
        wren_a => en(0),
        address_b => redist15_expX_uid6_fpLogETest_b_7_mem_ab,
        q_b => redist15_expX_uid6_fpLogETest_b_7_mem_iq
    );
    redist15_expX_uid6_fpLogETest_b_7_mem_q <= redist15_expX_uid6_fpLogETest_b_7_mem_iq(7 downto 0);

    -- e_uid29_fpLogETest(SUB,28)@7
    e_uid29_fpLogETest_a <= STD_LOGIC_VECTOR("0" & redist15_expX_uid6_fpLogETest_b_7_mem_q);
    e_uid29_fpLogETest_b <= STD_LOGIC_VECTOR("0" & cstBias_uid10_fpLogETest_q);
    e_uid29_fpLogETest_o <= STD_LOGIC_VECTOR(UNSIGNED(e_uid29_fpLogETest_a) - UNSIGNED(e_uid29_fpLogETest_b));
    e_uid29_fpLogETest_q <= e_uid29_fpLogETest_o(8 downto 0);

    -- xv1_uid95_eLn2_uid30_fpLogETest(BITSELECT,94)@7
    xv1_uid95_eLn2_uid30_fpLogETest_b <= STD_LOGIC_VECTOR(e_uid29_fpLogETest_q(8 downto 6));

    -- p1_uid96_eLn2_uid30_fpLogETest(LOOKUP,95)@7
    p1_uid96_eLn2_uid30_fpLogETest_combproc: PROCESS (xv1_uid95_eLn2_uid30_fpLogETest_b)
    BEGIN
        -- Begin reserved scope level
        CASE (xv1_uid95_eLn2_uid30_fpLogETest_b) IS
            WHEN "000" => p1_uid96_eLn2_uid30_fpLogETest_q <= "00000000000000000000000000000000000010";
            WHEN "001" => p1_uid96_eLn2_uid30_fpLogETest_q <= "00001011000101110010000110000000000010";
            WHEN "010" => p1_uid96_eLn2_uid30_fpLogETest_q <= "00010110001011100100001100000000000010";
            WHEN "011" => p1_uid96_eLn2_uid30_fpLogETest_q <= "00100001010001010110010010000000000010";
            WHEN "100" => p1_uid96_eLn2_uid30_fpLogETest_q <= "11010011101000110111101000000000000010";
            WHEN "101" => p1_uid96_eLn2_uid30_fpLogETest_q <= "11011110101110101001101110000000000010";
            WHEN "110" => p1_uid96_eLn2_uid30_fpLogETest_q <= "11101001110100011011110100000000000010";
            WHEN "111" => p1_uid96_eLn2_uid30_fpLogETest_q <= "11110100111010001101111010000000000010";
            WHEN OTHERS => -- unreachable
                           p1_uid96_eLn2_uid30_fpLogETest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- lev1_a0sumAHighB_uid100_eLn2_uid30_fpLogETest(ADD,99)@7
    lev1_a0sumAHighB_uid100_eLn2_uid30_fpLogETest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((39 downto 38 => p1_uid96_eLn2_uid30_fpLogETest_q(37)) & p1_uid96_eLn2_uid30_fpLogETest_q));
    lev1_a0sumAHighB_uid100_eLn2_uid30_fpLogETest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000" & lowRangeB_uid98_eLn2_uid30_fpLogETest_merged_bit_select_c));
    lev1_a0sumAHighB_uid100_eLn2_uid30_fpLogETest_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid100_eLn2_uid30_fpLogETest_a) + SIGNED(lev1_a0sumAHighB_uid100_eLn2_uid30_fpLogETest_b));
    lev1_a0sumAHighB_uid100_eLn2_uid30_fpLogETest_q <= lev1_a0sumAHighB_uid100_eLn2_uid30_fpLogETest_o(38 downto 0);

    -- xv0_uid94_eLn2_uid30_fpLogETest(BITSELECT,93)@7
    xv0_uid94_eLn2_uid30_fpLogETest_in <= e_uid29_fpLogETest_q(5 downto 0);
    xv0_uid94_eLn2_uid30_fpLogETest_b <= xv0_uid94_eLn2_uid30_fpLogETest_in(5 downto 0);

    -- p0_uid97_eLn2_uid30_fpLogETest(LOOKUP,96)@7
    p0_uid97_eLn2_uid30_fpLogETest_combproc: PROCESS (xv0_uid94_eLn2_uid30_fpLogETest_b)
    BEGIN
        -- Begin reserved scope level
        CASE (xv0_uid94_eLn2_uid30_fpLogETest_b) IS
            WHEN "000000" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00000000000000000000000000000000000";
            WHEN "000001" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00000010110001011100100001100000000";
            WHEN "000010" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00000101100010111001000011000000000";
            WHEN "000011" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00001000010100010101100100100000000";
            WHEN "000100" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00001011000101110010000110000000000";
            WHEN "000101" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00001101110111001110100111100000000";
            WHEN "000110" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00010000101000101011001001000000000";
            WHEN "000111" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00010011011010000111101010100000000";
            WHEN "001000" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00010110001011100100001100000000000";
            WHEN "001001" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00011000111101000000101101100000000";
            WHEN "001010" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00011011101110011101001111000000000";
            WHEN "001011" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00011110011111111001110000100000000";
            WHEN "001100" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00100001010001010110010010000000000";
            WHEN "001101" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00100100000010110010110011100000000";
            WHEN "001110" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00100110110100001111010101000000000";
            WHEN "001111" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00101001100101101011110110100000000";
            WHEN "010000" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00101100010111001000011000000000000";
            WHEN "010001" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00101111001000100100111001100000000";
            WHEN "010010" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00110001111010000001011011000000000";
            WHEN "010011" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00110100101011011101111100100000000";
            WHEN "010100" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00110111011100111010011110000000000";
            WHEN "010101" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00111010001110010110111111100000000";
            WHEN "010110" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00111100111111110011100001000000000";
            WHEN "010111" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00111111110001010000000010100000000";
            WHEN "011000" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01000010100010101100100100000000000";
            WHEN "011001" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01000101010100001001000101100000000";
            WHEN "011010" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01001000000101100101100111000000000";
            WHEN "011011" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01001010110111000010001000100000000";
            WHEN "011100" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01001101101000011110101010000000000";
            WHEN "011101" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01010000011001111011001011100000000";
            WHEN "011110" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01010011001011010111101101000000000";
            WHEN "011111" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01010101111100110100001110100000000";
            WHEN "100000" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01011000101110010000110000000000000";
            WHEN "100001" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01011011011111101101010001100000000";
            WHEN "100010" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01011110010001001001110011000000000";
            WHEN "100011" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01100001000010100110010100100000000";
            WHEN "100100" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01100011110100000010110110000000000";
            WHEN "100101" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01100110100101011111010111100000000";
            WHEN "100110" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01101001010110111011111001000000000";
            WHEN "100111" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01101100001000011000011010100000000";
            WHEN "101000" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01101110111001110100111100000000000";
            WHEN "101001" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01110001101011010001011101100000000";
            WHEN "101010" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01110100011100101101111111000000000";
            WHEN "101011" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01110111001110001010100000100000000";
            WHEN "101100" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01111001111111100111000010000000000";
            WHEN "101101" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01111100110001000011100011100000000";
            WHEN "101110" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01111111100010100000000101000000000";
            WHEN "101111" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10000010010011111100100110100000000";
            WHEN "110000" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10000101000101011001001000000000000";
            WHEN "110001" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10000111110110110101101001100000000";
            WHEN "110010" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10001010101000010010001011000000000";
            WHEN "110011" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10001101011001101110101100100000000";
            WHEN "110100" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10010000001011001011001110000000000";
            WHEN "110101" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10010010111100100111101111100000000";
            WHEN "110110" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10010101101110000100010001000000000";
            WHEN "110111" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10011000011111100000110010100000000";
            WHEN "111000" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10011011010000111101010100000000000";
            WHEN "111001" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10011110000010011001110101100000000";
            WHEN "111010" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10100000110011110110010111000000000";
            WHEN "111011" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10100011100101010010111000100000000";
            WHEN "111100" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10100110010110101111011010000000000";
            WHEN "111101" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10101001001000001011111011100000000";
            WHEN "111110" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10101011111001101000011101000000000";
            WHEN "111111" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10101110101011000100111110100000000";
            WHEN OTHERS => -- unreachable
                           p0_uid97_eLn2_uid30_fpLogETest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- lowRangeB_uid98_eLn2_uid30_fpLogETest_merged_bit_select(BITSELECT,248)@7
    lowRangeB_uid98_eLn2_uid30_fpLogETest_merged_bit_select_b <= p0_uid97_eLn2_uid30_fpLogETest_q(0 downto 0);
    lowRangeB_uid98_eLn2_uid30_fpLogETest_merged_bit_select_c <= p0_uid97_eLn2_uid30_fpLogETest_q(34 downto 1);

    -- lev1_a0_uid101_eLn2_uid30_fpLogETest(BITJOIN,100)@7
    lev1_a0_uid101_eLn2_uid30_fpLogETest_q <= lev1_a0sumAHighB_uid100_eLn2_uid30_fpLogETest_q & lowRangeB_uid98_eLn2_uid30_fpLogETest_merged_bit_select_b;

    -- sR_uid111_eLn2_uid30_fpLogETest(BITSELECT,110)@7
    sR_uid111_eLn2_uid30_fpLogETest_in <= STD_LOGIC_VECTOR(lev1_a0_uid101_eLn2_uid30_fpLogETest_q(37 downto 0));
    sR_uid111_eLn2_uid30_fpLogETest_b <= STD_LOGIC_VECTOR(sR_uid111_eLn2_uid30_fpLogETest_in(37 downto 3));

    -- paddingX_uid104_eLn2_uid30_fpLogETest(CONSTANT,103)
    paddingX_uid104_eLn2_uid30_fpLogETest_q <= "000";

    -- updatedX_uid105_eLn2_uid30_fpLogETest(BITJOIN,104)@7
    updatedX_uid105_eLn2_uid30_fpLogETest_q <= maxValInOutFormat_uid102_eLn2_uid30_fpLogETest_q & paddingX_uid104_eLn2_uid30_fpLogETest_q;

    -- ovf_uid104_eLn2_uid30_fpLogETest(COMPARE,105)@7
    ovf_uid104_eLn2_uid30_fpLogETest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 38 => updatedX_uid105_eLn2_uid30_fpLogETest_q(37)) & updatedX_uid105_eLn2_uid30_fpLogETest_q));
    ovf_uid104_eLn2_uid30_fpLogETest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 40 => lev1_a0_uid101_eLn2_uid30_fpLogETest_q(39)) & lev1_a0_uid101_eLn2_uid30_fpLogETest_q));
    ovf_uid104_eLn2_uid30_fpLogETest_o <= STD_LOGIC_VECTOR(SIGNED(ovf_uid104_eLn2_uid30_fpLogETest_a) - SIGNED(ovf_uid104_eLn2_uid30_fpLogETest_b));
    ovf_uid104_eLn2_uid30_fpLogETest_c(0) <= ovf_uid104_eLn2_uid30_fpLogETest_o(41);

    -- updatedY_uid108_eLn2_uid30_fpLogETest(BITJOIN,107)@7
    updatedY_uid108_eLn2_uid30_fpLogETest_q <= minValueInFormat_uid103_eLn2_uid30_fpLogETest_q & paddingX_uid104_eLn2_uid30_fpLogETest_q;

    -- udf_uid107_eLn2_uid30_fpLogETest(COMPARE,108)@7
    udf_uid107_eLn2_uid30_fpLogETest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 40 => lev1_a0_uid101_eLn2_uid30_fpLogETest_q(39)) & lev1_a0_uid101_eLn2_uid30_fpLogETest_q));
    udf_uid107_eLn2_uid30_fpLogETest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 38 => updatedY_uid108_eLn2_uid30_fpLogETest_q(37)) & updatedY_uid108_eLn2_uid30_fpLogETest_q));
    udf_uid107_eLn2_uid30_fpLogETest_o <= STD_LOGIC_VECTOR(SIGNED(udf_uid107_eLn2_uid30_fpLogETest_a) - SIGNED(udf_uid107_eLn2_uid30_fpLogETest_b));
    udf_uid107_eLn2_uid30_fpLogETest_c(0) <= udf_uid107_eLn2_uid30_fpLogETest_o(41);

    -- ovfudfcond_uid110_eLn2_uid30_fpLogETest(BITJOIN,109)@7
    ovfudfcond_uid110_eLn2_uid30_fpLogETest_q <= ovf_uid104_eLn2_uid30_fpLogETest_c & udf_uid107_eLn2_uid30_fpLogETest_c;

    -- sRA0_uid112_eLn2_uid30_fpLogETest(MUX,111)@7
    sRA0_uid112_eLn2_uid30_fpLogETest_s <= ovfudfcond_uid110_eLn2_uid30_fpLogETest_q;
    sRA0_uid112_eLn2_uid30_fpLogETest_combproc: PROCESS (sRA0_uid112_eLn2_uid30_fpLogETest_s, en, sR_uid111_eLn2_uid30_fpLogETest_b, minValueInFormat_uid103_eLn2_uid30_fpLogETest_q, maxValInOutFormat_uid102_eLn2_uid30_fpLogETest_q)
    BEGIN
        CASE (sRA0_uid112_eLn2_uid30_fpLogETest_s) IS
            WHEN "00" => sRA0_uid112_eLn2_uid30_fpLogETest_q <= sR_uid111_eLn2_uid30_fpLogETest_b;
            WHEN "01" => sRA0_uid112_eLn2_uid30_fpLogETest_q <= minValueInFormat_uid103_eLn2_uid30_fpLogETest_q;
            WHEN "10" => sRA0_uid112_eLn2_uid30_fpLogETest_q <= maxValInOutFormat_uid102_eLn2_uid30_fpLogETest_q;
            WHEN "11" => sRA0_uid112_eLn2_uid30_fpLogETest_q <= maxValInOutFormat_uid102_eLn2_uid30_fpLogETest_q;
            WHEN OTHERS => sRA0_uid112_eLn2_uid30_fpLogETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist9_c_uid31_fpLogETest_q_7(DELAY,263)
    redist9_c_uid31_fpLogETest_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist8_c_uid31_fpLogETest_q_6_q, xout => redist9_c_uid31_fpLogETest_q_7_q, ena => en(0), clk => clk, aclr => areset );

    -- addTermOne_uid47_fpLogETest(MUX,46)@7 + 1
    addTermOne_uid47_fpLogETest_s <= redist9_c_uid31_fpLogETest_q_7_q;
    addTermOne_uid47_fpLogETest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            addTermOne_uid47_fpLogETest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (addTermOne_uid47_fpLogETest_s) IS
                    WHEN "0" => addTermOne_uid47_fpLogETest_q <= sRA0_uid112_eLn2_uid30_fpLogETest_q;
                    WHEN "1" => addTermOne_uid47_fpLogETest_q <= wideZero_uid46_fpLogETest_q;
                    WHEN OTHERS => addTermOne_uid47_fpLogETest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- finalSumsumAHighB_uid50_fpLogETest(ADD,49)@8
    finalSumsumAHighB_uid50_fpLogETest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 35 => addTermOne_uid47_fpLogETest_q(34)) & addTermOne_uid47_fpLogETest_q));
    finalSumsumAHighB_uid50_fpLogETest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 30 => highBBits_uid49_fpLogETest_b(29)) & highBBits_uid49_fpLogETest_b));
    finalSumsumAHighB_uid50_fpLogETest_o <= STD_LOGIC_VECTOR(SIGNED(finalSumsumAHighB_uid50_fpLogETest_a) + SIGNED(finalSumsumAHighB_uid50_fpLogETest_b));
    finalSumsumAHighB_uid50_fpLogETest_q <= finalSumsumAHighB_uid50_fpLogETest_o(35 downto 0);

    -- lowRangeB_uid48_fpLogETest(BITSELECT,47)@8
    lowRangeB_uid48_fpLogETest_in <= postPEMul_uid45_fpLogETest_cma_q(20 downto 0);
    lowRangeB_uid48_fpLogETest_b <= lowRangeB_uid48_fpLogETest_in(20 downto 0);

    -- finalSum_uid51_fpLogETest(BITJOIN,50)@8
    finalSum_uid51_fpLogETest_q <= finalSumsumAHighB_uid50_fpLogETest_q & lowRangeB_uid48_fpLogETest_b;

    -- msbUFinalSum_uid52_fpLogETest(BITSELECT,51)@8
    msbUFinalSum_uid52_fpLogETest_b <= STD_LOGIC_VECTOR(finalSum_uid51_fpLogETest_q(56 downto 56));

    -- notC_uid75_fpLogETest(LOGICAL,74)@8
    notC_uid75_fpLogETest_q <= not (redist10_c_uid31_fpLogETest_q_8_q);

    -- signTerm2_uid76_fpLogETest(LOGICAL,75)@8
    signTerm2_uid76_fpLogETest_q <= notC_uid75_fpLogETest_q and msbUFinalSum_uid52_fpLogETest_b;

    -- redist10_c_uid31_fpLogETest_q_8(DELAY,264)
    redist10_c_uid31_fpLogETest_q_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist9_c_uid31_fpLogETest_q_7_q, xout => redist10_c_uid31_fpLogETest_q_8_q, ena => en(0), clk => clk, aclr => areset );

    -- signRC1_uid77_fpLogETest(LOGICAL,76)@8
    signRC1_uid77_fpLogETest_q <= redist10_c_uid31_fpLogETest_q_8_q or signTerm2_uid76_fpLogETest_q;

    -- cstAllOWE_uid13_fpLogETest(CONSTANT,12)
    cstAllOWE_uid13_fpLogETest_q <= "11111111";

    -- expXIsMax_uid19_fpLogETest(LOGICAL,18)@7 + 1
    expXIsMax_uid19_fpLogETest_qi <= "1" WHEN redist15_expX_uid6_fpLogETest_b_7_mem_q = cstAllOWE_uid13_fpLogETest_q ELSE "0";
    expXIsMax_uid19_fpLogETest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid19_fpLogETest_qi, xout => expXIsMax_uid19_fpLogETest_q, ena => en(0), clk => clk, aclr => areset );

    -- invExpXIsMax_uid24_fpLogETest(LOGICAL,23)@8
    invExpXIsMax_uid24_fpLogETest_q <= not (expXIsMax_uid19_fpLogETest_q);

    -- InvExpXIsZero_uid25_fpLogETest(LOGICAL,24)@8
    InvExpXIsZero_uid25_fpLogETest_q <= not (excZ_x_uid18_fpLogETest_q);

    -- excR_x_uid26_fpLogETest(LOGICAL,25)@8
    excR_x_uid26_fpLogETest_q <= InvExpXIsZero_uid25_fpLogETest_q and invExpXIsMax_uid24_fpLogETest_q;

    -- signRC11_uid78_fpLogETest(LOGICAL,77)@8
    signRC11_uid78_fpLogETest_q <= excR_x_uid26_fpLogETest_q and signRC1_uid77_fpLogETest_q;

    -- cstAllZWE_uid15_fpLogETest(CONSTANT,14)
    cstAllZWE_uid15_fpLogETest_q <= "00000000";

    -- excZ_x_uid18_fpLogETest(LOGICAL,17)@7 + 1
    excZ_x_uid18_fpLogETest_qi <= "1" WHEN redist15_expX_uid6_fpLogETest_b_7_mem_q = cstAllZWE_uid15_fpLogETest_q ELSE "0";
    excZ_x_uid18_fpLogETest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid18_fpLogETest_qi, xout => excZ_x_uid18_fpLogETest_q, ena => en(0), clk => clk, aclr => areset );

    -- signR_uid79_fpLogETest(LOGICAL,78)@8
    signR_uid79_fpLogETest_q <= excZ_x_uid18_fpLogETest_q or signRC11_uid78_fpLogETest_q;

    -- fracXIsZero_uid20_fpLogETest(LOGICAL,19)@6 + 1
    fracXIsZero_uid20_fpLogETest_qi <= "1" WHEN cstAllZWF_uid8_fpLogETest_q = redist13_frac_x_uid17_fpLogETest_b_6_mem_q ELSE "0";
    fracXIsZero_uid20_fpLogETest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid20_fpLogETest_qi, xout => fracXIsZero_uid20_fpLogETest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist11_fracXIsZero_uid20_fpLogETest_q_2(DELAY,265)
    redist11_fracXIsZero_uid20_fpLogETest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid20_fpLogETest_q, xout => redist11_fracXIsZero_uid20_fpLogETest_q_2_q, ena => en(0), clk => clk, aclr => areset );

    -- fracXIsNotZero_uid21_fpLogETest(LOGICAL,20)@8
    fracXIsNotZero_uid21_fpLogETest_q <= not (redist11_fracXIsZero_uid20_fpLogETest_q_2_q);

    -- excN_x_uid23_fpLogETest(LOGICAL,22)@8
    excN_x_uid23_fpLogETest_q <= expXIsMax_uid19_fpLogETest_q and fracXIsNotZero_uid21_fpLogETest_q;

    -- signX_uid7_fpLogETest(BITSELECT,6)@0
    signX_uid7_fpLogETest_b <= STD_LOGIC_VECTOR(a(31 downto 31));

    -- redist14_signX_uid7_fpLogETest_b_8(DELAY,268)
    redist14_signX_uid7_fpLogETest_b_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => signX_uid7_fpLogETest_b, xout => redist14_signX_uid7_fpLogETest_b_8_q, ena => en(0), clk => clk, aclr => areset );

    -- negNonZero_uid73_fpLogETest(LOGICAL,72)@8
    negNonZero_uid73_fpLogETest_q <= InvExpXIsZero_uid25_fpLogETest_q and redist14_signX_uid7_fpLogETest_b_8_q;

    -- excRNaN_uid74_fpLogETest(LOGICAL,73)@8
    excRNaN_uid74_fpLogETest_q <= negNonZero_uid73_fpLogETest_q or excN_x_uid23_fpLogETest_q;

    -- invExcRNaN_uid80_fpLogETest(LOGICAL,79)@8
    invExcRNaN_uid80_fpLogETest_q <= not (excRNaN_uid74_fpLogETest_q);

    -- signRFull_uid81_fpLogETest(LOGICAL,80)@8 + 1
    signRFull_uid81_fpLogETest_qi <= invExcRNaN_uid80_fpLogETest_q and signR_uid79_fpLogETest_q;
    signRFull_uid81_fpLogETest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRFull_uid81_fpLogETest_qi, xout => signRFull_uid81_fpLogETest_q, ena => en(0), clk => clk, aclr => areset );

    -- zs_uid161_countZ_uid56_fpLogETest(CONSTANT,160)
    zs_uid161_countZ_uid56_fpLogETest_q <= "00000000000000000000000000000000";

    -- finalSumOneComp_uid54_fpLogETest(LOGICAL,53)@8
    finalSumOneComp_uid54_fpLogETest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((56 downto 1 => msbUFinalSum_uid52_fpLogETest_b(0)) & msbUFinalSum_uid52_fpLogETest_b));
    finalSumOneComp_uid54_fpLogETest_q <= finalSum_uid51_fpLogETest_q xor finalSumOneComp_uid54_fpLogETest_b;

    -- finalSumAbs_uid55_fpLogETest(ADD,54)@8
    finalSumAbs_uid55_fpLogETest_a <= STD_LOGIC_VECTOR("0" & finalSumOneComp_uid54_fpLogETest_q);
    finalSumAbs_uid55_fpLogETest_b <= STD_LOGIC_VECTOR("000000000000000000000000000000000000000000000000000000000" & msbUFinalSum_uid52_fpLogETest_b);
    finalSumAbs_uid55_fpLogETest_o <= STD_LOGIC_VECTOR(UNSIGNED(finalSumAbs_uid55_fpLogETest_a) + UNSIGNED(finalSumAbs_uid55_fpLogETest_b));
    finalSumAbs_uid55_fpLogETest_q <= finalSumAbs_uid55_fpLogETest_o(57 downto 0);

    -- rVStage_uid162_countZ_uid56_fpLogETest(BITSELECT,161)@8
    rVStage_uid162_countZ_uid56_fpLogETest_b <= finalSumAbs_uid55_fpLogETest_q(57 downto 26);

    -- vCount_uid163_countZ_uid56_fpLogETest(LOGICAL,162)@8
    vCount_uid163_countZ_uid56_fpLogETest_q <= "1" WHEN rVStage_uid162_countZ_uid56_fpLogETest_b = zs_uid161_countZ_uid56_fpLogETest_q ELSE "0";

    -- redist2_vCount_uid163_countZ_uid56_fpLogETest_q_1(DELAY,256)
    redist2_vCount_uid163_countZ_uid56_fpLogETest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid163_countZ_uid56_fpLogETest_q, xout => redist2_vCount_uid163_countZ_uid56_fpLogETest_q_1_q, ena => en(0), clk => clk, aclr => areset );

    -- zs_uid169_countZ_uid56_fpLogETest(CONSTANT,168)
    zs_uid169_countZ_uid56_fpLogETest_q <= "0000000000000000";

    -- vStage_uid165_countZ_uid56_fpLogETest(BITSELECT,164)@8
    vStage_uid165_countZ_uid56_fpLogETest_in <= finalSumAbs_uid55_fpLogETest_q(25 downto 0);
    vStage_uid165_countZ_uid56_fpLogETest_b <= vStage_uid165_countZ_uid56_fpLogETest_in(25 downto 0);

    -- mO_uid164_countZ_uid56_fpLogETest(CONSTANT,163)
    mO_uid164_countZ_uid56_fpLogETest_q <= "111111";

    -- cStage_uid166_countZ_uid56_fpLogETest(BITJOIN,165)@8
    cStage_uid166_countZ_uid56_fpLogETest_q <= vStage_uid165_countZ_uid56_fpLogETest_b & mO_uid164_countZ_uid56_fpLogETest_q;

    -- vStagei_uid168_countZ_uid56_fpLogETest(MUX,167)@8
    vStagei_uid168_countZ_uid56_fpLogETest_s <= vCount_uid163_countZ_uid56_fpLogETest_q;
    vStagei_uid168_countZ_uid56_fpLogETest_combproc: PROCESS (vStagei_uid168_countZ_uid56_fpLogETest_s, en, rVStage_uid162_countZ_uid56_fpLogETest_b, cStage_uid166_countZ_uid56_fpLogETest_q)
    BEGIN
        CASE (vStagei_uid168_countZ_uid56_fpLogETest_s) IS
            WHEN "0" => vStagei_uid168_countZ_uid56_fpLogETest_q <= rVStage_uid162_countZ_uid56_fpLogETest_b;
            WHEN "1" => vStagei_uid168_countZ_uid56_fpLogETest_q <= cStage_uid166_countZ_uid56_fpLogETest_q;
            WHEN OTHERS => vStagei_uid168_countZ_uid56_fpLogETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid170_countZ_uid56_fpLogETest_merged_bit_select(BITSELECT,249)@8
    rVStage_uid170_countZ_uid56_fpLogETest_merged_bit_select_b <= vStagei_uid168_countZ_uid56_fpLogETest_q(31 downto 16);
    rVStage_uid170_countZ_uid56_fpLogETest_merged_bit_select_c <= vStagei_uid168_countZ_uid56_fpLogETest_q(15 downto 0);

    -- vCount_uid171_countZ_uid56_fpLogETest(LOGICAL,170)@8
    vCount_uid171_countZ_uid56_fpLogETest_q <= "1" WHEN rVStage_uid170_countZ_uid56_fpLogETest_merged_bit_select_b = zs_uid169_countZ_uid56_fpLogETest_q ELSE "0";

    -- redist0_vCount_uid171_countZ_uid56_fpLogETest_q_1(DELAY,254)
    redist0_vCount_uid171_countZ_uid56_fpLogETest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid171_countZ_uid56_fpLogETest_q, xout => redist0_vCount_uid171_countZ_uid56_fpLogETest_q_1_q, ena => en(0), clk => clk, aclr => areset );

    -- vStagei_uid174_countZ_uid56_fpLogETest(MUX,173)@8 + 1
    vStagei_uid174_countZ_uid56_fpLogETest_s <= vCount_uid171_countZ_uid56_fpLogETest_q;
    vStagei_uid174_countZ_uid56_fpLogETest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vStagei_uid174_countZ_uid56_fpLogETest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (vStagei_uid174_countZ_uid56_fpLogETest_s) IS
                    WHEN "0" => vStagei_uid174_countZ_uid56_fpLogETest_q <= rVStage_uid170_countZ_uid56_fpLogETest_merged_bit_select_b;
                    WHEN "1" => vStagei_uid174_countZ_uid56_fpLogETest_q <= rVStage_uid170_countZ_uid56_fpLogETest_merged_bit_select_c;
                    WHEN OTHERS => vStagei_uid174_countZ_uid56_fpLogETest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- rVStage_uid176_countZ_uid56_fpLogETest_merged_bit_select(BITSELECT,250)@9
    rVStage_uid176_countZ_uid56_fpLogETest_merged_bit_select_b <= vStagei_uid174_countZ_uid56_fpLogETest_q(15 downto 8);
    rVStage_uid176_countZ_uid56_fpLogETest_merged_bit_select_c <= vStagei_uid174_countZ_uid56_fpLogETest_q(7 downto 0);

    -- vCount_uid177_countZ_uid56_fpLogETest(LOGICAL,176)@9
    vCount_uid177_countZ_uid56_fpLogETest_q <= "1" WHEN rVStage_uid176_countZ_uid56_fpLogETest_merged_bit_select_b = cstAllZWE_uid15_fpLogETest_q ELSE "0";

    -- zs_uid181_countZ_uid56_fpLogETest(CONSTANT,180)
    zs_uid181_countZ_uid56_fpLogETest_q <= "0000";

    -- vStagei_uid180_countZ_uid56_fpLogETest(MUX,179)@9
    vStagei_uid180_countZ_uid56_fpLogETest_s <= vCount_uid177_countZ_uid56_fpLogETest_q;
    vStagei_uid180_countZ_uid56_fpLogETest_combproc: PROCESS (vStagei_uid180_countZ_uid56_fpLogETest_s, en, rVStage_uid176_countZ_uid56_fpLogETest_merged_bit_select_b, rVStage_uid176_countZ_uid56_fpLogETest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid180_countZ_uid56_fpLogETest_s) IS
            WHEN "0" => vStagei_uid180_countZ_uid56_fpLogETest_q <= rVStage_uid176_countZ_uid56_fpLogETest_merged_bit_select_b;
            WHEN "1" => vStagei_uid180_countZ_uid56_fpLogETest_q <= rVStage_uid176_countZ_uid56_fpLogETest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid180_countZ_uid56_fpLogETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid182_countZ_uid56_fpLogETest_merged_bit_select(BITSELECT,251)@9
    rVStage_uid182_countZ_uid56_fpLogETest_merged_bit_select_b <= vStagei_uid180_countZ_uid56_fpLogETest_q(7 downto 4);
    rVStage_uid182_countZ_uid56_fpLogETest_merged_bit_select_c <= vStagei_uid180_countZ_uid56_fpLogETest_q(3 downto 0);

    -- vCount_uid183_countZ_uid56_fpLogETest(LOGICAL,182)@9
    vCount_uid183_countZ_uid56_fpLogETest_q <= "1" WHEN rVStage_uid182_countZ_uid56_fpLogETest_merged_bit_select_b = zs_uid181_countZ_uid56_fpLogETest_q ELSE "0";

    -- vStagei_uid186_countZ_uid56_fpLogETest(MUX,185)@9
    vStagei_uid186_countZ_uid56_fpLogETest_s <= vCount_uid183_countZ_uid56_fpLogETest_q;
    vStagei_uid186_countZ_uid56_fpLogETest_combproc: PROCESS (vStagei_uid186_countZ_uid56_fpLogETest_s, en, rVStage_uid182_countZ_uid56_fpLogETest_merged_bit_select_b, rVStage_uid182_countZ_uid56_fpLogETest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid186_countZ_uid56_fpLogETest_s) IS
            WHEN "0" => vStagei_uid186_countZ_uid56_fpLogETest_q <= rVStage_uid182_countZ_uid56_fpLogETest_merged_bit_select_b;
            WHEN "1" => vStagei_uid186_countZ_uid56_fpLogETest_q <= rVStage_uid182_countZ_uid56_fpLogETest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid186_countZ_uid56_fpLogETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid188_countZ_uid56_fpLogETest_merged_bit_select(BITSELECT,252)@9
    rVStage_uid188_countZ_uid56_fpLogETest_merged_bit_select_b <= vStagei_uid186_countZ_uid56_fpLogETest_q(3 downto 2);
    rVStage_uid188_countZ_uid56_fpLogETest_merged_bit_select_c <= vStagei_uid186_countZ_uid56_fpLogETest_q(1 downto 0);

    -- vCount_uid189_countZ_uid56_fpLogETest(LOGICAL,188)@9
    vCount_uid189_countZ_uid56_fpLogETest_q <= "1" WHEN rVStage_uid188_countZ_uid56_fpLogETest_merged_bit_select_b = z2_uid41_fpLogETest_q ELSE "0";

    -- vStagei_uid192_countZ_uid56_fpLogETest(MUX,191)@9
    vStagei_uid192_countZ_uid56_fpLogETest_s <= vCount_uid189_countZ_uid56_fpLogETest_q;
    vStagei_uid192_countZ_uid56_fpLogETest_combproc: PROCESS (vStagei_uid192_countZ_uid56_fpLogETest_s, en, rVStage_uid188_countZ_uid56_fpLogETest_merged_bit_select_b, rVStage_uid188_countZ_uid56_fpLogETest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid192_countZ_uid56_fpLogETest_s) IS
            WHEN "0" => vStagei_uid192_countZ_uid56_fpLogETest_q <= rVStage_uid188_countZ_uid56_fpLogETest_merged_bit_select_b;
            WHEN "1" => vStagei_uid192_countZ_uid56_fpLogETest_q <= rVStage_uid188_countZ_uid56_fpLogETest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid192_countZ_uid56_fpLogETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid194_countZ_uid56_fpLogETest(BITSELECT,193)@9
    rVStage_uid194_countZ_uid56_fpLogETest_b <= vStagei_uid192_countZ_uid56_fpLogETest_q(1 downto 1);

    -- vCount_uid195_countZ_uid56_fpLogETest(LOGICAL,194)@9
    vCount_uid195_countZ_uid56_fpLogETest_q <= "1" WHEN rVStage_uid194_countZ_uid56_fpLogETest_b = GND_q ELSE "0";

    -- r_uid196_countZ_uid56_fpLogETest(BITJOIN,195)@9
    r_uid196_countZ_uid56_fpLogETest_q <= redist2_vCount_uid163_countZ_uid56_fpLogETest_q_1_q & redist0_vCount_uid171_countZ_uid56_fpLogETest_q_1_q & vCount_uid177_countZ_uid56_fpLogETest_q & vCount_uid183_countZ_uid56_fpLogETest_q & vCount_uid189_countZ_uid56_fpLogETest_q & vCount_uid195_countZ_uid56_fpLogETest_q;

    -- cstMSBFinalSumPBias_uid58_fpLogETest(CONSTANT,57)
    cstMSBFinalSumPBias_uid58_fpLogETest_q <= "010001001";

    -- expRExt_uid59_fpLogETest(SUB,58)@9
    expRExt_uid59_fpLogETest_a <= STD_LOGIC_VECTOR("0" & cstMSBFinalSumPBias_uid58_fpLogETest_q);
    expRExt_uid59_fpLogETest_b <= STD_LOGIC_VECTOR("0000" & r_uid196_countZ_uid56_fpLogETest_q);
    expRExt_uid59_fpLogETest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRExt_uid59_fpLogETest_a) - UNSIGNED(expRExt_uid59_fpLogETest_b));
    expRExt_uid59_fpLogETest_q <= expRExt_uid59_fpLogETest_o(9 downto 0);

    -- leftShiftStage2Idx3Rng3_uid236_normVal_uid57_fpLogETest(BITSELECT,235)@9
    leftShiftStage2Idx3Rng3_uid236_normVal_uid57_fpLogETest_in <= leftShiftStage1_uid228_normVal_uid57_fpLogETest_q(54 downto 0);
    leftShiftStage2Idx3Rng3_uid236_normVal_uid57_fpLogETest_b <= leftShiftStage2Idx3Rng3_uid236_normVal_uid57_fpLogETest_in(54 downto 0);

    -- leftShiftStage2Idx3_uid237_normVal_uid57_fpLogETest(BITJOIN,236)@9
    leftShiftStage2Idx3_uid237_normVal_uid57_fpLogETest_q <= leftShiftStage2Idx3Rng3_uid236_normVal_uid57_fpLogETest_b & paddingX_uid104_eLn2_uid30_fpLogETest_q;

    -- leftShiftStage2Idx2Rng2_uid233_normVal_uid57_fpLogETest(BITSELECT,232)@9
    leftShiftStage2Idx2Rng2_uid233_normVal_uid57_fpLogETest_in <= leftShiftStage1_uid228_normVal_uid57_fpLogETest_q(55 downto 0);
    leftShiftStage2Idx2Rng2_uid233_normVal_uid57_fpLogETest_b <= leftShiftStage2Idx2Rng2_uid233_normVal_uid57_fpLogETest_in(55 downto 0);

    -- leftShiftStage2Idx2_uid234_normVal_uid57_fpLogETest(BITJOIN,233)@9
    leftShiftStage2Idx2_uid234_normVal_uid57_fpLogETest_q <= leftShiftStage2Idx2Rng2_uid233_normVal_uid57_fpLogETest_b & z2_uid41_fpLogETest_q;

    -- leftShiftStage2Idx1Rng1_uid230_normVal_uid57_fpLogETest(BITSELECT,229)@9
    leftShiftStage2Idx1Rng1_uid230_normVal_uid57_fpLogETest_in <= leftShiftStage1_uid228_normVal_uid57_fpLogETest_q(56 downto 0);
    leftShiftStage2Idx1Rng1_uid230_normVal_uid57_fpLogETest_b <= leftShiftStage2Idx1Rng1_uid230_normVal_uid57_fpLogETest_in(56 downto 0);

    -- leftShiftStage2Idx1_uid231_normVal_uid57_fpLogETest(BITJOIN,230)@9
    leftShiftStage2Idx1_uid231_normVal_uid57_fpLogETest_q <= leftShiftStage2Idx1Rng1_uid230_normVal_uid57_fpLogETest_b & GND_q;

    -- leftShiftStage1Idx3Rng12_uid225_normVal_uid57_fpLogETest(BITSELECT,224)@9
    leftShiftStage1Idx3Rng12_uid225_normVal_uid57_fpLogETest_in <= leftShiftStage0_uid217_normVal_uid57_fpLogETest_q(45 downto 0);
    leftShiftStage1Idx3Rng12_uid225_normVal_uid57_fpLogETest_b <= leftShiftStage1Idx3Rng12_uid225_normVal_uid57_fpLogETest_in(45 downto 0);

    -- leftShiftStage1Idx3Pad12_uid224_normVal_uid57_fpLogETest(CONSTANT,223)
    leftShiftStage1Idx3Pad12_uid224_normVal_uid57_fpLogETest_q <= "000000000000";

    -- leftShiftStage1Idx3_uid226_normVal_uid57_fpLogETest(BITJOIN,225)@9
    leftShiftStage1Idx3_uid226_normVal_uid57_fpLogETest_q <= leftShiftStage1Idx3Rng12_uid225_normVal_uid57_fpLogETest_b & leftShiftStage1Idx3Pad12_uid224_normVal_uid57_fpLogETest_q;

    -- leftShiftStage1Idx2Rng8_uid222_normVal_uid57_fpLogETest(BITSELECT,221)@9
    leftShiftStage1Idx2Rng8_uid222_normVal_uid57_fpLogETest_in <= leftShiftStage0_uid217_normVal_uid57_fpLogETest_q(49 downto 0);
    leftShiftStage1Idx2Rng8_uid222_normVal_uid57_fpLogETest_b <= leftShiftStage1Idx2Rng8_uid222_normVal_uid57_fpLogETest_in(49 downto 0);

    -- leftShiftStage1Idx2_uid223_normVal_uid57_fpLogETest(BITJOIN,222)@9
    leftShiftStage1Idx2_uid223_normVal_uid57_fpLogETest_q <= leftShiftStage1Idx2Rng8_uid222_normVal_uid57_fpLogETest_b & cstAllZWE_uid15_fpLogETest_q;

    -- leftShiftStage1Idx1Rng4_uid219_normVal_uid57_fpLogETest(BITSELECT,218)@9
    leftShiftStage1Idx1Rng4_uid219_normVal_uid57_fpLogETest_in <= leftShiftStage0_uid217_normVal_uid57_fpLogETest_q(53 downto 0);
    leftShiftStage1Idx1Rng4_uid219_normVal_uid57_fpLogETest_b <= leftShiftStage1Idx1Rng4_uid219_normVal_uid57_fpLogETest_in(53 downto 0);

    -- leftShiftStage1Idx1_uid220_normVal_uid57_fpLogETest(BITJOIN,219)@9
    leftShiftStage1Idx1_uid220_normVal_uid57_fpLogETest_q <= leftShiftStage1Idx1Rng4_uid219_normVal_uid57_fpLogETest_b & zs_uid181_countZ_uid56_fpLogETest_q;

    -- leftShiftStage0Idx3Rng48_uid214_normVal_uid57_fpLogETest(BITSELECT,213)@9
    leftShiftStage0Idx3Rng48_uid214_normVal_uid57_fpLogETest_in <= redist4_finalSumAbs_uid55_fpLogETest_q_1_q(9 downto 0);
    leftShiftStage0Idx3Rng48_uid214_normVal_uid57_fpLogETest_b <= leftShiftStage0Idx3Rng48_uid214_normVal_uid57_fpLogETest_in(9 downto 0);

    -- leftShiftStage0Idx3Pad48_uid213_normVal_uid57_fpLogETest(CONSTANT,212)
    leftShiftStage0Idx3Pad48_uid213_normVal_uid57_fpLogETest_q <= "000000000000000000000000000000000000000000000000";

    -- leftShiftStage0Idx3_uid215_normVal_uid57_fpLogETest(BITJOIN,214)@9
    leftShiftStage0Idx3_uid215_normVal_uid57_fpLogETest_q <= leftShiftStage0Idx3Rng48_uid214_normVal_uid57_fpLogETest_b & leftShiftStage0Idx3Pad48_uid213_normVal_uid57_fpLogETest_q;

    -- redist1_vStage_uid165_countZ_uid56_fpLogETest_b_1(DELAY,255)
    redist1_vStage_uid165_countZ_uid56_fpLogETest_b_1 : dspba_delay
    GENERIC MAP ( width => 26, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vStage_uid165_countZ_uid56_fpLogETest_b, xout => redist1_vStage_uid165_countZ_uid56_fpLogETest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- leftShiftStage0Idx2_uid212_normVal_uid57_fpLogETest(BITJOIN,211)@9
    leftShiftStage0Idx2_uid212_normVal_uid57_fpLogETest_q <= redist1_vStage_uid165_countZ_uid56_fpLogETest_b_1_q & zs_uid161_countZ_uid56_fpLogETest_q;

    -- leftShiftStage0Idx1Rng16_uid208_normVal_uid57_fpLogETest(BITSELECT,207)@9
    leftShiftStage0Idx1Rng16_uid208_normVal_uid57_fpLogETest_in <= redist4_finalSumAbs_uid55_fpLogETest_q_1_q(41 downto 0);
    leftShiftStage0Idx1Rng16_uid208_normVal_uid57_fpLogETest_b <= leftShiftStage0Idx1Rng16_uid208_normVal_uid57_fpLogETest_in(41 downto 0);

    -- leftShiftStage0Idx1_uid209_normVal_uid57_fpLogETest(BITJOIN,208)@9
    leftShiftStage0Idx1_uid209_normVal_uid57_fpLogETest_q <= leftShiftStage0Idx1Rng16_uid208_normVal_uid57_fpLogETest_b & zs_uid169_countZ_uid56_fpLogETest_q;

    -- redist4_finalSumAbs_uid55_fpLogETest_q_1(DELAY,258)
    redist4_finalSumAbs_uid55_fpLogETest_q_1 : dspba_delay
    GENERIC MAP ( width => 58, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => finalSumAbs_uid55_fpLogETest_q, xout => redist4_finalSumAbs_uid55_fpLogETest_q_1_q, ena => en(0), clk => clk, aclr => areset );

    -- leftShiftStage0_uid217_normVal_uid57_fpLogETest(MUX,216)@9
    leftShiftStage0_uid217_normVal_uid57_fpLogETest_s <= leftShiftStageSel5Dto4_uid216_normVal_uid57_fpLogETest_merged_bit_select_b;
    leftShiftStage0_uid217_normVal_uid57_fpLogETest_combproc: PROCESS (leftShiftStage0_uid217_normVal_uid57_fpLogETest_s, en, redist4_finalSumAbs_uid55_fpLogETest_q_1_q, leftShiftStage0Idx1_uid209_normVal_uid57_fpLogETest_q, leftShiftStage0Idx2_uid212_normVal_uid57_fpLogETest_q, leftShiftStage0Idx3_uid215_normVal_uid57_fpLogETest_q)
    BEGIN
        CASE (leftShiftStage0_uid217_normVal_uid57_fpLogETest_s) IS
            WHEN "00" => leftShiftStage0_uid217_normVal_uid57_fpLogETest_q <= redist4_finalSumAbs_uid55_fpLogETest_q_1_q;
            WHEN "01" => leftShiftStage0_uid217_normVal_uid57_fpLogETest_q <= leftShiftStage0Idx1_uid209_normVal_uid57_fpLogETest_q;
            WHEN "10" => leftShiftStage0_uid217_normVal_uid57_fpLogETest_q <= leftShiftStage0Idx2_uid212_normVal_uid57_fpLogETest_q;
            WHEN "11" => leftShiftStage0_uid217_normVal_uid57_fpLogETest_q <= leftShiftStage0Idx3_uid215_normVal_uid57_fpLogETest_q;
            WHEN OTHERS => leftShiftStage0_uid217_normVal_uid57_fpLogETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1_uid228_normVal_uid57_fpLogETest(MUX,227)@9
    leftShiftStage1_uid228_normVal_uid57_fpLogETest_s <= leftShiftStageSel5Dto4_uid216_normVal_uid57_fpLogETest_merged_bit_select_c;
    leftShiftStage1_uid228_normVal_uid57_fpLogETest_combproc: PROCESS (leftShiftStage1_uid228_normVal_uid57_fpLogETest_s, en, leftShiftStage0_uid217_normVal_uid57_fpLogETest_q, leftShiftStage1Idx1_uid220_normVal_uid57_fpLogETest_q, leftShiftStage1Idx2_uid223_normVal_uid57_fpLogETest_q, leftShiftStage1Idx3_uid226_normVal_uid57_fpLogETest_q)
    BEGIN
        CASE (leftShiftStage1_uid228_normVal_uid57_fpLogETest_s) IS
            WHEN "00" => leftShiftStage1_uid228_normVal_uid57_fpLogETest_q <= leftShiftStage0_uid217_normVal_uid57_fpLogETest_q;
            WHEN "01" => leftShiftStage1_uid228_normVal_uid57_fpLogETest_q <= leftShiftStage1Idx1_uid220_normVal_uid57_fpLogETest_q;
            WHEN "10" => leftShiftStage1_uid228_normVal_uid57_fpLogETest_q <= leftShiftStage1Idx2_uid223_normVal_uid57_fpLogETest_q;
            WHEN "11" => leftShiftStage1_uid228_normVal_uid57_fpLogETest_q <= leftShiftStage1Idx3_uid226_normVal_uid57_fpLogETest_q;
            WHEN OTHERS => leftShiftStage1_uid228_normVal_uid57_fpLogETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStageSel5Dto4_uid216_normVal_uid57_fpLogETest_merged_bit_select(BITSELECT,253)@9
    leftShiftStageSel5Dto4_uid216_normVal_uid57_fpLogETest_merged_bit_select_b <= r_uid196_countZ_uid56_fpLogETest_q(5 downto 4);
    leftShiftStageSel5Dto4_uid216_normVal_uid57_fpLogETest_merged_bit_select_c <= r_uid196_countZ_uid56_fpLogETest_q(3 downto 2);
    leftShiftStageSel5Dto4_uid216_normVal_uid57_fpLogETest_merged_bit_select_d <= r_uid196_countZ_uid56_fpLogETest_q(1 downto 0);

    -- leftShiftStage2_uid239_normVal_uid57_fpLogETest(MUX,238)@9
    leftShiftStage2_uid239_normVal_uid57_fpLogETest_s <= leftShiftStageSel5Dto4_uid216_normVal_uid57_fpLogETest_merged_bit_select_d;
    leftShiftStage2_uid239_normVal_uid57_fpLogETest_combproc: PROCESS (leftShiftStage2_uid239_normVal_uid57_fpLogETest_s, en, leftShiftStage1_uid228_normVal_uid57_fpLogETest_q, leftShiftStage2Idx1_uid231_normVal_uid57_fpLogETest_q, leftShiftStage2Idx2_uid234_normVal_uid57_fpLogETest_q, leftShiftStage2Idx3_uid237_normVal_uid57_fpLogETest_q)
    BEGIN
        CASE (leftShiftStage2_uid239_normVal_uid57_fpLogETest_s) IS
            WHEN "00" => leftShiftStage2_uid239_normVal_uid57_fpLogETest_q <= leftShiftStage1_uid228_normVal_uid57_fpLogETest_q;
            WHEN "01" => leftShiftStage2_uid239_normVal_uid57_fpLogETest_q <= leftShiftStage2Idx1_uid231_normVal_uid57_fpLogETest_q;
            WHEN "10" => leftShiftStage2_uid239_normVal_uid57_fpLogETest_q <= leftShiftStage2Idx2_uid234_normVal_uid57_fpLogETest_q;
            WHEN "11" => leftShiftStage2_uid239_normVal_uid57_fpLogETest_q <= leftShiftStage2Idx3_uid237_normVal_uid57_fpLogETest_q;
            WHEN OTHERS => leftShiftStage2_uid239_normVal_uid57_fpLogETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracR_uid60_fpLogETest(BITSELECT,59)@9
    fracR_uid60_fpLogETest_in <= leftShiftStage2_uid239_normVal_uid57_fpLogETest_q(56 downto 0);
    fracR_uid60_fpLogETest_b <= fracR_uid60_fpLogETest_in(56 downto 33);

    -- expFracConc_uid61_fpLogETest(BITJOIN,60)@9
    expFracConc_uid61_fpLogETest_q <= expRExt_uid59_fpLogETest_q & fracR_uid60_fpLogETest_b;

    -- expFracPostRnd_uid63_fpLogETest(ADD,62)@9
    expFracPostRnd_uid63_fpLogETest_a <= STD_LOGIC_VECTOR("0" & expFracConc_uid61_fpLogETest_q);
    expFracPostRnd_uid63_fpLogETest_b <= STD_LOGIC_VECTOR("0000000000000000000000000000000000" & VCC_q);
    expFracPostRnd_uid63_fpLogETest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracPostRnd_uid63_fpLogETest_a) + UNSIGNED(expFracPostRnd_uid63_fpLogETest_b));
    expFracPostRnd_uid63_fpLogETest_q <= expFracPostRnd_uid63_fpLogETest_o(34 downto 0);

    -- fracR_uid64_fpLogETest_merged_bit_select(BITSELECT,247)@9
    fracR_uid64_fpLogETest_merged_bit_select_in <= expFracPostRnd_uid63_fpLogETest_q(31 downto 0);
    fracR_uid64_fpLogETest_merged_bit_select_b <= fracR_uid64_fpLogETest_merged_bit_select_in(23 downto 1);
    fracR_uid64_fpLogETest_merged_bit_select_c <= fracR_uid64_fpLogETest_merged_bit_select_in(31 downto 24);

    -- invSignX_uid69_fpLogETest(LOGICAL,68)@8
    invSignX_uid69_fpLogETest_q <= not (redist14_signX_uid7_fpLogETest_b_8_q);

    -- excI_x_uid22_fpLogETest(LOGICAL,21)@8
    excI_x_uid22_fpLogETest_q <= expXIsMax_uid19_fpLogETest_q and redist11_fracXIsZero_uid20_fpLogETest_q_2_q;

    -- excRInfC1_uid70_fpLogETest(LOGICAL,69)@8
    excRInfC1_uid70_fpLogETest_q <= excI_x_uid22_fpLogETest_q and invSignX_uid69_fpLogETest_q;

    -- excRInf_uid71_fpLogETest(LOGICAL,70)@8
    excRInf_uid71_fpLogETest_q <= excRInfC1_uid70_fpLogETest_q or excZ_x_uid18_fpLogETest_q;

    -- FPOne_uid66_fpLogETest(BITJOIN,65)@0
    FPOne_uid66_fpLogETest_q <= GND_q & cstBias_uid10_fpLogETest_q & cstAllZWF_uid8_fpLogETest_q;

    -- excRZero_uid68_fpLogETest(LOGICAL,67)@0 + 1
    excRZero_uid68_fpLogETest_qi <= "1" WHEN a = FPOne_uid66_fpLogETest_q ELSE "0";
    excRZero_uid68_fpLogETest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRZero_uid68_fpLogETest_qi, xout => excRZero_uid68_fpLogETest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist3_excRZero_uid68_fpLogETest_q_8(DELAY,257)
    redist3_excRZero_uid68_fpLogETest_q_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRZero_uid68_fpLogETest_q, xout => redist3_excRZero_uid68_fpLogETest_q_8_q, ena => en(0), clk => clk, aclr => areset );

    -- concExc_uid82_fpLogETest(BITJOIN,81)@8
    concExc_uid82_fpLogETest_q <= excRNaN_uid74_fpLogETest_q & excRInf_uid71_fpLogETest_q & redist3_excRZero_uid68_fpLogETest_q_8_q;

    -- excREnc_uid83_fpLogETest(LOOKUP,82)@8 + 1
    excREnc_uid83_fpLogETest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excREnc_uid83_fpLogETest_q <= "01";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (concExc_uid82_fpLogETest_q) IS
                    WHEN "000" => excREnc_uid83_fpLogETest_q <= "01";
                    WHEN "001" => excREnc_uid83_fpLogETest_q <= "00";
                    WHEN "010" => excREnc_uid83_fpLogETest_q <= "10";
                    WHEN "011" => excREnc_uid83_fpLogETest_q <= "00";
                    WHEN "100" => excREnc_uid83_fpLogETest_q <= "11";
                    WHEN "101" => excREnc_uid83_fpLogETest_q <= "00";
                    WHEN "110" => excREnc_uid83_fpLogETest_q <= "00";
                    WHEN "111" => excREnc_uid83_fpLogETest_q <= "00";
                    WHEN OTHERS => -- unreachable
                                   excREnc_uid83_fpLogETest_q <= (others => '-');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- expRPostExc_uid91_fpLogETest(MUX,90)@9
    expRPostExc_uid91_fpLogETest_s <= excREnc_uid83_fpLogETest_q;
    expRPostExc_uid91_fpLogETest_combproc: PROCESS (expRPostExc_uid91_fpLogETest_s, en, cstAllZWE_uid15_fpLogETest_q, fracR_uid64_fpLogETest_merged_bit_select_c, cstAllOWE_uid13_fpLogETest_q)
    BEGIN
        CASE (expRPostExc_uid91_fpLogETest_s) IS
            WHEN "00" => expRPostExc_uid91_fpLogETest_q <= cstAllZWE_uid15_fpLogETest_q;
            WHEN "01" => expRPostExc_uid91_fpLogETest_q <= fracR_uid64_fpLogETest_merged_bit_select_c;
            WHEN "10" => expRPostExc_uid91_fpLogETest_q <= cstAllOWE_uid13_fpLogETest_q;
            WHEN "11" => expRPostExc_uid91_fpLogETest_q <= cstAllOWE_uid13_fpLogETest_q;
            WHEN OTHERS => expRPostExc_uid91_fpLogETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid84_fpLogETest(CONSTANT,83)
    oneFracRPostExc2_uid84_fpLogETest_q <= "00000000000000000000001";

    -- fracRPostExc_uid87_fpLogETest(MUX,86)@9
    fracRPostExc_uid87_fpLogETest_s <= excREnc_uid83_fpLogETest_q;
    fracRPostExc_uid87_fpLogETest_combproc: PROCESS (fracRPostExc_uid87_fpLogETest_s, en, cstAllZWF_uid8_fpLogETest_q, fracR_uid64_fpLogETest_merged_bit_select_b, oneFracRPostExc2_uid84_fpLogETest_q)
    BEGIN
        CASE (fracRPostExc_uid87_fpLogETest_s) IS
            WHEN "00" => fracRPostExc_uid87_fpLogETest_q <= cstAllZWF_uid8_fpLogETest_q;
            WHEN "01" => fracRPostExc_uid87_fpLogETest_q <= fracR_uid64_fpLogETest_merged_bit_select_b;
            WHEN "10" => fracRPostExc_uid87_fpLogETest_q <= cstAllZWF_uid8_fpLogETest_q;
            WHEN "11" => fracRPostExc_uid87_fpLogETest_q <= oneFracRPostExc2_uid84_fpLogETest_q;
            WHEN OTHERS => fracRPostExc_uid87_fpLogETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- RLn_uid92_fpLogETest(BITJOIN,91)@9
    RLn_uid92_fpLogETest_q <= signRFull_uid81_fpLogETest_q & expRPostExc_uid91_fpLogETest_q & fracRPostExc_uid87_fpLogETest_q;

    -- xOut(GPOUT,4)@9
    q <= RLn_uid92_fpLogETest_q;

END normal;
