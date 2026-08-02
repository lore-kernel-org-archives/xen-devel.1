Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18017C55171
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 13:18:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380758.1624502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqW4c-0004tc-B7; Sun, 02 Aug 2026 13:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380758.1624502; Sun, 02 Aug 2026 13:17:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqW4c-0004tT-7i; Sun, 02 Aug 2026 13:17:50 +0000
Received: by outflank-mailman (input) for mailman id 1380758;
 Sun, 02 Aug 2026 13:17:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wqW4a-0004pR-RA
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 13:17:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqW4a-00Bn6b-7p
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 15:17:48 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f436e-bab6-0a2a0a5309dd-0a2a4501cdb6-12
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:17:48 +0200
Received: from [87.98.178.58] (helo=17.mo561.mail-out.ovh.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f41d6-5984-0a2a45010019-5762b23adae3-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:47 +0200
Received: from director4.ghost.mail-out.ovh.net (unknown [10.110.0.178])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4hCgCp55tjz5xsS
 for <xen-devel@lists.xenproject.org>; Sun,  2 Aug 2026 13:10:46 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-m4frt (unknown [10.111.174.132])
 by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9E9E0C2306;
 Sun,  2 Aug 2026 13:10:44 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.101])
 by ghost-submission-7d8d68f679-m4frt with ESMTPSA
 id A262F9RBb2oNsRcAXQcPeQ
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 02 Aug 2026 13:10:44 +0000
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
Authentication-Results:garm.ovh; auth=pass (GARM-101G004633ecb7a-a591-49b8-960a-955f05690000,
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
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ross Philipson <ross.philipson@gmail.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v4 21/23] x86/slaunch: support EFI boot
Date: Sun,  2 Aug 2026 16:09:37 +0300
Message-ID: <e29edd81eeb55927fef2c56b7493a8db65edfc90.1785668458.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 4743979258418570684
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFkIVM66t9WfxMA1MBLamLRI1g7isw4fvjTq42J16AnGGiVkfZZz7RNohO0DVzuB6p7ByU2jpbyNpeFSmhxy18LKLUp8eoLMQd6SniSDWM2cNrBr0In5AXWUClj6LSw0UENmYdxRZSA2740zY8xbtv3e0tQCOijX5z+87X8/lqG082kExyxNnnNomzq4n6JxeS+9hUWvV3ncL+A/VeP2cvLfZQ+CqbSooIUmTa+tUTJpOYsWTKV07AKa/rJsi+zSktpNOwqnqM3QkFMTTxnOM0YJkWFFta90JnAtJgk2pNma17wsGvogAUiRHEWxKZPCW0f+1LBF9pVpiXy5iPezXU8d1hce61Aoq+F+RzUjso/AXwTe0q1s2f/fih1X+6DUmvool3KHQypNF8upsQVo+IBvC2Yjz4usFTJs0tU4CdieQIpWWA+M+WIP+3VvProtgPGB3V4I4TbBITe+5ww3KdQ8QBD+dIYUR2xsf46qGgJSHLLpxdbWpOAu39N4u/DbhJX9frf5n4MqugzsU42SlsfG2vroQwvKy7w8DgmCWSTGHyQhyOcU+pLZkvhAT0wCJmieOYIYVupe4kEpmCKcjFt2VY2EJrP6cQdkcw/LQXt7Tohx2E2u94aF3cgH6K1clYyYmuTm0lRXH1R/nT51K2vCRskrU0ONuM6EwWrUzRcBg
DKIM-Signature: a=rsa-sha256; bh=eiitqsXzV8CcZOdxpmTe8+PK7v6PihsQTS4KVdOMirw=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1785676246; v=1;
 b=bEcHWuwNfJrOBZFyHuWhXz1RxNezZ6yFLALj21FFaaEJAWE7ZLWFAeEMcrhuLSh2ypaOGZmv
 t9Fqt54R3YaMwodm1CDuHXVh2DmQmbOF8g71SUrcNgTs9KrVQjcst7TSY8rwlEZ+rVVi7ZWYEWn
 PDZtjstZVDn3d39MnFpRHiTaiCFIrfRUEm3OWEI69gyKi70n234sbiyOk3M6lRdzhZbi0vx5OyT
 +TqMUX7emXKimOEWzXIGkFK46X96uRKRJr/v2p+N7/owZ0Gv+z/qjuCjiN1HoOeYnt+GT7tY6+M
 iCEw7vao67lmk3Q2iGbS/YgcXudK7cpvmr3ofs8f9Bmeg==
