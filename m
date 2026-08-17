Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97032C5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 12:12:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392883.1631846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvwBm-00072g-7Z; Mon, 17 Aug 2026 12:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392883.1631846; Mon, 17 Aug 2026 12:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvwBm-00072Z-4T; Mon, 17 Aug 2026 12:11:38 +0000
Received: by outflank-mailman (input) for mailman id 1392883;
 Mon, 17 Aug 2026 12:11:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wvwBk-00072T-Vp
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 12:11:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvwBj-005sHB-HJ
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 14:11:35 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a82fa6e-2eae-0a2a0a5409dd-0a2a450aa3f0-32
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 14:11:35 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a82fa77-f2d2-0a2a450a0019-d1558032d150-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 14:11:35 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4995b0343c1so31568605e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 05:11:35 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5b7840esm3121758f8f.29.2026.08.17.05.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 05:11:31 -0700 (PDT)
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
        d=citrix.com; s=google; t=1786968695; x=1787573495; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mm8rYwJ94WoMy2zl46KL0OvoZuAPqnQ3iss5Dazj+AY=;
        b=Lf8C2e8t3ssGPz/ombKBE6jYiiu4wzQRkOwWM/6+Un/7T/GOpPU+CYUSGwwRv2xKnH
         /1/kF73HTQHrV5lXjlhg7FGvlf56KNSlh2l/nHeoHP6pMd3t9gtqnD+7t2Kjdo0zyVYJ
         I1+kypmiu6bYWSI694ej3nbfenB04UecMgUlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786968695; x=1787573495;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mm8rYwJ94WoMy2zl46KL0OvoZuAPqnQ3iss5Dazj+AY=;
        b=qBGM3gsoU3xK3J2TD4UwVNIaN/SsCxRd6xyv1HixhawN5SWER1JSlIeA5Qpj/r41fx
         GRMUAbaL+zbR8w9C/9lJMKw5qhVwfI6HezvVQqXSTZ59YwqwvHReZrQdCp0NwSOwtbDO
         4mk2FmwY6yH2MxyiiCLJhAN1V/hCuxCe6sR/+zRLZhzQOb5uBNSV1CvTNKfClgccs9cC
         mhIIpWqvck1AHAjwgsU4/79hobVgzEKmCDDVSCL5QqlF6nxgIvnCZedDomJeZZl4QOT1
         6qwe5ibO4x7nTJLZv2Smq/ErqE1+6jDzbzx0Zg1y03Fzz+AlLTh6JPGFjoBiiI6RGaHD
         xVfg==
X-Gm-Message-State: AOJu0Yy889E4RXWOhMR5QyKS6Jj7ONf1G/hgDoT9+SLS4pkjd0QgvwaC
	HH/wr53XGgTmaIUIzw0zQh/i4p4pbk+tCl52/X/uQg8P3OarCNYGQ4/8Ak3BGP+Fkc0nnPkMghp
	gjLW1Tj4=
X-Gm-Gg: AR+sD13QdxRGPW/dXilN9KsiywY+WBaetjr9h168zXu27zupt4VxWTy5ae47oEfDRPt
	wJrKdj5q7WkBHR4jz4pBLyWoTTCjWag4Gl31mDoHr/FSaoaR+TY/yT4s8bYAUwchw7qG39yS+Bp
	i4nBdvXU6F/7125mBDsTZUnj04bIXoJZqTxY2qtBs4ZFM8zay0BcDS+ygnyku0O5ZH7uI6g2E7A
	aEZzHY6aFMrmPbE2UOQQb8S0nzvLLs2G8t5AC0skHd0VWkkYgQh3meF7p9WoE7Tx3ozAh6NWT+6
	e6d+bWKoYIbkgf/K4/sYP/JKv3FkNOPSUoiwKbhRnD7YoVbUBn+bO9Msgx4SF1SLawprMFHEQVG
	4HLb5ltNfQfhKruFe139r5HS6jLxYUiVGvGo/pLS59fpATWbL1RfDP3m9SvgfLXWIDNC93PxSrM
	lhnTX2Ws6mX0BzUc+0e9p32NfOrOk8KmhN3KSpXDp090v810siRXOMjFxdNbNOsLXwEOEN1nMXA
	o5mB6chjRiu8wvG1Y+c73hMghN/gRZCr1HosgA=
