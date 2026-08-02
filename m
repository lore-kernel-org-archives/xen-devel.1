Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A459AC55171
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 13:10:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380626.1624367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVxA-00054p-RL; Sun, 02 Aug 2026 13:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380626.1624367; Sun, 02 Aug 2026 13:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVxA-00054D-Lm; Sun, 02 Aug 2026 13:10:08 +0000
Received: by outflank-mailman (input) for mailman id 1380626;
 Sun, 02 Aug 2026 13:10:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wqVx8-0004bl-Bq
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 13:10:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqVx7-001xPK-OX
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 15:10:05 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f4195-5cb7-0a2a0a5109dd-0a2a4506dd12-16
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:05 +0200
Received: from [87.98.179.142] (helo=17.mo550.mail-out.ovh.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f41ad-195a-0a2a45060019-5762b38eedc5-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:05 +0200
Received: from director3.ghost.mail-out.ovh.net (unknown [10.110.58.156])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4hCgC10RDWz5yR7
 for <xen-devel@lists.xenproject.org>; Sun,  2 Aug 2026 13:10:04 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-lkzsb (unknown [10.110.178.46])
 by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id F1632C0A40;
 Sun,  2 Aug 2026 13:10:03 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.100])
 by ghost-submission-7d8d68f679-lkzsb with ESMTPSA
 id MaIRK6tBb2rqGBgA1y1k7A
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 02 Aug 2026 13:10:03 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ovhmo3617313-selector1 header.d=3mdeb.com header.i="@3mdeb.com" header.h=From
Authentication-Results:garm.ovh; auth=pass (GARM-100R003147be42b-89d9-414b-ba50-7c1feb6d7b6d,
                    A7BD45287BC66A7121136900083CD01C39616B1D) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.215
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v4 07/23] x86/boot: add CONFIG_SLAUNCH, MLE header and Secure Launch entry point
Date: Sun,  2 Aug 2026 16:09:23 +0300
Message-ID: <18917d8a445748ba8e997ef71f3172e8f96ed173.1785668458.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 4732157311134148028
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGce0r1ej7YhDvQcoqZzEJUtCQawdbz8FQcTUZWO9brC0fe8AmOsukA+lpn9eiuqako/+9EHlgkoenIYWl357JWwxZOYEqD7LgSB99mM+zUZBiC7QnYK6FiDOBKtL9EXtmHdYOKWcos3vmqFqx4iL/JYXlSeHTzjkKOlsOppKzx/OjSnRSPfqZj0haS76+HPBGMt4m9UNntAG8pd1aw7UmCIs68THN1JZzkevU8BOUWLkPp7zSSYrTQoWq+4FNfY85nWoc+NuYU0vsYmLoQ/W/xvsOsp1BFgfhCXbO5dG2+akiMePW94isPsGmNCVi75YOYndcrS2F/rDTAxq8iT2SlplevNjvkj9ERWKOYBz3pR+l3PibRWrN+TamsRsDuT41truaT1bY/63Wshns5HHYig9FakelyGKvVyT4loq4LCsm0x2fjWun6wZ0BF7Ce5Ka/7QrRWs/Cjj0VP7UmomxPBa9IMvGoIG+shwW33VPCKjijK8UsTF0Y6lMwucph3JrTIQDLAHHNzvdHPE1qqQ1s39EHC4plsQqZp30WupmrIUK6hqHAnb29G2CzAWCUo+MxeLLAhsCiNLk9dXeNm/uNHQcHUm+c+Hz784luCrLvBIBTe0cf76KO6AC2VjMLVIX1Ji4EMCq/qflLs2E2RwytP1trb8WQxuda1ajVsAZItQ
DKIM-Signature: a=rsa-sha256; bh=cFSKQz8f5JDd+KNHvqLRMdQrdK9DDxsbcV/OttzdZYs=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1785676205; v=1;
 b=eZSWfAGwHvJHU0enPhMtKBrUHdn0qyBiqANe+N1MybITDguAyRHv+5uxShTp6TtH6jZwOkH9
 kyzVzyVJ37yOxVKRiNM1rdz2MES/w1Svxl+imVnC2mpS7egIIDzWVXFYB0Wje0QlcWzv86xy6aj
 v12D8mGjCqBBDlUOuXxxEJzeNNb6k3N3zKtu9iKz++VMVoxOEu/rHkigTVXHqxNB8HMXcuAB05N
 sLslbO0iw/Kz0lWG7fwok3e3G2mI9FfuQtrbObZ2H2aH6jx+l79jfzzqI2zG/0csU3cnqMvY2B0
 3NaGucJSP9tyEoTqSEZ9xwKTZBwkJ/vHkfqxcYCtcOzkw==