X-purgate-ID: tlsNG-d62444/1785676247-C5146757-84F0834B/0/0
X-purgate-type: clean
X-purgate-size: 27035

When running on an EFI-enabled system, Xen needs to have access to Boot
Services in order to initialize itself properly and reach a state in
which a dom0 kernel can operate without issues.

This means that DRTM must be started in the middle of Xen's
initialization process.  This effect is achieved via a callback into
a TrenchBoot-enabled bootloader (GRUB) which is responsible for
initiating DRTM and continuing Xen's initialization process.  The latter
is done by branching in Slaunch entry point on a flag to switch back
into long mode before calling the same function which Xen would execute
as the next step without DRTM.

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---

Notes:
    v4: -DXEN_BUILD_EFI => -DXEN_BUILD_EFI=1
    v4: use CONFIG_SLAUNCH
    v4: use pointers to `const` SLRT and TXT heap data
    v4: use container_of()
    v4: take updates to `struct boot_module` into account
    v4: now UEFI_SLR_TABLE_GUID is defined here in efi/boot.c

 .gitignore                                    |   1 +
 .../eclair_analysis/ECLAIR/out_of_scope.ecl   |   1 +
 docs/hypervisor-guide/x86/how-xen-boots.rst   |  14 +-
 xen/arch/x86/Makefile                         |  12 +-
 xen/arch/x86/boot/head.S                      | 124 +++++++++++++++++
 xen/arch/x86/boot/x86_64.S                    |  14 +-
 xen/arch/x86/efi/efi-boot.h                   |  94 ++++++++++++-
 xen/arch/x86/efi/fixmlehdr.c                  | 127 ++++++++++++++++++
 xen/arch/x86/slaunch.c                        |  75 ++++++++++-
 xen/common/efi/boot.c                         |   6 +
 xen/common/efi/runtime.c                      |   1 +
 xen/include/xen/efi.h                         |   1 +
 12 files changed, 455 insertions(+), 15 deletions(-)
 create mode 100644 xen/arch/x86/efi/fixmlehdr.c

diff --git a/.gitignore b/.gitignore
index bfc7bdf043..76bc97d5ea 100644
--- a/.gitignore
+++ b/.gitignore
@@ -177,6 +177,7 @@ xen/.xen.elf32
 xen/System.map
 xen/arch/x86/efi.lds
 xen/arch/x86/efi/check.efi
