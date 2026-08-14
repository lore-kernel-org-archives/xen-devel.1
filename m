Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B340C5CFC1
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 18:59:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1391432.1631265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wux7O-0005R2-2v; Fri, 14 Aug 2026 18:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1391432.1631265; Fri, 14 Aug 2026 18:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wux7N-0005QI-Qq; Fri, 14 Aug 2026 18:59:01 +0000
Received: by outflank-mailman (input) for mailman id 1391432;
 Fri, 14 Aug 2026 18:59:00 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wux7M-0005JE-7R
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 18:59:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wux7L-001zlG-KO
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 20:58:59 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a7f6542-8faa-0a2a0a5109dd-0a2a450b959a-34
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 20:58:59 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a7f6573-b7e8-0a2a450b0019-d155dd33b5c7-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 20:58:59 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-47f904e80eeso1316615f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 11:58:59 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f229681sm8682153f8f.16.2026.08.14.11.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2026 11:58:58 -0700 (PDT)
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
        d=citrix.com; s=google; t=1786733939; x=1787338739; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xCFz+bswAcxSZNQCcoi1kMR/ZsUCGcovta9jkJRC0lc=;
        b=idJWDXTDSbwVnlimw9JFwOJHt5UAxqh1/l4noCVyO/bnK3XDJxWlyXooDAmCR8HUvw
         u5lBMZA18KG47RDT8vxbCUe4sCNoBKH9iNz8LCP1i3aV5uvjGKJD3f/FSLj4JjkWgQLd
         TAe3CzZNebx1E2R0Iw/S5Owgkf9HE/+3aZlxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786733939; x=1787338739;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xCFz+bswAcxSZNQCcoi1kMR/ZsUCGcovta9jkJRC0lc=;
        b=KVvQex1wzKvWFZmq/Z3kv7nprzq5g3B0tKBo7XG/XafgzxudVf90wbs2gvXIOfq+6z
         I/AeZDFzyJX9sw6jWQoxwzqOJdgAe5Bq3kA4mgw7ePelSMuAk/5KYUgWmraRZ5BAjuAq
         1M9A8sDN1+yv7qjxqJ0h4pG409n/46XNPMyph8ZA2bucWAS+hziDotlJhRR+g4kbgAJO
         DQQpV3Ulk5E5Kylp7Yg2PVO9Lxzobx2UktYyPj++VYOpcpKd/eH47hUB+QiCJ2NxB/eE
         BghkTjpjqm0vtyBXOYF2IO1oD74JQzdy/yJzYV2iogi/QzfjAkZtvMEW5BB1b3RCuHbS
         eByA==
X-Gm-Message-State: AOJu0Yx58P491ygX7qhqvjzq9lqEufKqBNBtvRpU0mmQP0Yo21qmTQIH
	ev8tcXRuBYKcIE5lHUF6OSIry3hhNrCu787zeE9V6ySxF+U51VA9uT+hfd3p0cBgBD9QL6E2zT8
	6LXVYlpY=
X-Gm-Gg: AR+sD12rzfexMEtCDWKCBLRCR7ksGBV1gUTzl/dnAK0gwNQyIhh47/EuYqOhO7ud1Cv
	z93AYPzWcQrM0EOqVbupCnbbhgS0fNGWyQdNFuPFTjKkTyTWwqS2TFK4BMfWqUa2OW1jRvPHuVF
	k9pon2e7x7blhAV46hmGj0IP7BMGLgVe83WRkb0SWybCO6Umcj7q8qJjR/i2opumPcm6vb8v+qx
	fk8atoxVaNqdaGiBAXFCmsNCXCU2qY2cKyg4tfQxdI3G4/3ZhHErpoquU2sC+S+vOUfaGF3j9D+
	776YAXaE8jntNkmAmHG3CmkBDc3SHjpgDkoLkl3r+r+cZ3VQq+R4sP2KCYW+MfScFB2grCz/NEN
	AcQPUTb85cc8GYxBVD90jzUNo7OWEWeBGo40Thq4zLQtOWzRLNzcVzisr4qpCSFrT6KXgAxNhlJ
	Pnvf45HlZcOOair6LBsiVw8yEhBK5aBT+1Z6NMDp9/Ofu4qSTTZuucqPjH5HoWVTK7NIe7udojx
	j0acbX0zGiUNLvaoJFKnui+5woydnJuIQzYF2E=
X-Received: by 2002:a05:6000:2c09:b0:47f:9760:4d2e with SMTP id ffacd0b85a97d-481607618e8mr10222640f8f.24.1786733938786;
        Fri, 14 Aug 2026 11:58:58 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 3/3] x86/emul: Drop the union in x86_event had have a single data field
