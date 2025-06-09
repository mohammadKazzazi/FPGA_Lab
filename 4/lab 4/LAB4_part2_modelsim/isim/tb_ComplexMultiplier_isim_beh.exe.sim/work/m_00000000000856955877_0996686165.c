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
static const char *ng0 = "D:/DANESHGAH/term6/FPGA/Lab assignments/LAB 4_8/lab 4/LAB4_complex_multiplier/complexMultiplier.v";
static int ng1[] = {0, 0};
static int ng2[] = {31, 0};
static int ng3[] = {16, 0};
static int ng4[] = {15, 0};



static void Cont_15_0(char *t0)
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

LAB0:    t1 = (t0 + 3648U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(15, ng0);
    t2 = (t0 + 2728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4312);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t4, 8);
    xsi_driver_vfirst_trans(t5, 0, 31);
    t10 = (t0 + 4216);
    *((int *)t10) = 1;

LAB1:    return;
}

static void Always_17_1(char *t0)
{
    char t4[8];
    char t21[8];
    char t24[8];
    char t25[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    unsigned int t22;
    unsigned int t23;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    int t31;
    char *t32;
    int t33;
    int t34;
    char *t35;
    int t36;
    int t37;
    int t38;
    int t39;
    int t40;

LAB0:    t1 = (t0 + 3896U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(17, ng0);
    t2 = (t0 + 4232);
    *((int *)t2) = 1;
    t3 = (t0 + 3928);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(17, ng0);

LAB5:    xsi_set_current_line(18, ng0);
    t5 = (t0 + 1208U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB9;

LAB7:    if (*((unsigned int *)t5) == 0)
        goto LAB6;

LAB8:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;

LAB9:    t13 = (t4 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t4);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(21, ng0);

LAB14:    xsi_set_current_line(22, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t4 + 4);
    t5 = (t3 + 4);
    t7 = *((unsigned int *)t3);
    t8 = (t7 >> 8);
    *((unsigned int *)t4) = t8;
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 8);
    *((unsigned int *)t2) = t10;
    t11 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t11 & 255U);
    t14 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t14 & 255U);
    t6 = (t0 + 1528U);
    t12 = *((char **)t6);
    memset(t21, 0, 8);
    t6 = (t21 + 4);
    t13 = (t12 + 4);
    t15 = *((unsigned int *)t12);
    t16 = (t15 >> 8);
    *((unsigned int *)t21) = t16;
    t17 = *((unsigned int *)t13);
    t18 = (t17 >> 8);
    *((unsigned int *)t6) = t18;
    t22 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t22 & 255U);
    t23 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t23 & 255U);
    memset(t24, 0, 8);
    xsi_vlog_unsigned_multiply(t24, 16, t4, 16, t21, 16);
    t19 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t19, t24, 0, 0, 16, 0LL);
    xsi_set_current_line(23, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t4 + 4);
    t5 = (t3 + 4);
    t7 = *((unsigned int *)t3);
    t8 = (t7 >> 8);
    *((unsigned int *)t4) = t8;
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 8);
    *((unsigned int *)t2) = t10;
    t11 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t11 & 255U);
    t14 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t14 & 255U);
    t6 = (t0 + 1528U);
    t12 = *((char **)t6);
    memset(t21, 0, 8);
    t6 = (t21 + 4);
    t13 = (t12 + 4);
    t15 = *((unsigned int *)t12);
    t16 = (t15 >> 0);
    *((unsigned int *)t21) = t16;
    t17 = *((unsigned int *)t13);
    t18 = (t17 >> 0);
    *((unsigned int *)t6) = t18;
    t22 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t22 & 255U);
    t23 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t23 & 255U);
    memset(t24, 0, 8);
    xsi_vlog_unsigned_multiply(t24, 16, t4, 16, t21, 16);
    t19 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t19, t24, 0, 0, 16, 0LL);
    xsi_set_current_line(24, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t4 + 4);
    t5 = (t3 + 4);
    t7 = *((unsigned int *)t3);
    t8 = (t7 >> 0);
    *((unsigned int *)t4) = t8;
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 0);
    *((unsigned int *)t2) = t10;
    t11 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t11 & 255U);
    t14 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t14 & 255U);
    t6 = (t0 + 1528U);
    t12 = *((char **)t6);
    memset(t21, 0, 8);
    t6 = (t21 + 4);
    t13 = (t12 + 4);
    t15 = *((unsigned int *)t12);
    t16 = (t15 >> 8);
    *((unsigned int *)t21) = t16;
    t17 = *((unsigned int *)t13);
    t18 = (t17 >> 8);
    *((unsigned int *)t6) = t18;
    t22 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t22 & 255U);
    t23 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t23 & 255U);
    memset(t24, 0, 8);
    xsi_vlog_unsigned_multiply(t24, 16, t4, 16, t21, 16);
    t19 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t19, t24, 0, 0, 16, 0LL);
    xsi_set_current_line(25, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t4 + 4);
    t5 = (t3 + 4);
    t7 = *((unsigned int *)t3);
    t8 = (t7 >> 0);
    *((unsigned int *)t4) = t8;
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 0);
    *((unsigned int *)t2) = t10;
    t11 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t11 & 255U);
    t14 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t14 & 255U);
    t6 = (t0 + 1528U);
    t12 = *((char **)t6);
    memset(t21, 0, 8);
    t6 = (t21 + 4);
    t13 = (t12 + 4);
    t15 = *((unsigned int *)t12);
    t16 = (t15 >> 0);
    *((unsigned int *)t21) = t16;
    t17 = *((unsigned int *)t13);
    t18 = (t17 >> 0);
    *((unsigned int *)t6) = t18;
    t22 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t22 & 255U);
    t23 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t23 & 255U);
    memset(t24, 0, 8);
    xsi_vlog_unsigned_multiply(t24, 16, t4, 16, t21, 16);
    t19 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t19, t24, 0, 0, 16, 0LL);
    xsi_set_current_line(27, ng0);
    t2 = (t0 + 2088);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 2568);
    t12 = (t6 + 56U);
    t13 = *((char **)t12);
    memset(t4, 0, 8);
    xsi_vlog_signed_minus(t4, 16, t5, 16, t13, 16);
    t19 = (t0 + 2728);
    t20 = (t0 + 2728);
    t26 = (t20 + 72U);
    t27 = *((char **)t26);
    t28 = ((char*)((ng2)));
    t29 = ((char*)((ng3)));
    xsi_vlog_convert_partindices(t21, t24, t25, ((int*)(t27)), 2, t28, 32, 1, t29, 32, 1);
    t30 = (t21 + 4);
    t7 = *((unsigned int *)t30);
    t31 = (!(t7));
    t32 = (t24 + 4);
    t8 = *((unsigned int *)t32);
    t33 = (!(t8));
    t34 = (t31 && t33);
    t35 = (t25 + 4);
    t9 = *((unsigned int *)t35);
    t36 = (!(t9));
    t37 = (t34 && t36);
    if (t37 == 1)
        goto LAB15;

