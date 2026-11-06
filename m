Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF952606A326
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 23:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=Frtb/vbV
Received: from list by lists.xenproject.org with outflank-mailman.1477593.1682994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPTnO-0007Ny-3O; Fri, 06 Nov 2026 23:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1477593.1682994; Fri, 06 Nov 2026 23:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPTnO-0007Nr-0G; Fri, 06 Nov 2026 23:56:34 +0000
Received: by outflank-mailman (input) for mailman id 1477593;
 Fri, 06 Nov 2026 23:56:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xPTnM-0007Nk-SX
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 23:56:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPTnM-001LoL-6D
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 00:56:32 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aee6923-8faa-0a2a0a5109dd-0a2a4502b0c2-2
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 00:56:32 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aee692f-6ca4-0a2a45020019-d155802ea9e8-3
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 00:56:32 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a2072b9832so607135e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 15:56:32 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7e32b46a3sm19200735e9.6.2026.11.06.15.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 15:56:31 -0800 (PST)
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
        d=citrix.com; s=google; t=1794009391; x=1794614191; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/++iBq87OEZlSRysDMyKl+pJtbf6Rmz2e5RRpkSpU4=;
        b=Frtb/vbV03xeCsWQg1Qx4T50CsPOMeV5fzk3bZk8YPqw8KbNDsHkzmm/tH8N0dzinv
         5LNmvXRWR5u0HKV1oEylVsxtYIhZX88Gsb8olkePn4XeP0ejqNZkmxsYwDNHDWbmPtCZ
         yqcbLafyWNJHJJ6ZRAqOI0kjCTuwKRQa+i17s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794009391; x=1794614191;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u/++iBq87OEZlSRysDMyKl+pJtbf6Rmz2e5RRpkSpU4=;
        b=v9WuDSdldINKCZIicjUAEc2lKfPWHiYmEIYuCLAIf5RwWjssDuRoiXe3j7U+G7ON/L
         Wd0PNti6wk9baIexr0s2a5f6B9OphD42HoGVhgWTUkTJHoH2Cr/uQZsp/BUqIncspUkA
         zwp5j4RcQ8kJzCToJfds/my+O9w5MLKqQQfG8UwCBREgQFIV9qn18EGZKN6VuPHTdSPl
         ArGdvO75z40r8wi1hVElnSWLUBwBL9nTK8ywRtBGtF8hti/ssfJtzq+6BlRGgNNrWHuN
         jK7JbBn4ZqYaCnR6oHyqAQwvy4im0rUMl1N1NAWWCNjF3EwCkJwmTVXZxgke19ceUn6R
         O2Mg==
X-Gm-Message-State: APuU4Z99YTFDridSDD2H6DYgkEPE6eAOuWFJicQY8EjQlqiDiqj3BJXy
	rby77ue4XvE+bDYg+q9mWHdUe17ROT9wM6d2KUsRqd/RVgYXMNOnnvPOk7EOMYXCPRCYTg6wAaT
	ZR67xyMg=
X-Gm-Gg: AYBFou2pvTJUL6+OY61c+EhR0hF0Iyw5p08PlUaXnp6ReNZWsRq4RYpMLm2EartNDQb
	IWgvbjLOzQSyzAlfTsiD/G9X1Os+6sX19h69O3eOOhxWJ0BbNJjodVq6CO6NlZH/yn07ez5PPrG
	TK0MItmomCh6iR/yGgrsZ6KAu1gTjJKEXVw3VuOzCSlKHsQS6ojJjbxFxLzaw7DH9VyExXGqyLW
	5gXzs5fk71uD4+4zyzVoVAYfMYcc+MMTioO1wWZuEGwK8O6kdcEGSYhFqFP+hlss6KbqDUfO6rE
	AV25upougPjNeXF8cvh7r2Jk9ExVgKLk3O555agajZ37a856GMrJVv7J2Ln6gp3HNQOsP9OhUlQ
	cOaRTwLALfDbfBXugL2Dwk3ZoDjJd6dz8Vh53es30il+xJEbhAImgSSkBhwswxxBE4YQW9VetKm
	Y9Me6sPJ+Q8/y1Do9hPkquKRuc79I7tPfR6IepkVsHnrHJKTFrRPG3XHV1YpRaW8XCkCUj1Rp84
	eYVpRDdV1W8V89ab+f0IJ1ZQ1Pap8ljfOJ9bvH+yIenp6jdNbeLiiNaQhPg1pOVEM3Dnf6ATNPE
	hm5c4bBwQjm+o0GwMXUmPbMXBwIV1WGsa9H4CEfK9iQOINqRF/SE5FH1z/m9fH9BIybLyMf4oB3
	X5wEY9byd+yIScrTR6ES+KEMH
