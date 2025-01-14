	.text
	.syntax unified
	.eabi_attribute	67, "2.09"	@ Tag_conformance
	.cpu	cortex-m3
	.eabi_attribute	6, 10	@ Tag_CPU_arch
	.eabi_attribute	7, 77	@ Tag_CPU_arch_profile
	.eabi_attribute	8, 0	@ Tag_ARM_ISA_use
	.eabi_attribute	9, 2	@ Tag_THUMB_ISA_use
	.eabi_attribute	34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute	17, 1	@ Tag_ABI_PCS_GOT_use
	.eabi_attribute	20, 2	@ Tag_ABI_FP_denormal
	.eabi_attribute	21, 0	@ Tag_ABI_FP_exceptions
	.eabi_attribute	23, 1	@ Tag_ABI_FP_number_model
	.eabi_attribute	24, 1	@ Tag_ABI_align_needed
	.eabi_attribute	25, 1	@ Tag_ABI_align_preserved
	.eabi_attribute	38, 1	@ Tag_ABI_FP_16bit_format
	.eabi_attribute	18, 2	@ Tag_ABI_PCS_wchar_t
	.eabi_attribute	26, 1	@ Tag_ABI_enum_size
	.eabi_attribute	14, 0	@ Tag_ABI_PCS_R9_use
	.file	"main.c"
	.file	1 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include" "stdint.h"
	.file	2 "D:\\3.Courses\\Profile\\Embedded_Automative\\Lesson_05_SPI_software_and_hardware\\SPI_Software\\Slave" "main.c"
	.file	3 "C:/Users/LENOVO/AppData/Local/Arm/Packs/Keil/STM32F1xx_DFP/2.4.1/Device/Include" "stm32f10x.h"
	.file	4 "C:/Users/LENOVO/AppData/Local/Arm/Packs/Keil/STM32F1xx_DFP/2.4.1/Device/StdPeriph_Driver/inc" "stm32f10x_gpio.h"
	.section	.text.RCC_Config,"ax",%progbits
	.hidden	RCC_Config                      @ -- Begin function RCC_Config
	.globl	RCC_Config
	.p2align	2
	.type	RCC_Config,%function
	.code	16                              @ @RCC_Config
	.thumb_func
RCC_Config:
.Lfunc_begin0:
	.loc	2 13 0                          @ main.c:13:0
	.fnstart
	.cfi_sections .debug_frame
	.cfi_startproc
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r7, -8
	.pad	#8
	sub	sp, #8
	.cfi_def_cfa_offset 16
	movs	r0, #4
	movs	r1, #1