X-Received: by 2002:a05:600c:8b37:b0:497:ff73:68d5 with SMTP id 5b1f17b1804b1-499878cf9bamr364886625e9.0.1786968694285;
        Mon, 17 Aug 2026 05:11:34 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2 2/3] x86/emul: Rename the x86_seg_* system segments
Date: Mon, 17 Aug 2026 13:11:29 +0100
Message-Id: <20260817121129.1787344-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260814185841.1757421-3-andrew.cooper3@citrix.com>
References: <20260814185841.1757421-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1786968695-520C1CFC-34B20C49/0/0
X-purgate-type: clean
X-purgate-size: 27715

These refer to the segments themsevles, not to the registers, even if there is
a tight coupling between the two.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

v2:
 * Rename x86_seg_tr => x86_seg_tss too.
 * Fix up a couple of comments refering to the old names.
---
 .../fuzz/x86_instruction_emulator/fuzz-emul.c |  4 +-
 tools/tests/x86_emulator/test_x86_emulator.c  |  4 +-
 xen/arch/x86/hvm/domain.c                     | 15 +++--
 xen/arch/x86/hvm/hvm.c                        | 56 +++++++++----------
 xen/arch/x86/hvm/svm/svm.c                    | 28 +++++-----
 xen/arch/x86/hvm/vmx/realmode.c               |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c                    | 44 +++++++--------
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h       |  2 +-
 xen/arch/x86/include/asm/x86-types.h          | 10 ++--
 xen/arch/x86/pv/emul-priv-op.c                |  2 +-
 xen/arch/x86/vm_event.c                       |  4 +-
 xen/arch/x86/x86_emulate/0f01.c               |  2 +-
 xen/arch/x86/x86_emulate/x86_emulate.c        | 16 +++---
 xen/arch/x86/x86_emulate/x86_emulate.h        |  2 +-
 14 files changed, 97 insertions(+), 94 deletions(-)

