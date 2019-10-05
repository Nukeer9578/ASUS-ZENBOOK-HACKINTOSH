#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "hack", "atk", 0)
{
#endif
    External (_SB.ATKP, IntObj)
    External (_SB.ATKD, DeviceObj)
    External (_SB.ATKD.IANE, MethodObj)
    External (_SB.ATKD.GKBL, MethodObj)
    External (_SB.ATKD.SKBV, MethodObj)
    External (_SB.KBLV, FieldUnitObj)
    External (_SB.PCI0.LPCB.EC0, DeviceObj)
    External (_SB.PCI0.LPCB.EC0.WRAM, MethodObj)
    External (_SB.PCI0.LPCB.EC0.ST9E, MethodObj)
    Scope (_SB.ATKD)
    {
    
        Method (IANE, 1)
            {
                IANQ (Arg0)
                Notify (ATKD, 0xFF)
            }

        Method (GKBL, 1)
        {
                If (LEqual (Arg0, 0xFF))
                {
                    Return (BOFF)
                }

                Return (KBLV)
        }

        Method (SKBV, 1)
        {
                Store (Divide (Arg0, 0x10, ), KBLV)
                ^^PCI0.LPCB.EC0.WRAM (0x04B1, Arg0)
                Return (Arg0)
        }

    }
    
    Scope (_SB.PCI0.LPCB.EC0)
    {
        Method (_Q0A, 0) // F1 key
        {
            If (^^^^ATKP)
            {
                ^^^^ATKD.IANE (0x5E)
            }
        }
        
        Method (_Q0B, 0) // F2 key
        {
            If (^^^^ATKP)
            {
                ^^^^ATKD.IANE (0x7D)
            }
        }
        
        Method (_Q0E, 0) // F5 key
        {
            If (^^^^ATKP)
            {
                ^^^^ATKD.IANE (0x20)
            }
        }

        Method (_Q0F, 0) // F6 key
        {
            If (^^^^ATKP)
            {
                ^^^^ATKD.IANE (0x10)
            }
        }
        
        Method (_Q11, 0) // F8 key
        {
            If (^^^^ATKP)
            {
                ^^^^ATKD.IANE (0x61)
            }
        }
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