X-purgate-ID: tlsNG-16d1c6/1785676205-FDA0C77B-A49DB105/0/0
X-purgate-type: clean
X-purgate-size: 8714

From: Kacper Stojek <kacper.stojek@3mdeb.com>

Measured Launched Environment (MLE) is Intel TXT specific term for DLME
(Dynamic Launch Measured Environment) which is whatever gets control
after DRTM (Dynamic Root of Trust for Measurement) is initiated.

DRTM is a way to establish hardware root of trust which excludes
firmware and is not directly tied to hardware's boot process (in
contrast to static RTM, or SRTM).  A bootloader compatible with Secure
Launch specification [1] parses MLE header to know how to invoke Xen as
MLE/DLME.  The header is also processed by SINIT ACM.

The new entry point is called `slaunch_stub_entry` and is used mainly to
differentiate from other kinds of boots.  It moves a magic number to
`EAX` before jumping into common startup code.

[1]: https://trenchboot.org/specifications/Secure_Launch/

Signed-off-by: Kacper Stojek <kacper.stojek@3mdeb.com>
Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---

Notes:
    v4: was "x86/boot: add MLE header and Secure Launch entry point"
    v4: added CONFIG_SLAUNCH Kconfig option
    v4: expanded commit message significantly
    v4: expanded the paragraph added to the documentation
    v4: SLAUNCH_BOOTLOADER_MAGIC now lives here
    v4: MLE header size is now computed from labels
    v4: provided more details in the comment on slaunch_stub_entry
    v4: handle Slaunch bootloader by just hanging (wasn't handled here in v3)
    v4: use __base_reloc_end as an end of image instead of _end

 docs/hypervisor-guide/x86/how-xen-boots.rst | 10 +++
 xen/arch/x86/Kconfig                        |  8 +++
 xen/arch/x86/boot/head.S                    | 76 +++++++++++++++++++++
 3 files changed, 94 insertions(+)

diff --git a/docs/hypervisor-guide/x86/how-xen-boots.rst b/docs/hypervisor-guide/x86/how-xen-boots.rst
index 8b3229005c..a841d1e9f8 100644
--- a/docs/hypervisor-guide/x86/how-xen-boots.rst
+++ b/docs/hypervisor-guide/x86/how-xen-boots.rst
@@ -55,6 +55,16 @@ If ``CONFIG_PVH_GUEST`` was selected at build time, an Elf note is included
 which indicates the ability to use the PVH boot protocol, and registers
 ``__pvh_start`` as the entrypoint, entered in 32bit mode.
 
+A combination of Multiboot 2 and Measured Launched Environment (MLE) headers
+is used to support Dynamic Root of Trust for Measurement (DRTM) for legacy
+(BIOS) boot.  DRTM is a way to establish hardware root of trust which
+excludes firmware and is not directly tied to hardware's boot process.  The
+separate entry point called ``slaunch_stub_entry`` is used mainly to
+differentiate from other kinds of boots.  It moves a magic number to ``EAX``
+before jumping into common startup code.  More details about Secure Launch
+data structures processed by Xen in this boot mode can be found in
+`<https://trenchboot.org/specifications/Secure_Launch/>`_.
+
 
 xen.gz
 ~~~~~~
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 3ce0774b8d..d8dac2dcfa 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -187,6 +187,14 @@ config TBOOT
 
 	  If unsure, stay with the default.
 
+config SLAUNCH
+	bool "DRTM via Secure Launch support"
+	depends on INTEL
+	default y
+	help
+	  Allows support for Secure Launch DRTM boot.  This is a boot in a
+	  measured environment which requires a compatible bootloader.
+
 config X86_PSR
 	bool "Platform Shared Resource support" if EXPERT
 	default INTEL
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 68b963ce6f..cbf91b23c9 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -4,6 +4,7 @@
 #include <public/xen.h>
 #include <asm/asm_defns.h>
 #include <asm/fixmap.h>
+#include <asm/intel-txt.h>
 #include <asm/page.h>
 #include <asm/processor.h>
 #include <asm/msr-index.h>
@@ -36,6 +37,7 @@
 #define MB2_TT(name)      (MULTIBOOT2_TAG_TYPE_##name)
 
 #define XEN_HVM_START_MAGIC_VALUE 0x336ec578
+#define SLAUNCH_BOOTLOADER_MAGIC  0x4c534254
 
         .macro mb2ht_args arg:req, args:vararg
         .long \arg
@@ -126,6 +128,25 @@ multiboot2_header:
         .size multiboot2_header, . - multiboot2_header
         .type multiboot2_header, @object
 
+#if CONFIG_SLAUNCH
+SYM(mle_header, DATA, LOCAL, 16)
+        .long   0x9082ac5a  /* UUID0 */
+        .long   0x74a7476f  /* UUID1 */
+        .long   0xa2555c0f  /* UUID2 */
+        .long   0x42b651cb  /* UUID3 */
+        .long   (.Lmle_header_end - mle_header)  /* MLE header size */
+        .long   0x00020002  /* MLE version 2.2 */
+        .long   (slaunch_stub_entry - start)  /* Linear entry point of MLE (SINIT virt. address) */
+        .long   0x00000000  /* First valid page of MLE */
+        .long   0x00000000  /* Offset within binary of first byte of MLE */
+        .long   (__base_relocs_end - start)  /* Offset within binary of last byte + 1 of MLE */
+        .long   0x00000723  /* Bit vector of MLE-supported capabilities */
+        .long   0x00000000  /* Starting linear address of command line (unused) */
+        .long   0x00000000  /* Ending linear address of command line (unused) */
+.Lmle_header_end:
+        END(mle_header)
+#endif
+
         .section .init.rodata, "a", @progbits
 
 .Lbad_cpu_msg: .asciz "ERR: Not a 64-bit CPU!"
@@ -334,6 +355,43 @@ cs32_switch:
         /* Jump to earlier loaded address. */
         jmp     *%edi
 
+#if CONFIG_SLAUNCH
+        /*
+         * Entry point for TrenchBoot Secure Launch on Intel TXT platforms.
+         *
+         * CPU is in 32b protected mode with paging disabled. On entry:
+         * - %ebx = %eip = MLE entry point,
+         * - stack pointer is undefined,
+         * - CS is flat 4GB code segment,
+         * - DS, ES, SS, FS and GS are undefined according to TXT SDG, but this
+         *   would make it impossible to initialize GDTR, because GDT base must
+         *   be relocated in the descriptor, which requires write access that
+         *   CS doesn't provide. Instead we have to assume that some data
+         *   segment register is set by SINIT ACM as flat 4GB data segment and
+         *   choose DS as that register (LGDT instruction uses it by default).
+         *
+         * Additional restrictions:
+         * - some MSRs are partially cleared, among them IA32_MISC_ENABLE, so
+         *   some capabilities might be reported as disabled even if they are
+         *   supported by CPU
+         * - interrupts (including NMIs and SMIs) are disabled and must be
+         *   enabled later
+         * - trying to enter real mode results in reset
+         * - APs are in a special SENTER sleep state and must be woken up by
+         *   writing a non-zero value at a MONITORed address or via
+         *   GETSEC[WAKEUP] instruction, depending on which is supported by a
+         *   given SINIT ACM
+         */
+slaunch_stub_entry:
+        /* Calculate the load base address. */
+        mov     %ebx, %esi
+        sub     $sym_offs(slaunch_stub_entry), %esi
+
+        /* Mark Secure Launch boot protocol and jump to common entry. */
+        mov     $SLAUNCH_BOOTLOADER_MAGIC, %eax
+        jmp     .Lset_stack
+#endif /* CONFIG_SLAUNCH */
+
 #ifdef CONFIG_PVH_GUEST
 ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_ENTRY, .long sym_offs(__pvh_start))
 