LAB16:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 2248);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 2408);
    t12 = (t6 + 56U);
    t13 = *((char **)t12);
    memset(t4, 0, 8);
    xsi_vlog_signed_add(t4, 16, t5, 16, t13, 16);
    t19 = (t0 + 2728);
    t20 = (t0 + 2728);
    t26 = (t20 + 72U);
    t27 = *((char **)t26);
    t28 = ((char*)((ng4)));
    t29 = ((char*)((ng1)));
    xsi_vlog_convert_partindices(t21, t24, t25, ((int*)(t27)), 2, t28, 32, 1, t29, 32, 1);
    t30 = (t21 + 4);
    t7 = *((unsigned int *)t30);
    t31 = (!(t7));
    t32 = (t24 + 4);
    t8 = *((unsigned int *)t32);
    t33 = (!(t8));
    t34 = (t31 && t33);
    t35 = (t25 + 4);
    t9 = *((unsigned int *)t35);
    t36 = (!(t9));
    t37 = (t34 && t36);
    if (t37 == 1)
        goto LAB17;

LAB18:
LAB12:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(18, ng0);

LAB13:    xsi_set_current_line(19, ng0);
    t19 = ((char*)((ng1)));
    t20 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 32, 0LL);
    goto LAB12;

LAB15:    t10 = *((unsigned int *)t25);
    t38 = (t10 + 0);
    t11 = *((unsigned int *)t21);
    t14 = *((unsigned int *)t24);
    t39 = (t11 - t14);
    t40 = (t39 + 1);
    xsi_vlogvar_wait_assign_value(t19, t4, t38, *((unsigned int *)t24), t40, 0LL);
    goto LAB16;

LAB17:    t10 = *((unsigned int *)t25);
    t38 = (t10 + 0);
    t11 = *((unsigned int *)t21);
    t14 = *((unsigned int *)t24);
    t39 = (t11 - t14);
    t40 = (t39 + 1);
    xsi_vlogvar_wait_assign_value(t19, t4, t38, *((unsigned int *)t24), t40, 0LL);
    goto LAB18;

}


extern void work_m_00000000000856955877_0996686165_init()
{
	static char *pe[] = {(void *)Cont_15_0,(void *)Always_17_1};
	xsi_register_didat("work_m_00000000000856955877_0996686165", "isim/tb_ComplexMultiplier_isim_beh.exe.sim/work/m_00000000000856955877_0996686165.didat");
	xsi_register_executes(pe);
}
