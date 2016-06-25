/* 
 * CS:APP Data Lab 
 * 
 * <Please put your name and userid here>
 * 
 * bits.c - Source file with your solutions to the Lab.
 *          This is the file you will hand in to your instructor.
 *
 * WARNING: Do not include the <stdio.h> header; it confuses the dlc
 * compiler. You can still use printf for debugging without including
 * <stdio.h>, although you might get a compiler warning. In general,
 * it's not good practice to ignore compiler warnings, but in this
 * case it's OK.  
 */

#if 0
/*
 * Instructions to Students:
 *
 * STEP 1: Read the following instructions carefully.
 */

You will provide your solution to the Data Lab by
editing the collection of functions in this source file.

INTEGER CODING RULES:
 
  Replace the "return" statement in each function with one
  or more lines of C code that implements the function. Your code 
  must conform to the following style:
 
  int Funct(arg1, arg2, ...) {
      /* brief description of how your implementation works */
      int var1 = Expr1;
      ...
      int varM = ExprM;

      varJ = ExprJ;
      ...
      varN = ExprN;
      return ExprR;
  }

  Each "Expr" is an expression using ONLY the following:
  1. Integer constants 0 through 255 (0xFF), inclusive. You are
      not allowed to use big constants such as 0xffffffff.
  2. Function arguments and local variables (no global variables).
  3. Unary integer operations ! ~
  4. Binary integer operations & ^ | + << >>
    
  Some of the problems restrict the set of allowed operators even further.
  Each "Expr" may consist of multiple operators. You are not restricted to
  one operator per line.

  You are expressly forbidden to:
  1. Use any control constructs such as if, do, while, for, switch, etc.
  2. Define or use any macros.
  3. Define any additional functions in this file.
  4. Call any functions.
  5. Use any other operations, such as &&, ||, -, or ?:
  6. Use any form of casting.
  7. Use any data type other than int.  This implies that you
     cannot use arrays, structs, or unions.

 
  You may assume that your machine:
  1. Uses 2s complement, 32-bit representations of integers.
  2. Performs right shifts arithmetically.
  3. Has unpredictable behavior when shifting an integer by more
     than the word size.

EXAMPLES OF ACCEPTABLE CODING STYLE:
  /*
   * pow2plus1 - returns 2^x + 1, where 0 <= x <= 31
   */
  int pow2plus1(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     return (1 << x) + 1;
  }

  /*
   * pow2plus4 - returns 2^x + 4, where 0 <= x <= 31
   */
  int pow2plus4(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     int result = (1 << x);
     result += 4;
     return result;
  }

FLOATING POINT CODING RULES

For the problems that require you to implent floating-point operations,
the coding rules are less strict.  You are allowed to use looping and
conditional control.  You are allowed to use both ints and unsigneds.
You can use arbitrary integer and unsigned constants.

You are expressly forbidden to:
  1. Define or use any macros.
  2. Define any additional functions in this file.
  3. Call any functions.
  4. Use any form of casting.
  5. Use any data type other than int or unsigned.  This means that you
     cannot use arrays, structs, or unions.
  6. Use any floating point data types, operations, or constants.


NOTES:
  1. Use the dlc (data lab checker) compiler (described in the handout) to 
     check the legality of your solutions.
  2. Each function has a maximum number of operators (! ~ & ^ | + << >>)
     that you are allowed to use for your implementation of the function. 
     The max operator count is checked by dlc. Note that '=' is not 
     counted; you may use as many of these as you want without penalty.
  3. Use the btest test harness to check your functions for correctness.
  4. Use the BDD checker to formally verify your functions
  5. The maximum number of ops for each function is given in the
     header comment for each function. If there are any inconsistencies 
     between the maximum ops in the writeup and in this file, consider
     this file the authoritative source.

/*
 * STEP 2: Modify the following functions according the coding rules.
 * 
 *   IMPORTANT. TO AVOID GRADING SURPRISES:
 *   1. Use the dlc compiler to check that your solutions conform
 *      to the coding rules.
 *   2. Use the BDD checker to formally verify that your solutions produce 
 *      the correct answers.
 */


#endif
/* Copyright (C) 1991-2014 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <http://www.gnu.org/licenses/>.  */
/* This header is separate from features.h so that the compiler can
   include it implicitly at the start of every compilation.  It must
   not itself include <features.h> or any other header that includes
   <features.h> because the implicit include comes before any feature
   test macros that may be defined in a source file before it first
   explicitly includes a system header.  GCC knows the name of this
   header in order to preinclude it.  */