+xen/arch/x86/efi/fixmlehdr
 xen/arch/x86/efi/mkreloc
 xen/arch/x86/include/asm/asm-macros.h
 xen/arch/*/xen.lds
diff --git a/automation/eclair_analysis/ECLAIR/out_of_scope.ecl b/automation/eclair_analysis/ECLAIR/out_of_scope.ecl
index 9bcec4c69d..a09cf5442c 100644
--- a/automation/eclair_analysis/ECLAIR/out_of_scope.ecl
+++ b/automation/eclair_analysis/ECLAIR/out_of_scope.ecl
@@ -19,6 +19,7 @@
 
 -doc_begin="Build tools are out of scope."
 -file_tag+={out_of_scope_tools,"^xen/tools/.*$"}
+-file_tag+={out_of_scope_tools,"^xen/arch/x86/efi/fixmlehdr\\.c$"}
 -file_tag+={out_of_scope_tools,"^xen/arch/x86/efi/mkreloc\\.c$"}
 -file_tag+={out_of_scope_tools,"^xen/arch/x86/boot/mkelf32\\.c$"}
 -doc_end
diff --git a/docs/hypervisor-guide/x86/how-xen-boots.rst b/docs/hypervisor-guide/x86/how-xen-boots.rst
index a841d1e9f8..0b1b62971f 100644
--- a/docs/hypervisor-guide/x86/how-xen-boots.rst
+++ b/docs/hypervisor-guide/x86/how-xen-boots.rst
@@ -56,12 +56,14 @@ which indicates the ability to use the PVH boot protocol, and registers
 ``__pvh_start`` as the entrypoint, entered in 32bit mode.
 
 A combination of Multiboot 2 and Measured Launched Environment (MLE) headers
-is used to support Dynamic Root of Trust for Measurement (DRTM) for legacy
-(BIOS) boot.  DRTM is a way to establish hardware root of trust which
-excludes firmware and is not directly tied to hardware's boot process.  The
-separate entry point called ``slaunch_stub_entry`` is used mainly to
-differentiate from other kinds of boots.  It moves a magic number to ``EAX``
-before jumping into common startup code.  More details about Secure Launch
+is used to support Dynamic Root of Trust for Measurement (DRTM).  DRTM is a
+way to establish hardware root of trust which excludes firmware and is not
+directly tied to hardware's boot process.  The separate entry point called
+``slaunch_stub_entry`` is used mainly to differentiate from other kinds of
+boots.  For a legacy (BIOS) boot, it moves a magic number to ``EAX`` before
+jumping into common startup code.  For a EFI boot, it resumes execution of
+Xen.efi which was paused by handing control to a part of a bootloader
+responsible for initiating DRTM sequence.  More details about Secure Launch
 data structures processed by Xen in this boot mode can be found in
 `<https://trenchboot.org/specifications/Secure_Launch/>`_.
 
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 8dbb76a3a0..4f7db9420e 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -89,6 +89,7 @@ extra-y += xen.lds
 
 hostprogs-y += boot/mkelf32
 hostprogs-y += efi/mkreloc
+hostprogs-y += efi/fixmlehdr
 
 $(obj)/efi/mkreloc: HOSTCFLAGS += -I$(srctree)/include
 
@@ -123,6 +124,11 @@ $(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkelf32
 
 CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
 
+# Expose this build flag as a macro when compiling assembly files.
+ifeq ($(XEN_BUILD_EFI),y)
+XEN_AFLAGS += -DXEN_BUILD_EFI=1
+endif
+
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
 	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
 	$(MAKE) $(build)=$(@D) $(dot-target).0.o
@@ -196,7 +202,7 @@ note_file_option ?= $(note_file)
 extra-$(XEN_BUILD_PE) += efi.lds
 ifeq ($(XEN_BUILD_PE),y)
 $(TARGET).efi: $(obj)/efi/relocs-dummy.o $(obj)/efi/relocs-empty.o $(obj)/efi/mkreloc
-$(TARGET).efi: $(objtree)/prelink.o $(note_file) $(obj)/efi.lds
+$(TARGET).efi: $(objtree)/prelink.o $(note_file) $(obj)/efi.lds $(obj)/efi/fixmlehdr
 ifeq ($(CONFIG_DEBUG_INFO),y)
 	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
 endif
@@ -230,6 +236,10 @@ endif
 	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< $(obj)/efi/relocs-empty.o \
 	      $(dot-target).2r.o $(dot-target).2s.o $(orphan-handling-y) \
 	      $(note_file_option) -o $@
+ifeq ($(CONFIG_SLAUNCH),y)
+	# update entry point's address by taking image offset into account
+	$(obj)/efi/fixmlehdr $@ $(XEN_IMG_OFFSET)
+endif
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		> $@.map
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index bf38aef21c..22b331a45c 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -408,6 +408,12 @@ slaunch_stub_entry:
         mov     %ebx, %esi
         sub     $sym_offs(slaunch_stub_entry), %esi
 
+#if XEN_BUILD_EFI
+        /* If the flag is already set, then Xen should continue execution. */
+        cmpb    $0, sym_esi(slaunch_active)
+        jne     slaunch_efi_jumpback
+#endif
+
         /* On AMD, %ebp holds the base address of SLB, save it for later. */
         mov     %ebp, %ebx
 
@@ -855,6 +861,124 @@ trampoline_setup:
         /* Jump into the relocated trampoline. */
         lret
 
