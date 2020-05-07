#pragma once

#include "MiscDef.h"

union MmxVal
{
	// mmx registers are 64-bit in length, and can therefor hold 8
	// 8-bit values.
	Int8	i8[8];
	// mmx registers are 64-bit in length, and can therefor hold 4
	// 16-bit values.
	Int16	i16[4];
	// mmx registers are 64-bit in length, and can therefor hold 2
	// 32-bit values.
	Int32	i32[2];
	// mmx registers are 64-bit in length, and can therefor hold 1
	// 64-bit values.
	Int64	i64;

	// mmx registers are 64-bit in length, and can therefor hold 8
	// 8-bit values.
	Uint8	u8[8];
	// mmx registers are 64-bit in length, and can therefor hold 4
	// 16-bit values.
	Uint16	u16[4];
	// mmx registers are 64-bit in length, and can therefor hold 2
	// 32-bit values.
	Uint32	u32[2];
	// mmx registers are 64-bit in length, and can therefor hold 1
	// 64-bit values.
	Uint64	u64;

	char* ToString_i8(char* s, size_t len);
	char* ToString_i16(char* s, size_t len);
	char* ToString_i32(char* s, size_t len);
	char* ToString_i64(char* s, size_t len);

	char* ToString_u8(char* s, size_t len);
	char* ToString_u16(char* s, size_t len);
	char* ToString_u32(char* s, size_t len);
	char* ToString_u64(char* s, size_t len);

	char* ToString_x8(char* s, size_t len);
	char* ToString_x16(char* s, size_t len);
	char* ToString_x32(char* s, size_t len);
	char* ToString_x64(char* s, size_t len);
};

enum MmxAddOp : unsigned int
{
	// packad byte addition with wraparound.
	paddb,
	// packed byte addition with signed saturation.
	paddsb,
	// packed byte addition with unsigned saturation.
	paddusb,
	// packad word addition with wraparound.
	paddw,
	// packad word addition with signed saturation.
	paddsw,
	// packad word addition with unsigned saturation.
	paddusw,
	// packed double word addition with wraparound.
	paddd
};

extern "C" MmxVal MmxAdd(MmxVal a, MmxVal b, MmxAddOp op);

enum MmxShiftOp : unsigned int
{
	// shift left logical word
	psllw,
	// shift right logical word
	psrlw,
	// shift right arithmetic word
	psraw,
	// shift left logical dword
	pslld,
	// shift right logical dword
	psrld,
	// shift right arithmetic dword
	psrad
};

extern "C" bool MmxShifter(MmxVal a, MmxShiftOp shift_op, int count, MmxVal * b);
