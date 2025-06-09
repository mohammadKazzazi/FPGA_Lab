/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/DANESHGAH/term6/FPGA/Lab assignments/LAB 4_8/lab 4/LAB4_PART3_IPCORE/ALU.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {2U, 0U};
static int ng4[] = {10, 0};
static int ng5[] = {1, 0};
static int ng6[] = {20, 0};
static int ng7[] = {30, 0};
static int ng8[] = {0, 0};



static void Cont_18_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 8288U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(18, ng0);
    t2 = (t0 + 5288);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 10952);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_bit_copy(t9, 0, t4, 0, 38);
    xsi_driver_vfirst_trans(t5, 0, 37);
    t10 = (t0 + 10840);
    *((int *)t10) = 1;

LAB1:    return;
}

static void Cont_33_1(char *t0)
{
    char t5[8];
    char t14[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    char *t52;
    unsigned int t53;
    unsigned int t54;
    char *t55;

LAB0:    t1 = (t0 + 8536U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 6248);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t0 + 1208U);
    t7 = *((char **)t6);
    memset(t5, 0, 8);
    t6 = (t7 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (~(t8));
    t10 = *((unsigned int *)t7);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB7;

LAB5:    if (*((unsigned int *)t6) == 0)
        goto LAB4;

LAB6:    t13 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t13) = 1;

LAB7:    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t5);
    t17 = (t15 | t16);
    *((unsigned int *)t14) = t17;
    t18 = (t4 + 4);
    t19 = (t5 + 4);
    t20 = (t14 + 4);
    t21 = *((unsigned int *)t18);
    t22 = *((unsigned int *)t19);
    t23 = (t21 | t22);
    *((unsigned int *)t20) = t23;
    t24 = *((unsigned int *)t20);
    t25 = (t24 != 0);
    if (t25 == 1)
        goto LAB8;

LAB9:
LAB10:    t42 = (t0 + 11016);
    t43 = (t42 + 56U);
    t44 = *((char **)t43);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    memset(t46, 0, 8);
    t47 = 1U;
    t48 = t47;
    t49 = (t14 + 4);
    t50 = *((unsigned int *)t14);
    t47 = (t47 & t50);
    t51 = *((unsigned int *)t49);
    t48 = (t48 & t51);
    t52 = (t46 + 4);
    t53 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t53 | t47);
    t54 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t54 | t48);
    xsi_driver_vfirst_trans(t42, 0, 0);
    t55 = (t0 + 10856);
    *((int *)t55) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t5) = 1;
    goto LAB7;

LAB8:    t26 = *((unsigned int *)t14);
    t27 = *((unsigned int *)t20);
    *((unsigned int *)t14) = (t26 | t27);
    t28 = (t4 + 4);
    t29 = (t5 + 4);
    t30 = *((unsigned int *)t28);
    t31 = (~(t30));
    t32 = *((unsigned int *)t4);
    t33 = (t32 & t31);
    t34 = *((unsigned int *)t29);
    t35 = (~(t34));
    t36 = *((unsigned int *)t5);
    t37 = (t36 & t35);
    t38 = (~(t33));
    t39 = (~(t37));
    t40 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t40 & t38);
    t41 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t41 & t39);
    goto LAB10;

}

static void Always_62_2(char *t0)
{
    char t6[16];
    char t9[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t7;
    char *t8;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;

LAB0:    t1 = (t0 + 8784U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 10872);
    *((int *)t2) = 1;
    t3 = (t0 + 8816);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(62, ng0);

LAB5:    xsi_set_current_line(63, ng0);
    t4 = (t0 + 2488U);
    t5 = *((char **)t4);
    memcpy(t6, t5, 16);
    t4 = (t0 + 4808);
    xsi_vlogvar_wait_assign_value(t4, t6, 0, 0, 38, 0LL);
    xsi_set_current_line(64, ng0);
    t2 = (t0 + 2808U);
    t3 = *((char **)t2);
    memcpy(t6, t3, 16);
    t2 = (t0 + 4968);
    xsi_vlogvar_wait_assign_value(t2, t6, 0, 0, 38, 0LL);
    xsi_set_current_line(65, ng0);
    t2 = (t0 + 3128U);
    t3 = *((char **)t2);
    memcpy(t6, t3, 16);
    t2 = (t0 + 5128);
    xsi_vlogvar_wait_assign_value(t2, t6, 0, 0, 38, 0LL);
    xsi_set_current_line(66, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);

LAB6:    t2 = ((char*)((ng1)));
    t7 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 2);
    if (t7 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t7 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 2);
    if (t7 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng3)));
    t7 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 2);
    if (t7 == 1)
        goto LAB11;

LAB12:
LAB13:    goto LAB2;

LAB7:    xsi_set_current_line(68, ng0);

