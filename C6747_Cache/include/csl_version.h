/*  ============================================================================
 *  Copyright (c) Texas Instruments Inc 2002, 2003, 2004, 2005, 2006, 2007
 *
 *  Use of this software is controlled by the terms and conditions found in the
 *  license agreement under which this software has been supplied.
 *  ============================================================================
 */
/** ============================================================================
 *   @file  csl_version.h
 *
 *   @path  $(CSLPATH)\inc
 *
 *   @desc  This file contains the version number of different chips
 *
 */
/* =============================================================================
 *  Revision History
 *  ===============
 *  25-Aug-2006 NG  Updated for new chip c6454 for the release v03_00_10_02
 * =============================================================================
 */

#ifndef _CSL_VERSION_H_
#define _CSL_VERSION_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <tistdtypes.h>

/* 0xAABBCCDD -> Arch (AA); API Changes (BB); Major (CC); Minor (DD) */
#define CSL_VERSION_ID          (0x03000400)
#define CSL_VERSION_STR         "@(#) CSL Revision: 3.00.04.00;"

#ifdef C6452
#define CSL_CHIP_ID             (0x6452)
#define CSL_CHIP_STR            "TMS320C6452 PG 1.0 (C6452)"
#endif

#ifdef DM648
#define CSL_CHIP_ID             (0x648)
#define CSL_CHIP_STR            "DM648 PG 1.0"
#endif


/**
  @brief    Retrieves the version ID
*/
Uint32 CSL_versionGetID (
    void
);


/**
  @brief    Retrieves the version string
*/
const char *
    CSL_versionGetStr (
        void
);


#ifdef __cplusplus
}
#endif

#endif /* _CSL_VERSION_H_ */

