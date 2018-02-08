From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Slow HVM boot time, was "HVM boot time optimization"
Date: Thu, 8 Feb 2018 08:31:40 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1802080826470.15787@sstabellini-ThinkPad-X260>
References: <CABLtV0BqS_Y6oMt8TyCx55Nf9mB=-L7To+xY2on76p+1KDyXSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1892710487-1518107216=:15787"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=tjqy=fc=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ejp6t-0001fV-2h
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2018 16:31:43 +0000
In-Reply-To: <CABLtV0BqS_Y6oMt8TyCx55Nf9mB=-L7To+xY2on76p+1KDyXSQ@mail.gmail.com>
Content-ID: <alpine.DEB.2.10.1802080827420.15787@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Yessine Daoud <da.yessine@gmail.com>
Cc: anthony.perard@citrix.com, xen-devel@lists.xenproject.org, sstabellini@kernel.org, wei.liu2@citrix.com, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1892710487-1518107216=:15787
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1802080827421.15787@sstabellini-ThinkPad-X260>

CC'ing xen-devel and a few relevant people

On Thu, 8 Feb 2018, Yessine Daoud wrote:
> Dear Sir,
> I need your help please.
> 
> I am using a direct kernel boot (HVM guest) with kernel + ramdisk.
> At boot, seabios is bloqued about 20 seconds (or more) at the following state:
> 
> (d4) RamSizeOver4G: 0x0000000000000000 [cmos]
> (d4) boot order:
> (d4) 1: /rom@genroms/linuxboot.bin
> (d4) Found 4 PCI devices (max PCI bus is 00)
> (d4) Allocated Xen hypercall page at ffff000
> (d4) Detected Xen v4.9-unstable
> (d4) xen: copy BIOS tables...
> (d4) Copying SMBIOS entry point from 0x00010020 to 0x000f69b0
> (d4) Copying MPTABLE from 0xfc001170/fc001180 to 0x000f68b0
> (d4) Copying PIR from 0x00010040 to 0x000f6830
> (d4) CPU Mhz=1335
> (d4) Scan for VGA option rom
> (d4) ATA controller 1 at 1f0/3f4/c100 (irq 14 dev 9)
> (d4) ATA controller 2 at 170/374/c108 (irq 15 dev 9)
> (d4) Found 0 lpt ports
> (d4) Found 1 serial ports
> (d4) PS2 keyboard initialized
> (d4) All threads complete.
> (d4) Scan for option roms
> (d4) Running option rom at c000:0003
> (d4) Searching bootorder for: /rom@genroms/linuxboot.bin
> (d4) Searching bootorder for: HALT
> (d4) Space available for UMB: c0800-ec800, f61d0-f67f0
> (d4) Returned 258048 bytes of ZoneHigh
> (d4) e820 map has 6 items:
> (d4)   0: 0000000000000000 - 000000000009fc00 = 1 RAM
> (d4)   1: 000000000009fc00 - 00000000000a0000 = 2 RESERVED
> (d4)   2: 00000000000f0000 - 0000000000100000 = 2 RESERVED
> (d4)   3: 0000000000100000 - 000000000ffff000 = 1 RAM
> (d4)   4: 000000000ffff000 - 0000000010000000 = 2 RESERVED
> (d4)   5: 00000000fc000000 - 0000000100000000 = 2 RESERVED
> (d4) enter handle_19:
> (d4)   NULL
> (d4) Booting from ROM...
> (d4) Booting from c000:00
> 
> 
> Then (after 20 seconds) the kernel starts booting.
> Any idea about this behavior?

I am guessing one of the ROMs take a long time to run. It might be
waiting for a timeout, like ipxe. Does anybody know about this issue?
--8323329-1892710487-1518107216=:15787
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1892710487-1518107216=:15787--