diff --git a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
index 2b9b72df3584..a797d17fe536 100644
--- a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
+++ b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
@@ -173,7 +173,7 @@ static int fuzz_read(
     /* Reads expected for all user and system segments. */
     if ( is_x86_user_segment(seg) )
         assert(ctxt->addr_size == 64 || !(offset >> 32));
-    else if ( seg == x86_seg_tr )
+    else if ( seg == x86_seg_tss )
         /*
          * The TSS is special in that accesses below the segment base are
          * possible, as the Interrupt Redirection Bitmap starts 32 bytes
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
diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
index a0e811ea47a0..414ece94922f 100644
--- a/xen/arch/x86/hvm/domain.c
+++ b/xen/arch/x86/hvm/domain.c
@@ -34,7 +34,7 @@ static int check_segment(struct segment_register *reg, enum x86_segment seg)
         return 0;
     }
 
-    if ( seg == x86_seg_tr )
+    if ( seg == x86_seg_tss )
     {
         if ( reg->s )
         {
@@ -88,7 +88,7 @@ static int check_segment(struct segment_register *reg, enum x86_segment seg)
         }
         break;
 
-    case x86_seg_tr:
+    case x86_seg_tss:
         break;
 
     default:
@@ -131,18 +131,21 @@ int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx)
 #define SEG(s, r) ({                                                        \
     s = (struct segment_register)                                           \
         { 0, { (r)->s ## _ar }, (r)->s ## _limit, (r)->s ## _base };        \
-    /* Set accessed / busy bit for present segments. */                     \
+    /* Set accessed bit for present segments. */                            \
     if ( (s).p )                                                            \
-        (s).type |= (x86_seg_ ## s != x86_seg_tr ? 1 : 2);                  \
+        (s).type |= 2;                                                      \
     check_segment(&(s), x86_seg_ ## s); })
 
         rc = SEG(cs, regs);
         rc |= SEG(ds, regs);
         rc |= SEG(ss, regs);
         rc |= SEG(es, regs);
-        rc |= SEG(tr, regs);
 #undef SEG
 
+        tr = (struct segment_register){
+            0, { regs->tr_ar | 1 /* Busy */ }, regs->tr_limit, regs->tr_base };
+        rc |= check_segment(&tr, x86_seg_tss);
+
         if ( rc != 0 )
             return rc;
 
@@ -307,7 +310,7 @@ int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx)
     hvm_set_segment_register(v, x86_seg_ds, &ds);
     hvm_set_segment_register(v, x86_seg_ss, &ss);
     hvm_set_segment_register(v, x86_seg_es, &es);
-    hvm_set_segment_register(v, x86_seg_tr, &tr);
+    hvm_set_segment_register(v, x86_seg_tss, &tr);
 
     /* Sync AP's TSC with BSP's. */
     v->arch.hvm.cache_tsc_offset =
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index a75ccb57bf04..5cb4c348ec75 100644
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
 
@@ -923,13 +923,13 @@ static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
     ctxt.gs_base = seg.base;
     ctxt.gs_arbytes = seg.attr;
 
-    hvm_get_segment_register(v, x86_seg_tr, &seg);
+    hvm_get_segment_register(v, x86_seg_tss, &seg);
     ctxt.tr_sel = seg.sel;
     ctxt.tr_limit = seg.limit;
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
@@ -1175,13 +1175,13 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
     seg.limit = ctxt.tr_limit;
     seg.base = ctxt.tr_base;
     seg.attr = ctxt.tr_arbytes;
-    hvm_set_segment_register(v, x86_seg_tr, &seg);
+    hvm_set_segment_register(v, x86_seg_tss, &seg);
 
     seg.sel = ctxt.ldtr_sel;
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
@@ -3035,8 +3035,8 @@ void hvm_task_switch(
     unsigned int token = hvmemul_cache_disable(v);
     struct tss32 tss;
 
-    hvm_get_segment_register(v, x86_seg_gdtr, &gdt);
-    hvm_get_segment_register(v, x86_seg_tr, &prev_tr);
+    hvm_get_segment_register(v, x86_seg_gdt, &gdt);
+    hvm_get_segment_register(v, x86_seg_tss, &prev_tr);
 
     if ( ((tss_sel & 0xfff8) + 7) > gdt.limit )
     {
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
@@ -3193,7 +3193,7 @@ void hvm_task_switch(
     }
 
     tr.type = 0xb; /* busy 32-bit tss */
-    hvm_set_segment_register(v, x86_seg_tr, &tr);
+    hvm_set_segment_register(v, x86_seg_tss, &tr);
 
     v->arch.hvm.guest_cr[0] |= X86_CR0_TS;
     hvm_update_guest_cr(v, 0);
@@ -4011,14 +4011,14 @@ void hvm_vcpu_reset_state(struct vcpu *v, uint16_t cs, uint16_t ip)
     hvm_set_segment_register(v, x86_seg_ss, &reg);
 
     reg.attr = 0x82; /* LDT */
-    hvm_set_segment_register(v, x86_seg_ldtr, &reg);
+    hvm_set_segment_register(v, x86_seg_ldt, &reg);
 
     reg.attr = 0x8b; /* 32-bit TSS (busy) */
-    hvm_set_segment_register(v, x86_seg_tr, &reg);
+    hvm_set_segment_register(v, x86_seg_tss, &reg);
 
     reg.attr = 0;
-    hvm_set_segment_register(v, x86_seg_gdtr, &reg);
-    hvm_set_segment_register(v, x86_seg_idtr, &reg);
+    hvm_set_segment_register(v, x86_seg_gdt, &reg);
+    hvm_set_segment_register(v, x86_seg_idt, &reg);
 
     /* Sync AP's TSC with BSP's. */
     v->arch.hvm.cache_tsc_offset =
@@ -5278,7 +5278,7 @@ void hvm_get_segment_register(struct vcpu *v, enum x86_segment seg,
             reg->db = 0;
         break;
 
-    case x86_seg_tr:
+    case x86_seg_tss:
         /*
          * SVM doesn't track %tr.B. Architecturally, a loaded TSS segment will
          * always be busy.
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
@@ -5382,7 +5382,7 @@ void hvm_set_segment_register(struct vcpu *v, enum x86_segment seg,
         }
         break;
 
-    case x86_seg_tr:
+    case x86_seg_tss:
         ASSERT(reg->p);                              /* Usable. */
         ASSERT(!reg->s);                             /* System segment. */
         ASSERT(!(reg->sel & 0x4));                   /* !TI. */
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
index 38c61db1d71d..fb9ddf70dc75 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -622,20 +622,20 @@ static void cf_check svm_get_segment_register(
             reg->dpl = vmcb_get_cpl(vmcb);
         break;
 
-    case x86_seg_tr:
+    case x86_seg_tss:
         svm_sync_vmcb(v, vmcb_in_sync);
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
-    case x86_seg_tr:
-    case x86_seg_ldtr:
+    case x86_seg_tss:
+    case x86_seg_ldt:
         if ( v == current )
             svm_sync_vmcb(v, vmcb_needs_vmload);
         break;
@@ -694,21 +694,21 @@ static void cf_check svm_set_segment_register(
         vmcb->sreg[seg] = *reg;
         break;
 
-    case x86_seg_tr:
+    case x86_seg_tss:
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
index ff44ddcfa627..9787a7bdcfb8 100644
--- a/xen/arch/x86/hvm/vmx/realmode.c
+++ b/xen/arch/x86/hvm/vmx/realmode.c
@@ -34,7 +34,7 @@ static void realmode_deliver_exception(
     uint16_t frame[3];
     unsigned int last_byte;
 
-    idtr = hvmemul_get_seg_reg(x86_seg_idtr, hvmemul_ctxt);
+    idtr = hvmemul_get_seg_reg(x86_seg_idt,  hvmemul_ctxt);
     csr  = hvmemul_get_seg_reg(x86_seg_cs,   hvmemul_ctxt);
     __set_bit(x86_seg_cs, &hvmemul_ctxt->seg_reg_dirty);
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 269ca5643346..c2a76d691e34 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1227,20 +1227,20 @@ static void cf_check vmx_get_segment_register(
     }
 
     /*
-     * Xen's x86_seg_* enumeration *almost* matches the VMCS encoding order.
+     * Xen's x86_segment encoding *almost* matches the VMCS encoding order.
      *
-     * tr and ldtr are reversed, and other areas of code rely on this, so we
+     * TSS and LDT are reversed, and other areas of code rely on this, so we
      * can't just re-enumerate.
      */
-    BUILD_BUG_ON(x86_seg_tr   != 6);
-    BUILD_BUG_ON(x86_seg_ldtr != 7);
-    BUILD_BUG_ON(x86_seg_gdtr != 8);
-    BUILD_BUG_ON(x86_seg_idtr != 9);
+    BUILD_BUG_ON(x86_seg_tss != 6);
+    BUILD_BUG_ON(x86_seg_ldt != 7);
+    BUILD_BUG_ON(x86_seg_gdt != 8);
+    BUILD_BUG_ON(x86_seg_idt != 9);
     switch ( tmp_seg = seg )
     {
-    case x86_seg_tr:
-    case x86_seg_ldtr:
-        tmp_seg ^= 1; /* Flip tr and ldtr so GUEST_SEG_*() works. */
+    case x86_seg_tss:
+    case x86_seg_ldt:
+        tmp_seg ^= 1; /* Flip TSS and LDT so GUEST_SEG_*() works. */
         fallthrough;
 
     case x86_seg_es ... x86_seg_gs:
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
@@ -1272,11 +1272,11 @@ static void cf_check vmx_get_segment_register(
         (!(attr & (1u << 16)) << 7) | (attr & 0x7f) | ((attr >> 4) & 0xf00);
 
     /* Adjust for virtual 8086 mode */
-    if ( v->arch.hvm.vmx.vmx_realmode && seg <= x86_seg_tr
+    if ( v->arch.hvm.vmx.vmx_realmode && seg <= x86_seg_tss
          && !(v->arch.hvm.vmx.vm86_segment_mask & (1u << seg)) )
     {
         struct segment_register *sreg = &v->arch.hvm.vmx.vm86_saved_seg[seg];
-        if ( seg == x86_seg_tr ) 
+        if ( seg == x86_seg_tss )
             *reg = *sreg;
         else if ( reg->base != sreg->base || seg == x86_seg_ss )
         {
@@ -1312,12 +1312,12 @@ static void cf_check vmx_set_segment_register(
     base = reg->base;
 
     /* Adjust CS/SS/DS/ES/FS/GS/TR for virtual 8086 mode */
-    if ( v->arch.hvm.vmx.vmx_realmode && seg <= x86_seg_tr )
+    if ( v->arch.hvm.vmx.vmx_realmode && seg <= x86_seg_tss )
     {
         /* Remember the proper contents */
         v->arch.hvm.vmx.vm86_saved_seg[seg] = *reg;
         
-        if ( seg == x86_seg_tr ) 
+        if ( seg == x86_seg_tss )
         {
             const struct domain *d = v->domain;
             uint64_t val = d->arch.hvm.params[HVM_PARAM_VM86_TSS_SIZED];
@@ -1367,9 +1367,9 @@ static void cf_check vmx_set_segment_register(
 
     switch ( seg )
     {
-    case x86_seg_tr:
-    case x86_seg_ldtr:
-        seg ^= 1; /* Flip tr and ldtr so GUEST_SEG_*() works. */
+    case x86_seg_tss:
+    case x86_seg_ldt:
+        seg ^= 1; /* Flip TSS and LDT so GUEST_SEG_*() works. */
         fallthrough;
 
     case x86_seg_es ... x86_seg_gs:
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
@@ -1738,9 +1738,9 @@ static void cf_check vmx_update_guest_cr(
              (realmode != v->arch.hvm.vmx.vmx_realmode) )
         {
             enum x86_segment s;
-            struct segment_register reg[x86_seg_tr + 1];
+            struct segment_register reg[x86_seg_tss + 1];
 
-            BUILD_BUG_ON(x86_seg_tr != x86_seg_gs + 1);
+            BUILD_BUG_ON(x86_seg_tss != x86_seg_gs + 1);
 
             /* Entering or leaving real mode: adjust the segment registers.
              * Need to read them all either way, as realmode reads can update
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index f85a8c8bbaba..d0716e97d25c 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -174,7 +174,7 @@ struct vmx_vcpu {
     /* Bitmask of segments that we can't safely use in virtual 8086 mode */
     uint16_t             vm86_segment_mask;
     /* Shadow CS, SS, DS, ES, FS, GS, TR while in virtual 8086 mode */
-    struct segment_register vm86_saved_seg[x86_seg_tr + 1];
+    struct segment_register vm86_saved_seg[x86_seg_tss + 1];
     /* Remember EFLAGS while in virtual 8086 mode */
     uint32_t             vm86_saved_eflags;
     int                  hostenv_migrated;
diff --git a/xen/arch/x86/include/asm/x86-types.h b/xen/arch/x86/include/asm/x86-types.h
index 26b06aeac380..d11fe036b435 100644
--- a/xen/arch/x86/include/asm/x86-types.h
+++ b/xen/arch/x86/include/asm/x86-types.h
@@ -30,10 +30,10 @@ enum x86_segment {
     x86_seg_fs,
     x86_seg_gs,
     /* System: Valid to use for implicit table references. */
-    x86_seg_tr,
-    x86_seg_ldtr,
-    x86_seg_gdtr,
-    x86_seg_idtr,
+    x86_seg_tss,
+    x86_seg_ldt,
+    x86_seg_gdt,
+    x86_seg_idt,
     /* No Segment: For (system/normal) accesses which are already linear. */
     x86_seg_sys,
     x86_seg_none
@@ -47,7 +47,7 @@ static inline bool is_x86_user_segment(enum x86_segment seg)
 }
 static inline bool is_x86_system_segment(enum x86_segment seg)
 {
-    return seg >= x86_seg_tr && seg < x86_seg_none;
+    return seg >= x86_seg_tss && seg < x86_seg_none;
 }
 
 /*
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 1a3e3012e23c..7bebd2ccdc21 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -504,7 +504,7 @@ static int cf_check read_segment(
     struct x86_emulate_ctxt *ctxt)
 {
     /* Check if this is an attempt to access the I/O bitmap. */
-    if ( seg == x86_seg_tr )
+    if ( seg == x86_seg_tss )
     {
         switch ( ctxt->opcode )
         {
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
index e15ab3775854..7de646083639 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -814,13 +814,13 @@ static int ioport_access_check(
      * X86EMUL_DONE coming back here may be used to defer the port
      * permission check to the respective ioport hook.
      */
-    if ( (rc = ops->read_segment(x86_seg_tr, &tr, ctxt)) != 0 )
+    if ( (rc = ops->read_segment(x86_seg_tss, &tr, ctxt)) != 0 )
         return rc == X86EMUL_DONE ? X86EMUL_OKAY : rc;
 
     /* Ensure the TSS has an io-bitmap-offset field. */
     generate_exception_if(tr.type != 0xb, X86_EXC_GP, 0);
 
-    switch ( rc = read_ulong(x86_seg_tr, 0x66, &iobmp, 2, ctxt, ops) )
+    switch ( rc = read_ulong(x86_seg_tss, 0x66, &iobmp, 2, ctxt, ops) )
     {
     case X86EMUL_OKAY:
         break;
@@ -834,7 +834,7 @@ static int ioport_access_check(
     }
 
     /* Read two bytes including byte containing first port. */
-    switch ( rc = read_ulong(x86_seg_tr, iobmp + first_port / 8,
+    switch ( rc = read_ulong(x86_seg_tss, iobmp + first_port / 8,
                              &iobmp, 2, ctxt, ops) )
     {
     case X86EMUL_OKAY:
@@ -891,7 +891,7 @@ protmode_load_seg(
     const struct x86_emulate_ops *ops)
 {
     const struct cpu_policy *cp = ctxt->cpu_policy;
-    enum x86_segment sel_seg = (sel & 4) ? x86_seg_ldtr : x86_seg_gdtr;
+    enum x86_segment sel_seg = (sel & 4) ? x86_seg_ldt : x86_seg_gdt;
     struct { uint32_t a, b; } desc, desc_hi = {};
     uint8_t dpl, rpl;
     int cpl = x86emul_get_cpl(ctxt, ops);
@@ -912,7 +912,7 @@ protmode_load_seg(
                 break;
             /* fall through */
         case x86_seg_cs:
-        case x86_seg_tr:
+        case x86_seg_tss:
             goto raise_exn;
         }
         if ( seg == x86_seg_none || !_amd_like(cp) || vcpu_has_nscb() ||
@@ -992,13 +992,13 @@ protmode_load_seg(
         if ( (dpl != cpl) || (dpl != rpl) )
             goto raise_exn;
         break;
-    case x86_seg_ldtr:
+    case x86_seg_ldt:
         /* LDT system segment? */
         if ( (desc.b & (15u<<8)) != (2u<<8) )
             goto raise_exn;
         a_flag = 0;
         break;
-    case x86_seg_tr:
+    case x86_seg_tss:
         /* Available TSS system segment? */
         if ( (desc.b & (15u<<8)) != (9u<<8) )
             goto raise_exn;
@@ -2914,7 +2914,7 @@ x86_emulate(
         break;
 
     case X86EMUL_OPC(0x0f, 0x00): /* Grp6 */
-        seg = (modrm_reg & 1) ? x86_seg_tr : x86_seg_ldtr;
+        seg = (modrm_reg & 1) ? x86_seg_tss : x86_seg_ldt;
         generate_exception_if(!in_protmode(ctxt, ops), X86_EXC_UD);
         switch ( modrm_reg & 6 )
         {
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index 534b1c46fad3..d86ed7b3e0c9 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -51,7 +51,7 @@ struct x86_emul_fpu_aux {
  /*
   * Operation fully done by one of the hooks:
   * - validate(): operation completed (except common insn retire logic)
-  * - read_segment(x86_seg_tr, ...): bypass I/O bitmap access
+  * - read_segment(x86_seg_tss, ...): bypass I/O bitmap access
   * - read_io() / write_io(): bypass GPR update (non-string insns only)
   * Undefined behavior when used anywhere else.
   */
-- 
2.39.5