+#if XEN_BUILD_EFI && CONFIG_SLAUNCH
+
+        /*
+         * The state matches that of slaunch_stub_entry above, but with %esi
+         * already initialized.
+         */
+slaunch_efi_jumpback:
+        lea     STACK_SIZE - CPUINFO_sizeof + sym_esi(cpu0_stack), %esp
+
+        /* Prepare gdt and segments. */
+        add     %esi, sym_esi(gdt_boot_base)
+        lgdt    sym_esi(gdt_boot_descr)
+
+        mov     $BOOT_DS, %ecx
+        mov     %ecx, %ds
+        mov     %ecx, %es
+        mov     %ecx, %ss
+
+        push    $BOOT_CS32
+        lea     sym_esi(.Lgdt_is_set),%edx
+        push    %edx
+        lret
+.Lgdt_is_set:
+
+        /*
+         * Stash TSC as above because it was zeroed on jumping into bootloader
+         * to not interfere with measurements.
+         */
+        rdtsc
+        mov     %eax,     sym_esi(boot_tsc_stamp)
+        mov     %edx, 4 + sym_esi(boot_tsc_stamp)
+
+        /*
+         * Clear the pagetables before the use. We are loaded below 4GiB and
+         * this avoids the need for writing to higher dword of each entry.
+         * Additionally, this ensures those dwords are actually zero and the
+         * mappings aren't manipulated from outside.
+         */
+        lea     sym_esi(bootmap_start), %edi
+        lea     sym_esi(bootmap_end), %ecx
+        sub     %edi, %ecx
+        xor     %eax, %eax
+        shr     $2, %ecx
+        rep stosl
+
+        /* 1x L1 page, 512 entries mapping total of 2M. */
+        lea     sym_esi(l1_bootmap), %edi
+        mov     $512, %ecx
+        mov     $(__PAGE_HYPERVISOR + 512 * PAGE_SIZE), %edx
+.Lfill_l1_identmap:
+        sub     $PAGE_SIZE, %edx
+        /* Loop runs for ecx=[512..1] for entries [511..0], hence -8. */
+        mov     %edx, -8(%edi,%ecx,8)
+        loop    .Lfill_l1_identmap
+
+        /* 4x L2 pages, each page mapping 1G of RAM. */
+        lea     sym_esi(l2_bootmap), %edi
+        /* 1st entry points to L1. */
+        lea     (sym_offs(l1_bootmap) + __PAGE_HYPERVISOR)(%esi), %edx
+        mov     %edx, (%edi)
+        /* Other entries are 2MB pages. */
+        mov     $(4 * 512 - 1), %ecx
+        /*
+         * Value below should be 4GB + flags, which wouldn't fit in 32b
+         * register. To avoid warning from the assembler, 4GB is skipped here.
+         * Substitution in first iteration makes the value roll over and point
+         * to 4GB - 2MB + flags.
+         */
+        mov     $(_PAGE_PSE + __PAGE_HYPERVISOR), %edx
+.Lfill_l2_identmap:
+        sub     $(1 << L2_PAGETABLE_SHIFT), %edx
+        /* Loop runs for ecx=[2047..1] for entries [2047..1]. */
+        mov     %edx, (%edi,%ecx,8)
+        loop    .Lfill_l2_identmap
+
+        /* 1x L3 page, mapping the 4x L2 pages. */
+        lea     sym_esi(l3_bootmap), %edi
+        mov     $4, %ecx
+        lea     (sym_offs(l2_bootmap) + 4 * PAGE_SIZE + __PAGE_HYPERVISOR)(%esi), %edx
+.Lfill_l3_identmap:
+        sub     $PAGE_SIZE, %edx
+        /* Loop runs for ecx=[4..1] for entries [3..0], hence -8. */
+        mov     %edx, -8(%edi,%ecx,8)
+        loop    .Lfill_l3_identmap
+
+        /* 1x L4 page, mapping the L3 page. */
+        lea     (sym_offs(l3_bootmap) + __PAGE_HYPERVISOR)(%esi), %edx
+        mov     %edx, sym_esi(l4_bootmap)
+
+        /* Restore CR4, PAE must be enabled before IA-32e mode */
+        mov     %cr4, %ecx
+        or      $X86_CR4_PAE, %ecx
+        mov     %ecx, %cr4
+
+        /* Load PML4 table location into PT base register */
+        lea     sym_esi(l4_bootmap), %eax
+        mov     %eax, %cr3
+
+        /* Enable IA-32e mode and paging */
+        mov     $MSR_EFER, %ecx
+        rdmsr
+        or      $EFER_LME >> 8, %ah
+        wrmsr
+
+        mov     %cr0, %eax
+        or      $X86_CR0_PG | X86_CR0_NE | X86_CR0_TS | X86_CR0_MP, %eax
+        mov     %eax, %cr0
+
+        /* Now in IA-32e compatibility mode, use lret to jump to 64b mode */
+        lea     sym_esi(start_xen_from_efi), %ecx
+        push    $BOOT_CS64
+        push    %ecx
+        lret
+
+.global start_xen_from_efi
+
+#endif /* XEN_BUILD_EFI && CONFIG_SLAUNCH */
+
 ENTRY(trampoline_start)
 #include "trampoline.S"
 ENTRY(trampoline_end)
diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
index 886960c22f..d23cfebdb6 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -267,14 +267,22 @@ GLOBAL(__page_tables_end)
 /* Init pagetables. Enough page directories to map into 4GB. */
         .section .init.data.page_aligned, "aw", @progbits
 
-DATA_LOCAL(l1_bootmap, PAGE_SIZE)
+bootmap_start:
+
+DATA_LOCAL(l1_bootmap, PAGE_SIZE) /* 1x L1 page, mapping 2M of RAM. */
         .fill L1_PAGETABLE_ENTRIES, 8, 0
 END(l1_bootmap)
 
