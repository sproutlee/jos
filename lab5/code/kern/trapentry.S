/* See COPYRIGHT for copyright information. */

#include <inc/mmu.h>
#include <inc/memlayout.h>
#include <inc/trap.h>

#include <kern/picirq.h>


###################################################################
# exceptions/interrupts
###################################################################

/* TRAPHANDLER defines a globally-visible function for handling a trap.
 * It pushes a trap number onto the stack, then jumps to _alltraps.
 * Use TRAPHANDLER for traps where the CPU automatically pushes an error code.
 *
 * You shouldn't call a TRAPHANDLER function from C, but you may
 * need to _declare_ one in C (for instance, to get a function pointer
 * during IDT setup).  You can declare the function with
 *   void NAME();
 * where NAME is the argument passed to TRAPHANDLER.
 */
#define TRAPHANDLER(name, num)						\
	.globl name;		/* define global symbol for 'name' */	\
	.type name, @function;	/* symbol type is function */		\
	.align 2;		/* align function definition */		\
	name:			/* function starts here */		\
	pushl $(num);							\
	jmp _alltraps

/* Use TRAPHANDLER_NOEC for traps where the CPU doesn't push an error code.
 * It pushes a 0 in place of the error code, so the trap frame has the same
 * format in either case.
 */
#define TRAPHANDLER_NOEC(name, num)					\
	.globl name;							\
	.type name, @function;						\
	.align 2;							\
	name:								\
	pushl $0;							\
	pushl $(num);							\
	jmp _alltraps

.text

/*
 * Lab 3: Your code here for generating entry points for the different traps.
 */

