.code16
.intel_syntax noprefix
.text
.org 0x0

.global main

main:
jmp
  nop

bootsector:
 iOEM:          .ascii "TFLP_1.0"    # OEM String
 iSectSize:     .word  0x200         # bytes per sector
 iClustSize:    .byte  1             # sectors per cluster
 iResSect:      .word  1             # #of reserved sectors
 iFatCnt:       .byte  2             # #of FAT copies
 iRootSize:     .word  224           # size of root directory
 iTotalSect:    .word  2880          # total # of sectors if over 32 MB
 iMedia:        .byte  0xF0          # media Descriptor
 iFatSize:      .word  9             # size of each FAT
 iTrackSect:    .word  9             # sectors per track
 iHeadCnt:      .word  2             # number of read-write heads
 iHiddenSect:   .int   0             # number of hidden sectors
 iSect32:       .int   0             # # sectors for over 32 MB
 iBootDrive:    .byte  0             # holds drive that the boot sector came from
 iReserved:     .byte  0             # reserved, empty
 iBootSign:     .byte  0x29          # extended boot sector signature
 iVolID:        .ascii "seri"        # disk serial
 acVolumeLabel: .ascii "Tumble_FLP " # volume label
 acFSType:      .ascii "FAT16   "    # file system type

.fill (510-(.-main)), 1, 0  # Pad with nulls up to 510 bytes (excl. boot magic)
BootMagic:  .int 0xAA55     # magic word for BIOS