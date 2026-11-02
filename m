Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CA3606B0E6
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 17:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=tDeZtqqI
Received: from list by lists.xenproject.org with outflank-mailman.1468522.1677591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNw1m-0001l8-6t; Mon, 02 Nov 2026 17:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468522.1677591; Mon, 02 Nov 2026 17:41:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNw1m-0001l1-4A; Mon, 02 Nov 2026 17:41:02 +0000
Received: by outflank-mailman (input) for mailman id 1468522;
 Mon, 02 Nov 2026 17:41:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xNw1k-0001kv-Dc
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 17:41:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNw1j-0046Ef-JD
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 18:40:59 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae8cb27-2eae-0a2a0a5409dd-0a2a4506aa66-14
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 18:40:59 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae8cb2b-195a-0a2a45060019-d1558032c83e-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 18:40:59 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4ac95761c85so21269145e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 09:40:59 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b2a9fafe08sm3267375e9.3.2026.11.02.09.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 09:40:58 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1793641259; x=1794246059; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fS1lE8AkVx4uwyNLR++cwvmIqMGfv3Lxh7g13q9F0SI=;
        b=tDeZtqqIBjeEdZyts2QE+qru5R2Fzgm+ZQhFhcWL1sXBPaWfcDHz7o/UwrIhjdNvij
         oCb2Elm+H/wM/ci6X+Lubl9jbApiZZgJkmTaWa2hksu9SVT5UgOl5GRVJhRyctAqhQJt
         AkeHjlTMu1pyhf5zRRsHLH6FYtw4CRfiJxcxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641259; x=1794246059;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fS1lE8AkVx4uwyNLR++cwvmIqMGfv3Lxh7g13q9F0SI=;
        b=B5LFbD9BvmlfRFIUO1d86FTg86sfNQcydmSMjFxiL141rfhv+X1mkY52B4hpvrm2Y0
         IOyIStOUP2FQNDtq5ijXcnua17ZoNYVhkdOLwQFme8dwd697r/ehpZbZwBSa5UEROIob
         f1IH27uFATBzAFkAGyF0Sg0/AIKODrHMvu+z4vwDTHsN1EqdFsQ1T9AcC5obb4ZyXk2z
         UxUXLheE7I0ztyx2Zc3uGHFY5muRntk8ZvuDpB6LydsZRpPHGdHdI9pzbKJrbbpUPmmc
         hdAhCnsiMlWBLfzoaf0lRdVjS2XL9lYLIy8Wr7pK8B2k5Wtvs+7yD1y7KxOyvz2HtwWI
         bojQ==
X-Gm-Message-State: AFq9FYI2pCAkSjK4R36h4NTmCqm0cFPvQ8NK8Wgj5GRkXe1oNo5GRh0f
	CZThpoa78gtiPxlQ8TQIlSFHybBBvzD/wN7tqyyGhgVL/z687afL/GxD4BG+O2Oax8la57dYixj
	/2sAI
X-Gm-Gg: AYBFou2dIS1chn1fvzeYq+GW9FlaEqAbUMx7ZHTaJmT73nHVYjD2eqLHgwUK5j3Osxx
	7L1JeGRGVmlfqTapW5QkmUQPsXNyr3HBHHcSDCoJRYjMzm1d8+TpngaGt3OTAfiFLsvebab2IzG
	xZhmV55dDy5LrIJRa2dQZvu5NbHaD8y+t9cQSDM83OBxuwir3g908GXYsj0FtV116tYKVrI2g7w
	9/xnXb6cBfH0O8BqVkZ90zHQejDaZkcloMzRzdiWsX0YJuc6dEyFB/QPudGCHM+vbrbGZPM9zHM
	5iHccax86BnGMSogBgMiKx9ASQB9Doj2vYSDbNxxIAIJf9hckzUmRTDbwgZv5tMWHdMyHi5xLk5
	FXDUqTEiuBLa8adnVE+G6zxPcwtxfDUqgtc1oMfnYgOGSzC+1air0TcaIqA5vr3dg8y5KDEazWX
	sjR6O3WfmBUbnZmHfy5j/q2grr58Cxdjy3q0dOVkXTo17cOe+N+GTMGDdEzSKFqyGN8iXKcBzYL
	DWgt6WnQ8b0uwHs2mFkjjV5m7pGA6ZXtyr/VuTPrjCfFHbOGMKwyXyWOZc2lB3kHGtM9FFJ4isG
	Q2wLhkLMse+W/Mktgk3a7fMHLNDxVIV7NGsr/Zh1tmh6rgGY1TfPZxof1GO0tQccOlHmFtwajG8
	Mxp4=
