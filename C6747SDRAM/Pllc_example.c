/*  ============================================================================
 *   Copyright (c) Texas Instruments Inc 2002, 2003, 2004, 2005, 2006, 2007
 *
 *   Use of this software is controlled by the terms and conditions found in the
 *   license agreement under which this software has been supplied.
 *  ============================================================================
 */

/** ============================================================================
 *   @file  Pllc_example.c
 *
 *   @path $(CSL_EXAMPLE_PATH)\pllc\src
 *
 *   @desc  Example of PLLC module Register layer CSL
 *
 *
 *  ============================================================================
 *   @n Target Platform: EVM
 *  ============================================================================
 *   @n <b> Example Description </b>
 *   @n The example shows PLLC module register layer CSL usage
 *      This example configures PLL Controller
 *  ============================================================================
 *
 *   <b> Procedure to run the example </b>
 *   @verbatim
 *      1. Configure the CCS setup to work with the emulator being used.
 *         Refer CCS manual for setup configuration.
 *      2. Load required GEL file depending on the board used.
 *      3. Launch CCS window.
 *      4. Open project Pllc_example.pjt.
 *      5. Build the project and load the .out file of the project.
 *
 *   @endverbatim
 *
 *
 *  ============================================================================
 */

#include <stdio.h>
#include <ti/pspiom/cslr/cslr_pllc.h>
#include <ti/pspiom/cslr/soc_C6747.h>

static void setupPll1(int pll_multiplier);
static int test_pll1();

/* Pointer to register overlay structure */
CSL_PllcRegsOvly pllcRegs = ((CSL_PllcRegsOvly)CSL_PLLC_0_REGS);

/*
 * =============================================================================
 *   @func   sw_wait
 *
 *   @desc
 *     This is the delay routine.
 *
 * =============================================================================
 */
void sw_wait(int delay)
{
    volatile int i;
    for( i = 0; i < delay; i++ ) {
    }
}

/*
 * =============================================================================
 *   @func   main
 *
 *   @desc
 *     This is the main routine which calls example routine.
 *
 * =============================================================================
 */

int main()
{
    printf("Configure PLL1 with register layer macros\n");
    printf("Please wait System PLL Initialization is in Progress.....\n");

    return(test_pll1());
}

/*
 * =============================================================================
 *   @func   setupPll1
 *
 *   @desc
 *     This is the actual routine which configures PLL0.
 *
 * =============================================================================
 */
void setupPll1(int pll_multiplier)
{
    /* Set PLLENSRC '0', PLL Enable(PLLEN) selection is controlled through MMR */
    CSL_FINST(pllcRegs->PLLCTL, PLLC_PLLCTL_PLLENSRC, CLEAR);

    /*Set PLL BYPASS MODE */
    CSL_FINST(pllcRegs->PLLCTL, PLLC_PLLCTL_PLLEN, BYPASS);

    /*wait for some cycles to allow PLLEN mux switches properly to bypass clock*/
    sw_wait(150);

    /* Reset the PLL */
    CSL_FINST(pllcRegs->PLLCTL, PLLC_PLLCTL_PLLRST, ASSERT);

    /*PLL stabilisation time*/
    sw_wait(1500);

    /*Program PREDIV Reg, POSTDIV register and OSCDIV1 Reg
    1.predvien_pi is set to '1'
    2.prediv_ratio_lock_pi is set to '1', RATIO field of PREDIV is locked
    3.Set the PLLM Register
    4.Dont program POSTDIV Register
    */

    /* Set PLL Multiplier */
    pllcRegs->PLLM = pll_multiplier;

    /*wait for PLL to Reset properly=>PLL reset Time*/
    sw_wait(128);

    /*Bring PLL out of Reset*/
    CSL_FINST(pllcRegs->PLLCTL, PLLC_PLLCTL_PLLRST, DEASSERT);

    /*Wait for PLL to LOCK atleast 2000 MXI clock or Reference clock cycles*/
    sw_wait(2000);

    /*Enable the PLL Bit of PLLCTL*/
    CSL_FINST(pllcRegs->PLLCTL, PLLC_PLLCTL_PLLEN, PLL);
}

/*
 * =============================================================================
 *   @func   test_pll0
 *
 *   @desc
 *     This is the dummy function.
 *
 * =============================================================================
 */
int test_pll1()
{
    setupPll1(20);

    printf("PLL1 has been configured\n");

    return(0);
}