X-Received: by 2002:a05:600c:8115:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4b8190f468amr8518525e9.7.1794009391423;
        Fri, 06 Nov 2026 15:56:31 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v2] x86/svm: Cleanup vintr_t type
Date: Fri,  6 Nov 2026 23:56:29 +0000
Message-Id: <20261106235629.2799832-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1794009392-67ABD2AC-4DD0BECD/10/78276251493
X-purgate-type: spam
X-purgate-size: 13355
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ross Lagerwall <ross.lagerwall@citrix.com>

Rearrange the union to drop the .fields infix, rename bytes to the more
common raw, adjust types where appropriate, and simplify some names.
Adjust the users accordingly.

No functional change intended.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Jason Andryuk <jason.andryuk@amd.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
CC: Denis Mukhin <dmukhin@ford.com>

v2:
 * Further adjustments to names, swap to true/false for bools.
---
 xen/arch/x86/hvm/svm/intr.c      | 19 +++++++--------
 xen/arch/x86/hvm/svm/nestedsvm.c | 33 +++++++++++++------------
 xen/arch/x86/hvm/svm/svm.c       | 18 +++++++-------
 xen/arch/x86/hvm/svm/vmcb.c      |  6 ++---
 xen/arch/x86/hvm/svm/vmcb.h      | 41 +++++++++++++++-----------------
 5 files changed, 55 insertions(+), 62 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 2224f1834741..dfe6d8347605 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -34,9 +34,9 @@ static void svm_inject_nmi(struct vcpu *v)
     uint32_t general1_intercepts;
     intinfo_t event;
 
-    if ( vintr.fields.vnmi_enable )
+    if ( vintr.vnmi_en )
     {
-        vintr.fields.vnmi_pending = true;
+        vintr.nmi_pending = true;
         vmcb_set_vintr(vmcb, vintr);
         return;
     }
@@ -93,7 +93,7 @@ static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
              */
             ASSERT(gvmcb != NULL);
             intr = vmcb_get_vintr(gvmcb);
-            if ( intr.fields.irq )
+            if ( intr.intr_pending )
                 return;
         }
     }
@@ -122,10 +122,10 @@ static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
         return;
 
     intr = vmcb_get_vintr(vmcb);
-    intr.fields.irq     = 1;
-    intr.fields.vector  = 0;
-    intr.fields.prio    = intack.vector >> 4;
-    intr.fields.ign_tpr = (intack.source != hvm_intsrc_lapic);
+    intr.intr_pending = true;
+    intr.intr_prio    = intack.vector >> 4;
+    intr.ign_tpr      = (intack.source != hvm_intsrc_lapic);
+    intr.vector       = 0;
     vmcb_set_vintr(vmcb, intr);
     vmcb_set_general1_intercepts(
         vmcb, general1_intercepts | GENERAL1_INTERCEPT_VINTR);
@@ -153,15 +153,14 @@ void asmlinkage svm_intr_assist(void)
         intblk = hvm_interrupt_blocked(v, intack);
 
         /*
-         * When vNMI is active, NMIs can be injected by setting vnmi_pending
+         * When vNMI is active, NMIs can be injected by setting nmi_pending
          * and hardware will deliver them at the next appropriate opportunity.
          * Consider them not blocked, to avoid trying to open an NMI Window.
          *
          * Correctness here relies on the fact that all vNMI capable hardware
          * has vGIF, and vGIF is always activated when appropriate.
          */