Date: Fri, 14 Aug 2026 19:58:41 +0100
Message-Id: <20260814185841.1757421-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260814185841.1757421-1-andrew.cooper3@citrix.com>
References: <20260814185841.1757421-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1786733939-A9EC69EA-3C395450/0/0
X-purgate-type: clean
X-purgate-size: 9111

FRED has formalised the event_data field.  It already has more uses than
given (e.g. the NMI Source Bitmap), and further uses are expected in the
future.

Collapse the union into a single field called 'data' as the struct has event
in it's name, as well as 'event' being the common name for the variable.
Refer to the FRED spec rather than keeping an out-of-date list of uses.

Adjust all users of the old names.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/hvm/dm.c                  |  2 +-
 xen/arch/x86/hvm/hvm.c                 |  4 ++--
 xen/arch/x86/hvm/svm/nestedsvm.c       |  2 +-
 xen/arch/x86/hvm/svm/svm.c             |  8 ++++----
 xen/arch/x86/hvm/vmx/vmx.c             |  2 +-
 xen/arch/x86/include/asm/domain.h      |  6 ++----
 xen/arch/x86/include/asm/hvm/hvm.h     |  3 +--
 xen/arch/x86/include/asm/x86-event.h   | 14 ++++++++++----
 xen/arch/x86/pv/traps.c                | 10 +++++-----
 xen/arch/x86/x86_emulate/x86_emulate.h |  2 +-
 10 files changed, 28 insertions(+), 25 deletions(-)

diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index 1f44fff12a21..91f6ca669b2b 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -315,7 +315,7 @@ static int inject_event(struct domain *d,
     v->arch.hvm.inject_event.type = data->type;
     v->arch.hvm.inject_event.insn_len = data->insn_len;
     v->arch.hvm.inject_event.error_code = data->error_code;
-    v->arch.hvm.inject_event.cr2 = data->cr2;
+    v->arch.hvm.inject_event.data = data->cr2;
     smp_wmb();
     v->arch.hvm.inject_event.vector = data->vector;
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index b7d5ba126b1e..64845e210b6c 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -513,7 +513,7 @@ void hvm_migrate_pirqs(struct vcpu *v)
 
 static bool hvm_get_pending_event(struct vcpu *v, struct x86_event *info)
 {
-    info->cr2 = v->arch.hvm.guest_cr[2];
+    info->data = v->arch.hvm.guest_cr[2];
 
     return alternative_call(hvm_funcs.get_pending_event, v, info);
 }
@@ -555,7 +555,7 @@ void hvm_do_resume(struct vcpu *v)
         if ( hvm_get_pending_event(v, &info) )
         {
             hvm_monitor_interrupt(info.vector, info.type, info.error_code,
-                                  info.cr2);
+                                  info.data);
             v->arch.monitor.next_interrupt_enabled = false;
         }
     }
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 91c906072001..0845e9f77879 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -775,7 +775,7 @@ int cf_check nsvm_vcpu_vmexit_event(
     ASSERT(vcpu_nestedhvm(v).nv_vvmcx != NULL);
 
     nestedsvm_vmexit_defer(v, VMEXIT_EXCEPTION_DE + event->vector,
-                           event->error_code, event->cr2);
+                           event->error_code, event->data);
     return NESTEDHVM_VMEXIT_DONE;
 }
 
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index eab8c735cf25..2219f9c4911e 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1177,7 +1177,7 @@ static void svm_emul_swint_injection(struct x86_event *event)
         {
             fault = X86_EXC_PF;
             ec = pfinfo.ec;
-            event->cr2 = pfinfo.linear;
+            event->data = pfinfo.linear;
         }
 
         goto raise_exception;
@@ -1270,8 +1270,8 @@ static void cf_check svm_inject_event(const struct x86_event *event)
 
     case X86_EXC_PF:
         ASSERT(_event.type == X86_ET_HW_EXC);
-        curr->arch.hvm.guest_cr[2] = _event.cr2;
-        vmcb_set_cr2(vmcb, _event.cr2);
+        curr->arch.hvm.guest_cr[2] = _event.data;
+        vmcb_set_cr2(vmcb, _event.data);
         break;
     }
 
@@ -1354,7 +1354,7 @@ static void cf_check svm_inject_event(const struct x86_event *event)
 
     if ( _event.vector == X86_EXC_PF && _event.type == X86_ET_HW_EXC )
         TRACE(TRC_HVM_PF_INJECT64, _event.error_code,
-              _event.cr2, _event.cr2 >> 32);
+              _event.data, _event.data >> 32);
     else
         TRACE(TRC_HVM_INJ_EXC, _event.vector, _event.error_code);
 }
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index b0d5ad6981b3..6ff4aeb70d41 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2106,7 +2106,7 @@ static void cf_check vmx_inject_event(const struct x86_event *event)
 
     case X86_EXC_PF:
         ASSERT(_event.type == X86_ET_HW_EXC);
