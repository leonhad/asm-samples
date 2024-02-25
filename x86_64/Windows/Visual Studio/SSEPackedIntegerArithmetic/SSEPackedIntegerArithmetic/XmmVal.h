#pragma once

#include "MiscDef.h"

union XmmVal
{
	// mmx registers are 64-bit in length, and can therefor hold 8
	// 8-bit values.
	Int8	i8[16];
	// mmx registers are 64-bit in length, and can therefor hold 4
	// 16-bit values.
	Int16	i16[8];
	// mmx registers are 64-bit in length, and can therefor hold 2
	// 32-bit values.
	Int32	i32[4];
	// mmx registers are 64-bit in length, and can therefor hold 1
	// 64-bit values.
	Int64	i64[2];

	// mmx registers are 64-bit in length, and can therefor hold 8
	// 8-bit values.
	Uint8	u8[16];
	// mmx registers are 64-bit in length, and can therefor hold 4
	// 16-bit values.
	Uint16	u16[8];
	// mmx registers are 64-bit in length, and can therefor hold 2
	// 32-bit values.
	Uint32	u32[4];
	// mmx registers are 64-bit in length, and can therefor hold 1
	// 64-bit values.
	Uint64	u64[2];

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

	char* ToString_r32(char* s, size_t len, bool upper_half);
	char* ToString_r64(char* s, size_t len, bool upper_half);
};
