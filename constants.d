module constants;

immutable BAM_MAGIC = "BAM\1";
immutable BAI_MAGIC = "BAI\1";

immutable ubyte BAM_SI1 = 66;
immutable ubyte BAM_SI2 = 67;

immutable BGZF_MAGIC = 0x04_08_8B_1F; // little endian

immutable ubyte[16] BLOCK_HEADER_START = 
    [ 31, 139,   8,   4,  // BGZF magic
       0,   0,   0,   0,  // GZIP modification time
       0,                 // GZIP extra flags
     255,                 // GZIP OS identifier
       6,   0,            // GZIP extra length == 6 (LE)
      66,  67,            // Subfield 'BC'
       2,   0];           // Subfield length (holds 1 ushort)

// BGZF block header length in bytes.
// Block header holds BLOCK_HEADER_START + block size (ushort)
immutable BLOCK_HEADER_LENGTH = BLOCK_HEADER_START.length + ushort.sizeof;

// BGZF footer holds CRC32 and size of decompressed block.
immutable BLOCK_FOOTER_LENGTH = uint.sizeof + uint.sizeof;

immutable BGZF_MAX_BLOCK_SIZE = 65536;
immutable BGZF_BLOCK_SIZE = 0xFF00; 

immutable ubyte[28] BAM_EOF = 
    [31, 139, 8, 4, 
        0, 0, 0, 0, 
                 0, 
               255, 
              6, 0, 
            66, 67, 
              2, 0, 
             27, 0, 
              3, 0, 
        0, 0, 0, 0, 
        0, 0, 0, 0];

immutable BAI_MAX_BIN_ID = 37449;
immutable BAI_MAX_NONLEAF_BIN_ID = 4680;
immutable BAI_LINEAR_INDEX_WINDOW_SIZE = 16384;