-        curr->arch.hvm.guest_cr[2] = _event.cr2;
+        curr->arch.hvm.guest_cr[2] = _event.data;
         break;
     }
 
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 50c048adb5ad..2d0a91541034 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -747,10 +747,9 @@ static inline void pv_inject_DB(unsigned long pending_dbg)
         .vector      = X86_EXC_DB,
         .type        = X86_ET_HW_EXC,
         .error_code  = X86_EVENT_NO_EC,
+        .data        = pending_dbg,
     };
 
-    event.pending_dbg = pending_dbg;
-
     pv_inject_event(&event);
 }
 
@@ -760,10 +759,9 @@ static inline void pv_inject_page_fault(int errcode, unsigned long cr2)
         .vector = X86_EXC_PF,
         .type = X86_ET_HW_EXC,
         .error_code = errcode,
+        .data = cr2,
     };
 
-    event.cr2 = cr2;
-
     pv_inject_event(&event);
 }
 
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 0ce7d5d78350..16383e1084ee 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -569,10 +569,9 @@ static inline void hvm_inject_page_fault(int errcode, unsigned long cr2)
         .vector = X86_EXC_PF,
         .type = X86_ET_HW_EXC,
         .error_code = errcode,
+        .data = cr2,
     };
 
-    event.cr2 = cr2;
-
     hvm_inject_event(&event);
 }
 
diff --git a/xen/arch/x86/include/asm/x86-event.h b/xen/arch/x86/include/asm/x86-event.h
index a8823c7cfc31..b0543c9e3715 100644
--- a/xen/arch/x86/include/asm/x86-event.h
+++ b/xen/arch/x86/include/asm/x86-event.h
@@ -22,10 +22,16 @@ struct x86_event {
     uint8_t       type;         /* X86_ET_* */
     uint8_t       insn_len;     /* Instruction length */
     int32_t       error_code;   /* X86_EVENT_NO_EC if n/a */
-    union {
-        unsigned long cr2;         /* #PF */
-        unsigned long pending_dbg; /* #DB (new DR6 bits, positive polarity) */
-    };
+
+    /*
+     * As per the FRED spec.
+     *
+     * A subset of uses occur in IDT mode as well:
+     * - #PF: CR2
+     * - #DB: PENDING_DBG (DR6 with positive polarity)
+     * - #NM: XFD_ERR (AMX)
+     */
+    unsigned long data;
 };
 
 #endif /* X86_X86_EVENT_H */
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index c863ab9d372a..21a1f4b7174a 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -58,20 +58,20 @@ void pv_inject_event(const struct x86_event *event)
     switch ( vector | -(event->type == X86_ET_SW_INT) )
     {
     case X86_EXC_PF:
-        curr->arch.pv.ctrlreg[2] = event->cr2;
-        arch_set_cr2(curr, event->cr2);
+        curr->arch.pv.ctrlreg[2] = event->data;
+        arch_set_cr2(curr, event->data);
 
         /* Re-set error_code.user flag appropriately for the guest. */
         error_code &= ~PFEC_user_mode;
         if ( !guest_kernel_mode(curr, regs) )
             error_code |= PFEC_user_mode;
 
-        trace_pv_page_fault(event->cr2, error_code);
+        trace_pv_page_fault(event->data, error_code);
         break;
 
     case X86_EXC_DB:
         curr->arch.dr6 = x86_merge_dr6(curr->domain->arch.cpu_policy,
-                                       curr->arch.dr6, event->pending_dbg);
+                                       curr->arch.dr6, event->data);
         fallthrough;
     default:
         trace_pv_trap(vector, regs->rip, use_error_code, error_code);
@@ -94,7 +94,7 @@ void pv_inject_event(const struct x86_event *event)
                 vector, vector_name(vector), error_code);
 
         if ( vector == X86_EXC_PF )
-            show_page_walk(event->cr2);
+            show_page_walk(event->data);
     }
 }
 
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index 534b1c46fad3..da1051a0f9e7 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -758,7 +758,7 @@ static inline void x86_emul_pagefault(
     ctxt->event.vector = X86_EXC_PF;
     ctxt->event.type = X86_ET_HW_EXC;
     ctxt->event.error_code = error_code;
-    ctxt->event.cr2 = cr2;
+    ctxt->event.data = cr2;
 
     ctxt->event_pending = true;
 }
-- 
2.39.5