-        if ( intblk == hvm_intblk_nmi_iret &&
-             vmcb->_vintr.fields.vnmi_enable )
+        if ( intblk == hvm_intblk_nmi_iret && vmcb->_vintr.vnmi_en )
             intblk = hvm_intblk_none;
 
         if ( intblk == hvm_intblk_svm_gif )
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index d970869cfd96..610c8c213cf2 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -427,7 +427,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     if ( !clean.tpr )
     {
         n2vmcb->_vintr = ns_vmcb->_vintr;
-        n2vmcb->_vintr.fields.intr_masking = 1;
+        n2vmcb->_vintr.vintr_masking = true;
     }
 
     /* Interrupt state */
@@ -637,7 +637,7 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
     svm->ns_hap_enabled = vmcb_get_np(ns_vmcb);
 
     /* Remember the V_INTR_MASK in hostflags */
-    svm->ns_hostflags.vintrmask = ns_vmcb->_vintr.fields.intr_masking;
+    svm->ns_hostflags.vintrmask = ns_vmcb->_vintr.vintr_masking;
 
     /* Save l1 guest state (= host state) */
     ret = nsvm_vcpu_hostsave(v, inst_len);
@@ -723,8 +723,8 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
     struct vmcb_struct *ns_vmcb;
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
-    if ( vmcb->_vintr.fields.vgif_enable )
-        vmcb->_vintr.fields.vgif = 0;
+    if ( vmcb->_vintr.vgif_en )
+        vmcb->_vintr.gif = false;
     else
         svm->ns_gif = 0;
 
@@ -979,7 +979,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     /* Virtual Interrupts */
     ns_vmcb->_vintr = n2vmcb->_vintr;
     if ( !svm->ns_hostflags.vintrmask )
-        ns_vmcb->_vintr.fields.intr_masking = 0;
+        ns_vmcb->_vintr.vintr_masking = false;
 
     /* Interrupt state */
     ns_vmcb->int_stat = n2vmcb->int_stat;
@@ -1198,8 +1198,8 @@ nestedsvm_vmexit_defer(struct vcpu *v,
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
-    if ( vmcb->_vintr.fields.vgif_enable )
-        vmcb->_vintr.fields.vgif = 0;
+    if ( vmcb->_vintr.vgif_en )
+        vmcb->_vintr.gif = false;
     else
         svm->ns_gif = 0;
 
@@ -1461,8 +1461,8 @@ nestedsvm_gif_isset(struct vcpu *v)
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
     /* get the vmcb gif value if using vgif */
-    if ( vmcb->_vintr.fields.vgif_enable )
-        return vmcb->_vintr.fields.vgif;
+    if ( vmcb->_vintr.vgif_en )
+        return vmcb->_vintr.gif;
     else
         return svm->ns_gif;
 }
@@ -1509,7 +1509,7 @@ void svm_vmexit_do_clgi(struct cpu_user_regs *regs, struct vcpu *v)
 
     /* After a CLGI no interrupts should come */
     intr = vmcb_get_vintr(vmcb);
-    intr.fields.irq = 0;
+    intr.intr_pending = false;
     general1_intercepts &= ~GENERAL1_INTERCEPT_VINTR;
     vmcb_set_vintr(vmcb, intr);
     vmcb_set_general1_intercepts(vmcb, general1_intercepts);
@@ -1543,12 +1543,11 @@ void svm_nested_features_on_efer_update(struct vcpu *v)
             vmcb_set_general2_intercepts(vmcb, general2_intercepts);
         }
 