X-Received: by 2002:a05:600d:82f2:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4afc2105bf0mr146434385e9.24.1793641258559;
        Mon, 02 Nov 2026 09:40:58 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86: Drop {nmi,mce}_pending defines
Date: Mon,  2 Nov 2026 17:40:56 +0000
Message-Id: <20261102174056.1763614-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1793641259-FC40377B-C3F1AB70/10/78276251493
X-purgate-type: spam
X-purgate-size: 8351
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These obscure the data layout in v->arch, and prevent using the names for
other variables.

Expand the defines in place.  No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

The {nmi,mce}_state defines are rude too, but that involves more unpicking
than I have time for right now.
---
 xen/arch/x86/cpu/mcheck/vmce.c    | 2 +-
 xen/arch/x86/cpu/vpmu.c           | 2 +-
 xen/arch/x86/domain.c             | 2 +-
 xen/arch/x86/domctl.c             | 2 +-
 xen/arch/x86/hvm/irq.c            | 8 ++++----
 xen/arch/x86/hvm/vioapic.c        | 2 +-
 xen/arch/x86/hvm/vlapic.c         | 2 +-
 xen/arch/x86/include/asm/domain.h | 3 ---
 xen/arch/x86/nmi.c                | 2 +-
 xen/arch/x86/pv/callback.c        | 2 +-
 xen/arch/x86/pv/traps.c           | 2 +-
 xen/arch/x86/x86_64/asm-offsets.c | 4 ++--
 12 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmce.c
index 1a7e92506ac8..2b7ec6737d20 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -410,7 +410,7 @@ int inject_vmce(struct domain *d, int vcpu)
 
         if ( (is_hvm_domain(d) ||
               pv_trap_callback_registered(v, X86_EXC_MC)) &&
-             !test_and_set_bool(v->arch.mce_pending) )
+             !test_and_set_bool(v->arch.mce_state.pending) )
         {
             mce_printk(MCE_VERBOSE, "MCE: inject vMCE to %pv\n", v);
             vcpu_kick(v);
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index e0f7edded3d7..5cc854d71ce3 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -316,7 +316,7 @@ void vpmu_do_interrupt(void)
         vlapic_set_irq(vlapic, vlapic_lvtpc & APIC_VECTOR_MASK, 0);
         break;
     case APIC_DM_NMI:
-        sampling->arch.nmi_pending = true;
+        sampling->arch.nmi_state.pending = true;
         break;
     }
 #endif
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 368e4deff375..f8e31cdc5791 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1684,7 +1684,7 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( !guest_handle_is_null(arg) )
             return -EINVAL;
 
