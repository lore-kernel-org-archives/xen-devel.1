Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A220FF8869
	for <xen-devel@archiver.kernel.org>; Mon, 27 Apr 2026 16:11:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1295066.1571774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHOYY-0004sD-6p; Mon, 27 Apr 2026 16:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295066.1571774; Mon, 27 Apr 2026 16:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHOYY-0004s6-3n; Mon, 27 Apr 2026 16:11:34 +0000
Received: by outflank-mailman (input) for mailman id 1295066;
 Mon, 27 Apr 2026 16:11:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wHOYU-0004Rn-R2
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 16:11:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHOYT-005zON-Mx
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 18:11:29 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 69ef8ab0-5cb7-0a2a0a5109dd-0a2a4504bcd2-2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 18:11:29 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <mfo@igalia.com>)
 id 69ef8ab0-1dec-0a2a45040019-d561b3389644-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 18:11:29 +0200
Received: from 186-249-145-131.shared.desktop.com.br ([186.249.145.131]
 helo=[192.168.1.66]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wHOY5-00305I-Tl; Mon, 27 Apr 2026 18:11:05 +0200
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20170329 header.d=igalia.com header.i="@igalia.com" header.h="Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=gy93+YTuH8qqT2Cs7yYAisUzlA9SSxiG/wPDUCdgZNM=; b=s4dS23AEjRC4u6ydWlDMr7Wstw
	vWMSp8m3hwPPjm4zhbYwJjl0SqWK2bUyKpDOdxO6s7FFyT0L5gjMM4Un6O6o1s6pyuhgHI5rq8yjD
	lUbaOJYrQsU+hEUNVIo/jJQUXvRKxi5a1rJY4mw+b/RKzFdkr7rd7IIrFOWoKy5HRgzdBPTrDTHTo
	VN+h0tzCXpywZ6JRunVYUvNDGqNUcl45iNboQv3iB597lDFn5nsSnIKh6/xhlz7rMwKo/RGcfHODx
	8upsoNcOJJR/YBvA8b2Nm3kPXVAZmdEsnGtUbA1VyEa+yX4wrevzoXYxb9UOwsUkYt8y3uHDi+VNl
	CyL/+SnA==;
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Subject: [PATCH v2 0/3] x86/pvh: fix unbootable VMs again (PVH + KASAN)
Date: Mon, 27 Apr 2026 13:10:56 -0300
Message-Id: <20260427-pvh-kasan-inline-v2-0-2c57b8dcff6a@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJCK72kC/32NQQrCMBBFr1Jm7Ugzhoa68h7SRYyTZrCmJZGgl
 N7d2AO4fA/++ytkTsIZzs0KiYtkmWMFOjTggo0jo9wrA7XUtZoIlxLwYbONKHGSyNixt84Yr25
 koM6WxF7ee/I6VA6SX3P67A9F/eyfWFHYouFO9fqktevpIqOdxB7d/IRh27YvLI8rLrEAAAA=
X-Change-ID: 20260422-pvh-kasan-inline-6efac77f1b27
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-purgate-ID: tlsNG-ebf023/1777306289-297793FF-18E73E25/0/0
X-purgate-type: clean
X-purgate-size: 5611

The issue of unbootable VMs with CONFIG_PVH due to CONFIG_KASAN is back.

Booting directly from vmlinux (instead of bzImage) now fails with gcc-14/15
(but works with gcc-12/13) if CONFIG_KASAN_GENERIC is set, on Ubuntu 25.10.

The PVH code is required/supposed not to hit the KASAN memory access check
in the kernel entry point as KASAN has not yet been setup, or an exception
is hit and the boot fails.

This was previously described and addressed with __builtin_mem{cmp,set}():
- commit 661362e3dcab ("xen, pvh: fix unbootable VMs (PVH + KASAN - AMD_MEM_ENCRYPT)")
- commit 416a33c9afce ("x86/cpu: fix unbootable VMs by inlining memcmp() in hypervisor_cpuid_base()")
- commit fbe5a6dfe492 ("xen, pvh: fix unbootable VMs by inlining memset() in xen_prepare_pvh()")

However, even with __builtin the compiler may decide to use the out of line
function instead of the inline implementation. So, that does not really fix
the issue unconditionally, as it's being seen (details below).

In order to address this, it's required to switch to inline implementations
that do not depend on the compiler.

There's such a memset in <asm/string.h> and memcmp in 'boot/string.c', now
exposed in <asm/string.h> too. Use them instead of builtins in PVH entry.

Testing:

- Booting from vmlinux (fixed) and bzImage (still works) using
  allnoconfig + CONFIG_PVH + CONFIG_KASAN with gcc-12/13/14/15.

- Building allyesconfig (check for issues with <asm/string.h>).

Details/Debugging:

- Only CONFIG_PVH (works):

  make allnoconfig
  ./scripts/config \
    -e 64BIT -e HYPERVISOR_GUEST -e PVH \
    -e SERIAL_8250 -e SERIAL_8250_CONSOLE
  make olddefconfig
  make -j$(nproc) vmlinux

  qemu-system-x86_64 \
    -accel kvm -nodefaults -nographic -serial stdio \
    -kernel vmlinux -append 'console=ttyS0'
  ...
  SeaBIOS (version ...)
  Booting from ROM...
  Linux version ...
  ...
  <Ctrl-C>

- With CONFIG_KASAN (fails)
  
  ./scripts/config -e KASAN
  make olddefconfig
  make -j$(nproc) vmlinux

  qemu-system-x86_64 \
    -accel kvm -nodefaults -nographic -serial stdio \
    -kernel vmlinux -append 'console=ttyS0'
  ...
  SeaBIOS (version ...)
  Booting from ROM...
  <QEMU reboot loop, flashing the text above>

- Debugging:

  Enable debug info and rebuild.

  QEMU: enable and wait for GDB, stop rebooting, remain running.

  qemu-system-x86_64 \
    -s -S -no-reboot -no-shutdown \
    <other options>

  gdb vmlinux
  (gdb) target remote localhost:1234
  ...
  (gdb) c
  ...
  Thread 2 received signal SIGQUIT, Quit.
  ...
  (gdb) info threads
    Id   Target Id                    Frame
    1    Thread 1.1 (CPU#0 [running]) bytes_is_nonzero (
      start=0xfffffbfff031eebe <error: Cannot access memory at address 0xfffffbfff031eebe>, size=1)
      at .../linux/mm/kasan/generic.c:98
  * 2    Thread 1.2 (CPU#1 [halted ]) 0x00000000000fd0a9 in ?? ()
  ...
  (gdb) thr 1
  ...
  (gdb) bt
  #0  bytes_is_nonzero (start=0xfffffbfff031eebe <error: Cannot access memory at address 0xfffffbfff031eebe>, size=1)
      at .../linux/mm/kasan/generic.c:98
  #1  memory_is_nonzero (start=0xfffffbfff031eebe, end=0xfffffbfff031eebf) at .../linux/mm/kasan/generic.c:115
  #2  memory_is_poisoned_n (addr=0xffffffff818f75f0, size=8) at .../linux/mm/kasan/generic.c:140
  #3  memory_is_poisoned (addr=0xffffffff818f75f0, size=8) at .../linux/mm/kasan/generic.c:172
  #4  check_region_inline (addr=0xffffffff818f75f0, size=8, write=false, ret_ip=18446744071585002062)
      at .../linux/mm/kasan/generic.c:191
  #5  kasan_check_range (addr=addr@entry=0xffffffff818f75f0, size=size@entry=8, write=write@entry=false,
      ret_ip=18446744071585002062) at .../linux/mm/kasan/generic.c:200
  #6  0xffffffff813eb283 in __asan_loadN (addr=addr@entry=0xffffffff818f75f0, size=size@entry=8)
      at .../linux/mm/kasan/generic.c:278
  #7  0xffffffff815df24e in memcmp (cs=cs@entry=0xffffffff818f75f0, ct=ct@entry=0x1be2fe4, count=<optimized out>,
      count@entry=12) at .../linux/lib/string.c:683
  #8  0xffffffff81ba2323 in cpuid_base_hypervisor (sig=0xffffffff818f75f0 "XenVMMXenVMM", leaves=2)
      at .../linux/arch/x86/include/asm/cpuid/api.h:206
  #9  xen_cpuid_base () at .../linux/arch/x86/include/asm/xen/hypervisor.h:46
  #10 xen_prepare_pvh () at .../linux/arch/x86/platform/pvh/enlighten.c:119
  #11 0x0000000001ba2588 in ?? ()
  #12 0x0000000000000000 in ?? ()
  (gdb)

  Frames #7-#8 show the non-builtin memcmp() (lib/string.c) was called
  even with __builtin_memcmp() being used in cpuid_base_hypervisor().

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
Changes in v2:
- Add comment about the return value of __inline_memcmp() in patch 1.
- Add 'Reviewed-by: Juergen Gross' in patches 2 and 3.
- Link to v1: https://lore.kernel.org/r/20260422-pvh-kasan-inline-v1-0-7e6194344c92@igalia.com

---
Mauricio Faria de Oliveira (3):
      x86/asm, x86/boot: Expose inline memcmp
      x86/cpuid: fix unbootable VMs by really inlining memcmp() in hypervisor_cpuid_base()
      x86/pvh: fix unbootable VMs by really inlining memset() in xen_prepare_pvh()

 arch/x86/boot/string.c            |  6 ++----
 arch/x86/include/asm/cpuid/api.h  |  2 +-
 arch/x86/include/asm/string.h     | 12 ++++++++++++
 arch/x86/platform/pvh/enlighten.c |  3 ++-
 4 files changed, 17 insertions(+), 6 deletions(-)
---
base-commit: 6596a02b207886e9e00bb0161c7fd59fea53c081
change-id: 20260422-pvh-kasan-inline-6efac77f1b27

Best regards,
-- 
Mauricio Faria de Oliveira <mfo@igalia.com>