LAB14:    xsi_set_current_line(69, ng0);
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    t4 = (t0 + 1528U);
    t8 = *((char **)t4);
    memset(t9, 0, 8);
    xsi_vlog_unsigned_multiply(t9, 32, t5, 16, t8, 16);
    t4 = (t0 + 5448);
    xsi_vlogvar_wait_assign_value(t4, t9, 0, 0, 32, 0LL);
    xsi_set_current_line(70, ng0);
    t2 = (t0 + 1688U);
    t4 = *((char **)t2);
    t2 = (t0 + 1688U);
    t5 = *((char **)t2);
    memset(t9, 0, 8);
    xsi_vlog_unsigned_multiply(t9, 32, t4, 16, t5, 16);
    t2 = (t0 + 5608);
    xsi_vlogvar_wait_assign_value(t2, t9, 0, 0, 32, 0LL);
    xsi_set_current_line(71, ng0);
    t2 = (t0 + 5448);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t0 + 5608);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    xsi_vlog_unsigned_add(t6, 33, t5, 32, t11, 32);
    t12 = (t0 + 5768);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 33, 0LL);
    xsi_set_current_line(72, ng0);
    t2 = (t0 + 2168U);
    t4 = *((char **)t2);
    memcpy(t6, t4, 8);
    t2 = (t6 + 8);
    memset(t2, 0, 8);
    t5 = (t0 + 5288);
    xsi_vlogvar_wait_assign_value(t5, t6, 0, 0, 38, 0LL);
    goto LAB13;

LAB9:    xsi_set_current_line(75, ng0);

LAB15:    xsi_set_current_line(76, ng0);
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    t4 = (t0 + 5928);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 16, 0LL);
    xsi_set_current_line(77, ng0);
    t2 = (t0 + 1688U);
    t4 = *((char **)t2);
    t2 = (t0 + 6088);
    xsi_vlogvar_wait_assign_value(t2, t4, 0, 0, 16, 0LL);
    xsi_set_current_line(78, ng0);
    t2 = (t0 + 2328U);
    t4 = *((char **)t2);
    memcpy(t6, t4, 8);
    t2 = (t6 + 8);
    memset(t2, 0, 8);
    t5 = (t0 + 5288);
    xsi_vlogvar_wait_assign_value(t5, t6, 0, 0, 38, 0LL);
    goto LAB13;

LAB11:    xsi_set_current_line(81, ng0);

LAB16:    xsi_set_current_line(82, ng0);
    t4 = (t0 + 7368);
    t5 = (t4 + 56U);
    t8 = *((char **)t5);
    t10 = ((char*)((ng4)));
    memset(t9, 0, 8);
    t11 = (t8 + 4);
    if (*((unsigned int *)t11) != 0)
        goto LAB18;

LAB17:    t12 = (t10 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB18;

LAB21:    if (*((unsigned int *)t8) < *((unsigned int *)t10))
        goto LAB19;

LAB20:    t14 = (t9 + 4);
    t15 = *((unsigned int *)t14);
    t16 = (~(t15));
    t17 = *((unsigned int *)t9);
    t18 = (t17 & t16);
    t19 = (t18 != 0);
    if (t19 > 0)
        goto LAB22;

LAB23:    xsi_set_current_line(87, ng0);
    t2 = (t0 + 7368);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = ((char*)((ng6)));
    memset(t9, 0, 8);
    t10 = (t5 + 4);
    if (*((unsigned int *)t10) != 0)
        goto LAB27;

LAB26:    t11 = (t8 + 4);
    if (*((unsigned int *)t11) != 0)
        goto LAB27;

LAB30:    if (*((unsigned int *)t5) < *((unsigned int *)t8))
        goto LAB28;

LAB29:    t13 = (t9 + 4);
    t15 = *((unsigned int *)t13);
    t16 = (~(t15));
    t17 = *((unsigned int *)t9);
    t18 = (t17 & t16);
    t19 = (t18 != 0);
    if (t19 > 0)
        goto LAB31;

LAB32:    xsi_set_current_line(92, ng0);
    t2 = (t0 + 7368);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = ((char*)((ng7)));
    memset(t9, 0, 8);
    t10 = (t5 + 4);
    if (*((unsigned int *)t10) != 0)
        goto LAB36;

LAB35:    t11 = (t8 + 4);
    if (*((unsigned int *)t11) != 0)
        goto LAB36;

LAB39:    if (*((unsigned int *)t5) < *((unsigned int *)t8))
        goto LAB37;

LAB38:    t13 = (t9 + 4);
    t15 = *((unsigned int *)t13);
    t16 = (~(t15));
    t17 = *((unsigned int *)t9);
    t18 = (t17 & t16);
    t19 = (t18 != 0);
    if (t19 > 0)
        goto LAB40;

LAB41:    xsi_set_current_line(97, ng0);

LAB44:    xsi_set_current_line(98, ng0);
    t2 = ((char*)((ng8)));
    t4 = (t0 + 7368);
    xsi_vlogvar_wait_assign_value(t4, t2, 0, 0, 6, 0LL);

LAB42:
LAB33:
LAB24:    xsi_set_current_line(100, ng0);
    t2 = (t0 + 5128);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t0 + 5288);
    xsi_vlogvar_wait_assign_value(t8, t5, 0, 0, 38, 0LL);
    goto LAB13;

