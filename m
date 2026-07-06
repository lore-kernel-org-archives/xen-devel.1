Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCD3C44501
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jul 2026 15:34:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1355440.1610226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglKy-0001MR-DJ; Mon, 06 Jul 2026 15:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355440.1610226; Mon, 06 Jul 2026 15:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglKy-0001MJ-9Z; Mon, 06 Jul 2026 15:34:24 +0000
Received: by outflank-mailman (input) for mailman id 1355440;
 Mon, 06 Jul 2026 15:34:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wglKw-0000wn-Ot
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:34:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wglKw-000YCn-5X
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:34:22 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a4bcafc-5cb7-0a2a0a5109dd-0a2a4507a422-6
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:34:22 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a4bcafd-9c8e-0a2a45070019-d1558030ec53-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:34:22 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-493d28b1930so24172985e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:34:22 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c63bfba1sm433726505e9.15.2026.07.06.08.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:34:20 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1783352061; x=1783956861; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=US++6oXh7QmRtGgM9Ky45/VXvpj8kcMFRZ59/2f4CgI=;
        b=jJ9zhtcJ/q7XROAGTiLGjebJtD2vWUz1jWLHxyUwxk5VFkWZtLMRTMl4khCx47Au8W
         9Awf822YbVLks7VOenwhwPnzC8zhA9WlCFoCx5fWGlckq2kJvkcVrzwBc0xdGFDQbt8S
         57xdnj7ty29f4OZVf/VPC5uBRmrKVAuRAPmj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352061; x=1783956861;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=US++6oXh7QmRtGgM9Ky45/VXvpj8kcMFRZ59/2f4CgI=;
        b=aAtB1ALyYUfcu5Yf65PzHKPrVO7xmGj5ZxUNWsmhVYGSp5QZmpzgK+RICKwoM26qQI
         0xpR4qyHnEuq6O2J4NRBkiCanefnY+15ruQLsgLYgADz5E5aWESrjQszCErkeb168/Pv
         nyY9aknmBifF3DbhUDomna0FCn18yDi3LcINUl5V44gjCUeS3IULaxskG8wORhY5DrwK
         eHI5mU3Ts9CApnFNkQIOVIL48WFZjDXT9rhFR0vP2uaPcIB83qHi6rIOLBBi2pbUX1Uj
         r35JxpxHgbEKVvrxJiFvy/OhY3+UFNlD1cdSiyGzGyb7Sc0g6UNTtQKnFwa19oVQ1y/I
         YyYw==
X-Gm-Message-State: AOJu0Ywq77zyn0bq5NDYCwQUhoDmkBRAYyQ/1VDDQkOYOsR2d+pYNGUz
	yBOJ7ZiQvhyRT7/g0hp6Lj3yGJnTRXCb8UiXg8eD/NHpipaSGTsU0UBbx1qpXj56rrLAe2zS0za
	IWdNpR8U=
X-Gm-Gg: AfdE7ck4hT8XG1Rljukg4SVdScDODlMrlQEoplBw5V2z3ZkqBSM5VThRhPWsd65yr6F
	QF53pImdJp2dlfbrCJAosQtJ8Pd6/Gg1zJL/6m6oAkproeiIHm3Pge8KQs8DbdEWE9hE5/WR/7M
	rZ6UZsLNatkKskHNJbLqz0aKcesIwvbnmbFsHnfwT4ly1OKaR68OpjJ8xQCrz3UY4Tt78JIyWrA
	3yQq4yMBBu+ygkzuUsRey7XhItSdtolYPDQ3CxJE/iRBjS12RPiR4e3n7AsCRMJ1j7q7uki3yBX
	kymtdaDDfCnNwVP8JbKGnZ/JTjW2FyV5285HIcnGytxG4FRHki3cK7CSCQc6ulatuURIJ3nbI7s
	6mfWCS+PPCeqIXH94WqdQSn7yySwr8P3iW2Yd9t29eAX34bds15j25T0l+i13LevsZN3sGmgMb3
	v74pldzimmB7/HL4eo/fS1W1e8gU1/kIoFxs7z52HcQx2KPOxscXq808RsQFY4A78=
X-Received: by 2002:a05:600c:154e:b0:493:d216:ed96 with SMTP id 5b1f17b1804b1-493df0b6a8emr11671105e9.9.1783352061219;
        Mon, 06 Jul 2026 08:34:21 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 2/3] x86/entry: Use POP_GPRS and remove RESTORE_ALL
Date: Mon,  6 Jul 2026 16:34:14 +0100
Message-Id: <20260706153415.1264750-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260706153415.1264750-1-andrew.cooper3@citrix.com>
References: <20260706153415.1264750-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1783352062-7D72125E-81E483E4/0/0
X-purgate-type: clean
X-purgate-size: 5688

POP_GPRS is shorter than RESTORE_ALL in terms of emitted code.

By separating the popping of entry_vector/error_code off the stack,
SPEC_CTRL_COND_VERW doesn't need custom displacements.

Get rid of the compat=1 special case for PV32.  It's not obviously a win, and
PV32 is getting increasingly rare these days.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>

Bloat-o-meter reports:
  add/remove: 0/0 grow/shrink: 0/3 up/down: 0/-128 (-128)
  Function                                     old     new   delta
  compat_restore_all_guest                     187     158     -29
  restore_all_guest                            372     324     -48
  restore_all_xen                              165     114     -51
---
 xen/arch/x86/include/asm/asm_defns.h | 50 +---------------------------
 xen/arch/x86/x86_64/compat/entry.S   |  9 +++--
 xen/arch/x86/x86_64/entry.S          | 12 +++----
 3 files changed, 10 insertions(+), 61 deletions(-)

diff --git a/xen/arch/x86/include/asm/asm_defns.h b/xen/arch/x86/include/asm/asm_defns.h
index 87bd6b1193e7..d1b80186c14c 100644
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -264,54 +264,6 @@ static always_inline void stac(void)
         xor   %r15d, %r15d
 .endm
 
-#define LOAD_ONE_REG(reg, compat) \
-.if !(compat); \
-        movq  UREGS_r##reg(%rsp),%r##reg; \
-.else; \
-        movl  UREGS_r##reg(%rsp),%e##reg; \
-.endif
-
-/*
- * Restore all previously saved registers.
- *
- * @adj: extra stack pointer adjustment to be folded into the adjustment done
- *       anyway at the end of the macro
- * @compat: R8-R15 don't need reloading, but they are clobbered for added
- *          safety against information leaks.
- */
-.macro RESTORE_ALL adj=0, compat=0
-.if !\compat
-        movq  UREGS_r15(%rsp), %r15
-        movq  UREGS_r14(%rsp), %r14
-        movq  UREGS_r13(%rsp), %r13
-        movq  UREGS_r12(%rsp), %r12
-.else
-        xor %r15d, %r15d
-        xor %r14d, %r14d
-        xor %r13d, %r13d
-        xor %r12d, %r12d
-.endif
-        LOAD_ONE_REG(bp, \compat)
-        LOAD_ONE_REG(bx, \compat)
-.if !\compat
-        movq  UREGS_r11(%rsp),%r11
-        movq  UREGS_r10(%rsp),%r10
-        movq  UREGS_r9(%rsp),%r9
-        movq  UREGS_r8(%rsp),%r8
-.else
-        xor %r11d, %r11d
-        xor %r10d, %r10d
-        xor %r9d, %r9d
-        xor %r8d, %r8d
-.endif
-        LOAD_ONE_REG(ax, \compat)
-        LOAD_ONE_REG(cx, \compat)
-        LOAD_ONE_REG(dx, \compat)
-        LOAD_ONE_REG(si, \compat)
-        LOAD_ONE_REG(di, \compat)
-        subq  $-(UREGS_error_code-UREGS_r15+\adj), %rsp
-.endm
-
 /*
  * Push and clear GPRs
  */
@@ -369,7 +321,7 @@ static always_inline void stac(void)
         pop   %r9
         pop   %r8
  .if \skip_rax
-        pop   %rcx
+        pop   %rcx /* Any register yet to restore. */
  .else
         pop   %rax
  .endif
diff --git a/xen/arch/x86/x86_64/compat/entry.S b/xen/arch/x86/x86_64/compat/entry.S
index 39925d80a677..4bf4ee7c944c 100644
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -160,12 +160,11 @@ FUNC(compat_restore_all_guest)
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
         SPEC_CTRL_EXIT_TO_PV    /* Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: cd */
 
-        RESTORE_ALL adj=8, compat=1
+        POP_GPRS
 
-        /* Account for ev/ec having already been popped off the stack. */
-        SPEC_CTRL_COND_VERW \
-            scf=STK_REL(CPUINFO_scf,      CPUINFO_rip), \
-            sel=STK_REL(CPUINFO_verw_sel, CPUINFO_rip)
+        SPEC_CTRL_COND_VERW     /* Req: %rsp=eframe                    Clob: efl */
+
+        add     $8, %rsp        /* Pop ev/ec off the stack */
 
         jmp     iret_to_guest
 END(compat_restore_all_guest)
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index de5d854f5533..cd3532d7d174 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -226,7 +226,8 @@ FUNC_LOCAL(restore_all_guest)
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
         SPEC_CTRL_EXIT_TO_PV    /* Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: cd */
 
-        RESTORE_ALL
+        POP_GPRS
+
         BUILD_BUG_ON(TRAP_syscall & 0xff)
         testb $TRAP_syscall >> 8, EFRAME_entry_vector + 1(%rsp)
         jz    iret_exit_to_guest
@@ -753,20 +754,17 @@ UNLIKELY_END(exit_cr3)
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
         SPEC_CTRL_EXIT_TO_XEN /* Req: %r12=ist_exit %r14=end %rsp=regs, Clob: abcd */
 
-        RESTORE_ALL adj=8
+        POP_GPRS
 
         /*
          * When the CPU pushed this exception frame, it zero-extended eflags.
          * For an IST exit, SPEC_CTRL_EXIT_TO_XEN stashed shadow copies of
          * scf and ver_sel above eflags, as we can't use any GPRs,
          * and we're at a random place on the stack, not in a CPUFINFO block.
-         *
-         * Account for ev/ec having already been popped off the stack.
          */
-        SPEC_CTRL_COND_VERW \
-            scf=STK_REL(EFRAME_shadow_scf, EFRAME_rip), \
-            sel=STK_REL(EFRAME_shadow_sel, EFRAME_rip)
+        SPEC_CTRL_COND_VERW     /* Req: %rsp=eframe                    Clob: efl */
 
+        add     $8, %rsp        /* Pop ev/ec off the stack */
         iretq
 END(restore_all_xen)
 
-- 
2.39.5