-        if ( !vmcb->_vintr.fields.vgif_enable &&
-             cpu_has_svm_vgif )
+        if ( !vmcb->_vintr.vgif_en && cpu_has_svm_vgif )
         {
             vintr = vmcb_get_vintr(vmcb);
-            vintr.fields.vgif = svm->ns_gif;
-            vintr.fields.vgif_enable = 1;
+            vintr.gif = svm->ns_gif;
+            vintr.vgif_en = true;
             vmcb_set_vintr(vmcb, vintr);
             general2_intercepts  = vmcb_get_general2_intercepts(vmcb);
             general2_intercepts &= ~(GENERAL2_INTERCEPT_STGI |
@@ -1567,11 +1566,11 @@ void svm_nested_features_on_efer_update(struct vcpu *v)
             vmcb_set_general2_intercepts(vmcb, general2_intercepts);
         }
 
-        if ( vmcb->_vintr.fields.vgif_enable )
+        if ( vmcb->_vintr.vgif_en )
         {
             vintr = vmcb_get_vintr(vmcb);
-            svm->ns_gif = vintr.fields.vgif;
-            vintr.fields.vgif_enable = 0;
+            svm->ns_gif = vintr.gif;
+            vintr.vgif_en = false;
             vmcb_set_vintr(vmcb, vintr);
             general2_intercepts  = vmcb_get_general2_intercepts(vmcb);
             general2_intercepts |= (GENERAL2_INTERCEPT_STGI |
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 666bcd3eb483..3e08610d151f 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -498,8 +498,8 @@ static unsigned cf_check int svm_get_interrupt_shadow(struct vcpu *v)
     if ( vmcb->int_stat.intr_shadow )
         intr_shadow |= HVM_INTR_SHADOW_MOV_SS | HVM_INTR_SHADOW_STI;
 
-    if ( vmcb->_vintr.fields.vnmi_enable
-         ? vmcb->_vintr.fields.vnmi_blocking
+    if ( vmcb->_vintr.vnmi_en
+         ? vmcb->_vintr.nmi_blocked
          : (vmcb_get_general1_intercepts(vmcb) & GENERAL1_INTERCEPT_IRET) )
         intr_shadow |= HVM_INTR_SHADOW_NMI;
 
@@ -516,9 +516,9 @@ static void cf_check svm_set_interrupt_shadow(
     vmcb->int_stat.intr_shadow =
         !!(intr_shadow & (HVM_INTR_SHADOW_MOV_SS|HVM_INTR_SHADOW_STI));
 
-    if ( vintr.fields.vnmi_enable )
+    if ( vintr.vnmi_en )
     {
-        vintr.fields.vnmi_blocking = block_nmi;
+        vintr.nmi_blocked = block_nmi;
         vmcb_set_vintr(vmcb, vintr);
     }
     else
@@ -964,8 +964,7 @@ static void noreturn cf_check svm_do_resume(void)
 
         /* Reflect the vlapic's TPR in the hardware vtpr */
         intr = vmcb_get_vintr(vmcb);
-        intr.fields.tpr =
-            (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0xFF) >> 4;
+        intr.tpr = (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0xFF) >> 4;
         vmcb_set_vintr(vmcb, intr);
     }
 
@@ -2542,7 +2541,7 @@ void asmlinkage svm_vmexit_handler(void)
     {
         intr = vmcb_get_vintr(vmcb);
         vlapic_set_reg(vlapic, APIC_TASKPRI,
-                   ((intr.fields.tpr & 0x0F) << 4) |
+                   ((intr.tpr & 0x0F) << 4) |
                    (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0x0F));
     }
 
@@ -2776,7 +2775,7 @@ void asmlinkage svm_vmexit_handler(void)
         u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
         intr = vmcb_get_vintr(vmcb);
 
-        intr.fields.irq = 0;
+        intr.intr_pending = false;
         general1_intercepts &= ~GENERAL1_INTERCEPT_VINTR;
 
         vmcb_set_vintr(vmcb, intr);
@@ -3067,8 +3066,7 @@ void asmlinkage svm_vmexit_handler(void)
 
     /* The exit may have updated the TPR: reflect this in the hardware vtpr */
     intr = vmcb_get_vintr(vmcb);
-    intr.fields.tpr =
-        (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0xFF) >> 4;
+    intr.tpr = (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0xFF) >> 4;
     vmcb_set_vintr(vmcb, intr);
 }
 
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 33c85ea3bfc5..91b9581a2e34 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -105,7 +105,7 @@ static int construct_vmcb(struct vcpu *v)
     vmcb->_iopm_base_pa = __pa(v->domain->arch.hvm.io_bitmap);
 
     /* Virtualise EFLAGS.IF and LAPIC TPR (CR8). */
-    vmcb->_vintr.fields.intr_masking = 1;
+    vmcb->_vintr.vintr_masking = true;
 
     /* Don't need to intercept RDTSC if CPU supports TSC rate scaling */
     if ( v->domain->arch.vtsc && !cpu_has_tsc_ratio )
@@ -192,7 +192,7 @@ static int construct_vmcb(struct vcpu *v)
     if ( default_xen_spec_ctrl == SPEC_CTRL_STIBP )
         v->arch.msrs->spec_ctrl.raw = SPEC_CTRL_STIBP;
 
-    vmcb->_vintr.fields.vnmi_enable = cpu_has_svm_vnmi;
+    vmcb->_vintr.vnmi_en = cpu_has_svm_vnmi;
 
     return 0;
 }
@@ -275,7 +275,7 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
            vmcb_get_iopm_base_pa(vmcb), vmcb_get_msrpm_base_pa(vmcb),
            vmcb_get_tsc_offset(vmcb));
     printk("tlb_control = %#x vintr = %#"PRIx64" int_stat = %#"PRIx64"\n",
-           vmcb->tlb_control, vmcb_get_vintr(vmcb).bytes,
+           vmcb->tlb_control, vmcb_get_vintr(vmcb).raw,
            vmcb->int_stat.raw);
     printk("event_inj %016"PRIx64", valid? %d, ec? %d, type %u, vector %#x\n",
            vmcb->event_inj.raw, vmcb->event_inj.v,
diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
index 8b351679fac5..bfe4a4521dcb 100644
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -328,28 +328,25 @@ typedef union {
     uint64_t raw;
 } intstat_t;
 
-typedef union
-{
-    u64 bytes;
-    struct
-    {
-        u64 tpr:          8;
-        u64 irq:          1;
-        u64 vgif:         1;
-        u64 :             1;
-        u64 vnmi_pending: 1;
-        u64 vnmi_blocking:1;
-        u64 :             3;
-        u64 prio:         4;
-        u64 ign_tpr:      1;
-        u64 rsvd1:        3;
-        u64 intr_masking: 1;
-        u64 vgif_enable:  1;
-        u64 vnmi_enable:  1;
-        u64 :             5;
-        u64 vector:       8;
-        u64 rsvd3:       24;
-    } fields;
+typedef union {
+    struct {         /* Cleanbit 3 (TPR),  APM Name */
+        uint8_t tpr;                /* c   V_TPR */
+        bool    intr_pending:1;     /* c   V_IRQ */
+        bool    gif:1;              /*     VGIF */
+        bool    :1;
+        bool    nmi_pending:1;      /* c   V_NMI */
+        bool    nmi_blocked:1;      /* c   V_NMI_MASK */
+        uint8_t :3;
+        uint8_t intr_prio:4;        /* c   V_INTR_PRIO */
+        bool    ign_tpr:1;          /* c   V_IGN_TPR */
+        uint8_t :3;
+        bool    vintr_masking:1;    /* c   V_INTR_MASKING */
+        bool    vgif_en:1;          /*     VGIF_EN */
+        bool    vnmi_en:1;          /*     V_NMI_ENABLE */
+        uint8_t :5;
+        uint8_t vector;             /* c   V_INTR_VECTOR */
+    };
+    uint64_t raw;
 } vintr_t;
 
 typedef union
-- 
2.39.5