LAB18:    t13 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB20;

LAB19:    *((unsigned int *)t9) = 1;
    goto LAB20;

LAB22:    xsi_set_current_line(82, ng0);

LAB25:    xsi_set_current_line(83, ng0);
    t20 = (t0 + 1528U);
    t21 = *((char **)t20);
    t20 = (t0 + 6408);
    xsi_vlogvar_wait_assign_value(t20, t21, 0, 0, 16, 0LL);
    xsi_set_current_line(84, ng0);
    t2 = (t0 + 1688U);
    t4 = *((char **)t2);
    t2 = (t0 + 6568);
    xsi_vlogvar_wait_assign_value(t2, t4, 0, 0, 16, 0LL);
    xsi_set_current_line(85, ng0);
    t2 = (t0 + 7368);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = ((char*)((ng5)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_add(t9, 32, t5, 6, t8, 32);
    t10 = (t0 + 7368);
    xsi_vlogvar_wait_assign_value(t10, t9, 0, 0, 6, 0LL);
    goto LAB24;

LAB27:    t12 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB29;

LAB28:    *((unsigned int *)t9) = 1;
    goto LAB29;

LAB31:    xsi_set_current_line(87, ng0);

LAB34:    xsi_set_current_line(88, ng0);
    t14 = (t0 + 1528U);
    t20 = *((char **)t14);
    t14 = (t0 + 6728);
    xsi_vlogvar_wait_assign_value(t14, t20, 0, 0, 16, 0LL);
    xsi_set_current_line(89, ng0);
    t2 = (t0 + 1688U);
    t4 = *((char **)t2);
    t2 = (t0 + 6888);
    xsi_vlogvar_wait_assign_value(t2, t4, 0, 0, 16, 0LL);
    xsi_set_current_line(90, ng0);
    t2 = (t0 + 7368);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = ((char*)((ng5)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_add(t9, 32, t5, 6, t8, 32);
    t10 = (t0 + 7368);
    xsi_vlogvar_wait_assign_value(t10, t9, 0, 0, 6, 0LL);
    goto LAB33;

LAB36:    t12 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB38;

LAB37:    *((unsigned int *)t9) = 1;
    goto LAB38;

LAB40:    xsi_set_current_line(92, ng0);

LAB43:    xsi_set_current_line(93, ng0);
    t14 = (t0 + 1528U);
    t20 = *((char **)t14);
    t14 = (t0 + 7048);
    xsi_vlogvar_wait_assign_value(t14, t20, 0, 0, 16, 0LL);
    xsi_set_current_line(94, ng0);
    t2 = (t0 + 1688U);
    t4 = *((char **)t2);
    t2 = (t0 + 7208);
    xsi_vlogvar_wait_assign_value(t2, t4, 0, 0, 16, 0LL);
    xsi_set_current_line(95, ng0);
    t2 = (t0 + 7368);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = ((char*)((ng5)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_add(t9, 32, t5, 6, t8, 32);
    t10 = (t0 + 7368);
    xsi_vlogvar_wait_assign_value(t10, t9, 0, 0, 6, 0LL);
    goto LAB42;

}

static void implSig1_execute(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 9032U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = ((char*)((ng2)));
    t3 = (t0 + 11080);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 1U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 0);

LAB1:    return;
}

static void implSig2_execute(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 9280U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = ((char*)((ng1)));
    t3 = (t0 + 11144);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 3U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 1);

LAB1:    return;
}

static void implSig3_execute(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 9528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = ((char*)((ng1)));
    t3 = (t0 + 11208);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 1U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 0);

LAB1:    return;
}

static void implSig4_execute(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 9776U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = ((char*)((ng2)));
    t3 = (t0 + 11272);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 1U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 0);

LAB1:    return;
}

static void implSig5_execute(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 10024U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = ((char*)((ng1)));
    t3 = (t0 + 11336);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 1U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 0);

LAB1:    return;
}

static void implSig6_execute(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 10272U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = ((char*)((ng2)));
    t3 = (t0 + 11400);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 1U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 0);

LAB1:    return;
}

static void implSig7_execute(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 10520U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = ((char*)((ng1)));
    t3 = (t0 + 11464);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 1U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 0);

LAB1:    return;
}


extern void work_m_00000000002803022661_0886308060_init()
{
	static char *pe[] = {(void *)Cont_18_0,(void *)Cont_33_1,(void *)Always_62_2,(void *)implSig1_execute,(void *)implSig2_execute,(void *)implSig3_execute,(void *)implSig4_execute,(void *)implSig5_execute,(void *)implSig6_execute,(void *)implSig7_execute};
	xsi_register_didat("work_m_00000000002803022661_0886308060", "isim/tb_ALU_isim_beh.exe.sim/work/m_00000000002803022661_0886308060.didat");
	xsi_register_executes(pe);
}