@@ -373,6 +431,7 @@ __start:
         /* Restore the clobbered field. */
         mov     %edx, (%ebx)
 
+.Lset_stack:
         /* Set up stack. */
         lea     STACK_SIZE - CPUINFO_sizeof + sym_esi(cpu0_stack), %esp
 
@@ -421,6 +480,12 @@ __start:
         /* Bootloaders may set multiboot{1,2}.mem_lower to a nonzero value. */
         xor     %edx,%edx
 
+#if CONFIG_SLAUNCH
+        /* Check for TrenchBoot slaunch bootloader. */
+        cmp     $SLAUNCH_BOOTLOADER_MAGIC, %eax
+        je      .Lslaunch_proto
+#endif
+
         /* Check for Multiboot2 bootloader. */
         cmp     $MULTIBOOT2_BOOTLOADER_MAGIC,%eax
         je      .Lmultiboot2_proto
@@ -436,6 +501,17 @@ __start:
         cmovnz  MB_mem_lower(%ebx),%edx
         jmp     trampoline_bios_setup
 
+#if CONFIG_SLAUNCH
+.Lslaunch_proto:
+        /*
+         * Upon reaching here, CPU state mostly matches the one set up by the
+         * bootloader with ESP, ESI and EDX being clobbered above.
+         */
+
+        /* Hang as this boot path is yet to be implemented. */
+        jmp     .Lslaunch_proto
+#endif
+
 .Lmultiboot2_proto:
         /* Skip Multiboot2 information fixed part. */
         lea     (MB2_fixed_sizeof+MULTIBOOT2_TAG_ALIGN-1)(%ebx),%ecx
-- 
2.55.0


