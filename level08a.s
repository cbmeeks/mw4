                processor 6502

                include define.s
                include extern.s

                org map
                incbin bg/level08.map

                org randomacttbl
                incbin bg/level08.lvr

                org bganimcode
                inc bganimcounter
                lda bganimcounter
                and #$03
                bne bganimdone
                ldy #$02
bganimloop:     ldx chars+244*8,y
                lda chars+245*8,y
                sta chars+244*8,y
                txa
                sta chars+245*8,y
                dey
                bpl bganimloop
bganimdone:     lda bganimcounter
                and #$0f
                bne bganimdone2
                lda chars+235*8
                eor #%00100000
                sta chars+235*8
bganimdone2:    rts

bganimcounter:  dc.b 0

                org blocks
                incbin bg/level08.blk

                org blkcoltbl
                incbin bg/level08.blc

                org charinfo
                incbin bg/level08.chi