/* glibc's intent is to support the IEC 559 math functionality, real
   and complex.  If the GCC (4.9 and later) predefined macros
   specifying compiler intent are available, use them to determine
   whether the overall intent is to support these features; otherwise,
   presume an older compiler has intent to support these features and
   define these macros by default.  */
/* wchar_t uses ISO/IEC 10646 (2nd ed., published 2011-03-15) /
   Unicode 6.0.  */
/* We do not support C11 <threads.h>.  */
/* 
 *   lsbZero - set 0 to the least significant bit of x 
 *   Example: lsbZero(0x87654321) = 0x87654320
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 5
 *   Rating: 1
 */
int lsbZero(int x) {
// 将最后一位与0按位与，其余与1按位与，
// 则得到最低有效位置零其余保持的效果
	int one = 0x01;
	return x & ~one;    // x & 0xfffffffe
}
/* 
 * byteNot - bit-inversion to byte n from word x  
 *   Bytes numbered from 0 (LSB) to 3 (MSB)
 *   Examples: getByteNot(0x12345678,1) = 0x1234A978
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 6
 *   Rating: 2
 */
int byteNot(int x, int n) {
// 将第n个字节与11异或，其余字节与00异或，
// 则第n个字节取反，其余字节不变
	int ff = 0xff;
	int move = n << 3;       // move = n * 8;
	return x ^ (ff << move); // 将第n个字节的内容与11异或
}
/* 
 *   byteXor - compare the nth byte of x and y, if it is same, return 0, if not, return 1

 *   example: byteXor(0x12345678, 0x87654321, 1) = 1

 *			  byteXor(0x12345678, 0x87344321, 2) = 0
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 2 
 */
int byteXor(int x, int y, int n) {
// 将x与y的第n个字节与11按位与，其余与00按位与
// 由此取到x与y的第n个字节，将其按位异或，再两次逻辑非
// 则相等返回0，不等返回1
	int one = 0xff;
	int move = n << 3;   // move = n * 8;
	one = one << move;   // 第n个字节置为11
	return !!((x & one)^(y & one)); 
}
/* 
 *   logicalAnd - x && y
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 3 
 */
int logicalAnd(int x, int y) {
// 两次逻辑非将非零数变为1,0变为0
// 再将得到的0、1进行按位与，
// 有一个为零则得到0,否则为1
	return (!!x) & (!!y);
}
/* 
 *   logicalOr - x || y
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 3 
 */
int logicalOr(int x, int y) {
// 两次逻辑非将非零数变为1,0变为0
// 再将得到的0、1进行按位或，
// 有一个非零则得到1,否则为0
	return (!!x) | (!!y);
}
/* 
 * rotateLeft - Rotate x to the left by n
 *   Can assume that 0 <= n <= 31
 *   Examples: rotateLeft(0x87654321,4) = 0x76543218
 *   Legal ops: ~ & ^ | + << >> !
 *   Max ops: 25
 *   Rating: 3 
 */
int rotateLeft(int x, int n) {
	int firsone = 1 << 31;       // MSB为1
	int minus_n = n + ~1 + 1;    // n-1
	int highnx = x & (firsone >> minus_n); // 最高的n位
	int allminn = 32 + ~n;       // 32-n
	int tmp = ~(firsone >> allminn);       // 低n位为1，其余为0
	highnx = (highnx >> (allminn + 1)) & tmp;  // 将高n位移至低n位并使其余为0
	// 若n为0，则返回x
	// 否则，返回x左移n位并在最低n位补上高n位内容后的值
	return (((~!n) + 1) & x) | (((~!!n) + 1) & (x << n | highnx)); 
}
/*
 * parityCheck - returns 1 if x contains an odd number of 1's
 *   Examples: parityCheck(5) = 0, parityCheck(7) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 4
 */
int parityCheck(int x) {
// 每次折半按位异或，两个1异或得0（即偶数个1）
// 最终留下一位若是0则说明有偶数个1在异或过程中都抵消得到0
// 否则说明1个数为奇数
	x ^= x >> 16;  // 高16位与低16位按位异或
	x ^= x >> 8;   // 所得16位中高低8位按位异或
	x ^= x >> 4;   // 所得8位中高低4位按位异或
	x ^= x >> 2;   // 所得4位中高低2位按位异或
	x ^= x >> 1;   // 所得2位中高低位按位异或
	return x & 0x01;   // 最终的LSB即为结果
}
/*
 * mul2OK - Determine if can compute 2*x without overflow
 *   Examples: mul2OK(0x30000000) = 1
 *             mul2OK(0x40000000) = 0
 *         
 *   Legal ops: ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 2
 */