TRAPHANDLER_NOEC(thdlr0, 0)
TRAPHANDLER_NOEC(thdlr1, 1)
TRAPHANDLER_NOEC(thdlr2, 2)
TRAPHANDLER_NOEC(thdlr3, 3)
TRAPHANDLER_NOEC(thdlr4, 4)
TRAPHANDLER_NOEC(thdlr5, 5)
TRAPHANDLER_NOEC(thdlr6, 6)
TRAPHANDLER_NOEC(thdlr7, 7)
TRAPHANDLER(thdlr8, 8)
TRAPHANDLER_NOEC(thdlr9, 9)
TRAPHANDLER(thdlr10, 10)
TRAPHANDLER(thdlr11, 11)
TRAPHANDLER(thdlr12, 12)
TRAPHANDLER(thdlr13, 13)
TRAPHANDLER(thdlr14, 14)
TRAPHANDLER_NOEC(thdlr15, 15)
TRAPHANDLER_NOEC(thdlr16, 16)
TRAPHANDLER(thdlr17, 17)
TRAPHANDLER_NOEC(thdlr18, 18)
TRAPHANDLER_NOEC(thdlr19, 19)
TRAPHANDLER_NOEC(thdlr20, 20)
TRAPHANDLER_NOEC(thdlr21, 21)
TRAPHANDLER_NOEC(thdlr22, 22)
TRAPHANDLER_NOEC(thdlr23, 23)
TRAPHANDLER_NOEC(thdlr24, 24)
TRAPHANDLER_NOEC(thdlr25, 25)
TRAPHANDLER_NOEC(thdlr26, 26)
TRAPHANDLER_NOEC(thdlr27, 27)
TRAPHANDLER_NOEC(thdlr28, 28)
TRAPHANDLER_NOEC(thdlr29, 29)
TRAPHANDLER_NOEC(thdlr30, 30)
TRAPHANDLER_NOEC(thdlr31, 31)
TRAPHANDLER_NOEC(thdlr32, 32)
TRAPHANDLER_NOEC(thdlr33, 33)
TRAPHANDLER_NOEC(thdlr34, 34)
TRAPHANDLER_NOEC(thdlr35, 35)
TRAPHANDLER_NOEC(thdlr36, 36)
TRAPHANDLER_NOEC(thdlr37, 37)
TRAPHANDLER_NOEC(thdlr38, 38)
TRAPHANDLER_NOEC(thdlr39, 39)
TRAPHANDLER_NOEC(thdlr40, 40)
TRAPHANDLER_NOEC(thdlr41, 41)
TRAPHANDLER_NOEC(thdlr42, 42)
TRAPHANDLER_NOEC(thdlr43, 43)
TRAPHANDLER_NOEC(thdlr44, 44)
TRAPHANDLER_NOEC(thdlr45, 45)
TRAPHANDLER_NOEC(thdlr46, 46)
TRAPHANDLER_NOEC(thdlr47, 47)
TRAPHANDLER_NOEC(thdlr48, 48)
TRAPHANDLER_NOEC(thdlr49, 49)
TRAPHANDLER_NOEC(thdlr50, 50)
TRAPHANDLER_NOEC(thdlr51, 51)
TRAPHANDLER_NOEC(thdlr52, 52)
TRAPHANDLER_NOEC(thdlr53, 53)
TRAPHANDLER_NOEC(thdlr54, 54)
TRAPHANDLER_NOEC(thdlr55, 55)
TRAPHANDLER_NOEC(thdlr56, 56)
TRAPHANDLER_NOEC(thdlr57, 57)
TRAPHANDLER_NOEC(thdlr58, 58)
TRAPHANDLER_NOEC(thdlr59, 59)
TRAPHANDLER_NOEC(thdlr60, 60)
TRAPHANDLER_NOEC(thdlr61, 61)
TRAPHANDLER_NOEC(thdlr62, 62)
TRAPHANDLER_NOEC(thdlr63, 63)
TRAPHANDLER_NOEC(thdlr64, 64)
TRAPHANDLER_NOEC(thdlr65, 65)
TRAPHANDLER_NOEC(thdlr66, 66)
TRAPHANDLER_NOEC(thdlr67, 67)
TRAPHANDLER_NOEC(thdlr68, 68)
TRAPHANDLER_NOEC(thdlr69, 69)
TRAPHANDLER_NOEC(thdlr70, 70)
TRAPHANDLER_NOEC(thdlr71, 71)
TRAPHANDLER_NOEC(thdlr72, 72)
TRAPHANDLER_NOEC(thdlr73, 73)
TRAPHANDLER_NOEC(thdlr74, 74)
TRAPHANDLER_NOEC(thdlr75, 75)
TRAPHANDLER_NOEC(thdlr76, 76)
TRAPHANDLER_NOEC(thdlr77, 77)
TRAPHANDLER_NOEC(thdlr78, 78)
TRAPHANDLER_NOEC(thdlr79, 79)
TRAPHANDLER_NOEC(thdlr80, 80)
TRAPHANDLER_NOEC(thdlr81, 81)
TRAPHANDLER_NOEC(thdlr82, 82)
TRAPHANDLER_NOEC(thdlr83, 83)
TRAPHANDLER_NOEC(thdlr84, 84)
TRAPHANDLER_NOEC(thdlr85, 85)
TRAPHANDLER_NOEC(thdlr86, 86)
TRAPHANDLER_NOEC(thdlr87, 87)
TRAPHANDLER_NOEC(thdlr88, 88)
TRAPHANDLER_NOEC(thdlr89, 89)
TRAPHANDLER_NOEC(thdlr90, 90)
TRAPHANDLER_NOEC(thdlr91, 91)
TRAPHANDLER_NOEC(thdlr92, 92)
TRAPHANDLER_NOEC(thdlr93, 93)
TRAPHANDLER_NOEC(thdlr94, 94)
TRAPHANDLER_NOEC(thdlr95, 95)
TRAPHANDLER_NOEC(thdlr96, 96)
TRAPHANDLER_NOEC(thdlr97, 97)
TRAPHANDLER_NOEC(thdlr98, 98)
TRAPHANDLER_NOEC(thdlr99, 99)
TRAPHANDLER_NOEC(thdlr100, 100)
TRAPHANDLER_NOEC(thdlr101, 101)
TRAPHANDLER_NOEC(thdlr102, 102)
TRAPHANDLER_NOEC(thdlr103, 103)
TRAPHANDLER_NOEC(thdlr104, 104)
TRAPHANDLER_NOEC(thdlr105, 105)
TRAPHANDLER_NOEC(thdlr106, 106)
TRAPHANDLER_NOEC(thdlr107, 107)
TRAPHANDLER_NOEC(thdlr108, 108)
TRAPHANDLER_NOEC(thdlr109, 109)
TRAPHANDLER_NOEC(thdlr110, 110)
TRAPHANDLER_NOEC(thdlr111, 111)
TRAPHANDLER_NOEC(thdlr112, 112)
TRAPHANDLER_NOEC(thdlr113, 113)
TRAPHANDLER_NOEC(thdlr114, 114)
TRAPHANDLER_NOEC(thdlr115, 115)
TRAPHANDLER_NOEC(thdlr116, 116)
TRAPHANDLER_NOEC(thdlr117, 117)
TRAPHANDLER_NOEC(thdlr118, 118)
TRAPHANDLER_NOEC(thdlr119, 119)
TRAPHANDLER_NOEC(thdlr120, 120)
TRAPHANDLER_NOEC(thdlr121, 121)
TRAPHANDLER_NOEC(thdlr122, 122)
TRAPHANDLER_NOEC(thdlr123, 123)
TRAPHANDLER_NOEC(thdlr124, 124)
TRAPHANDLER_NOEC(thdlr125, 125)
TRAPHANDLER_NOEC(thdlr126, 126)
TRAPHANDLER_NOEC(thdlr127, 127)
TRAPHANDLER_NOEC(thdlr128, 128)
TRAPHANDLER_NOEC(thdlr129, 129)
TRAPHANDLER_NOEC(thdlr130, 130)
TRAPHANDLER_NOEC(thdlr131, 131)
TRAPHANDLER_NOEC(thdlr132, 132)
TRAPHANDLER_NOEC(thdlr133, 133)
TRAPHANDLER_NOEC(thdlr134, 134)
TRAPHANDLER_NOEC(thdlr135, 135)
TRAPHANDLER_NOEC(thdlr136, 136)
TRAPHANDLER_NOEC(thdlr137, 137)
TRAPHANDLER_NOEC(thdlr138, 138)
TRAPHANDLER_NOEC(thdlr139, 139)
TRAPHANDLER_NOEC(thdlr140, 140)
TRAPHANDLER_NOEC(thdlr141, 141)
TRAPHANDLER_NOEC(thdlr142, 142)
TRAPHANDLER_NOEC(thdlr143, 143)
TRAPHANDLER_NOEC(thdlr144, 144)
TRAPHANDLER_NOEC(thdlr145, 145)
TRAPHANDLER_NOEC(thdlr146, 146)
TRAPHANDLER_NOEC(thdlr147, 147)
TRAPHANDLER_NOEC(thdlr148, 148)
TRAPHANDLER_NOEC(thdlr149, 149)
TRAPHANDLER_NOEC(thdlr150, 150)
TRAPHANDLER_NOEC(thdlr151, 151)
TRAPHANDLER_NOEC(thdlr152, 152)
TRAPHANDLER_NOEC(thdlr153, 153)
TRAPHANDLER_NOEC(thdlr154, 154)
TRAPHANDLER_NOEC(thdlr155, 155)
TRAPHANDLER_NOEC(thdlr156, 156)
TRAPHANDLER_NOEC(thdlr157, 157)
TRAPHANDLER_NOEC(thdlr158, 158)
TRAPHANDLER_NOEC(thdlr159, 159)
TRAPHANDLER_NOEC(thdlr160, 160)
TRAPHANDLER_NOEC(thdlr161, 161)
TRAPHANDLER_NOEC(thdlr162, 162)
TRAPHANDLER_NOEC(thdlr163, 163)
TRAPHANDLER_NOEC(thdlr164, 164)
TRAPHANDLER_NOEC(thdlr165, 165)
TRAPHANDLER_NOEC(thdlr166, 166)
TRAPHANDLER_NOEC(thdlr167, 167)
TRAPHANDLER_NOEC(thdlr168, 168)
TRAPHANDLER_NOEC(thdlr169, 169)
TRAPHANDLER_NOEC(thdlr170, 170)
TRAPHANDLER_NOEC(thdlr171, 171)
TRAPHANDLER_NOEC(thdlr172, 172)
TRAPHANDLER_NOEC(thdlr173, 173)
TRAPHANDLER_NOEC(thdlr174, 174)
TRAPHANDLER_NOEC(thdlr175, 175)
TRAPHANDLER_NOEC(thdlr176, 176)
TRAPHANDLER_NOEC(thdlr177, 177)
TRAPHANDLER_NOEC(thdlr178, 178)
TRAPHANDLER_NOEC(thdlr179, 179)
TRAPHANDLER_NOEC(thdlr180, 180)
TRAPHANDLER_NOEC(thdlr181, 181)
TRAPHANDLER_NOEC(thdlr182, 182)
TRAPHANDLER_NOEC(thdlr183, 183)
TRAPHANDLER_NOEC(thdlr184, 184)
TRAPHANDLER_NOEC(thdlr185, 185)
TRAPHANDLER_NOEC(thdlr186, 186)
TRAPHANDLER_NOEC(thdlr187, 187)
TRAPHANDLER_NOEC(thdlr188, 188)
TRAPHANDLER_NOEC(thdlr189, 189)
TRAPHANDLER_NOEC(thdlr190, 190)
TRAPHANDLER_NOEC(thdlr191, 191)
TRAPHANDLER_NOEC(thdlr192, 192)
TRAPHANDLER_NOEC(thdlr193, 193)
TRAPHANDLER_NOEC(thdlr194, 194)
TRAPHANDLER_NOEC(thdlr195, 195)
TRAPHANDLER_NOEC(thdlr196, 196)
TRAPHANDLER_NOEC(thdlr197, 197)
TRAPHANDLER_NOEC(thdlr198, 198)
TRAPHANDLER_NOEC(thdlr199, 199)
TRAPHANDLER_NOEC(thdlr200, 200)
TRAPHANDLER_NOEC(thdlr201, 201)
TRAPHANDLER_NOEC(thdlr202, 202)
TRAPHANDLER_NOEC(thdlr203, 203)
TRAPHANDLER_NOEC(thdlr204, 204)
TRAPHANDLER_NOEC(thdlr205, 205)
TRAPHANDLER_NOEC(thdlr206, 206)
TRAPHANDLER_NOEC(thdlr207, 207)
TRAPHANDLER_NOEC(thdlr208, 208)
TRAPHANDLER_NOEC(thdlr209, 209)
TRAPHANDLER_NOEC(thdlr210, 210)
TRAPHANDLER_NOEC(thdlr211, 211)
TRAPHANDLER_NOEC(thdlr212, 212)
TRAPHANDLER_NOEC(thdlr213, 213)
TRAPHANDLER_NOEC(thdlr214, 214)
TRAPHANDLER_NOEC(thdlr215, 215)
TRAPHANDLER_NOEC(thdlr216, 216)
TRAPHANDLER_NOEC(thdlr217, 217)
TRAPHANDLER_NOEC(thdlr218, 218)
TRAPHANDLER_NOEC(thdlr219, 219)
TRAPHANDLER_NOEC(thdlr220, 220)
TRAPHANDLER_NOEC(thdlr221, 221)
TRAPHANDLER_NOEC(thdlr222, 222)
TRAPHANDLER_NOEC(thdlr223, 223)
TRAPHANDLER_NOEC(thdlr224, 224)
TRAPHANDLER_NOEC(thdlr225, 225)
TRAPHANDLER_NOEC(thdlr226, 226)
TRAPHANDLER_NOEC(thdlr227, 227)
TRAPHANDLER_NOEC(thdlr228, 228)
TRAPHANDLER_NOEC(thdlr229, 229)
TRAPHANDLER_NOEC(thdlr230, 230)
TRAPHANDLER_NOEC(thdlr231, 231)
TRAPHANDLER_NOEC(thdlr232, 232)
TRAPHANDLER_NOEC(thdlr233, 233)
TRAPHANDLER_NOEC(thdlr234, 234)
TRAPHANDLER_NOEC(thdlr235, 235)
TRAPHANDLER_NOEC(thdlr236, 236)
TRAPHANDLER_NOEC(thdlr237, 237)
TRAPHANDLER_NOEC(thdlr238, 238)
TRAPHANDLER_NOEC(thdlr239, 239)
TRAPHANDLER_NOEC(thdlr240, 240)
TRAPHANDLER_NOEC(thdlr241, 241)
TRAPHANDLER_NOEC(thdlr242, 242)
TRAPHANDLER_NOEC(thdlr243, 243)
TRAPHANDLER_NOEC(thdlr244, 244)
TRAPHANDLER_NOEC(thdlr245, 245)
TRAPHANDLER_NOEC(thdlr246, 246)
TRAPHANDLER_NOEC(thdlr247, 247)
TRAPHANDLER_NOEC(thdlr248, 248)
TRAPHANDLER_NOEC(thdlr249, 249)
TRAPHANDLER_NOEC(thdlr250, 250)
TRAPHANDLER_NOEC(thdlr251, 251)
TRAPHANDLER_NOEC(thdlr252, 252)
TRAPHANDLER_NOEC(thdlr253, 253)
TRAPHANDLER_NOEC(thdlr254, 254)
TRAPHANDLER_NOEC(thdlr255, 255)