.Ltmp0:
	.loc	2 14 3 prologue_end             @ main.c:14:3
	str	r1, [sp, #4]                    @ 4-byte Spill
	bl	RCC_APB2PeriphClockCmd
	ldr	r1, [sp, #4]                    @ 4-byte Reload
	.loc	2 15 3                          @ main.c:15:3
	mov	r0, r1
	bl	RCC_APB1PeriphClockCmd
	.loc	2 16 1 epilogue_begin           @ main.c:16:1
	add	sp, #8
	pop	{r7, pc}
.Ltmp1:
.Lfunc_end0:
	.size	RCC_Config, .Lfunc_end0-RCC_Config
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.section	.text.GPIO_Config,"ax",%progbits
	.hidden	GPIO_Config                     @ -- Begin function GPIO_Config
	.globl	GPIO_Config
	.p2align	2
	.type	GPIO_Config,%function
	.code	16                              @ @GPIO_Config
	.thumb_func
GPIO_Config:
.Lfunc_begin1:
	.loc	2 18 0                          @ main.c:18:0
	.fnstart
	.cfi_startproc
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r7, -8
	.pad	#16
	sub	sp, #16
	.cfi_def_cfa_offset 24
	movs	r0, #176
.Ltmp2:
	.loc	2 20 30 prologue_end            @ main.c:20:30
	strh.w	r0, [sp, #12]
	movs	r0, #4
	.loc	2 21 31                         @ main.c:21:31
	strb.w	r0, [sp, #15]
	movs	r0, #3
	.loc	2 22 32                         @ main.c:22:32
	strb.w	r0, [sp, #14]
	movw	r0, #2048
	movt	r0, #16385
	str	r0, [sp, #4]                    @ 4-byte Spill
	add	r1, sp, #12
	.loc	2 23 2                          @ main.c:23:2
	str	r1, [sp, #8]                    @ 4-byte Spill
	bl	GPIO_Init
	ldr	r0, [sp, #4]                    @ 4-byte Reload
	ldr	r1, [sp, #8]                    @ 4-byte Reload
	movs	r2, #64
	.loc	2 25 30                         @ main.c:25:30
	strh.w	r2, [sp, #12]
	movs	r2, #16
	.loc	2 26 31                         @ main.c:26:31
	strb.w	r2, [sp, #15]
	.loc	2 27 2                          @ main.c:27:2
	bl	GPIO_Init
	.loc	2 28 1 epilogue_begin           @ main.c:28:1
	add	sp, #16
	pop	{r7, pc}
.Ltmp3:
.Lfunc_end1:
	.size	GPIO_Config, .Lfunc_end1-GPIO_Config
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.section	.text.TIM_Config,"ax",%progbits
	.hidden	TIM_Config                      @ -- Begin function TIM_Config
	.globl	TIM_Config
	.p2align	2
	.type	TIM_Config,%function
	.code	16                              @ @TIM_Config
	.thumb_func
TIM_Config:
.Lfunc_begin2:
	.loc	2 31 0                          @ main.c:31:0
	.fnstart
	.cfi_startproc
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r7, -8
	.pad	#16
	sub	sp, #16
	.cfi_def_cfa_offset 24
	movs	r0, #0
.Ltmp4:
	.loc	2 34 35 prologue_end            @ main.c:34:35
	strh.w	r0, [sp, #12]
	.loc	2 35 34                         @ main.c:35:34
	strh.w	r0, [sp, #8]
	movw	r0, #65535
	.loc	2 36 32                         @ main.c:36:32
	strh.w	r0, [sp, #10]
	movw	r0, #7199
	.loc	2 37 33                         @ main.c:37:33
	strh.w	r0, [sp, #6]
	mov.w	r0, #1073741824
	str	r0, [sp]                        @ 4-byte Spill
	add.w	r1, sp, #6
	.loc	2 39 2                          @ main.c:39:2
	bl	TIM_TimeBaseInit
	ldr	r0, [sp]                        @ 4-byte Reload
	movs	r1, #1
	.loc	2 40 2                          @ main.c:40:2
	bl	TIM_Cmd
	.loc	2 41 1 epilogue_begin           @ main.c:41:1
	add	sp, #16
	pop	{r7, pc}
.Ltmp5:
.Lfunc_end2:
	.size	TIM_Config, .Lfunc_end2-TIM_Config
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.section	.text.delay_us,"ax",%progbits
	.hidden	delay_us                        @ -- Begin function delay_us
	.globl	delay_us
	.p2align	2
	.type	delay_us,%function
	.code	16                              @ @delay_us
	.thumb_func
delay_us:
.Lfunc_begin3:
	.loc	2 43 0                          @ main.c:43:0
	.fnstart
	.cfi_startproc
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r7, -8
	.pad	#8
	sub	sp, #8
	.cfi_def_cfa_offset 16
	str	r0, [sp, #4]
	mov.w	r0, #1073741824
	movs	r1, #0
.Ltmp6:
	.loc	2 44 2 prologue_end             @ main.c:44:2
	bl	TIM_SetCounter
	.loc	2 45 2                          @ main.c:45:2
	b	.LBB3_1
.LBB3_1:                                @ =>This Inner Loop Header: Depth=1
	.loc	2 0 2 is_stmt 0                 @ main.c:0:2
	mov.w	r0, #1073741824
	.loc	2 45 8                          @ main.c:45:8
	bl	TIM_GetCounter
	.loc	2 45 31                         @ main.c:45:31
	ldr	r1, [sp, #4]
	.loc	2 45 35                         @ main.c:45:35
	add.w	r1, r1, r1, lsl #2
	.loc	2 45 2                          @ main.c:45:2
	cmp.w	r0, r1, lsl #1
	bhs	.LBB3_3
	b	.LBB3_2
.LBB3_2:                                @   in Loop: Header=BB3_1 Depth=1
	b	.LBB3_1
.LBB3_3:
	.loc	2 46 1 epilogue_begin is_stmt 1 @ main.c:46:1
	add	sp, #8
	pop	{r7, pc}
.Ltmp7:
.Lfunc_end3:
	.size	delay_us, .Lfunc_end3-delay_us
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.section	.text.SPI_Slave_Receive,"ax",%progbits
	.hidden	SPI_Slave_Receive               @ -- Begin function SPI_Slave_Receive
	.globl	SPI_Slave_Receive
	.p2align	2
	.type	SPI_Slave_Receive,%function
	.code	16                              @ @SPI_Slave_Receive
	.thumb_func
SPI_Slave_Receive:
.Lfunc_begin4:
	.loc	2 48 0                          @ main.c:48:0
	.fnstart
	.cfi_startproc
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r7, -8
	.pad	#8
	sub	sp, #8
	.cfi_def_cfa_offset 16
	movs	r0, #0
.Ltmp8:
	.loc	2 49 13 prologue_end            @ main.c:49:13
	strb.w	r0, [sp, #7]
	.loc	2 50 13                         @ main.c:50:13
	strb.w	r0, [sp, #6]
	.loc	2 52 5                          @ main.c:52:5
	b	.LBB4_1
.LBB4_1:                                @ =>This Inner Loop Header: Depth=1
	.loc	2 0 5 is_stmt 0                 @ main.c:0:5
	movw	r0, #2048
	movt	r0, #16385
	movs	r1, #16
	.loc	2 52 12                         @ main.c:52:12
	bl	GPIO_ReadInputDataBit
	.loc	2 52 5                          @ main.c:52:5
	cbz	r0, .LBB4_3
	b	.LBB4_2
.LBB4_2:                                @   in Loop: Header=BB4_1 Depth=1
	b	.LBB4_1
.LBB4_3:
	.loc	2 0 5                           @ main.c:0:5
	movs	r0, #0
.Ltmp9:
	.loc	2 54 14 is_stmt 1               @ main.c:54:14
	str	r0, [sp]
	.loc	2 54 10 is_stmt 0               @ main.c:54:10
	b	.LBB4_4
.LBB4_4:                                @ =>This Loop Header: Depth=1
                                        @     Child Loop BB4_6 Depth 2
                                        @     Child Loop BB4_9 Depth 2
.Ltmp10:
	.loc	2 54 21                         @ main.c:54:21
	ldr	r0, [sp]
.Ltmp11:
	.loc	2 54 5                          @ main.c:54:5
	cmp	r0, #7
	bgt	.LBB4_13
	b	.LBB4_5
.LBB4_5:                                @   in Loop: Header=BB4_4 Depth=1
.Ltmp12:
	.loc	2 56 9 is_stmt 1                @ main.c:56:9
	b	.LBB4_6
.LBB4_6:                                @   Parent Loop BB4_4 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	.loc	2 0 9 is_stmt 0                 @ main.c:0:9
	movw	r0, #2048
	movt	r0, #16385
	movs	r1, #32
	.loc	2 56 17                         @ main.c:56:17
	bl	GPIO_ReadInputDataBit
	.loc	2 56 9                          @ main.c:56:9
	cbnz	r0, .LBB4_8
	b	.LBB4_7
.LBB4_7:                                @   in Loop: Header=BB4_6 Depth=2
	b	.LBB4_6
.LBB4_8:                                @   in Loop: Header=BB4_4 Depth=1
	.loc	2 0 9                           @ main.c:0:9
	movw	r0, #2048
	movt	r0, #16385
	movs	r1, #128
	.loc	2 58 16 is_stmt 1               @ main.c:58:16
	bl	GPIO_ReadInputDataBit
	.loc	2 58 14 is_stmt 0               @ main.c:58:14
	strb.w	r0, [sp, #6]
	.loc	2 60 24 is_stmt 1               @ main.c:60:24
	ldrb.w	r1, [sp, #7]
	.loc	2 60 44 is_stmt 0               @ main.c:60:44
	ldrb.w	r0, [sp, #6]
	.loc	2 60 42                         @ main.c:60:42
	orr.w	r0, r0, r1, lsl #1
	.loc	2 60 21                         @ main.c:60:21
	strb.w	r0, [sp, #7]
	.loc	2 62 9 is_stmt 1                @ main.c:62:9
	b	.LBB4_9
.LBB4_9:                                @   Parent Loop BB4_4 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	.loc	2 0 9 is_stmt 0                 @ main.c:0:9
	movw	r0, #2048
	movt	r0, #16385
	movs	r1, #32
	.loc	2 62 16                         @ main.c:62:16
	bl	GPIO_ReadInputDataBit
	.loc	2 62 9                          @ main.c:62:9
	cbz	r0, .LBB4_11
	b	.LBB4_10
.LBB4_10:                               @   in Loop: Header=BB4_9 Depth=2
	b	.LBB4_9
.LBB4_11:                               @   in Loop: Header=BB4_4 Depth=1
	.loc	2 63 5 is_stmt 1                @ main.c:63:5
	b	.LBB4_12
.Ltmp13:
.LBB4_12:                               @   in Loop: Header=BB4_4 Depth=1
	.loc	2 54 29                         @ main.c:54:29
	ldr	r0, [sp]
	adds	r0, #1
	str	r0, [sp]
	.loc	2 54 5 is_stmt 0                @ main.c:54:5
	b	.LBB4_4
.Ltmp14:
.LBB4_13:
	.loc	2 65 5 is_stmt 1                @ main.c:65:5
	b	.LBB4_14
.LBB4_14:                               @ =>This Inner Loop Header: Depth=1
	.loc	2 0 5 is_stmt 0                 @ main.c:0:5
	movw	r0, #2048
	movt	r0, #16385
	movs	r1, #16
	.loc	2 65 13                         @ main.c:65:13
	bl	GPIO_ReadInputDataBit
	.loc	2 65 5                          @ main.c:65:5
	cbnz	r0, .LBB4_16
	b	.LBB4_15
.LBB4_15:                               @   in Loop: Header=BB4_14 Depth=1
	b	.LBB4_14
.LBB4_16:
	.loc	2 67 12 is_stmt 1               @ main.c:67:12
	ldrb.w	r0, [sp, #7]
	.loc	2 67 5 epilogue_begin is_stmt 0 @ main.c:67:5
	add	sp, #8
	pop	{r7, pc}
.Ltmp15:
.Lfunc_end4:
	.size	SPI_Slave_Receive, .Lfunc_end4-SPI_Slave_Receive
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.section	.text.main,"ax",%progbits
	.hidden	main                            @ -- Begin function main
	.globl	main
	.p2align	2
	.type	main,%function
	.code	16                              @ @main
	.thumb_func
main:
.Lfunc_begin5:
	.loc	2 73 0 is_stmt 1                @ main.c:73:0
	.fnstart
	.cfi_startproc
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r7, -8
	.pad	#8
	sub	sp, #8
	.cfi_def_cfa_offset 16
	movs	r0, #0
	str	r0, [sp, #4]
.Ltmp16:
	.loc	2 74 2 prologue_end             @ main.c:74:2
	bl	RCC_Config
	.loc	2 75 2                          @ main.c:75:2
	bl	GPIO_Config
	.loc	2 76 2                          @ main.c:76:2
	bl	TIM_Config
	.loc	2 77 2                          @ main.c:77:2
	b	.LBB5_1
.LBB5_1:                                @ =>This Inner Loop Header: Depth=1
.Ltmp17:
	.loc	2 78 17                         @ main.c:78:17
	bl	SPI_Slave_Receive
	.loc	2 78 15 is_stmt 0               @ main.c:78:15
	movw	r1, :lower16:DataReceive
	movt	r1, :upper16:DataReceive
	strb	r0, [r1]
.Ltmp18:
	.loc	2 77 2 is_stmt 1                @ main.c:77:2
	b	.LBB5_1
.Ltmp19:
.Lfunc_end5:
	.size	main, .Lfunc_end5-main
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.hidden	DataReceive                     @ @DataReceive
	.type	DataReceive,%object
	.section	.bss.DataReceive,"aw",%nobits
	.globl	DataReceive
DataReceive:
	.byte	0                               @ 0x0
	.size	DataReceive, 1

	.type	__ARM_use_no_argv,%object       @ @__ARM_use_no_argv
	.section	.ARM.use_no_argv,"awR",%progbits,unique,1
	.globl	__ARM_use_no_argv
	.p2align	2, 0x0
__ARM_use_no_argv:
	.long	1                               @ 0x1
	.size	__ARM_use_no_argv, 4

	.file	5 "C:/Users/LENOVO/AppData/Local/Arm/Packs/Keil/STM32F1xx_DFP/2.4.1/Device/StdPeriph_Driver/inc" "stm32f10x_tim.h"
	.section	.debug_abbrev,"",%progbits
	.byte	1                               @ Abbreviation Code
	.byte	17                              @ DW_TAG_compile_unit
	.byte	1                               @ DW_CHILDREN_yes
	.byte	37                              @ DW_AT_producer
	.byte	14                              @ DW_FORM_strp
	.byte	19                              @ DW_AT_language
	.byte	5                               @ DW_FORM_data2
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	16                              @ DW_AT_stmt_list
	.byte	23                              @ DW_FORM_sec_offset
	.byte	27                              @ DW_AT_comp_dir
	.byte	14                              @ DW_FORM_strp
	.byte	17                              @ DW_AT_low_pc
	.byte	1                               @ DW_FORM_addr
	.byte	85                              @ DW_AT_ranges
	.byte	23                              @ DW_FORM_sec_offset
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	2                               @ Abbreviation Code
	.byte	52                              @ DW_TAG_variable
	.byte	0                               @ DW_CHILDREN_no
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	63                              @ DW_AT_external
	.byte	25                              @ DW_FORM_flag_present
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	2                               @ DW_AT_location
	.byte	24                              @ DW_FORM_exprloc
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	3                               @ Abbreviation Code
	.byte	22                              @ DW_TAG_typedef
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	4                               @ Abbreviation Code
	.byte	36                              @ DW_TAG_base_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	62                              @ DW_AT_encoding
	.byte	11                              @ DW_FORM_data1
	.byte	11                              @ DW_AT_byte_size
	.byte	11                              @ DW_FORM_data1
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	5                               @ Abbreviation Code
	.byte	4                               @ DW_TAG_enumeration_type
	.byte	1                               @ DW_CHILDREN_yes
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	11                              @ DW_AT_byte_size
	.byte	11                              @ DW_FORM_data1
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	5                               @ DW_FORM_data2
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	6                               @ Abbreviation Code
	.byte	40                              @ DW_TAG_enumerator
	.byte	0                               @ DW_CHILDREN_no
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	28                              @ DW_AT_const_value
	.byte	15                              @ DW_FORM_udata
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	7                               @ Abbreviation Code
	.byte	4                               @ DW_TAG_enumeration_type
	.byte	1                               @ DW_CHILDREN_yes
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	11                              @ DW_AT_byte_size
	.byte	11                              @ DW_FORM_data1
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	8                               @ Abbreviation Code
	.byte	15                              @ DW_TAG_pointer_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	9                               @ Abbreviation Code
	.byte	22                              @ DW_TAG_typedef
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	5                               @ DW_FORM_data2
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	10                              @ Abbreviation Code
	.byte	19                              @ DW_TAG_structure_type
	.byte	1                               @ DW_CHILDREN_yes
	.byte	11                              @ DW_AT_byte_size
	.byte	11                              @ DW_FORM_data1
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	5                               @ DW_FORM_data2
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	11                              @ Abbreviation Code
	.byte	13                              @ DW_TAG_member
	.byte	0                               @ DW_CHILDREN_no
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	5                               @ DW_FORM_data2
	.byte	56                              @ DW_AT_data_member_location
	.byte	11                              @ DW_FORM_data1
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	12                              @ Abbreviation Code
	.byte	53                              @ DW_TAG_volatile_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	13                              @ Abbreviation Code
	.byte	46                              @ DW_TAG_subprogram
	.byte	0                               @ DW_CHILDREN_no
	.byte	17                              @ DW_AT_low_pc
	.byte	1                               @ DW_FORM_addr
	.byte	18                              @ DW_AT_high_pc
	.byte	6                               @ DW_FORM_data4
	.byte	64                              @ DW_AT_frame_base
	.byte	24                              @ DW_FORM_exprloc
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	63                              @ DW_AT_external
	.byte	25                              @ DW_FORM_flag_present
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	14                              @ Abbreviation Code
	.byte	46                              @ DW_TAG_subprogram
	.byte	1                               @ DW_CHILDREN_yes
	.byte	17                              @ DW_AT_low_pc
	.byte	1                               @ DW_FORM_addr
	.byte	18                              @ DW_AT_high_pc
	.byte	6                               @ DW_FORM_data4
	.byte	64                              @ DW_AT_frame_base
	.byte	24                              @ DW_FORM_exprloc
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	63                              @ DW_AT_external
	.byte	25                              @ DW_FORM_flag_present
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	15                              @ Abbreviation Code
	.byte	52                              @ DW_TAG_variable
	.byte	0                               @ DW_CHILDREN_no
	.byte	2                               @ DW_AT_location
	.byte	24                              @ DW_FORM_exprloc
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	16                              @ Abbreviation Code
	.byte	46                              @ DW_TAG_subprogram
	.byte	1                               @ DW_CHILDREN_yes
	.byte	17                              @ DW_AT_low_pc
	.byte	1                               @ DW_FORM_addr
	.byte	18                              @ DW_AT_high_pc
	.byte	6                               @ DW_FORM_data4
	.byte	64                              @ DW_AT_frame_base
	.byte	24                              @ DW_FORM_exprloc
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	39                              @ DW_AT_prototyped
	.byte	25                              @ DW_FORM_flag_present
	.byte	63                              @ DW_AT_external
	.byte	25                              @ DW_FORM_flag_present
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	17                              @ Abbreviation Code
	.byte	5                               @ DW_TAG_formal_parameter
	.byte	0                               @ DW_CHILDREN_no
	.byte	2                               @ DW_AT_location
	.byte	24                              @ DW_FORM_exprloc
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	18                              @ Abbreviation Code
	.byte	46                              @ DW_TAG_subprogram
	.byte	1                               @ DW_CHILDREN_yes
	.byte	17                              @ DW_AT_low_pc
	.byte	1                               @ DW_FORM_addr
	.byte	18                              @ DW_AT_high_pc
	.byte	6                               @ DW_FORM_data4
	.byte	64                              @ DW_AT_frame_base
	.byte	24                              @ DW_FORM_exprloc
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	63                              @ DW_AT_external
	.byte	25                              @ DW_FORM_flag_present
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	19                              @ Abbreviation Code
	.byte	11                              @ DW_TAG_lexical_block
	.byte	1                               @ DW_CHILDREN_yes
	.byte	17                              @ DW_AT_low_pc
	.byte	1                               @ DW_FORM_addr
	.byte	18                              @ DW_AT_high_pc
	.byte	6                               @ DW_FORM_data4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	20                              @ Abbreviation Code
	.byte	46                              @ DW_TAG_subprogram
	.byte	0                               @ DW_CHILDREN_no
	.byte	17                              @ DW_AT_low_pc
	.byte	1                               @ DW_FORM_addr
	.byte	18                              @ DW_AT_high_pc
	.byte	6                               @ DW_FORM_data4
	.byte	64                              @ DW_AT_frame_base
	.byte	24                              @ DW_FORM_exprloc
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	63                              @ DW_AT_external
	.byte	25                              @ DW_FORM_flag_present
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	21                              @ Abbreviation Code
	.byte	19                              @ DW_TAG_structure_type
	.byte	1                               @ DW_CHILDREN_yes
	.byte	11                              @ DW_AT_byte_size
	.byte	11                              @ DW_FORM_data1
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	22                              @ Abbreviation Code
	.byte	13                              @ DW_TAG_member
	.byte	0                               @ DW_CHILDREN_no
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	56                              @ DW_AT_data_member_location
	.byte	11                              @ DW_FORM_data1
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	0                               @ EOM(3)
	.section	.debug_info,"",%progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 @ Length of Unit
.Ldebug_info_start0:
	.short	4                               @ DWARF version number
	.long	.debug_abbrev                   @ Offset Into Abbrev. Section
	.byte	4                               @ Address Size (in bytes)
	.byte	1                               @ Abbrev [1] 0xb:0x4d5 DW_TAG_compile_unit
	.long	.Linfo_string0                  @ DW_AT_producer
	.short	12                              @ DW_AT_language
	.long	.Linfo_string1                  @ DW_AT_name
	.long	.Lline_table_start0             @ DW_AT_stmt_list
	.long	.Linfo_string2                  @ DW_AT_comp_dir
	.long	0                               @ DW_AT_low_pc
	.long	.Ldebug_ranges0                 @ DW_AT_ranges
	.byte	2                               @ Abbrev [2] 0x26:0x11 DW_TAG_variable
	.long	.Linfo_string3                  @ DW_AT_name
	.long	55                              @ DW_AT_type
                                        @ DW_AT_external
	.byte	2                               @ DW_AT_decl_file
	.byte	71                              @ DW_AT_decl_line
	.byte	5                               @ DW_AT_location
	.byte	3
	.long	DataReceive
	.byte	3                               @ Abbrev [3] 0x37:0xb DW_TAG_typedef
	.long	66                              @ DW_AT_type
	.long	.Linfo_string5                  @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	62                              @ DW_AT_decl_line
	.byte	4                               @ Abbrev [4] 0x42:0x7 DW_TAG_base_type
	.long	.Linfo_string4                  @ DW_AT_name
	.byte	8                               @ DW_AT_encoding
	.byte	1                               @ DW_AT_byte_size
	.byte	5                               @ Abbrev [5] 0x49:0x16 DW_TAG_enumeration_type
	.long	66                              @ DW_AT_type
	.byte	1                               @ DW_AT_byte_size
	.byte	3                               @ DW_AT_decl_file
	.short	529                             @ DW_AT_decl_line
	.byte	6                               @ Abbrev [6] 0x52:0x6 DW_TAG_enumerator
	.long	.Linfo_string6                  @ DW_AT_name
	.byte	0                               @ DW_AT_const_value
	.byte	6                               @ Abbrev [6] 0x58:0x6 DW_TAG_enumerator
	.long	.Linfo_string7                  @ DW_AT_name
	.byte	1                               @ DW_AT_const_value
	.byte	0                               @ End Of Children Mark
	.byte	7                               @ Abbrev [7] 0x5f:0x1b DW_TAG_enumeration_type
	.long	66                              @ DW_AT_type
	.byte	1                               @ DW_AT_byte_size
	.byte	4                               @ DW_AT_decl_file
	.byte	57                              @ DW_AT_decl_line
	.byte	6                               @ Abbrev [6] 0x67:0x6 DW_TAG_enumerator
	.long	.Linfo_string8                  @ DW_AT_name
	.byte	1                               @ DW_AT_const_value
	.byte	6                               @ Abbrev [6] 0x6d:0x6 DW_TAG_enumerator
	.long	.Linfo_string9                  @ DW_AT_name
	.byte	2                               @ DW_AT_const_value
	.byte	6                               @ Abbrev [6] 0x73:0x6 DW_TAG_enumerator
	.long	.Linfo_string10                 @ DW_AT_name
	.byte	3                               @ DW_AT_const_value
	.byte	0                               @ End Of Children Mark
	.byte	7                               @ Abbrev [7] 0x7a:0x39 DW_TAG_enumeration_type
	.long	66                              @ DW_AT_type
	.byte	1                               @ DW_AT_byte_size
	.byte	4                               @ DW_AT_decl_file
	.byte	70                              @ DW_AT_decl_line
	.byte	6                               @ Abbrev [6] 0x82:0x6 DW_TAG_enumerator
	.long	.Linfo_string11                 @ DW_AT_name
	.byte	0                               @ DW_AT_const_value
	.byte	6                               @ Abbrev [6] 0x88:0x6 DW_TAG_enumerator
	.long	.Linfo_string12                 @ DW_AT_name
	.byte	4                               @ DW_AT_const_value
	.byte	6                               @ Abbrev [6] 0x8e:0x6 DW_TAG_enumerator
	.long	.Linfo_string13                 @ DW_AT_name
	.byte	40                              @ DW_AT_const_value
	.byte	6                               @ Abbrev [6] 0x94:0x6 DW_TAG_enumerator
	.long	.Linfo_string14                 @ DW_AT_name
	.byte	72                              @ DW_AT_const_value
	.byte	6                               @ Abbrev [6] 0x9a:0x6 DW_TAG_enumerator
	.long	.Linfo_string15                 @ DW_AT_name
	.byte	20                              @ DW_AT_const_value
	.byte	6                               @ Abbrev [6] 0xa0:0x6 DW_TAG_enumerator
	.long	.Linfo_string16                 @ DW_AT_name
	.byte	16                              @ DW_AT_const_value
	.byte	6                               @ Abbrev [6] 0xa6:0x6 DW_TAG_enumerator
	.long	.Linfo_string17                 @ DW_AT_name
	.byte	28                              @ DW_AT_const_value
	.byte	6                               @ Abbrev [6] 0xac:0x6 DW_TAG_enumerator
	.long	.Linfo_string18                 @ DW_AT_name
	.byte	24                              @ DW_AT_const_value
	.byte	0                               @ End Of Children Mark
	.byte	3                               @ Abbrev [3] 0xb3:0xb DW_TAG_typedef
	.long	190                             @ DW_AT_type
	.long	.Linfo_string20                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	64                              @ DW_AT_decl_line
	.byte	4                               @ Abbrev [4] 0xbe:0x7 DW_TAG_base_type
	.long	.Linfo_string19                 @ DW_AT_name
	.byte	7                               @ DW_AT_encoding
	.byte	4                               @ DW_AT_byte_size
	.byte	3                               @ Abbrev [3] 0xc5:0xb DW_TAG_typedef
	.long	208                             @ DW_AT_type
	.long	.Linfo_string22                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	63                              @ DW_AT_decl_line
	.byte	4                               @ Abbrev [4] 0xd0:0x7 DW_TAG_base_type
	.long	.Linfo_string21                 @ DW_AT_name
	.byte	7                               @ DW_AT_encoding
	.byte	2                               @ DW_AT_byte_size
	.byte	8                               @ Abbrev [8] 0xd7:0x5 DW_TAG_pointer_type
	.long	220                             @ DW_AT_type
	.byte	9                               @ Abbrev [9] 0xdc:0xc DW_TAG_typedef
	.long	232                             @ DW_AT_type
	.long	.Linfo_string30                 @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.short	1018                            @ DW_AT_decl_line
	.byte	10                              @ Abbrev [10] 0xe8:0x61 DW_TAG_structure_type
	.byte	28                              @ DW_AT_byte_size
	.byte	3                               @ DW_AT_decl_file
	.short	1009                            @ DW_AT_decl_line
	.byte	11                              @ Abbrev [11] 0xed:0xd DW_TAG_member
	.long	.Linfo_string23                 @ DW_AT_name
	.long	329                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1011                            @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0xfa:0xd DW_TAG_member
	.long	.Linfo_string24                 @ DW_AT_name
	.long	329                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1012                            @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x107:0xd DW_TAG_member
	.long	.Linfo_string25                 @ DW_AT_name
	.long	329                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1013                            @ DW_AT_decl_line
	.byte	8                               @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x114:0xd DW_TAG_member
	.long	.Linfo_string26                 @ DW_AT_name
	.long	329                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1014                            @ DW_AT_decl_line
	.byte	12                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x121:0xd DW_TAG_member
	.long	.Linfo_string27                 @ DW_AT_name
	.long	329                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1015                            @ DW_AT_decl_line
	.byte	16                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x12e:0xd DW_TAG_member
	.long	.Linfo_string28                 @ DW_AT_name
	.long	329                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1016                            @ DW_AT_decl_line
	.byte	20                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x13b:0xd DW_TAG_member
	.long	.Linfo_string29                 @ DW_AT_name
	.long	329                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1017                            @ DW_AT_decl_line
	.byte	24                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	12                              @ Abbrev [12] 0x149:0x5 DW_TAG_volatile_type
	.long	179                             @ DW_AT_type
	.byte	8                               @ Abbrev [8] 0x14e:0x5 DW_TAG_pointer_type
	.long	339                             @ DW_AT_type
	.byte	9                               @ Abbrev [9] 0x153:0xc DW_TAG_typedef
	.long	351                             @ DW_AT_type
	.long	.Linfo_string71                 @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.short	1236                            @ DW_AT_decl_line
	.byte	10                              @ Abbrev [10] 0x15f:0x20e DW_TAG_structure_type
	.byte	80                              @ DW_AT_byte_size
	.byte	3                               @ DW_AT_decl_file
	.short	1194                            @ DW_AT_decl_line
	.byte	11                              @ Abbrev [11] 0x164:0xd DW_TAG_member
	.long	.Linfo_string31                 @ DW_AT_name
	.long	877                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1196                            @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x171:0xd DW_TAG_member
	.long	.Linfo_string32                 @ DW_AT_name
	.long	197                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1197                            @ DW_AT_decl_line
	.byte	2                               @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x17e:0xd DW_TAG_member
	.long	.Linfo_string33                 @ DW_AT_name
	.long	877                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1198                            @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x18b:0xd DW_TAG_member
	.long	.Linfo_string34                 @ DW_AT_name
	.long	197                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1199                            @ DW_AT_decl_line
	.byte	6                               @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x198:0xd DW_TAG_member
	.long	.Linfo_string35                 @ DW_AT_name
	.long	877                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1200                            @ DW_AT_decl_line
	.byte	8                               @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x1a5:0xd DW_TAG_member
	.long	.Linfo_string36                 @ DW_AT_name
	.long	197                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1201                            @ DW_AT_decl_line
	.byte	10                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x1b2:0xd DW_TAG_member
	.long	.Linfo_string37                 @ DW_AT_name
	.long	877                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1202                            @ DW_AT_decl_line
	.byte	12                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x1bf:0xd DW_TAG_member
	.long	.Linfo_string38                 @ DW_AT_name
	.long	197                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1203                            @ DW_AT_decl_line
	.byte	14                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x1cc:0xd DW_TAG_member
	.long	.Linfo_string39                 @ DW_AT_name
	.long	877                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1204                            @ DW_AT_decl_line
	.byte	16                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x1d9:0xd DW_TAG_member
	.long	.Linfo_string40                 @ DW_AT_name
	.long	197                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1205                            @ DW_AT_decl_line
	.byte	18                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x1e6:0xd DW_TAG_member
	.long	.Linfo_string41                 @ DW_AT_name
	.long	877                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1206                            @ DW_AT_decl_line
	.byte	20                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x1f3:0xd DW_TAG_member
	.long	.Linfo_string42                 @ DW_AT_name
	.long	197                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1207                            @ DW_AT_decl_line
	.byte	22                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x200:0xd DW_TAG_member
	.long	.Linfo_string43                 @ DW_AT_name
	.long	877                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1208                            @ DW_AT_decl_line
	.byte	24                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x20d:0xd DW_TAG_member
	.long	.Linfo_string44                 @ DW_AT_name
	.long	197                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1209                            @ DW_AT_decl_line
	.byte	26                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x21a:0xd DW_TAG_member
	.long	.Linfo_string45                 @ DW_AT_name
	.long	877                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1210                            @ DW_AT_decl_line
	.byte	28                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x227:0xd DW_TAG_member
	.long	.Linfo_string46                 @ DW_AT_name
	.long	197                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1211                            @ DW_AT_decl_line
	.byte	30                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x234:0xd DW_TAG_member
	.long	.Linfo_string47                 @ DW_AT_name
	.long	877                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1212                            @ DW_AT_decl_line
	.byte	32                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x241:0xd DW_TAG_member
	.long	.Linfo_string48                 @ DW_AT_name
	.long	197                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1213                            @ DW_AT_decl_line
	.byte	34                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x24e:0xd DW_TAG_member
	.long	.Linfo_string49                 @ DW_AT_name
	.long	877                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1214                            @ DW_AT_decl_line
	.byte	36                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x25b:0xd DW_TAG_member
	.long	.Linfo_string50                 @ DW_AT_name
	.long	197                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1215                            @ DW_AT_decl_line
	.byte	38                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x268:0xd DW_TAG_member
	.long	.Linfo_string51                 @ DW_AT_name
	.long	877                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1216                            @ DW_AT_decl_line
	.byte	40                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x275:0xd DW_TAG_member
	.long	.Linfo_string52                 @ DW_AT_name
	.long	197                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1217                            @ DW_AT_decl_line
	.byte	42                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x282:0xd DW_TAG_member
	.long	.Linfo_string53                 @ DW_AT_name
	.long	877                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1218                            @ DW_AT_decl_line
	.byte	44                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x28f:0xd DW_TAG_member
	.long	.Linfo_string54                 @ DW_AT_name
	.long	197                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1219                            @ DW_AT_decl_line
	.byte	46                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x29c:0xd DW_TAG_member
	.long	.Linfo_string55                 @ DW_AT_name
	.long	877                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1220                            @ DW_AT_decl_line
	.byte	48                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x2a9:0xd DW_TAG_member
	.long	.Linfo_string56                 @ DW_AT_name
	.long	197                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1221                            @ DW_AT_decl_line
	.byte	50                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x2b6:0xd DW_TAG_member
	.long	.Linfo_string57                 @ DW_AT_name
	.long	877                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1222                            @ DW_AT_decl_line
	.byte	52                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x2c3:0xd DW_TAG_member
	.long	.Linfo_string58                 @ DW_AT_name
	.long	197                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1223                            @ DW_AT_decl_line
	.byte	54                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x2d0:0xd DW_TAG_member
	.long	.Linfo_string59                 @ DW_AT_name
	.long	877                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1224                            @ DW_AT_decl_line
	.byte	56                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x2dd:0xd DW_TAG_member
	.long	.Linfo_string60                 @ DW_AT_name
	.long	197                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1225                            @ DW_AT_decl_line
	.byte	58                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x2ea:0xd DW_TAG_member
	.long	.Linfo_string61                 @ DW_AT_name
	.long	877                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1226                            @ DW_AT_decl_line
	.byte	60                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x2f7:0xd DW_TAG_member
	.long	.Linfo_string62                 @ DW_AT_name
	.long	197                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1227                            @ DW_AT_decl_line
	.byte	62                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x304:0xd DW_TAG_member
	.long	.Linfo_string63                 @ DW_AT_name
	.long	877                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1228                            @ DW_AT_decl_line
	.byte	64                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x311:0xd DW_TAG_member
	.long	.Linfo_string64                 @ DW_AT_name
	.long	197                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1229                            @ DW_AT_decl_line
	.byte	66                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x31e:0xd DW_TAG_member
	.long	.Linfo_string65                 @ DW_AT_name
	.long	877                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1230                            @ DW_AT_decl_line
	.byte	68                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x32b:0xd DW_TAG_member
	.long	.Linfo_string66                 @ DW_AT_name
	.long	197                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1231                            @ DW_AT_decl_line
	.byte	70                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x338:0xd DW_TAG_member
	.long	.Linfo_string67                 @ DW_AT_name
	.long	877                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1232                            @ DW_AT_decl_line
	.byte	72                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x345:0xd DW_TAG_member
	.long	.Linfo_string68                 @ DW_AT_name
	.long	197                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1233                            @ DW_AT_decl_line
	.byte	74                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x352:0xd DW_TAG_member
	.long	.Linfo_string69                 @ DW_AT_name
	.long	877                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1234                            @ DW_AT_decl_line
	.byte	76                              @ DW_AT_data_member_location
	.byte	11                              @ Abbrev [11] 0x35f:0xd DW_TAG_member
	.long	.Linfo_string70                 @ DW_AT_name
	.long	197                             @ DW_AT_type
	.byte	3                               @ DW_AT_decl_file
	.short	1235                            @ DW_AT_decl_line
	.byte	78                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	12                              @ Abbrev [12] 0x36d:0x5 DW_TAG_volatile_type
	.long	197                             @ DW_AT_type
	.byte	13                              @ Abbrev [13] 0x372:0x11 DW_TAG_subprogram
	.long	.Lfunc_begin0                   @ DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string72                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	13                              @ DW_AT_decl_line
                                        @ DW_AT_external
	.byte	14                              @ Abbrev [14] 0x383:0x20 DW_TAG_subprogram
	.long	.Lfunc_begin1                   @ DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string73                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	18                              @ DW_AT_decl_line
                                        @ DW_AT_external
	.byte	15                              @ Abbrev [15] 0x394:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	12
	.long	.Linfo_string79                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	19                              @ DW_AT_decl_line
	.long	1097                            @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	14                              @ Abbrev [14] 0x3a3:0x20 DW_TAG_subprogram
	.long	.Lfunc_begin2                   @ DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string74                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	31                              @ DW_AT_decl_line
                                        @ DW_AT_external
	.byte	15                              @ Abbrev [15] 0x3b4:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	6
	.long	.Linfo_string86                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	32                              @ DW_AT_decl_line
	.long	1171                            @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	16                              @ Abbrev [16] 0x3c3:0x20 DW_TAG_subprogram
	.long	.Lfunc_begin3                   @ DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string75                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	43                              @ DW_AT_decl_line
                                        @ DW_AT_prototyped
                                        @ DW_AT_external
	.byte	17                              @ Abbrev [17] 0x3d4:0xe DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	4
	.long	.Linfo_string93                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	43                              @ DW_AT_decl_line
	.long	179                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	18                              @ Abbrev [18] 0x3e3:0x4a DW_TAG_subprogram
	.long	.Lfunc_begin4                   @ DW_AT_low_pc
	.long	.Lfunc_end4-.Lfunc_begin4       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string76                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	48                              @ DW_AT_decl_line
	.long	55                              @ DW_AT_type
                                        @ DW_AT_external
	.byte	15                              @ Abbrev [15] 0x3f8:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	7
	.long	.Linfo_string94                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	49                              @ DW_AT_decl_line
	.long	55                              @ DW_AT_type
	.byte	15                              @ Abbrev [15] 0x406:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	6
	.long	.Linfo_string95                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	50                              @ DW_AT_decl_line
	.long	55                              @ DW_AT_type
	.byte	19                              @ Abbrev [19] 0x414:0x18 DW_TAG_lexical_block
	.long	.Ltmp9                          @ DW_AT_low_pc
	.long	.Ltmp14-.Ltmp9                  @ DW_AT_high_pc
	.byte	15                              @ Abbrev [15] 0x41d:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	0
	.long	.Linfo_string96                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	54                              @ DW_AT_decl_line
	.long	1090                            @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	20                              @ Abbrev [20] 0x42d:0x15 DW_TAG_subprogram
	.long	.Lfunc_begin5                   @ DW_AT_low_pc
	.long	.Lfunc_end5-.Lfunc_begin5       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string77                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	73                              @ DW_AT_decl_line
	.long	1090                            @ DW_AT_type
                                        @ DW_AT_external
	.byte	4                               @ Abbrev [4] 0x442:0x7 DW_TAG_base_type
	.long	.Linfo_string78                 @ DW_AT_name
	.byte	5                               @ DW_AT_encoding
	.byte	4                               @ DW_AT_byte_size
	.byte	3                               @ Abbrev [3] 0x449:0xb DW_TAG_typedef
	.long	1108                            @ DW_AT_type
	.long	.Linfo_string85                 @ DW_AT_name
	.byte	4                               @ DW_AT_decl_file
	.byte	100                             @ DW_AT_decl_line
	.byte	21                              @ Abbrev [21] 0x454:0x29 DW_TAG_structure_type
	.byte	4                               @ DW_AT_byte_size
	.byte	4                               @ DW_AT_decl_file
	.byte	90                              @ DW_AT_decl_line
	.byte	22                              @ Abbrev [22] 0x458:0xc DW_TAG_member
	.long	.Linfo_string80                 @ DW_AT_name
	.long	197                             @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	92                              @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	22                              @ Abbrev [22] 0x464:0xc DW_TAG_member
	.long	.Linfo_string81                 @ DW_AT_name
	.long	1149                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	95                              @ DW_AT_decl_line
	.byte	2                               @ DW_AT_data_member_location
	.byte	22                              @ Abbrev [22] 0x470:0xc DW_TAG_member
	.long	.Linfo_string83                 @ DW_AT_name
	.long	1160                            @ DW_AT_type
	.byte	4                               @ DW_AT_decl_file
	.byte	98                              @ DW_AT_decl_line
	.byte	3                               @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	3                               @ Abbrev [3] 0x47d:0xb DW_TAG_typedef
	.long	95                              @ DW_AT_type
	.long	.Linfo_string82                 @ DW_AT_name
	.byte	4                               @ DW_AT_decl_file
	.byte	62                              @ DW_AT_decl_line
	.byte	3                               @ Abbrev [3] 0x488:0xb DW_TAG_typedef
	.long	122                             @ DW_AT_type
	.long	.Linfo_string84                 @ DW_AT_name
	.byte	4                               @ DW_AT_decl_file
	.byte	79                              @ DW_AT_decl_line
	.byte	3                               @ Abbrev [3] 0x493:0xb DW_TAG_typedef
	.long	1182                            @ DW_AT_type
	.long	.Linfo_string92                 @ DW_AT_name
	.byte	5                               @ DW_AT_decl_file
	.byte	73                              @ DW_AT_decl_line
	.byte	21                              @ Abbrev [21] 0x49e:0x41 DW_TAG_structure_type
	.byte	10                              @ DW_AT_byte_size
	.byte	5                               @ DW_AT_decl_file
	.byte	50                              @ DW_AT_decl_line
	.byte	22                              @ Abbrev [22] 0x4a2:0xc DW_TAG_member
	.long	.Linfo_string87                 @ DW_AT_name
	.long	197                             @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	52                              @ DW_AT_decl_line
	.byte	0                               @ DW_AT_data_member_location
	.byte	22                              @ Abbrev [22] 0x4ae:0xc DW_TAG_member
	.long	.Linfo_string88                 @ DW_AT_name
	.long	197                             @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	55                              @ DW_AT_decl_line
	.byte	2                               @ DW_AT_data_member_location
	.byte	22                              @ Abbrev [22] 0x4ba:0xc DW_TAG_member
	.long	.Linfo_string89                 @ DW_AT_name
	.long	197                             @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	58                              @ DW_AT_decl_line
	.byte	4                               @ DW_AT_data_member_location
	.byte	22                              @ Abbrev [22] 0x4c6:0xc DW_TAG_member
	.long	.Linfo_string90                 @ DW_AT_name
	.long	197                             @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	62                              @ DW_AT_decl_line
	.byte	6                               @ DW_AT_data_member_location
	.byte	22                              @ Abbrev [22] 0x4d2:0xc DW_TAG_member
	.long	.Linfo_string91                 @ DW_AT_name
	.long	55                              @ DW_AT_type
	.byte	5                               @ DW_AT_decl_file
	.byte	65                              @ DW_AT_decl_line
	.byte	8                               @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.long	.Lfunc_begin0
	.long	.Lfunc_end0
	.long	.Lfunc_begin1
	.long	.Lfunc_end1
	.long	.Lfunc_begin2
	.long	.Lfunc_end2
	.long	.Lfunc_begin3
	.long	.Lfunc_end3
	.long	.Lfunc_begin4
	.long	.Lfunc_end4
	.long	.Lfunc_begin5
	.long	.Lfunc_end5
	.long	0
	.long	0
	.section	.debug_str,"MS",%progbits,1
.Linfo_string0:
	.asciz	"Component: Arm Compiler for Embedded 6.21 Tool: armclang [5ec1fd00]" @ string offset=0
.Linfo_string1:
	.asciz	"main.c"                        @ string offset=68
.Linfo_string2:
	.asciz	"D:\\3.Courses\\Profile\\Embedded_Automative\\Lesson_05_SPI_software_and_hardware\\SPI_Software\\Slave" @ string offset=75
.Linfo_string3:
	.asciz	"DataReceive"                   @ string offset=171
.Linfo_string4:
	.asciz	"unsigned char"                 @ string offset=183
.Linfo_string5:
	.asciz	"uint8_t"                       @ string offset=197
.Linfo_string6:
	.asciz	"DISABLE"                       @ string offset=205
.Linfo_string7:
	.asciz	"ENABLE"                        @ string offset=213
.Linfo_string8:
	.asciz	"GPIO_Speed_10MHz"              @ string offset=220
.Linfo_string9:
	.asciz	"GPIO_Speed_2MHz"               @ string offset=237
.Linfo_string10:
	.asciz	"GPIO_Speed_50MHz"              @ string offset=253
.Linfo_string11:
	.asciz	"GPIO_Mode_AIN"                 @ string offset=270
.Linfo_string12:
	.asciz	"GPIO_Mode_IN_FLOATING"         @ string offset=284
.Linfo_string13:
	.asciz	"GPIO_Mode_IPD"                 @ string offset=306
.Linfo_string14:
	.asciz	"GPIO_Mode_IPU"                 @ string offset=320
.Linfo_string15:
	.asciz	"GPIO_Mode_Out_OD"              @ string offset=334
.Linfo_string16:
	.asciz	"GPIO_Mode_Out_PP"              @ string offset=351
.Linfo_string17:
	.asciz	"GPIO_Mode_AF_OD"               @ string offset=368
.Linfo_string18:
	.asciz	"GPIO_Mode_AF_PP"               @ string offset=384
.Linfo_string19:
	.asciz	"unsigned int"                  @ string offset=400
.Linfo_string20:
	.asciz	"uint32_t"                      @ string offset=413
.Linfo_string21:
	.asciz	"unsigned short"                @ string offset=422
.Linfo_string22:
	.asciz	"uint16_t"                      @ string offset=437
.Linfo_string23:
	.asciz	"CRL"                           @ string offset=446
.Linfo_string24:
	.asciz	"CRH"                           @ string offset=450
.Linfo_string25:
	.asciz	"IDR"                           @ string offset=454
.Linfo_string26:
	.asciz	"ODR"                           @ string offset=458
.Linfo_string27:
	.asciz	"BSRR"                          @ string offset=462
.Linfo_string28:
	.asciz	"BRR"                           @ string offset=467
.Linfo_string29:
	.asciz	"LCKR"                          @ string offset=471
.Linfo_string30:
	.asciz	"GPIO_TypeDef"                  @ string offset=476
.Linfo_string31:
	.asciz	"CR1"                           @ string offset=489
.Linfo_string32:
	.asciz	"RESERVED0"                     @ string offset=493
.Linfo_string33:
	.asciz	"CR2"                           @ string offset=503
.Linfo_string34:
	.asciz	"RESERVED1"                     @ string offset=507
.Linfo_string35:
	.asciz	"SMCR"                          @ string offset=517
.Linfo_string36:
	.asciz	"RESERVED2"                     @ string offset=522
.Linfo_string37:
	.asciz	"DIER"                          @ string offset=532
.Linfo_string38:
	.asciz	"RESERVED3"                     @ string offset=537
.Linfo_string39:
	.asciz	"SR"                            @ string offset=547
.Linfo_string40:
	.asciz	"RESERVED4"                     @ string offset=550
.Linfo_string41:
	.asciz	"EGR"                           @ string offset=560
.Linfo_string42:
	.asciz	"RESERVED5"                     @ string offset=564
.Linfo_string43:
	.asciz	"CCMR1"                         @ string offset=574
.Linfo_string44:
	.asciz	"RESERVED6"                     @ string offset=580
.Linfo_string45:
	.asciz	"CCMR2"                         @ string offset=590
.Linfo_string46:
	.asciz	"RESERVED7"                     @ string offset=596
.Linfo_string47:
	.asciz	"CCER"                          @ string offset=606
.Linfo_string48:
	.asciz	"RESERVED8"                     @ string offset=611
.Linfo_string49:
	.asciz	"CNT"                           @ string offset=621
.Linfo_string50:
	.asciz	"RESERVED9"                     @ string offset=625
.Linfo_string51:
	.asciz	"PSC"                           @ string offset=635
.Linfo_string52:
	.asciz	"RESERVED10"                    @ string offset=639
.Linfo_string53:
	.asciz	"ARR"                           @ string offset=650
.Linfo_string54:
	.asciz	"RESERVED11"                    @ string offset=654
.Linfo_string55:
	.asciz	"RCR"                           @ string offset=665
.Linfo_string56:
	.asciz	"RESERVED12"                    @ string offset=669
.Linfo_string57:
	.asciz	"CCR1"                          @ string offset=680
.Linfo_string58:
	.asciz	"RESERVED13"                    @ string offset=685
.Linfo_string59:
	.asciz	"CCR2"                          @ string offset=696
.Linfo_string60:
	.asciz	"RESERVED14"                    @ string offset=701
.Linfo_string61:
	.asciz	"CCR3"                          @ string offset=712
.Linfo_string62:
	.asciz	"RESERVED15"                    @ string offset=717
.Linfo_string63:
	.asciz	"CCR4"                          @ string offset=728
.Linfo_string64:
	.asciz	"RESERVED16"                    @ string offset=733
.Linfo_string65:
	.asciz	"BDTR"                          @ string offset=744
.Linfo_string66:
	.asciz	"RESERVED17"                    @ string offset=749
.Linfo_string67:
	.asciz	"DCR"                           @ string offset=760
.Linfo_string68:
	.asciz	"RESERVED18"                    @ string offset=764
.Linfo_string69:
	.asciz	"DMAR"                          @ string offset=775
.Linfo_string70:
	.asciz	"RESERVED19"                    @ string offset=780
.Linfo_string71:
	.asciz	"TIM_TypeDef"                   @ string offset=791
.Linfo_string72:
	.asciz	"RCC_Config"                    @ string offset=803
.Linfo_string73:
	.asciz	"GPIO_Config"                   @ string offset=814
.Linfo_string74:
	.asciz	"TIM_Config"                    @ string offset=826
.Linfo_string75:
	.asciz	"delay_us"                      @ string offset=837
.Linfo_string76:
	.asciz	"SPI_Slave_Receive"             @ string offset=846
.Linfo_string77:
	.asciz	"main"                          @ string offset=864
.Linfo_string78:
	.asciz	"int"                           @ string offset=869
.Linfo_string79:
	.asciz	"GPIO_InitStructure"            @ string offset=873
.Linfo_string80:
	.asciz	"GPIO_Pin"                      @ string offset=892
.Linfo_string81:
	.asciz	"GPIO_Speed"                    @ string offset=901
.Linfo_string82:
	.asciz	"GPIOSpeed_TypeDef"             @ string offset=912
.Linfo_string83:
	.asciz	"GPIO_Mode"                     @ string offset=930
.Linfo_string84:
	.asciz	"GPIOMode_TypeDef"              @ string offset=940
.Linfo_string85:
	.asciz	"GPIO_InitTypeDef"              @ string offset=957
.Linfo_string86:
	.asciz	"TIM_InitStruct"                @ string offset=974
.Linfo_string87:
	.asciz	"TIM_Prescaler"                 @ string offset=989
.Linfo_string88:
	.asciz	"TIM_CounterMode"               @ string offset=1003
.Linfo_string89:
	.asciz	"TIM_Period"                    @ string offset=1019
.Linfo_string90:
	.asciz	"TIM_ClockDivision"             @ string offset=1030
.Linfo_string91:
	.asciz	"TIM_RepetitionCounter"         @ string offset=1048
.Linfo_string92:
	.asciz	"TIM_TimeBaseInitTypeDef"       @ string offset=1070
.Linfo_string93:
	.asciz	"time"                          @ string offset=1094
.Linfo_string94:
	.asciz	"dataReceive"                   @ string offset=1099
.Linfo_string95:
	.asciz	"temp"                          @ string offset=1111
.Linfo_string96:
	.asciz	"i"                             @ string offset=1116
	.ident	"Component: Arm Compiler for Embedded 6.21 Tool: armclang [5ec1fd00]"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 6	@ Tag_ABI_optimization_goals
	.ARM_attribute	16, 1	@ Tag_AV_eba
	.section	.debug_line,"",%progbits
.Lline_table_start0:
