Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F123C5DF67
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 18:59:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1391431.1631259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wux7N-0005Ol-NL; Fri, 14 Aug 2026 18:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1391431.1631259; Fri, 14 Aug 2026 18:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wux7N-0005Oe-Kb; Fri, 14 Aug 2026 18:59:01 +0000
Received: by outflank-mailman (input) for mailman id 1391431;
 Fri, 14 Aug 2026 18:59:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wux7M-0005Bd-3p
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 18:59:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wux7K-006yQi-SW
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 20:58:58 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a7f6523-2eae-0a2a0a5409dd-0a2a4508a910-40
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 20:58:58 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a7f6572-f659-0a2a45080019-d1558029bcf3-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 20:58:58 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so11788405e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 11:58:58 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f229681sm8682153f8f.16.2026.08.14.11.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2026 11:58:57 -0700 (PDT)
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
        d=citrix.com; s=google; t=1786733938; x=1787338738; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QtmaY6E0WOh6bcecniAklvM6olukym04Ax7bxpV8h4U=;
        b=tdr+QCxNTyBanaaGNRl5MN19QQdO6L7TUKu/rImuqgN0MmV/Hoc5plwtVd68Ta2i5s
         klYksnHrqiPc9JmMNWPTKEoMHFmaas3/NNO3XRnx3gOQixwd/I6H0fWRUC/nuxgGjr0c
         Dp6tieGu2mZxnESFW6eJU0h7n0lakNu64cGbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786733938; x=1787338738;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QtmaY6E0WOh6bcecniAklvM6olukym04Ax7bxpV8h4U=;
        b=nSlj6C59eJKbLCK4HT8VcfAF8v3D7+mbjWSeF+R22T4qAQqeKZE+iCRjI3qYXKxWOk
         gD9q+gNgg2C5JJYJ4IrsumAwBQ1p3O5FTaokbVfyu8hcjhu8r0vD6lC7PkymiBytEPnV
         Sa/sK7dviuipj5STptOoTvaGdL0O60BSceuk0rgIK7hxI72hpbFaf9xSwWUnm58FLPin
         PqhbzfuPnKi0woQoflXfRCXhw2uLZ+fyfIomVaXdnLXmUCsWjrcG0+p7El7nh78X/hdQ
         rcNKercTljKmC+miBneuKpOxvgOck9z73Re0ngNHzMSlwbvPDInezZzEQ0hAtZ+KRRzM
         dGSg==
X-Gm-Message-State: AOJu0YzjD16fM2GhSCFWA6FXUsewDYZPZMSGUTiqOBwnriCpu1Vkt7ad
	pUXi5NRgU5f02OI4xCFCKP5FwsLXWa2ONLawtleNsKpT6gzia7psIDsEIt4wjy9XCXURlgIu9fp
	x+7gI
X-Gm-Gg: AR+sD13Ok5JtmJlIeDwGVMx2A21YnPOA0kyPtEi0ovUt+da3opx26FUdg9MsEzmttRa
	tczq1AdzYgZuubAqHpIUy7c2zPsZWC5e24jT+Q4wps1mmJ7+Yboc+PyJdB2ZmwTcyxbqtDE2sUB
	kk/RNFV7RpyjXj/vn8UrQL8oyAQlbGSiAV8yhS0k7n/g9IsZl6AkES1tLS07aCV6IBvt49G5t8Y
	4IC7m8FedtIR46RhtO2YibdF9GSp8MygDwSkltLvWZJGCQMBJiKDaq9EkySTOC2QMWZydYl1x8V
	qqSL4AMm//a1BJFhZRO5EdAzmIyGMATL438vhgnfE14a1sh3BcnqKY0/ZqHN8eoL5pQ0ikfJq+O
	GImPyz7o9HvLbQLTsQaLtohLoQ+E4HpwyBQMuCbNi3vz/sOfB2pWYp4ih8yTZ08a4PhAKdJihes
	of40OwoPDAz6d+D/do+FhNUpBY/izOYP/118rfVnmIjDgCWSy7yWc4OtQWCpuN+bPK6yiz7fNrY
	jXWyAW1ayUytuyd/fGwz4LhPZfhv5u1C28DClk=
X-Received: by 2002:a05:600c:3491:b0:498:952:e276 with SMTP id 5b1f17b1804b1-499879653bbmr122153255e9.8.1786733937704;
        Fri, 14 Aug 2026 11:58:57 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 2/3] x86/emul: Drop trailing r from x86_seg_[lgi]dt names
Date: Fri, 14 Aug 2026 19:58:40 +0100
Message-Id: <20260814185841.1757421-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260814185841.1757421-1-andrew.cooper3@citrix.com>
References: <20260814185841.1757421-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1786733938-CC97287B-4C0DD2D5/0/0
X-purgate-type: clean
X-purgate-size: 16940

These refer to the segment, not to the segment registers.  TR is the
odd-one-out having "register" in it's name.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 .../fuzz/x86_instruction_emulator/fuzz-emul.c |  2 +-
 tools/tests/x86_emulator/test_x86_emulator.c  |  4 +-
 xen/arch/x86/hvm/hvm.c                        | 42 +++++++++----------
 xen/arch/x86/hvm/svm/svm.c                    | 22 +++++-----
 xen/arch/x86/hvm/vmx/realmode.c               |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c                    | 22 +++++-----
 xen/arch/x86/include/asm/x86-types.h          |  6 +--
 xen/arch/x86/vm_event.c                       |  4 +-
 xen/arch/x86/x86_emulate/0f01.c               |  2 +-
 xen/arch/x86/x86_emulate/x86_emulate.c        |  6 +--
 10 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
index 2b9b72df3584..ebe085465aae 100644
--- a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
+++ b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
@@ -362,7 +362,7 @@ static int fuzz_cmpxchg(
     if ( is_x86_user_segment(seg) )
         assert(ctxt->addr_size == 64 || !(offset >> 32));
     else
-        assert((seg == x86_seg_gdtr || seg == x86_seg_ldtr) && !(offset >> 16));
+        assert((seg == x86_seg_gdt || seg == x86_seg_ldt) && !(offset >> 16));
 
     return maybe_fail(ctxt, "cmpxchg", true);
 }
diff --git a/tools/tests/x86_emulator/test_x86_emulator.c b/tools/tests/x86_emulator/test_x86_emulator.c
index 31391f1bf790..61b2840ee058 100644
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -559,7 +559,7 @@ static int read(
     {
         uint64_t value;
 
-    case x86_seg_gdtr:
+    case x86_seg_gdt:
         /* Fake system segment type matching table index. */
         if ( (offset & 7) || (bytes > 8) )
             return X86EMUL_UNHANDLEABLE;
@@ -579,7 +579,7 @@ static int read(
         memcpy(p_data, &value, bytes);
         return X86EMUL_OKAY;
 
-    case x86_seg_ldtr:
+    case x86_seg_ldt:
         /* Fake user segment type matching table index. */
         if ( (offset & 7) || (bytes > 8) )
             return X86EMUL_UNHANDLEABLE;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index a75ccb57bf04..b7d5ba126b1e 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -879,11 +879,11 @@ static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
     /* Architecture-specific vmcs/vmcb bits */
     alternative_vcall(hvm_funcs.save_cpu_ctxt, v, &ctxt);
 
-    hvm_get_segment_register(v, x86_seg_idtr, &seg);
+    hvm_get_segment_register(v, x86_seg_idt, &seg);
     ctxt.idtr_limit = seg.limit;
     ctxt.idtr_base = seg.base;
 
-    hvm_get_segment_register(v, x86_seg_gdtr, &seg);
+    hvm_get_segment_register(v, x86_seg_gdt, &seg);
     ctxt.gdtr_limit = seg.limit;
     ctxt.gdtr_base = seg.base;
 
@@ -929,7 +929,7 @@ static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
     ctxt.tr_base = seg.base;
     ctxt.tr_arbytes = seg.attr;
 
-    hvm_get_segment_register(v, x86_seg_ldtr, &seg);
+    hvm_get_segment_register(v, x86_seg_ldt, &seg);
     ctxt.ldtr_sel = seg.sel;
     ctxt.ldtr_limit = seg.limit;
     ctxt.ldtr_base = seg.base;
@@ -1129,11 +1129,11 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
 
     seg.limit = ctxt.idtr_limit;
     seg.base = ctxt.idtr_base;
-    hvm_set_segment_register(v, x86_seg_idtr, &seg);
+    hvm_set_segment_register(v, x86_seg_idt, &seg);
 
     seg.limit = ctxt.gdtr_limit;
     seg.base = ctxt.gdtr_base;
-    hvm_set_segment_register(v, x86_seg_gdtr, &seg);
+    hvm_set_segment_register(v, x86_seg_gdt, &seg);
 
     seg.sel = ctxt.cs_sel;
     seg.limit = ctxt.cs_limit;
@@ -1181,7 +1181,7 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
     seg.limit = ctxt.ldtr_limit;
     seg.base = ctxt.ldtr_base;
     seg.attr = ctxt.ldtr_arbytes;
-    hvm_set_segment_register(v, x86_seg_ldtr, &seg);
+    hvm_set_segment_register(v, x86_seg_ldt, &seg);
 
     if ( ctxt.flags & XEN_X86_FPU_INITIALISED )
         vcpu_setup_fpu(v, &ctxt.fpu_regs);
@@ -2875,11 +2875,11 @@ static int task_switch_load_seg(
     }
 
     /* LDT descriptor must be in the GDT. */
-    if ( (seg == x86_seg_ldtr) && (sel & 4) )
+    if ( (seg == x86_seg_ldt) && (sel & 4) )
         goto fault;
 
     hvm_get_segment_register(
-        v, (sel & 4) ? x86_seg_ldtr : x86_seg_gdtr, &desctab);
+        v, (sel & 4) ? x86_seg_ldt : x86_seg_gdt, &desctab);
 
     /* Segment not valid for use (cooked meaning of .p)? */
     if ( !desctab.p )
@@ -2897,7 +2897,7 @@ static int task_switch_load_seg(
         desc = *pdesc;
 
         /* LDT descriptor is a system segment. All others are code/data. */
-        if ( (desc.b & (1u<<12)) == ((seg == x86_seg_ldtr) << 12) )
+        if ( (desc.b & (1 << 12)) == ((seg == x86_seg_ldt) << 12) )
             goto fault;
 
         dpl = (desc.b >> 13) & 3;
@@ -2920,7 +2920,7 @@ static int task_switch_load_seg(
             if ( (dpl != cpl) || (dpl != rpl) )
                 goto fault;
             break;
-        case x86_seg_ldtr:
+        case x86_seg_ldt:
             /* LDT system segment? */
             if ( (desc.b & _SEGMENT_TYPE) != (2u<<8) )
                 goto fault;
@@ -3035,7 +3035,7 @@ void hvm_task_switch(
     unsigned int token = hvmemul_cache_disable(v);
     struct tss32 tss;
 
-    hvm_get_segment_register(v, x86_seg_gdtr, &gdt);
+    hvm_get_segment_register(v, x86_seg_gdt, &gdt);
     hvm_get_segment_register(v, x86_seg_tr, &prev_tr);
 
     if ( ((tss_sel & 0xfff8) + 7) > gdt.limit )
@@ -3120,7 +3120,7 @@ void hvm_task_switch(
     tss.fs = segr.sel;
     hvm_get_segment_register(v, x86_seg_gs, &segr);
     tss.gs = segr.sel;
-    hvm_get_segment_register(v, x86_seg_ldtr, &segr);
+    hvm_get_segment_register(v, x86_seg_ldt, &segr);
     tss.ldt = segr.sel;
 
     rc = hvm_copy_to_guest_linear(prev_tr.base + offsetof(typeof(tss), eip),
@@ -3146,7 +3146,7 @@ void hvm_task_switch(
 
     new_cpl = tss.eflags & X86_EFLAGS_VM ? 3 : tss.cs & 3;
 
-    if ( task_switch_load_seg(x86_seg_ldtr, tss.ldt, new_cpl, 0) )
+    if ( task_switch_load_seg(x86_seg_ldt, tss.ldt, new_cpl, 0) )
         goto out;
 
     rc = hvm_set_cr3(tss.cr3, false, true);
@@ -4011,14 +4011,14 @@ void hvm_vcpu_reset_state(struct vcpu *v, uint16_t cs, uint16_t ip)
     hvm_set_segment_register(v, x86_seg_ss, &reg);
 
     reg.attr = 0x82; /* LDT */
-    hvm_set_segment_register(v, x86_seg_ldtr, &reg);
+    hvm_set_segment_register(v, x86_seg_ldt, &reg);
 
     reg.attr = 0x8b; /* 32-bit TSS (busy) */
     hvm_set_segment_register(v, x86_seg_tr, &reg);
 
     reg.attr = 0;
-    hvm_set_segment_register(v, x86_seg_gdtr, &reg);
-    hvm_set_segment_register(v, x86_seg_idtr, &reg);
+    hvm_set_segment_register(v, x86_seg_gdt, &reg);
+    hvm_set_segment_register(v, x86_seg_idt, &reg);
 
     /* Sync AP's TSC with BSP's. */
     v->arch.hvm.cache_tsc_offset =
@@ -5294,8 +5294,8 @@ void hvm_get_segment_register(struct vcpu *v, enum x86_segment seg,
         reg->p = 1;
         break;
 
-    case x86_seg_gdtr:
-    case x86_seg_idtr:
+    case x86_seg_gdt:
+    case x86_seg_idt:
         /*
          * Treat GDTR/IDTR as being present system segments.  This avoids them
          * needing special casing for segmentation checks.
@@ -5394,7 +5394,7 @@ void hvm_set_segment_register(struct vcpu *v, enum x86_segment seg,
             ASSERT(!"%tr typecheck failure");
         break;
 
-    case x86_seg_ldtr:
+    case x86_seg_ldt:
         if ( reg->p )
         {
             ASSERT(!reg->s);                         /* System segment. */
@@ -5404,8 +5404,8 @@ void hvm_set_segment_register(struct vcpu *v, enum x86_segment seg,
         }
         break;
 
-    case x86_seg_gdtr:
-    case x86_seg_idtr:
+    case x86_seg_gdt:
+    case x86_seg_idt:
         ASSERT(is_canonical_address(reg->base));
         ASSERT((reg->limit >> 16) == 0);             /* Upper bits clear. */
         break;
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 38c61db1d71d..eab8c735cf25 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -627,15 +627,15 @@ static void cf_check svm_get_segment_register(
         *reg = vmcb->tr;
         break;
 
-    case x86_seg_gdtr:
+    case x86_seg_gdt:
         *reg = vmcb->gdtr;
         break;
 
-    case x86_seg_idtr:
+    case x86_seg_idt:
         *reg = vmcb->idtr;
         break;
 
-    case x86_seg_ldtr:
+    case x86_seg_ldt:
         svm_sync_vmcb(v, vmcb_in_sync);
         *reg = vmcb->ldtr;
         break;
@@ -664,15 +664,15 @@ static void cf_check svm_set_segment_register(
         vmcb->cleanbits.seg = false;
         break;
 
-    case x86_seg_gdtr:
-    case x86_seg_idtr:
+    case x86_seg_gdt:
+    case x86_seg_idt:
         vmcb->cleanbits.dt = false;
         break;
 
     case x86_seg_fs:
     case x86_seg_gs:
     case x86_seg_tr:
-    case x86_seg_ldtr:
+    case x86_seg_ldt:
         if ( v == current )
             svm_sync_vmcb(v, vmcb_needs_vmload);
         break;
@@ -698,17 +698,17 @@ static void cf_check svm_set_segment_register(
         vmcb->tr = *reg;
         break;
 
-    case x86_seg_gdtr:
+    case x86_seg_gdt:
         vmcb->gdtr.base = reg->base;
         vmcb->gdtr.limit = reg->limit;
         break;
 
-    case x86_seg_idtr:
+    case x86_seg_idt:
         vmcb->idtr.base = reg->base;
         vmcb->idtr.limit = reg->limit;
         break;
 
-    case x86_seg_ldtr:
+    case x86_seg_ldt:
         vmcb->ldtr = *reg;
         break;
 
@@ -1163,8 +1163,8 @@ static void svm_emul_swint_injection(struct x86_event *event)
      * this entry, even though we don't look at all the words read.
      */
     hvm_get_segment_register(curr, x86_seg_cs, &cs);
-    hvm_get_segment_register(curr, x86_seg_idtr, &idtr);
-    if ( !hvm_virtual_to_linear_addr(x86_seg_idtr, &idtr, idte_offset,
+    hvm_get_segment_register(curr, x86_seg_idt, &idtr);
+    if ( !hvm_virtual_to_linear_addr(x86_seg_idt, &idtr, idte_offset,
                                      idte_size, hvm_access_read,
                                      &cs, &idte_linear_addr) )
         goto raise_exception;
diff --git a/xen/arch/x86/hvm/vmx/realmode.c b/xen/arch/x86/hvm/vmx/realmode.c
index ff44ddcfa627..0a3ee0bb9e2c 100644
--- a/xen/arch/x86/hvm/vmx/realmode.c
+++ b/xen/arch/x86/hvm/vmx/realmode.c
@@ -34,7 +34,7 @@ static void realmode_deliver_exception(
     uint16_t frame[3];
     unsigned int last_byte;
 
-    idtr = hvmemul_get_seg_reg(x86_seg_idtr, hvmemul_ctxt);
+    idtr = hvmemul_get_seg_reg(x86_seg_idt, hvmemul_ctxt);
     csr  = hvmemul_get_seg_reg(x86_seg_cs,   hvmemul_ctxt);
     __set_bit(x86_seg_cs, &hvmemul_ctxt->seg_reg_dirty);
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 269ca5643346..b0d5ad6981b3 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1227,19 +1227,19 @@ static void cf_check vmx_get_segment_register(
     }
 
     /*
-     * Xen's x86_seg_* enumeration *almost* matches the VMCS encoding order.
+     * Xen's x86_segment encoding *almost* matches the VMCS encoding order.
      *
-     * tr and ldtr are reversed, and other areas of code rely on this, so we
+     * tr and ldt are reversed, and other areas of code rely on this, so we
      * can't just re-enumerate.
      */
     BUILD_BUG_ON(x86_seg_tr   != 6);
-    BUILD_BUG_ON(x86_seg_ldtr != 7);
-    BUILD_BUG_ON(x86_seg_gdtr != 8);
-    BUILD_BUG_ON(x86_seg_idtr != 9);
+    BUILD_BUG_ON(x86_seg_ldt  != 7);
+    BUILD_BUG_ON(x86_seg_gdt  != 8);
+    BUILD_BUG_ON(x86_seg_idt  != 9);
     switch ( tmp_seg = seg )
     {
     case x86_seg_tr:
-    case x86_seg_ldtr:
+    case x86_seg_ldt:
         tmp_seg ^= 1; /* Flip tr and ldtr so GUEST_SEG_*() works. */
         fallthrough;
 
@@ -1248,8 +1248,8 @@ static void cf_check vmx_get_segment_register(
         __vmread(GUEST_SEG_AR_BYTES(tmp_seg), &attr);
         fallthrough;
 
-    case x86_seg_gdtr:
-    case x86_seg_idtr:
+    case x86_seg_gdt:
+    case x86_seg_idt:
         __vmread(GUEST_SEG_LIMIT(tmp_seg),    &limit);
         __vmread(GUEST_SEG_BASE(tmp_seg),     &reg->base);
         break;
@@ -1368,7 +1368,7 @@ static void cf_check vmx_set_segment_register(
     switch ( seg )
     {
     case x86_seg_tr:
-    case x86_seg_ldtr:
+    case x86_seg_ldt:
         seg ^= 1; /* Flip tr and ldtr so GUEST_SEG_*() works. */
         fallthrough;
 
@@ -1377,8 +1377,8 @@ static void cf_check vmx_set_segment_register(
         __vmwrite(GUEST_SEG_AR_BYTES(seg), attr);
         fallthrough;
 
-    case x86_seg_gdtr:
-    case x86_seg_idtr:
+    case x86_seg_gdt:
+    case x86_seg_idt:
         __vmwrite(GUEST_SEG_LIMIT(seg),    limit);
         __vmwrite(GUEST_SEG_BASE(seg),     base);
         break;
diff --git a/xen/arch/x86/include/asm/x86-types.h b/xen/arch/x86/include/asm/x86-types.h
index 26b06aeac380..488dc2b0cdaa 100644
--- a/xen/arch/x86/include/asm/x86-types.h
+++ b/xen/arch/x86/include/asm/x86-types.h
@@ -31,9 +31,9 @@ enum x86_segment {
     x86_seg_gs,
     /* System: Valid to use for implicit table references. */
     x86_seg_tr,
-    x86_seg_ldtr,
-    x86_seg_gdtr,
-    x86_seg_idtr,
+    x86_seg_ldt,
+    x86_seg_gdt,
+    x86_seg_idt,
     /* No Segment: For (system/normal) accesses which are already linear. */
     x86_seg_sys,
     x86_seg_none
diff --git a/xen/arch/x86/vm_event.c b/xen/arch/x86/vm_event.c
index 112d2ef66dc7..efafb4e4bc14 100644
--- a/xen/arch/x86/vm_event.c
+++ b/xen/arch/x86/vm_event.c
@@ -183,7 +183,7 @@ static void vm_event_pack_segment_register(enum x86_segment segment,
         reg->es_sel = seg.sel;
         break;
 
-    case x86_seg_gdtr:
+    case x86_seg_gdt:
         reg->gdtr_base = seg.base;
         reg->gdtr_limit = seg.limit;
         break;
@@ -248,7 +248,7 @@ void vm_event_fill_regs(vm_event_request_t *req)
     vm_event_pack_segment_register(x86_seg_ss, &req->data.regs.x86);
     vm_event_pack_segment_register(x86_seg_ds, &req->data.regs.x86);
     vm_event_pack_segment_register(x86_seg_es, &req->data.regs.x86);
-    vm_event_pack_segment_register(x86_seg_gdtr, &req->data.regs.x86);
+    vm_event_pack_segment_register(x86_seg_gdt, &req->data.regs.x86);
 
     req->data.regs.x86.shadow_gs = ctxt.shadow_gs;
     req->data.regs.x86.dr6 = ctxt.dr6;
diff --git a/xen/arch/x86/x86_emulate/0f01.c b/xen/arch/x86/x86_emulate/0f01.c
index d2a106557d36..ff39aefd0382 100644
--- a/xen/arch/x86/x86_emulate/0f01.c
+++ b/xen/arch/x86/x86_emulate/0f01.c
@@ -22,7 +22,7 @@ int x86emul_0f01(struct x86_emulate_state *s,
                  struct x86_emulate_ctxt *ctxt,
                  const struct x86_emulate_ops *ops)
 {
-    enum x86_segment seg = (s->modrm_reg & 1) ? x86_seg_idtr : x86_seg_gdtr;
+    enum x86_segment seg = (s->modrm_reg & 1) ? x86_seg_idt : x86_seg_gdt;
     int rc;
 
     switch ( s->modrm )
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index e15ab3775854..24db9fd175d0 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -891,7 +891,7 @@ protmode_load_seg(
     const struct x86_emulate_ops *ops)
 {
     const struct cpu_policy *cp = ctxt->cpu_policy;
-    enum x86_segment sel_seg = (sel & 4) ? x86_seg_ldtr : x86_seg_gdtr;
+    enum x86_segment sel_seg = (sel & 4) ? x86_seg_ldt : x86_seg_gdt;
     struct { uint32_t a, b; } desc, desc_hi = {};
     uint8_t dpl, rpl;
     int cpl = x86emul_get_cpl(ctxt, ops);
@@ -992,7 +992,7 @@ protmode_load_seg(
         if ( (dpl != cpl) || (dpl != rpl) )
             goto raise_exn;
         break;
-    case x86_seg_ldtr:
+    case x86_seg_ldt:
         /* LDT system segment? */
         if ( (desc.b & (15u<<8)) != (2u<<8) )
             goto raise_exn;
@@ -2914,7 +2914,7 @@ x86_emulate(
         break;
 
     case X86EMUL_OPC(0x0f, 0x00): /* Grp6 */
-        seg = (modrm_reg & 1) ? x86_seg_tr : x86_seg_ldtr;
+        seg = (modrm_reg & 1) ? x86_seg_tr : x86_seg_ldt;
         generate_exception_if(!in_protmode(ctxt, ops), X86_EXC_UD);
         switch ( modrm_reg & 6 )
         {
-- 
2.39.5