/*
 * Lab 3: Your code here for _alltraps
 */

.globl _alltraps
_alltraps:
	pushl %ds
        pushl %es
	pushal

	movw $GD_KD, %ax
	movw %ax, %ds
	movw %ax, %es 

        pushl %esp  /* trap(%esp) */
        call trap

	/* 
	# Ben: env_pop_tf() done by iret, so never run following code
	# try to comment out following line, make grade ok.
	# for reference xv6 code, we should refine code from env_pop_tf to here.
	addl $4, %esp
	popal
	pop %es
	pop %ds
	addl $8, %esp # trap num and errcode 
	iret
	*/

.data
.globl trap_handlers
trap_handlers:
	.long thdlr0
	.long thdlr1
	.long thdlr2
	.long thdlr3
	.long thdlr4
	.long thdlr5
	.long thdlr6
	.long thdlr7
	.long thdlr8
	.long thdlr9
	.long thdlr10
	.long thdlr11
	.long thdlr12
	.long thdlr13
	.long thdlr14
	.long thdlr15
	.long thdlr16
	.long thdlr17
	.long thdlr18
	.long thdlr19
	.long thdlr20
	.long thdlr21
	.long thdlr22
	.long thdlr23
	.long thdlr24
	.long thdlr25
	.long thdlr26
	.long thdlr27
	.long thdlr28
	.long thdlr29
	.long thdlr30
	.long thdlr31
	.long thdlr32
	.long thdlr33
	.long thdlr34
	.long thdlr35
	.long thdlr36
	.long thdlr37
	.long thdlr38
	.long thdlr39
	.long thdlr40
	.long thdlr41
	.long thdlr42 
	.long thdlr43
	.long thdlr44
	.long thdlr45
	.long thdlr46
	.long thdlr47
	.long thdlr48
	.long thdlr49
	.long thdlr50
	.long thdlr51
	.long thdlr52
	.long thdlr53
	.long thdlr54
	.long thdlr55
	.long thdlr56
	.long thdlr57
	.long thdlr58
	.long thdlr59
	.long thdlr60
	.long thdlr61
	.long thdlr62
	.long thdlr63
	.long thdlr64
	.long thdlr65
	.long thdlr66
	.long thdlr67
	.long thdlr68
	.long thdlr69
	.long thdlr70
	.long thdlr71
	.long thdlr72
	.long thdlr73
	.long thdlr74
	.long thdlr75
	.long thdlr76
	.long thdlr77
	.long thdlr78
	.long thdlr79
	.long thdlr80
	.long thdlr81
	.long thdlr82
	.long thdlr83
	.long thdlr84
	.long thdlr85
	.long thdlr86
	.long thdlr87
	.long thdlr88
	.long thdlr89
	.long thdlr90
	.long thdlr91
	.long thdlr92
	.long thdlr93
	.long thdlr94
	.long thdlr95
	.long thdlr96
	.long thdlr97
	.long thdlr98
	.long thdlr99
	.long thdlr100
	.long thdlr101
	.long thdlr102
	.long thdlr103
	.long thdlr104
	.long thdlr105
	.long thdlr106
	.long thdlr107
	.long thdlr108
	.long thdlr109
	.long thdlr110
	.long thdlr111
	.long thdlr112
	.long thdlr113
	.long thdlr114
	.long thdlr115
	.long thdlr116
	.long thdlr117
	.long thdlr118
	.long thdlr119
	.long thdlr120
	.long thdlr121
	.long thdlr122
	.long thdlr123
	.long thdlr124
	.long thdlr125
	.long thdlr126
	.long thdlr127
	.long thdlr128
	.long thdlr129
	.long thdlr130
	.long thdlr131
	.long thdlr132
	.long thdlr133
	.long thdlr134
	.long thdlr135
	.long thdlr136
	.long thdlr137
	.long thdlr138
	.long thdlr139
	.long thdlr140
	.long thdlr141
	.long thdlr142
	.long thdlr143
	.long thdlr144
	.long thdlr145
	.long thdlr146
	.long thdlr147
	.long thdlr148
	.long thdlr149
	.long thdlr150
	.long thdlr151
	.long thdlr152
	.long thdlr153
	.long thdlr154
	.long thdlr155
	.long thdlr156
	.long thdlr157
	.long thdlr158
	.long thdlr159
	.long thdlr160
	.long thdlr161
	.long thdlr162
	.long thdlr163
	.long thdlr164
	.long thdlr165
	.long thdlr166
	.long thdlr167
	.long thdlr168
	.long thdlr169
	.long thdlr170
	.long thdlr171
	.long thdlr172
	.long thdlr173
	.long thdlr174
	.long thdlr175
	.long thdlr176
	.long thdlr177
	.long thdlr178
	.long thdlr179
	.long thdlr180
	.long thdlr181
	.long thdlr182
	.long thdlr183
	.long thdlr184
	.long thdlr185
	.long thdlr186
	.long thdlr187
	.long thdlr188
	.long thdlr189
	.long thdlr190
	.long thdlr191
	.long thdlr192
	.long thdlr193
	.long thdlr194
	.long thdlr195
	.long thdlr196
	.long thdlr197
	.long thdlr198
	.long thdlr199
	.long thdlr200
	.long thdlr201
	.long thdlr202
	.long thdlr203
	.long thdlr204
	.long thdlr205
	.long thdlr206
	.long thdlr207
	.long thdlr208
	.long thdlr209
	.long thdlr210
	.long thdlr211
	.long thdlr212
	.long thdlr213
	.long thdlr214
	.long thdlr215
	.long thdlr216
	.long thdlr217
	.long thdlr218
	.long thdlr219
	.long thdlr220
	.long thdlr221
	.long thdlr222
	.long thdlr223
	.long thdlr224
	.long thdlr225
	.long thdlr226
	.long thdlr227
	.long thdlr228
	.long thdlr229
	.long thdlr230
	.long thdlr231
	.long thdlr232
	.long thdlr233
	.long thdlr234
	.long thdlr235
	.long thdlr236
	.long thdlr237
	.long thdlr238
	.long thdlr239
	.long thdlr240
	.long thdlr241
	.long thdlr242
	.long thdlr243
	.long thdlr244
	.long thdlr245
	.long thdlr246
	.long thdlr247
	.long thdlr248
	.long thdlr249
	.long thdlr250
	.long thdlr251
	.long thdlr252
	.long thdlr253
	.long thdlr254
	.long thdlr255