-DATA(l2_bootmap, PAGE_SIZE)
+DATA(l2_bootmap, PAGE_SIZE) /* 4x L2 pages, each mapping 1G of RAM. */
         .fill 4 * L2_PAGETABLE_ENTRIES, 8, 0
 END(l2_bootmap)
 
-DATA(l3_bootmap, PAGE_SIZE)
+DATA(l3_bootmap, PAGE_SIZE) /* 1x L3 page, mapping the 4x L2 pages. */
         .fill L3_PAGETABLE_ENTRIES, 8, 0
 END(l3_bootmap)
+
+DATA_LOCAL(l4_bootmap, PAGE_SIZE) /* 1x L4 page, mapping the L3 page. */
+        .fill L4_PAGETABLE_ENTRIES, 8, 0
+END(l4_bootmap)
+
+bootmap_end:
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index d738b839ee..9653de4ca9 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -7,8 +7,15 @@
 #ifndef X86_EFI_EFI_BOOT_H
 #define X86_EFI_EFI_BOOT_H
 
+#include <xen/kernel.h>
 #include <xen/vga.h>
 
+/*
+ * Tell <asm/intel-txt.h> to access TXT registers without address translation
+ * which has not yet been set up.
+ */
+#define __EARLY_SLAUNCH__
+
 #include <asm/boot-helpers.h>
 #include <asm/e820.h>
 #include <asm/edd.h>
@@ -17,8 +24,11 @@
 #include <asm/setup.h>
 #include <asm/trampoline.h>
 #include <asm/efi.h>
+#include <asm/intel-txt.h>
+#include <asm/slaunch.h>
 
 static struct file __initdata ucode;
+static uint64_t __initdata xen_image_size;
 static multiboot_info_t __initdata mbi = {
     .flags = MBI_MODULES | MBI_LOADERNAME
 };
@@ -234,10 +244,31 @@ static void __init efi_arch_pre_exit_boot(void)
     }
 }
 
-static void __init noreturn efi_arch_post_exit_boot(void)
+void __init asmlinkage noreturn start_xen_from_efi(void)
 {
     u64 cr4 = XEN_MINIMAL_CR4 & ~X86_CR4_PGE, efer;
 
+    if ( slaunch_active )
+    {
+        const struct slr_table *slrt = (const struct slr_table *)efi.slr;
+        const struct slr_entry_hdr *entry;
+
+        entry = slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_INTEL_INFO);
+        if ( entry != NULL )
+        {
+            const struct slr_entry_intel_info *intel_info =
+                container_of(entry, const struct slr_entry_intel_info, hdr);
+            void *txt_heap = txt_init();
+            const struct txt_os_mle_data *os_mle =
+                txt_start(txt_heap, TXT_OS2MLE);
+            const struct txt_os_sinit_data *os_sinit =
+                txt_start(txt_heap, TXT_OS2SINIT);
+
+            txt_verify_pmr_ranges(os_mle, os_sinit, intel_info, xen_phys_start,
+                                  xen_phys_start, xen_image_size);
+        }
+    }
+
     efi_arch_relocate_image(__XEN_VIRT_START - xen_phys_start);
     memcpy(_p(trampoline_phys), trampoline_start, cfg.size);
 
@@ -283,6 +314,66 @@ static void __init noreturn efi_arch_post_exit_boot(void)
     unreachable();
 }
 
+static void __init attempt_secure_launch(void)
+{
+#ifdef CONFIG_SLAUNCH
+    const struct slr_table *slrt;
+    const struct slr_entry_hdr *entry;
+    const struct slr_entry_dl_info *dlinfo;
+    dl_handler_func handler_callback;
+
+    /* The presence of this table indicates a Secure Launch boot. */
+    slrt = (const struct slr_table *)efi.slr;
+    if ( efi.slr == EFI_INVALID_TABLE_ADDR || slrt->magic != SLR_TABLE_MAGIC ||
+         slrt->revision != SLR_TABLE_REVISION )
+        return;
+
+    /* Avoid calls into firmware after DRTM. */
+    __clear_bit(EFI_RS, &efi_flags);
+
+    /*
+     * Make measurements less sensitive to hardware-specific details.
+     *
+     * Intentionally leaving efi_ct and efi_num_ct intact.
+     */
+    efi_ih = NULL;
+    efi_bs = NULL;
+    efi_bs_revision = 0;
+    efi_rs = NULL;
+    efi_version = 0;
+    efi_fw_vendor = NULL;
+    efi_fw_revision = 0;
+    StdOut = NULL;
+    StdErr = NULL;
+    boot_tsc_stamp = 0;
+
+    slaunch_active = true;
+    slaunch_slrt = efi.slr;
+
+    /* Jump through DL stub to initiate Secure Launch. */
+    entry = slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_DL_INFO);
+    dlinfo = container_of(entry, const struct slr_entry_dl_info, hdr);
+
+    handler_callback = (dl_handler_func)dlinfo->dl_handler;
+    handler_callback(&dlinfo->bl_context);
+
+    unreachable();
+#endif
+}
+
+static void __init noreturn efi_arch_post_exit_boot(void)
+{
+    /*
+     * If Secure Launch happens, attempt_secure_launch() doesn't return and
+     * start_xen_from_efi() is invoked after DRTM has been initiated.
+     * Otherwise, attempt_secure_launch() returns and execution continues as
+     * usual.
+     */
+    attempt_secure_launch();
+
+    start_xen_from_efi();
+}
+
 static void __init efi_arch_cfg_file_early(const EFI_LOADED_IMAGE *image,
                                            EFI_FILE_HANDLE *dir_handle,
                                            const char *section)