int mul2OK(int x) {
// 若乘2后的符号位与原符号位不同，则为溢出
// 乘2后的值与原数按位异或，带符号右移，得到全0或全1
	int flag = (x ^ (x << 1)) >> 31;
// 全1即符号位不同，溢出，再+1即为结果0
// 全0即符号位相同，未溢出，再+1即为结果1
	return flag + 1; 
}
/*
 * mult3div2 - multiplies by 3/2 rounding toward 0,
 *   Should exactly duplicate effect of C expression (x*3/2),
 *   including overflow behavior.
 *   Examples: mult3div2(11) = 16
 *             mult3div2(-9) = -13
 *             mult3div2(1073741824) = -536870912(overflow)
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 2
 */
int mult3div2(int x) {
// 只有在所得为负数且LBP为1(除2后应有0.5)的情况下需要再+1
	int y = (x << 1) + x;               // y = x * 3
	int flag = (y >> 31) & 1;           // 获取符号位
	int zerobit = x & 1;                // 取最低有效位
	return (y >> 1) + (flag & zerobit); // 所得为负数且LBP为1则加1，否则返回x*3/2的值
}
/* 
 * subOK - Determine if can compute x-y without overflow
 *   Example: subOK(0x80000000,0x80000000) = 1,
 *            subOK(0x80000000,0x70000000) = 0, 
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 3
 */
int subOK(int x, int y) {
// 只有负数减正数得正数 和 正数减负数得负数才是溢出
// 即被减数符号与减数、差的符号都不同才是溢出
	int signx = (x >> 31) & 1;      // 获取x符号位
	int signy = (y >> 31) & 1;      // 获取y符号位
	int signsub = ((x + ~y + 1) >> 31) & 1;   // 获取x-y的符号
// 若被减数和减数、差的符号都不同，则按位与后为1.逻辑非后得到结果0
// 反之一样
	return !((signx ^ signy) & (signx ^ signsub));  
}
/* 
 * absVal - absolute value of x
 *   Example: absVal(-1) = 1.
 *   You may assume -TMax <= x <= TMax
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 10
 *   Rating: 4
 */
int absVal(int x) {
	int sign = x >> 31;   // 获取符号位
	return ((~sign) & x) | (sign & (~x + 1)); // 为正数则返回x，为负数则返回（~x+1）即绝对值
}
/* 
 * float_abs - Return bit-level equivalent of absolute value of f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representations of
 *   single-precision floating point values.
 *   When argument is NaN, return argument..
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 10
 *   Rating: 2
 */
unsigned float_abs(unsigned uf) {
	unsigned sign_zero = 0x7fffffff; // 符号位为0，其余为1
	unsigned NaN_bottom = 0x7f800000; // 阶码全1，尾数为0
	unsigned uf_abs = uf & sign_zero; // 符号位为0
	if (uf_abs > NaN_bottom) {  
		// 阶码全1，尾数非0，则为NaN
		// 此时返回原参数
		return uf;
	}
	else {
		// 否则返回绝对值
		return uf_abs;  
	}
}
/* 
 * float_f2i - Return bit-level equivalent of expression (int) f
 *   for floating point argument f.
 *   Argument is passed as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point value.
 *   Anything out of range (including NaN and infinity) should return
 *   0x80000000u.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
int float_f2i(unsigned uf) {
	int sign = (uf >> 31) & 1;  // 获取符号位
	int exp = (uf & 0x7f800000) >> 23;  // 获取阶码
	int num = (uf | 0x00800000) & 0x00ffffff; // 获取隐藏位1及尾数
	if (exp < 127) {
		// 阶码小于127则小于1.xxx乘2^(-1),化成整数则为0
    		return 0; 
  	}
	else if (exp == 0xff || exp > 158) {
		// 阶码全1（NaN and infinity）或超出整数范围则返回0x80000000u
    		return 0x80000000u;
  	}
	else {
		if (exp > 150) {
			// 若exp-127 > 23,则还需在原基础上再左移exp-150位
			num <<= (exp - 150);
		}
		else if (exp < 150) {
			// 若exp-127 < 23,则还需在原基础上再右移150-exp位
			num >>= (150 - exp);
    		}
    		if (sign == 1) {
    			// 若为负数则取负值
    			num = (~num) + 1;
    		}
    		return num; 
	}
}
