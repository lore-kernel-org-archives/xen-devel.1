Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0572C5DF97
	for <xen-devel@archiver.kernel.org>; Sat, 22 Aug 2026 18:33:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398246.1634682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxqWn-0005z3-NE; Sat, 22 Aug 2026 18:33:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398246.1634682; Sat, 22 Aug 2026 18:33:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxqWn-0005yw-KL; Sat, 22 Aug 2026 18:33:13 +0000
Received: by outflank-mailman (input) for mailman id 1398246;
 Sat, 22 Aug 2026 18:33:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wxqWl-0005mG-Pw
 for xen-devel@lists.xenproject.org; Sat, 22 Aug 2026 18:33:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wxqWk-006G9Z-MI
 for xen-devel@lists.xenproject.org; Sat, 22 Aug 2026 20:33:10 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a89eb5f-bab6-0a2a0a5309dd-0a2a450ce090-6
 for <xen-devel@lists.xenproject.org>; Sat, 22 Aug 2026 20:33:09 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6a89eb64-f479-0a2a450c0019-d561b338c2f6-3
 for <xen-devel@lists.xenproject.org>; Sat, 22 Aug 2026 20:33:09 +0200
Received: from 186-249-148-4.shared.desktop.com.br ([186.249.148.4]
 helo=[127.0.1.1]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wxqWU-007bWT-BY; Sat, 22 Aug 2026 20:32:54 +0200
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
	Message-Id:Date:Subject:From:From:Reply-To;
	bh=+CpOtGeYoMEyuqqLY9qyKy2e9TMQp/hYdp8ZVK/CpDo=; b=YHOASPNYg9lrnpVvQAHX5d1NRV
	LpkBkplQp+cuTcTHQl7BcKxNQSOEmu5QXVqid0MkDK2Ig1uJL82x5wzOuS9uWbi+903TATPAGa9HT
	lEgIqZc1Ys0nBcw5FTUVnvyceI94jKi4aTt5zZe6qk7Fa8mO2771uY+fjKlug0+g17wEhg4klzqHw
	AP+WbBuapasPyPNJ+2GwQgSd+SplKsESoSalmpRtXpqUn5xl6YdZ97Po89TLGTjDfGRHCrdMn1MqM
	pMK8UsSKxEsR7jG6R9qJfmGRprm+xgO8V0+B/d6WCuXnjs/mdSERoQb0cHOZX55QWKSdVcq68IRhI
	/qcdHfQw==;
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Subject: [PATCH v9 0/5] x86/pvh: fix unbootable VMs again (PVH + KASAN)
Date: Sat, 22 Aug 2026 15:33:16 -0300
Message-Id: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGzriWoC/33RwU7DMAwG4FeZciYocRKn4cR7IA6u62wRo5taV
 IGmvTvZLitqxPG35M+2fFGzTEVm9bK7qEmWMpfTWEN62ik+0LgXXYaaFRhA4wH0eTnoD5pp1GU
 8llE0SiaOMdseoqpt50ly+b6Tb+81H8r8dZp+7hMWe6v+gy1WGx0FbfLOe07wWvZ0LPTMp0910
 xZYC7EhQBWAQ+y7gXNG2gjuIQQwDcFVoZdBIiZG4bgR/FrAhuCrQM4aQYIgPGyE8BDQtXYIVQh
 AmVNMvXR2I+BDiMY2BLxdQSkZH4ZMKW+EuBKgJcQquK4uQMGwZLMRurXgGkJXBbYZgW3AHP5+8
 3q9/gIv2tP6fwIAAA==
X-Change-ID: 20260422-pvh-kasan-inline-6efac77f1b27
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-purgate-ID: tlsNG-d25034/1787423589-022C0A5B-9DA478F2/0/0
X-purgate-type: clean
X-purgate-size: 8170

The issue of unbootable VMs with CONFIG_PVH due to CONFIG_KASAN is back.

Booting directly from vmlinux (instead of bzImage) now fails with gcc-14/15
(but works with gcc-12/13) if CONFIG_KASAN_GENERIC is set, on Ubuntu 25.10.

The PVH code is required/supposed not to use the KASAN memory access check
in the kernel entry point as KASAN has not yet been setup, or an exception
is hit and the boot fails.

This was previously described and addressed with __builtin_mem{cmp,set}():
- commit 661362e3dcab ("xen, pvh: fix unbootable VMs (PVH + KASAN - AMD_MEM_ENCRYPT)")
- commit 416a33c9afce ("x86/cpu: fix unbootable VMs by inlining memcmp() in hypervisor_cpuid_base()")
- commit fbe5a6dfe492 ("xen, pvh: fix unbootable VMs by inlining memset() in xen_prepare_pvh()")

However, even with __builtin the compiler may decide to use the out of line
function instead of the inline implementation. So, that does not really fix
the issue unconditionally; see details below.

In order to address this, it's required to switch to inline implementations
that do not depend on the compiler.

There's such a memset() in <asm/string.h> and memcmp() in 'boot/string.c'.
Use them instead of builtins in PVH entry.

Testing:

- Booting from vmlinux (fixed) and bzImage (still works) using
  allnoconfig + CONFIG_PVH + CONFIG_KASAN with gcc-12/13/14/15.

- Building with CONFIG_KEXEC_FILE, CONFIG_CFI and !CONFIG_KASAN with LLVM 20
  (check for a build error not caught previously).

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
Changes in v9:
- Patch 1: new patch in v9 to fix the patch submitted separately in v8.
- Rebased to next-20260821.
- Link to v8: https://lore.kernel.org/r/20260723-pvh-kasan-inline-v8-0-c1f62c156f52@igalia.com

Changes in v8:
- Patch 2 in v7 was submitted separately as requested, and the
  rest of this series was rebased on top of it (Borislav Petkov).
  Link: https://lore.kernel.org/all/20260723-x86-memcmp-asm-v2-1-d93ecb43797f@igalia.com/
- Patch 2 in v8:
  - Mention 'No functional changes' (Borislav Petkov).
  - Remove comment at the top of the header (Borislav Petkov).
- Link to v7: https://lore.kernel.org/r/20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com

Changes in v7:
- Patch 2 (added):
  - Address pre-existing issues in 'asm' (Borislav Petkov, Sashiko).
- Link to v6: https://lore.kernel.org/r/20260701-pvh-kasan-inline-v6-0-ba99045dfa9f@igalia.com

Changes in v6:
- Patch 1:
  - Explain the return value difference between __inline_memcmp() and memcmp().
- Patch 2 (added):
  - Group __inline string functions in <asm/shared/string.h>.
- Link to v5: https://lore.kernel.org/r/20260630-pvh-kasan-inline-v5-0-52afc979be81@igalia.com

Changes in v5:
- Create a minimal separate header in <asm/shared/string.h> instead,
  to be used by 'boot/setup.c' and <asm/string.h> (Borislav Petkov).
- Patch 1 (in v4/v3) is no longer needed; removed.
- Patch 1 (in v5):
  - Briefly mention there are issues with <asm/string.h>.
  - Remove 'Reviewed-by: Jurgen Gross' to be conservative
    (same code change and result, but the means changed).
- Link to v4: https://lore.kernel.org/r/20260526-pvh-kasan-inline-v4-0-a310e6a25ecd@igalia.com

Changes in v4:
- Patch 1: address Juergen's feedback:
  - s/In next patch/In a future patch/.
  - Move footnote (Reasons not to include...) after "---".
- Add 'Reviewed-by: Juergen Gross' in patches 1 and 2 as well.
- Link to v3: https://lore.kernel.org/r/20260520-pvh-kasan-inline-v3-0-bede769c6ec7@igalia.com

Changes in v3:
- Create and use a separate header for inline string functions
  to fix a build error reported by kernel test robot (patch 1).
- That also removes '#ifndef _SETUP/#endif' in <asm/string.h>.
- Link to v2: https://lore.kernel.org/r/20260427-pvh-kasan-inline-v2-0-2c57b8dcff6a@igalia.com

Changes in v2:
- Add comment about the return value of __inline_memcmp() in patch 1. (v3: now 2)
- Add 'Reviewed-by: Juergen Gross' in patches 2 and 3 (v3: now 3 and 4).
- Link to v1: https://lore.kernel.org/r/20260422-pvh-kasan-inline-v1-0-7e6194344c92@igalia.com

---
Mauricio Faria de Oliveira (5):
      x86/boot: Remove "cc" clobber from memcmp()
      x86/asm, x86/boot: expose inline memcmp()
      x86/asm: group inline string functions
      x86/cpuid: fix unbootable VMs by really inlining memcmp() in hypervisor_cpuid_base()
      x86/pvh: fix unbootable VMs by really inlining memset() in xen_prepare_pvh()

 arch/x86/boot/string.c               | 13 ++--------
 arch/x86/include/asm/cpuid/api.h     |  2 +-
 arch/x86/include/asm/shared/string.h | 47 ++++++++++++++++++++++++++++++++++++
 arch/x86/include/asm/string.h        | 21 +---------------
 arch/x86/platform/pvh/enlighten.c    |  3 ++-
 5 files changed, 53 insertions(+), 33 deletions(-)
---
base-commit: 903c1cf6dff9964e71eda98a39e2e5d442050472
change-id: 20260422-pvh-kasan-inline-6efac77f1b27

Best regards,
-- 
Mauricio Faria de Oliveira <mfo@igalia.com>