@@ -783,6 +874,7 @@ static void noreturn __init efi_arch_halt(void)
 static void __init efi_arch_load_addr_check(const EFI_LOADED_IMAGE *loaded_image)
 {
     xen_phys_start = (UINTN)loaded_image->ImageBase;
+    xen_image_size = loaded_image->ImageSize;
     if ( (xen_phys_start + loaded_image->ImageSize - 1) >> 32 )
         blexit(L"Xen must be loaded below 4Gb.");
     if ( xen_phys_start & ((1 << L2_PAGETABLE_SHIFT) - 1) )
diff --git a/xen/arch/x86/efi/fixmlehdr.c b/xen/arch/x86/efi/fixmlehdr.c
new file mode 100644
index 0000000000..60a91c6b73
--- /dev/null
+++ b/xen/arch/x86/efi/fixmlehdr.c
@@ -0,0 +1,127 @@
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+/*
+ * Depending on the toolchain and its configuration the header can end up quite
+ * far from the start of the file.
+ */
+#define PREFIX_SIZE (8*1024)
+
+struct mle_header
+{
+    uint8_t uuid[16];
+    uint32_t header_len;
+    uint32_t version;
+    uint32_t entry_point;
+    uint32_t first_valid_page;
+    uint32_t mle_start;
+    uint32_t mle_end;
+    uint32_t capabilities;
+    uint32_t cmdline_start;
+    uint32_t cmdline_end;
+} __attribute__ ((packed));
+
+static const uint8_t MLE_HEADER_UUID[] = {
+    0x5a, 0xac, 0x82, 0x90, 0x6f, 0x47, 0xa7, 0x74,
+    0x0f, 0x5c, 0x55, 0xa2, 0xcb, 0x51, 0xb6, 0x42
+};
+
+int main(int argc, char *argv[])
+{
+    FILE *fp;
+    struct mle_header header;
+    int i;
+    char *end_ptr;
+    long long correction;
+    const char *file_path;
+
+    if ( argc != 3 )
+    {
+        fprintf(stderr, "Usage: %s <xen.efi> <entry-correction>\n", argv[0]);
+        return 1;
+    }
+
+    correction = strtoll(argv[2], &end_ptr, 0);
+    if ( *end_ptr != '\0' )
+    {
+        fprintf(stderr, "Failed to parse '%s' as a number\n", argv[2]);
+        return 1;
+    }
+    if ( correction < INT32_MIN  )
+    {
+        fprintf(stderr, "Correction '%s' is too small\n", argv[2]);
+        return 1;
+    }
+    if ( correction > INT32_MAX  )
+    {
+        fprintf(stderr, "Correction '%s' is too large\n", argv[2]);
+        return 1;
+    }
+
+    file_path = argv[1];
+
+    fp = fopen(file_path, "r+");
+    if ( fp == NULL )
+    {
+        fprintf(stderr, "Failed to open %s\n", file_path);
+        return 1;
+    }
+
+    for ( i = 0; i < PREFIX_SIZE; i += 16 )
+    {
+        uint8_t bytes[16];
+
+        if ( fread(bytes, sizeof(bytes), 1, fp) != 1 )
+        {
+            fprintf(stderr, "Failed to find MLE header in %s\n", file_path);
+            goto fail;
+        }
+
+        if ( memcmp(bytes, MLE_HEADER_UUID, 16) == 0 )
+        {
+            break;
+        }
+    }
+
+    if ( i >= PREFIX_SIZE )
+    {
+        fprintf(stderr, "Failed to find MLE header in %s\n", file_path);
+        goto fail;
+    }
+
+    if ( fseek(fp, -16, SEEK_CUR) )
+    {
+        fprintf(stderr, "Failed to seek back to MLE header in %s\n", file_path);
+        goto fail;
+    }
+
+    if ( fread(&header, sizeof(header), 1, fp) != 1 )
+    {
+        fprintf(stderr, "Failed to read MLE header from %s\n", file_path);
+        goto fail;
+    }
+
+    if ( fseek(fp, -(int)sizeof(header), SEEK_CUR) )
+    {
+        fprintf(stderr, "Failed to seek back again to MLE header in %s\n",
+                file_path);
+        goto fail;
+    }
+
+    header.entry_point += correction;
+
+    if ( fwrite(&header, sizeof(header), 1, fp) != 1 )
+    {
+        fprintf(stderr, "Failed to write MLE header in %s\n", file_path);
+        goto fail;
+    }
+
+    fclose(fp);
+    return 0;
+
+fail:
+    fclose(fp);
+    return 1;
+}
diff --git a/xen/arch/x86/slaunch.c b/xen/arch/x86/slaunch.c
index af88ca9caa..e506fb4293 100644
--- a/xen/arch/x86/slaunch.c
+++ b/xen/arch/x86/slaunch.c
@@ -6,6 +6,7 @@
  */
 
 #include <xen/compiler.h>
+#include <xen/efi.h>
 #include <xen/init.h>
 #include <xen/kernel.h>
 #include <xen/macros.h>
@@ -252,10 +253,23 @@ check_drtm_policy(const struct slr_table *slrt,
 {
     uint32_t i;
     uint32_t num_mod_entries;
+    int min_entries;
 
-    if ( policy->nr_entries < 2 )
-        panic("DRTM policy in SLRT contains less than 2 entries (%d)!\n",
-              policy->nr_entries);
+    min_entries = efi_enabled(EFI_BOOT) ? 1 : 2;
+    if ( policy->nr_entries < min_entries )
+    {
+        panic("DRTM policy in SLRT contains less than %d entries (%d)!\n",
+              min_entries, policy->nr_entries);
+    }
+
+    if ( efi_enabled(EFI_BOOT) )
+    {
+        check_slrt_policy_entry(&policy_entry[0], 0, slrt);
+        /* SLRT was measured in slaunch_measure_slrt(). */
+        return 1;
+    }
+
+    /* This must be legacy MultiBoot2 boot. */
 
     /*
      * MBI policy entry must be the first one, so that measuring order matches
@@ -324,6 +338,7 @@ void __init slaunch_process_drtm_policy(const struct boot_info *bi)
     const struct slr_table *slrt;
     const struct slr_entry_policy *policy;
     struct slr_policy_entry *policy_entry;
+    int rc;
     uint16_t i;
     unsigned int measured;
 
@@ -338,7 +353,6 @@ void __init slaunch_process_drtm_policy(const struct boot_info *bi)
 
     for ( i = measured; i < policy->nr_entries; i++ )
     {
-        int rc;
         uint64_t start = policy_entry[i].entity;
         uint64_t size = policy_entry[i].size;
 
@@ -384,6 +398,59 @@ void __init slaunch_process_drtm_policy(const struct boot_info *bi)
 
         policy_entry[i].flags |= SLR_POLICY_FLAG_MEASURED;
     }
+
+    /*
+     * On x86 EFI platforms Xen reads its command-line options and kernel/initrd
+     * from configuration files (several can be chained). Bootloader can't know
+     * contents of the configuration beforehand without parsing it, so there
+     * will be no corresponding policy entries. Instead, measure command-line
+     * and all modules here.
+     */
+    if ( efi_enabled(EFI_BOOT) )
+    {
+#define LOG_DATA(str) (uint8_t *)(str), (sizeof(str) - 1)
+
+        slaunch_hash_extend(DRTM_LOC, DRTM_DATA_PCR,
+                            (const uint8_t *)bi->cmdline, strlen(bi->cmdline),
+                            DLE_EVTYPE_SLAUNCH, LOG_DATA("Xen's command line"));
+
+        for ( i = 0; i < bi->nr_modules; i++ )
+        {
+            const struct boot_module *mod = &bi->mods[i];
+
+            paddr_t string = mod->arch.cmdline_pa;
+            paddr_t start = mod->start;
+            size_t size = mod->size;
+
+            if ( mod->arch.relocated || mod->arch.released )
+            {
+                panic("A module \"%s\" (#%d) was consumed before measurement\n",
+                      (const char *)__va(string), i);
+            }
+
+            /*
+             * Measuring module's name separately because module's command-line
+             * parameters are appended to its name when present.
+             *
+             * 2 MiB is minimally mapped size and it should more than suffice.
+             */
+            rc = slaunch_map_l2(string, 2 * 1024 * 1024);
+            BUG_ON(rc != 0);
+
+            slaunch_hash_extend(DRTM_LOC, DRTM_DATA_PCR,
+                                __va(string), strlen(__va(string)),
+                                DLE_EVTYPE_SLAUNCH,
+                                LOG_DATA("MB module string"));
+
+            rc = slaunch_map_l2(start, size);
+            BUG_ON(rc != 0);
+
+            slaunch_hash_extend(DRTM_LOC, DRTM_CODE_PCR, __va(start), size,
+                                DLE_EVTYPE_SLAUNCH, LOG_DATA("MB module"));
+        }
+
+#undef LOG_DATA
+    }
 }
 
 int __init slaunch_map_l2(paddr_t paddr, size_t size)
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 8f24df9bc2..41ccc6dcd3 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -19,6 +19,7 @@
 #if EFI_PAGE_SIZE != PAGE_SIZE
 # error Cannot use xen/pfn.h here!
 #endif
+#include <xen/slr-table.h>
 #include <xen/string.h>
 #include <xen/stringify.h>
 #ifdef CONFIG_X86
@@ -45,6 +46,8 @@
 #define EFI_SYSTEM_RESOURCE_TABLE_GUID    \
   { 0xb122a263U, 0x3661, 0x4f68, {0x99, 0x29, 0x78, 0xf8, 0xb0, 0xd6, 0x21, 0x80} }
 #define EFI_SYSTEM_RESOURCE_TABLE_FIRMWARE_RESOURCE_VERSION 1
+#define UEFI_SLR_TABLE_GUID \
+  { 0x877a9b2aU, 0x0385, 0x45d1, { 0xa0, 0x34, 0x9d, 0xac, 0x9c, 0x9e, 0x56, 0x5f } }
 
 typedef struct {
     EFI_GUID FwClass;
@@ -1154,6 +1157,7 @@ static void __init efi_tables(void)
         static EFI_GUID __initdata mps_guid = MPS_TABLE_GUID;
         static EFI_GUID __initdata smbios_guid = SMBIOS_TABLE_GUID;
         static EFI_GUID __initdata smbios3_guid = SMBIOS3_TABLE_GUID;
+        static EFI_GUID __initdata slr_guid = UEFI_SLR_TABLE_GUID;
 
         if ( match_guid(&acpi2_guid, &efi_ct[i].VendorGuid) )
             efi.acpi20 = (unsigned long)efi_ct[i].VendorTable;
@@ -1165,6 +1169,8 @@ static void __init efi_tables(void)
             efi.smbios = (unsigned long)efi_ct[i].VendorTable;
         if ( match_guid(&smbios3_guid, &efi_ct[i].VendorGuid) )
             efi.smbios3 = (unsigned long)efi_ct[i].VendorTable;
+        if ( match_guid(&slr_guid, &efi_ct[i].VendorGuid) )
+            efi.slr = (unsigned long)efi_ct[i].VendorTable;
         if ( match_guid(&esrt_guid, &efi_ct[i].VendorGuid) )
             esrt = (UINTN)efi_ct[i].VendorTable;
     }
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index 596f2710fb..b2cebaad02 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -72,6 +72,7 @@ struct efi __read_mostly efi = {
 	.mps    = EFI_INVALID_TABLE_ADDR,
 	.smbios = EFI_INVALID_TABLE_ADDR,
 	.smbios3 = EFI_INVALID_TABLE_ADDR,
+	.slr    = EFI_INVALID_TABLE_ADDR,
 };
 
 const struct efi_pci_rom *__read_mostly efi_pci_roms;
diff --git a/xen/include/xen/efi.h b/xen/include/xen/efi.h
index 87146172ad..37d016d885 100644
--- a/xen/include/xen/efi.h
+++ b/xen/include/xen/efi.h
@@ -17,6 +17,7 @@ struct efi {
     unsigned long acpi20;       /* ACPI table (ACPI 2.0) */
     unsigned long smbios;       /* SM BIOS table */
     unsigned long smbios3;      /* SMBIOS v3 table */
+    unsigned long slr;          /* SLR table */
 };
 
 extern struct efi efi;
-- 
2.55.0