-        if ( !test_and_set_bool(v->arch.nmi_pending) )
+        if ( !test_and_set_bool(v->arch.nmi_state.pending) )
             vcpu_kick(v);
         break;
 
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 1e0051070211..12c14bb3f514 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -584,7 +584,7 @@ long arch_do_domctl(
         {
         case XEN_DOMCTL_SENDTRIGGER_NMI:
             ret = 0;
-            if ( !test_and_set_bool(v->arch.nmi_pending) )
+            if ( !test_and_set_bool(v->arch.nmi_state.pending) )
                 vcpu_kick(v);
             break;
 
diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 5f643611130f..18f05b6247fd 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -522,10 +522,10 @@ struct hvm_intack hvm_vcpu_has_pending_irq(struct vcpu *v)
      */
     hvm_sync_pir_to_irr(v);
 
-    if ( unlikely(v->arch.nmi_pending) )
+    if ( unlikely(v->arch.nmi_state.pending) )
         return hvm_intack_nmi;
 
-    if ( unlikely(v->arch.mce_pending) )
+    if ( unlikely(v->arch.mce_state.pending) )
         return hvm_intack_mce;
 
     if ( (plat->irq->callback_via_type == HVMIRQ_callback_vector)
@@ -550,11 +550,11 @@ struct hvm_intack hvm_vcpu_ack_pending_irq(
     switch ( intack.source )
     {
     case hvm_intsrc_nmi:
-        if ( !test_and_clear_bool(v->arch.nmi_pending) )
+        if ( !test_and_clear_bool(v->arch.nmi_state.pending) )
             intack = hvm_intack_none;
         break;
     case hvm_intsrc_mce:
-        if ( !test_and_clear_bool(v->arch.mce_pending) )
+        if ( !test_and_clear_bool(v->arch.mce_state.pending) )
             intack = hvm_intack_none;
         break;
     case hvm_intsrc_pic:
diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index b633f1523250..995fae7b3c0f 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -475,7 +475,7 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
         for_each_vcpu ( d, v )
             if ( vlapic_match_dest(vcpu_vlapic(v), NULL,
                                    0, dest, dest_mode) &&
-                 !test_and_set_bool(v->arch.nmi_pending) )
+                 !test_and_set_bool(v->arch.nmi_state.pending) )
                 vcpu_kick(v);
         break;
     }
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 0d7231c45b68..6698779e227c 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -356,7 +356,7 @@ static void vlapic_accept_irq(struct vcpu *v, uint32_t icr_low)
         break;
 
     case APIC_DM_NMI:
-        if ( !test_and_set_bool(v->arch.nmi_pending) )
+        if ( !test_and_set_bool(v->arch.nmi_state.pending) )
         {
             bool wake = false;
 
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 2d0a91541034..634d0710bfc2 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -47,9 +47,6 @@ unsigned int arch_domain_struct_memflags(void);
 #define nmi_state              async_exception_state(VCPU_TRAP_NMI)
 #define mce_state              async_exception_state(VCPU_TRAP_MCE)
 
-#define nmi_pending            nmi_state.pending
-#define mce_pending            mce_state.pending
-
 struct trap_bounce {
     uint32_t      error_code;
     uint8_t       flags; /* TBF_ */
diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index b3d18270b13a..3a94471037bd 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -522,7 +522,7 @@ static void cf_check do_nmi_stats(unsigned char key)
     if ( !hardware_domain || !(v = domain_vcpu(hardware_domain, 0)) )
         return;
 
-    pend = v->arch.nmi_pending;
+    pend = v->arch.nmi_state.pending;
     mask = v->arch.async_exception_mask & (1 << VCPU_TRAP_NMI);
     if ( pend || mask )
         printk("%pv: NMI%s%s\n",
diff --git a/xen/arch/x86/pv/callback.c b/xen/arch/x86/pv/callback.c
index 38b819b56626..29370a68ce15 100644
--- a/xen/arch/x86/pv/callback.c
+++ b/xen/arch/x86/pv/callback.c
@@ -35,7 +35,7 @@ static int register_guest_nmi_callback(unsigned long address)
      * now.
      */
     if ( curr->vcpu_id == 0 && arch_get_nmi_reason(d) != 0 )
-        curr->arch.nmi_pending = true;
+        curr->arch.nmi_state.pending = true;
 
     return 0;
 }
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index 21a1f4b7174a..b817b5b29604 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -199,7 +199,7 @@ int pv_raise_nmi(struct vcpu *v)
 
     if ( cmpxchgptr(v_ptr, NULL, v) )
         return -EBUSY;
-    if ( !test_and_set_bool(v->arch.nmi_pending) )
+    if ( !test_and_set_bool(v->arch.nmi_state.pending) )
     {
         /* Not safe to wake up a vcpu here */
         raise_softirq(NMI_SOFTIRQ);
diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index 3bc0f06c2ead..ce5e7aae16cd 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -110,9 +110,9 @@ void __dummy__(void)
     OFFSET(VCPU_guest_context_flags, struct vcpu, arch.pv.vgc_flags);
     OFFSET(VCPU_cr3, struct vcpu, arch.cr3);
     OFFSET(VCPU_arch_msrs, struct vcpu, arch.msrs);
-    OFFSET(VCPU_nmi_pending, struct vcpu, arch.nmi_pending);
-    OFFSET(VCPU_mce_pending, struct vcpu, arch.mce_pending);
+    OFFSET(VCPU_nmi_pending, struct vcpu, arch.nmi_state.pending);
     OFFSET(VCPU_nmi_old_mask, struct vcpu, arch.nmi_state.old_mask);
+    OFFSET(VCPU_mce_pending, struct vcpu, arch.mce_state.pending);
     OFFSET(VCPU_mce_old_mask, struct vcpu, arch.mce_state.old_mask);
     OFFSET(VCPU_async_exception_mask, struct vcpu, arch.async_exception_mask);
     DEFINE(VCPU_TRAP_NMI, VCPU_TRAP_NMI);
-- 
2.39.5


