Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D71D606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 17:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=TaGLgBtc
Received: from list by lists.xenproject.org with outflank-mailman.1480343.1684307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQTaK-0000wq-3w; Mon, 09 Nov 2026 17:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480343.1684307; Mon, 09 Nov 2026 17:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQTaK-0000wj-1O; Mon, 09 Nov 2026 17:55:12 +0000
Received: by outflank-mailman (input) for mailman id 1480343;
 Mon, 09 Nov 2026 17:55:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQTaI-0000wd-Je
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 17:55:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQTaI-00FX8z-0R
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 18:55:10 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af208a4-8faa-0a2a0a5109dd-0a2a4507dd4e-46
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 18:55:09 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af208fd-b4ea-0a2a45070019-d1558030f0de-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 18:55:09 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a35d5d4a20so14351065e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 09:55:09 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba02005762sm3522145e9.2.2026.11.09.09.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 09:55:08 -0800 (PST)
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
        d=citrix.com; s=google; t=1794246909; x=1794851709; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KRTqIsbDsF6i34pvfC1qpwoAKoKnkdFenpwq0H1eY6k=;
        b=TaGLgBtc3m1fo9M77jGlmHu7lAJ+dCnQ0S7tlyZWmF6SQTD4hV2rrnR77Bb11MLLcJ
         zr3e4kDSza3XujAL8Y8jSipChWPWx4SUh2KLLgSpkKCS8zq7vF4gR1twT5IGB+LzGDLr
         LUlZq2b7GRmzoqIps43kTOl8sCXKV5kCX+GcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246909; x=1794851709;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KRTqIsbDsF6i34pvfC1qpwoAKoKnkdFenpwq0H1eY6k=;
        b=Eco+3mnYBSxSJPedXnZxrjwuQ4+i4q5nGsBDxKvUQ1tIFK8tOVY6Kap9qu+0mPoEnZ
         a3Qp8glq9MI8t6EtAMdJIuIz185IztqOX2Iqd86eYVv96EMH6Lgb7ZeoJ5FxPoWjASfJ
         ZT80kYv9ICe2xQSO+T51vnzFVr1kMYgAdczI07qyPXzSs3N7+4P67BZiLy/UmKNwdY52
         WhMrYFEyOnv+K6U8yCRZ13CyHVmyH+SkxBdT9VvKOCDxCuFchbdqccVGxH9KWNHbYbW0
         R0ovfqUEzTQhT1Cw3z4U9AJb+tcpk59rnSzWoAokPI/ITj7eKcNGm3MKL1OCnrzSggO2
         QeAA==
X-Gm-Message-State: APuU4Z8xYOaX95h957KN0c+CQAwebQOt1DJaWB3ipgDtH38Ex2gytOyw
	VegFLRS37Rr+zdvyP4UKYQ+OQ2yd4x//zEHWMCuFGLw4Ii+/mmJPQvWMgPE88pFeZNbKW1mtgD7
	Q1Iey5QU=
X-Gm-Gg: AYBFou0d4AZfAzqv3yEvWIlGOxv4jXEPTQ2HMBdQd0EFMC3hrt+ZI6DMGSodVqLgMNO
	Usk3vbQm7BlzzgTtuEFIkpK1Z8vT7koIfJoHNHt/4pxCrCEYPgtzHIGEoFcKyczvrR2crXu1ntN
	lAjYD1ADYnPqt72CZqH9u2+csaly89vCkTuBjVAlhTiDqda0kbnII7gwJMy/jSx2tvTSGhzxtyE
	BAfzNZwV4L2PurQoE+Aoi/AOqNNQXMafkCKKXgK2XZ2lWD/dcXwvwUihGidbg1PhRJB/w+pdkqS
	DHP7wZX0s4YNjMXVKAKmFEuvVtqXd3gKbbbQeTEV53r3glV4hwr1gSQN3kDnAvYgXJJp/KcVmS1
	f6z9v5OdZKoQdKVCf0g9rHFBJwHMlbI1aIBSYADDTqxsTMyfNWiOsTTOlBuZND9v9wh6kKjgxql
	OJU/aU3qF/8izIReRBkfmP0iu+jPvAWBpnAXPzqCwVO6WeIKcaDdLJQ89KP/HN+UnWxto2xhODq
	xa1E5loOpPvPjD5XmgyfCOEuWoDuFmY9WovPqMngtdI2y0A8GM3bkkj3TSNyzItyULOH+pqHSAg
	o0jAOjyNZAKiBLasf7zB+vRdDNwUzqX+AcsnKF6qCfON8qaaeTGLCB6t4nyzAWdSW/QnFMTsesp
	jYj8=
X-Received: by 2002:a05:600c:3e88:b0:4b0:bc65:b9b5 with SMTP id 5b1f17b1804b1-4b963c8809emr85594455e9.35.1794246909064;
        Mon, 09 Nov 2026 09:55:09 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH] x86/svm: Drop 'struct' from the vmcb_struct type
Date: Mon,  9 Nov 2026 17:55:06 +0000
Message-Id: <20261109175506.2965263-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1794246909-342F4AE4-063D6BB5/10/78276251493
X-purgate-type: spam
X-purgate-size: 29668
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is just a waste of space seeing as it is acompanied by a struct keyword.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Jason Andryuk <jason.andryuk@amd.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
CC: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/svm/asid.c              |  2 +-
 xen/arch/x86/hvm/svm/emulate.c           |  2 +-
 xen/arch/x86/hvm/svm/intr.c              | 10 +--
 xen/arch/x86/hvm/svm/nestedsvm.c         | 36 +++++------
 xen/arch/x86/hvm/svm/svm.c               | 82 ++++++++++++------------
 xen/arch/x86/hvm/svm/vmcb.c              | 16 ++---
 xen/arch/x86/hvm/svm/vmcb.h              | 16 ++---
 xen/arch/x86/include/asm/hvm/svm-types.h |  2 +-
 xen/arch/x86/x86_64/asm-offsets.c        |  2 +-
 9 files changed, 84 insertions(+), 84 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/asid.c b/xen/arch/x86/hvm/svm/asid.c
index 53aa5d05125f..c8d86938d178 100644
--- a/xen/arch/x86/hvm/svm/asid.c
+++ b/xen/arch/x86/hvm/svm/asid.c
@@ -29,7 +29,7 @@ void svm_asid_init(const struct cpuinfo_x86 *c)
 void svm_asid_handle_vmrun(void)
 {
     struct vcpu *curr = current;
-    struct vmcb_struct *vmcb = curr->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = curr->arch.hvm.svm.vmcb;
     struct hvm_vcpu_asid *p_asid =
         nestedhvm_vcpu_in_guestmode(curr)
         ? &vcpu_nestedhvm(curr).nv_n2asid : &curr->arch.hvm.n1asid;
diff --git a/xen/arch/x86/hvm/svm/emulate.c b/xen/arch/x86/hvm/svm/emulate.c
index 1f5436c8ea5d..e392b2a7586b 100644
--- a/xen/arch/x86/hvm/svm/emulate.c
+++ b/xen/arch/x86/hvm/svm/emulate.c
@@ -18,7 +18,7 @@
 
 static unsigned long svm_nextrip_insn_length(struct vcpu *v)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
 
     if ( !cpu_has_svm_nrips )
         return 0;
diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 0d807fb768af..11fdac3b9d6b 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -29,7 +29,7 @@
 
 static void svm_inject_nmi(struct vcpu *v)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
     vintr_t vintr = vmcb_get_vintr(vmcb);
     uint32_t general1_intercepts;
     intinfo_t event;
@@ -60,7 +60,7 @@ static void svm_inject_nmi(struct vcpu *v)
 
 static void svm_inject_intr(struct vcpu *v, int vector)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
     intinfo_t event;
 
     event.raw = 0;
@@ -74,7 +74,7 @@ static void svm_inject_intr(struct vcpu *v, int vector)
 
 static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
     uint32_t general1_intercepts = vmcb_get_general1_intercepts(vmcb);
     vintr_t intr;
 
@@ -86,7 +86,7 @@ static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
 
         if ( nv->nv_vmentry_pending )
         {
-            struct vmcb_struct *gvmcb = nv->nv_vvmcx;
+            struct vmcb *gvmcb = nv->nv_vvmcx;
 
             /* check if l1 guest injects interrupt into l2 guest via vintr.
              * return here or l2 guest looses interrupts, otherwise.
@@ -134,7 +134,7 @@ static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
 void asmlinkage svm_intr_assist(void)
 {
     struct vcpu *v = current;
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
     struct hvm_intack intack;
     enum hvm_intblk intblk;
 
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 610c8c213cf2..81cae929dd05 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -165,7 +165,7 @@ static int nsvm_vcpu_hostsave(struct vcpu *v, unsigned int inst_len)
 {
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
-    struct vmcb_struct *n1vmcb;
+    struct vmcb *n1vmcb;
 
     n1vmcb = nv->nv_n1vmcx;
     ASSERT(n1vmcb != NULL);
@@ -190,7 +190,7 @@ static int nsvm_vcpu_hostsave(struct vcpu *v, unsigned int inst_len)
 static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
 {
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
-    struct vmcb_struct *n1vmcb, *n2vmcb;
+    struct vmcb *n1vmcb, *n2vmcb;
     int rc;
 
     n1vmcb = nv->nv_n1vmcx;
@@ -271,8 +271,8 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v)
     struct svm_vcpu *arch_svm = &v->arch.hvm.svm;
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
-    struct vmcb_struct *ns_vmcb = nv->nv_vvmcx;
-    struct vmcb_struct *host_vmcb = arch_svm->vmcb;
+    struct vmcb *ns_vmcb = nv->nv_vvmcx;
+    struct vmcb *host_vmcb = arch_svm->vmcb;
     unsigned long *ns_msrpm_ptr;
     unsigned int i;
     enum hvm_translation_result ret;
@@ -331,7 +331,7 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v)
 }
 
 static void nestedsvm_vmcb_set_nestedp2m(struct vcpu *v,
-    struct vmcb_struct *vvmcb, struct vmcb_struct *n2vmcb)
+    struct vmcb *vvmcb, struct vmcb *n2vmcb)
 {
     struct p2m_domain *p2m;
 
@@ -350,7 +350,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
 {
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
-    struct vmcb_struct *ns_vmcb, *n1vmcb, *n2vmcb;
+    struct vmcb *ns_vmcb, *n1vmcb, *n2vmcb;
     vmcbcleanbits_t clean = {};
     int rc;
 
@@ -610,7 +610,7 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
     int ret;
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
-    struct vmcb_struct *ns_vmcb;
+    struct vmcb *ns_vmcb;
 
     ns_vmcb = nv->nv_vvmcx;
     ASSERT(ns_vmcb != NULL);
@@ -720,8 +720,8 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
 {
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
-    struct vmcb_struct *ns_vmcb;
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *ns_vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
 
     if ( vmcb->_vintr.vgif_en )
         vmcb->_vintr.gif = false;
@@ -808,7 +808,7 @@ nsvm_vmcb_guest_intercepts_msr(unsigned long *msr_bitmap,
 }
 
 static int
-nsvm_vmcb_guest_intercepts_ioio(struct vmcb_struct *vmcb)
+nsvm_vmcb_guest_intercepts_ioio(struct vmcb *vmcb)
 {
     unsigned long gfn = vmcb->_iopm_base_pa >> PAGE_SHIFT;
     unsigned long *io_bitmap;
@@ -859,7 +859,7 @@ nsvm_vmcb_guest_intercepts_exitcode(struct vcpu *v,
     uint64_t exit_bits;
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
-    struct vmcb_struct *ns_vmcb = nv->nv_vvmcx;
+    struct vmcb *ns_vmcb = nv->nv_vvmcx;
     enum nestedhvm_vmexits vmexits;
 
     switch ( exitcode )
@@ -948,8 +948,8 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
 {
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
-    struct vmcb_struct *ns_vmcb = nv->nv_vvmcx;
-    struct vmcb_struct *n2vmcb = nv->nv_n2vmcx;
+    struct vmcb *ns_vmcb = nv->nv_vvmcx;
+    struct vmcb *n2vmcb = nv->nv_n2vmcx;
 
     svm_vmsave_pa(nv->nv_n1vmcx_pa);
 
@@ -1157,7 +1157,7 @@ enum hvm_intblk cf_check nsvm_intr_blocked(struct vcpu *v)
 
     if ( nestedhvm_vcpu_in_guestmode(v) )
     {
-        struct vmcb_struct *n2vmcb = nv->nv_n2vmcx;
+        struct vmcb *n2vmcb = nv->nv_n2vmcx;
 
         if ( svm->ns_hostflags.vintrmask && !svm->ns_hostflags.rflagsif )
             return hvm_intblk_rflags_ie;
@@ -1196,7 +1196,7 @@ nestedsvm_vmexit_defer(struct vcpu *v,
     uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2)
 {
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
 
     if ( vmcb->_vintr.vgif_en )
         vmcb->_vintr.gif = false;
@@ -1458,7 +1458,7 @@ bool
 nestedsvm_gif_isset(struct vcpu *v)
 {
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
 
     /* get the vmcb gif value if using vgif */
     if ( vmcb->_vintr.vgif_en )
@@ -1491,7 +1491,7 @@ void svm_vmexit_do_stgi(struct cpu_user_regs *regs, struct vcpu *v)
 
 void svm_vmexit_do_clgi(struct cpu_user_regs *regs, struct vcpu *v)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
     unsigned int inst_len;
     uint32_t general1_intercepts = vmcb_get_general1_intercepts(vmcb);
     vintr_t intr;
@@ -1523,7 +1523,7 @@ void svm_vmexit_do_clgi(struct cpu_user_regs *regs, struct vcpu *v)
  */
 void svm_nested_features_on_efer_update(struct vcpu *v)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
     u32 general2_intercepts;
     vintr_t vintr;
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 9a319e762555..bfca1eda4af5 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -56,7 +56,7 @@ u32 svm_feature_flags;
 static DEFINE_PER_CPU_READ_MOSTLY(paddr_t, hsa);
 static DEFINE_PER_CPU_READ_MOSTLY(paddr_t, host_vmcb);
 #ifdef CONFIG_PV
-static DEFINE_PER_CPU(struct vmcb_struct *, host_vmcb_va);
+static DEFINE_PER_CPU(struct vmcb *, host_vmcb_va);
 #endif
 
 static bool amd_erratum383_found __read_mostly;
@@ -107,7 +107,7 @@ static void cf_check svm_cpu_down(void)
 static void cf_check svm_update_guest_cr(
     struct vcpu *v, unsigned int cr, unsigned int flags)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
     uint64_t value;
 
     switch ( cr )
@@ -177,7 +177,7 @@ static void cf_check svm_update_guest_cr(
 
 static void cf_check svm_update_guest_efer(struct vcpu *v)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
     unsigned long guest_efer = v->arch.hvm.guest_efer,
         xen_efer = read_efer();
 
@@ -262,7 +262,7 @@ static void cf_check svm_enable_msr_interception(struct domain *d, uint32_t msr)
 
 static void svm_save_dr(struct vcpu *v)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
     unsigned int flag_dr_dirty = v->arch.hvm.flag_dr_dirty;
 
     if ( !flag_dr_dirty )
@@ -297,7 +297,7 @@ static void svm_save_dr(struct vcpu *v)
     v->arch.dr7   = vmcb_get_dr7(vmcb);
 }
 
-static void __restore_debug_registers(struct vmcb_struct *vmcb, struct vcpu *v)
+static void __restore_debug_registers(struct vmcb *vmcb, struct vcpu *v)
 {
     if ( v->arch.hvm.flag_dr_dirty )
         return;
@@ -344,7 +344,7 @@ static void __restore_debug_registers(struct vmcb_struct *vmcb, struct vcpu *v)
  */
 static void svm_restore_dr(struct vcpu *v)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
 
     if ( unlikely(v->arch.dr7 & DR7_ACTIVE_MASK) )
         __restore_debug_registers(vmcb, v);
@@ -352,7 +352,7 @@ static void svm_restore_dr(struct vcpu *v)
 
 static int svm_vmcb_save(struct vcpu *v, struct hvm_hw_cpu *c)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
 
     if ( vmcb->event_inj.v &&
          hvm_event_needs_reinjection(vmcb->event_inj.type,
@@ -368,7 +368,7 @@ static int svm_vmcb_save(struct vcpu *v, struct hvm_hw_cpu *c)
 static int svm_vmcb_restore(struct vcpu *v, struct hvm_hw_cpu *c)
 {
     struct page_info *page = NULL;
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
     struct p2m_domain *p2m = p2m_get_hostp2m(v->domain);
 
     if ( c->pending_valid )
@@ -443,7 +443,7 @@ static int svm_vmcb_restore(struct vcpu *v, struct hvm_hw_cpu *c)
 
 static void svm_save_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
 
     data->sysenter_cs      = vmcb->sysenter_cs;
     data->sysenter_esp     = vmcb->sysenter_esp;
@@ -457,7 +457,7 @@ static void svm_save_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
 
 static void svm_load_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
 
     vmcb->lstar        = data->msr_lstar;
     vmcb->star         = data->msr_star;
@@ -492,7 +492,7 @@ static int cf_check svm_load_vmcb_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
 
 static unsigned cf_check int svm_get_interrupt_shadow(struct vcpu *v)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
     unsigned int intr_shadow = 0;
 
     if ( vmcb->int_stat.intr_shadow )
@@ -509,7 +509,7 @@ static unsigned cf_check int svm_get_interrupt_shadow(struct vcpu *v)
 static void cf_check svm_set_interrupt_shadow(
     struct vcpu *v, unsigned int intr_shadow)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
     bool block_nmi = intr_shadow & HVM_INTR_SHADOW_NMI;
     vintr_t vintr = vmcb_get_vintr(vmcb);
 
@@ -535,7 +535,7 @@ static void cf_check svm_set_interrupt_shadow(
 
 static int cf_check svm_guest_x86_mode(struct vcpu *v)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
 
     if ( unlikely(!(v->arch.hvm.guest_cr[0] & X86_CR0_PE)) )
         return X86_MODE_REAL;
@@ -549,7 +549,7 @@ static int cf_check svm_guest_x86_mode(struct vcpu *v)
 static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
 {
     struct svm_vcpu *svm = &v->arch.hvm.svm;
-    struct vmcb_struct *vmcb = svm->vmcb;
+    struct vmcb *vmcb = svm->vmcb;
     const struct cpu_policy *cp = v->domain->arch.cpu_policy;
     u32 bitmap = vmcb_get_exception_intercepts(vmcb);
 
@@ -608,7 +608,7 @@ static unsigned int cf_check svm_get_cpl(struct vcpu *v)
 static void cf_check svm_get_segment_register(
     struct vcpu *v, enum x86_segment seg, struct segment_register *reg)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
 
     ASSERT((v == current) || !vcpu_runnable(v));
 
@@ -654,7 +654,7 @@ static void cf_check svm_get_segment_register(
 static void cf_check svm_set_segment_register(
     struct vcpu *v, enum x86_segment seg, struct segment_register *reg)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
 
     ASSERT((v == current) || !vcpu_runnable(v));
 
@@ -724,7 +724,7 @@ static void cf_check svm_set_segment_register(
 
 static int cf_check svm_set_guest_pat(struct vcpu *v, u64 gpat)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
 
     if ( paging_mode_shadow(v->domain) )
         return 0;
@@ -735,7 +735,7 @@ static int cf_check svm_set_guest_pat(struct vcpu *v, u64 gpat)
 
 static int cf_check svm_get_guest_pat(struct vcpu *v, u64 *gpat)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
 
     if ( paging_mode_shadow(v->domain) )
         return 0;
@@ -746,8 +746,8 @@ static int cf_check svm_get_guest_pat(struct vcpu *v, u64 *gpat)
 
 static void cf_check svm_set_tsc_offset(struct vcpu *v, uint64_t offset)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
-    struct vmcb_struct *n1vmcb, *n2vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *n1vmcb, *n2vmcb;
     uint64_t n2_tsc_offset = 0;
     struct domain *d = v->domain;
 
@@ -772,7 +772,7 @@ static void cf_check svm_set_tsc_offset(struct vcpu *v, uint64_t offset)
 
 static void cf_check svm_set_rdtsc_exiting(struct vcpu *v, bool enable)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
     u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
     u32 general2_intercepts = vmcb_get_general2_intercepts(vmcb);
 
@@ -793,7 +793,7 @@ static void cf_check svm_set_rdtsc_exiting(struct vcpu *v, bool enable)
 static void cf_check svm_set_descriptor_access_exiting(
     struct vcpu *v, bool enable)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
     u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
     u32 mask = GENERAL1_INTERCEPT_IDTR_READ | GENERAL1_INTERCEPT_GDTR_READ
             | GENERAL1_INTERCEPT_LDTR_READ | GENERAL1_INTERCEPT_TR_READ
@@ -811,7 +811,7 @@ static void cf_check svm_set_descriptor_access_exiting(
 
 static unsigned int cf_check svm_get_insn_bytes(struct vcpu *v, uint8_t *buf)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
     unsigned int len = v->arch.hvm.svm.cached_insn_len;
 
     if ( len != 0 )
@@ -927,7 +927,7 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
 static void noreturn cf_check svm_do_resume(void)
 {
     struct vcpu *v = current;
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
     bool debug_state = (v->domain->debugger_attached ||
                         v->domain->arch.monitor.software_breakpoint_enabled ||
                         v->domain->arch.monitor.debug_exception_enabled);
@@ -977,7 +977,7 @@ void asmlinkage svm_vmenter_helper(void)
 {
     const struct cpu_user_regs *regs = guest_cpu_user_regs();
     struct vcpu *curr = current;
-    struct vmcb_struct *vmcb = curr->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = curr->arch.hvm.svm.vmcb;
 
     ASSERT(hvmemul_cache_disabled(curr));
 
@@ -1127,7 +1127,7 @@ static void cf_check svm_vcpu_destroy(struct vcpu *v)
 static void svm_emul_swint_injection(struct x86_event *event)
 {
     struct vcpu *curr = current;
-    const struct vmcb_struct *vmcb = curr->arch.hvm.svm.vmcb;
+    const struct vmcb *vmcb = curr->arch.hvm.svm.vmcb;
     const struct cpu_user_regs *regs = guest_cpu_user_regs();
     unsigned int trap = event->vector, type = event->type;
     unsigned int fault = X86_EXC_GP, ec = 0;
@@ -1235,7 +1235,7 @@ static void svm_emul_swint_injection(struct x86_event *event)
 static void cf_check svm_inject_event(const struct x86_event *event)
 {
     struct vcpu *curr = current;
-    struct vmcb_struct *vmcb = curr->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = curr->arch.hvm.svm.vmcb;
     intinfo_t eventinj = vmcb->event_inj;
     struct x86_event _event = *event;
     struct cpu_user_regs *regs = guest_cpu_user_regs();
@@ -1453,7 +1453,7 @@ static void svm_init_erratum_383(const struct cpuinfo_x86 *c)
 #ifdef CONFIG_PV
 void svm_load_segs_prefetch(void)
 {
-    const struct vmcb_struct *vmcb = this_cpu(host_vmcb_va);
+    const struct vmcb *vmcb = this_cpu(host_vmcb_va);
 
     if ( vmcb )
         /*
@@ -1469,7 +1469,7 @@ bool svm_load_segs(unsigned int ldt_ents, unsigned long ldt_base,
                    unsigned long gs_shadow)
 {
     unsigned int cpu = smp_processor_id();
-    struct vmcb_struct *vmcb = per_cpu(host_vmcb_va, cpu);
+    struct vmcb *vmcb = per_cpu(host_vmcb_va, cpu);
 
     if ( unlikely(!vmcb) )
         return false;
@@ -1638,7 +1638,7 @@ static void svm_do_nested_pgfault(struct vcpu *v,
 }
 
 static void svm_vmexit_do_cr_access(
-    struct vmcb_struct *vmcb, struct cpu_user_regs *regs)
+    struct vmcb *vmcb, struct cpu_user_regs *regs)
 {
     int gp, cr, dir, rc;
 
@@ -1656,7 +1656,7 @@ static void svm_vmexit_do_cr_access(
 
 static void svm_dr_access(struct vcpu *v, struct cpu_user_regs *regs)
 {
-    struct vmcb_struct *vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
+    struct vmcb *vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
 
     TRACE(TRC_HVM_DR_WRITE);
     __restore_debug_registers(vmcb, v);
@@ -1667,7 +1667,7 @@ static int cf_check svm_msr_read_intercept(
 {
     struct vcpu *v = current;
     const struct domain *d = v->domain;
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
     const struct nestedsvm *nsvm = &vcpu_nestedsvm(v);
     uint64_t tmp;
 
@@ -1858,7 +1858,7 @@ static int cf_check svm_msr_write_intercept(
 {
     struct vcpu *v = current;
     struct domain *d = v->domain;
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
     struct nestedsvm *nsvm = &vcpu_nestedsvm(v);
 
     switch ( msr )
@@ -2064,7 +2064,7 @@ static void svm_do_msr_access(struct cpu_user_regs *regs)
         hvm_inject_hw_exception(X86_EXC_GP, 0);
 }
 
-static void svm_vmexit_do_hlt(struct vmcb_struct *vmcb,
+static void svm_vmexit_do_hlt(struct vmcb *vmcb,
                               struct cpu_user_regs *regs)
 {
     unsigned int inst_len;
@@ -2163,7 +2163,7 @@ nsvm_get_nvmcb_page(struct vcpu *v, uint64_t vmcbaddr)
 }
 
 static void
-svm_vmexit_do_vmload(struct vmcb_struct *vmcb,
+svm_vmexit_do_vmload(struct vmcb *vmcb,
                      struct cpu_user_regs *regs,
                      struct vcpu *v, uint64_t vmcbaddr)
 {
@@ -2198,7 +2198,7 @@ svm_vmexit_do_vmload(struct vmcb_struct *vmcb,
 }
 
 static void
-svm_vmexit_do_vmsave(struct vmcb_struct *vmcb,
+svm_vmexit_do_vmsave(struct vmcb *vmcb,
                      struct cpu_user_regs *regs,
                      struct vcpu *v, uint64_t vmcbaddr)
 {
@@ -2321,7 +2321,7 @@ static void cf_check svm_invlpg(struct vcpu *v, unsigned long linear)
 static bool cf_check svm_get_pending_event(
     struct vcpu *v, struct x86_event *info)
 {
-    const struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    const struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
 
     if ( !vmcb->event_inj.v )
         return false;
@@ -2336,7 +2336,7 @@ static bool cf_check svm_get_pending_event(
 static uint64_t cf_check svm_get_reg(struct vcpu *v, unsigned int reg)
 {
     struct vcpu *curr = current;
-    const struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    const struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
     struct domain *d = v->domain;
 
     switch ( reg )
@@ -2359,7 +2359,7 @@ static uint64_t cf_check svm_get_reg(struct vcpu *v, unsigned int reg)
 
 static void cf_check svm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
     struct domain *d = v->domain;
 
     switch ( reg )
@@ -2511,7 +2511,7 @@ void asmlinkage svm_vmexit_handler(void)
     struct cpu_user_regs *regs = guest_cpu_user_regs();
     uint64_t exit_reason;
     struct vcpu *v = current;
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
     int insn_len;
     vintr_t intr;
     bool vcpu_guestmode = false;
@@ -2563,7 +2563,7 @@ void asmlinkage svm_vmexit_handler(void)
     {
         enum nestedhvm_vmexits nsret;
         struct nestedvcpu *nv = &vcpu_nestedhvm(v);
-        struct vmcb_struct *ns_vmcb = nv->nv_vvmcx;
+        struct vmcb *ns_vmcb = nv->nv_vvmcx;
         uint64_t exitinfo1, exitinfo2;
 
         paging_update_nestedmode(v);
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 91b9581a2e34..65b7bdf92587 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -23,9 +23,9 @@
 #include "svm.h"
 #include "vmcb.h"
 
-struct vmcb_struct *alloc_vmcb(void)
+struct vmcb *alloc_vmcb(void)
 {
-    struct vmcb_struct *vmcb;
+    struct vmcb *vmcb;
 
     vmcb = alloc_xenheap_page();
     if ( vmcb == NULL )
@@ -38,7 +38,7 @@ struct vmcb_struct *alloc_vmcb(void)
     return vmcb;
 }
 
-void free_vmcb(struct vmcb_struct *vmcb)
+void free_vmcb(struct vmcb *vmcb)
 {
     free_xenheap_page(vmcb);
 }
@@ -47,7 +47,7 @@ void free_vmcb(struct vmcb_struct *vmcb)
 static int construct_vmcb(struct vcpu *v)
 {
     struct svm_vcpu *svm = &v->arch.hvm.svm;
-    struct vmcb_struct *vmcb = svm->vmcb;
+    struct vmcb *vmcb = svm->vmcb;
 
     vmcb->_general1_intercepts =
         GENERAL1_INTERCEPT_INTR        | GENERAL1_INTERCEPT_NMI         |
@@ -250,7 +250,7 @@ static void svm_dump_sel(const char *name, const struct segment_register *s)
            name, s->sel, s->attr, s->limit, s->base);
 }
 
-void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
+void svm_vmcb_dump(const char *from, const struct vmcb *vmcb)
 {
     struct vcpu *curr = current;
 
@@ -263,7 +263,7 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
 
     printk("Dumping guest's current state at %s...\n", from);
     printk("Size of VMCB = %zu, paddr = %"PRIpaddr", vaddr = %p\n",
-           sizeof(struct vmcb_struct), virt_to_maddr(vmcb), vmcb);
+           sizeof(struct vmcb), virt_to_maddr(vmcb), vmcb);
 
     printk("cr_intercepts = %#x dr_intercepts = %#x "
            "exception_intercepts = %#x\n",
@@ -328,7 +328,7 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
 }
 
 bool svm_vmcb_isvalid(
-    const char *from, const struct vmcb_struct *vmcb, const struct vcpu *v,
+    const char *from, const struct vmcb *vmcb, const struct vcpu *v,
     bool verbose)
 {
     bool ret = false; /* ok */
@@ -443,7 +443,7 @@ void __init setup_vmcb_dump(void)
 
 static void __init __maybe_unused build_assertions(void)
 {
-    struct vmcb_struct vmcb;
+    struct vmcb vmcb;
 
     /* Build-time check of the VMCB layout. */
     BUILD_BUG_ON(sizeof(vmcb) != PAGE_SIZE);
diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
index 9d89ce44fe55..ba10ff985440 100644
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -383,7 +383,7 @@ typedef union
 #define IOPM_SIZE   (12 * 1024)
 #define MSRPM_SIZE  (8  * 1024)
 
-struct vmcb_struct {
+struct vmcb {
     /* Control area */
     uint32_t _cr_intercepts;             /* 0x000 - Clean.intercepts(0) */
     uint32_t _dr_intercepts;             /* 0x004   | */
@@ -536,15 +536,15 @@ struct vmcb_struct {
     uint64_t res18[291];
 };
 
-struct vmcb_struct *alloc_vmcb(void);
-void free_vmcb(struct vmcb_struct *vmcb);
+struct vmcb *alloc_vmcb(void);
+void free_vmcb(struct vmcb *vmcb);
 
 int  svm_create_vmcb(struct vcpu *v);
 void svm_destroy_vmcb(struct vcpu *v);
 
 void setup_vmcb_dump(void);
-void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb);
-bool svm_vmcb_isvalid(const char *from, const struct vmcb_struct *vmcb,
+void svm_vmcb_dump(const char *from, const struct vmcb *vmcb);
+bool svm_vmcb_isvalid(const char *from, const struct vmcb *vmcb,
                       const struct vcpu *v, bool verbose);
 
 /*
@@ -553,20 +553,20 @@ bool svm_vmcb_isvalid(const char *from, const struct vmcb_struct *vmcb,
 
 #define VMCB_ACCESSORS_(name, type, cleanbit)     \
 static inline void                                \
-vmcb_set_ ## name(struct vmcb_struct *vmcb,       \
+vmcb_set_ ## name(struct vmcb *vmcb,              \
                   type value)                     \
 {                                                 \
     vmcb->_ ## name = value;                      \
     vmcb->cleanbits.cleanbit = false;             \
 }                                                 \
 static inline type                                \
-vmcb_get_ ## name(const struct vmcb_struct *vmcb) \
+vmcb_get_ ## name(const struct vmcb *vmcb)        \
 {                                                 \
     return vmcb->_ ## name;                       \
 }
 
 #define VMCB_ACCESSORS(name, cleanbit) \
-    VMCB_ACCESSORS_(name, typeof(((struct vmcb_struct){})._ ## name), cleanbit)
+    VMCB_ACCESSORS_(name, typeof(((struct vmcb){})._ ## name), cleanbit)
 
 VMCB_ACCESSORS(cr_intercepts, intercepts)
 VMCB_ACCESSORS(dr_intercepts, intercepts)
diff --git a/xen/arch/x86/include/asm/hvm/svm-types.h b/xen/arch/x86/include/asm/hvm/svm-types.h
index 71427b3c11d1..3475ed6a06db 100644
--- a/xen/arch/x86/include/asm/hvm/svm-types.h
+++ b/xen/arch/x86/include/asm/hvm/svm-types.h
@@ -18,7 +18,7 @@ struct svm_domain {
 };
 
 struct svm_vcpu {
-    struct vmcb_struct *vmcb;
+    struct vmcb *vmcb;
     unsigned long *msrpm;
     uint64_t vmcb_pa;
     int     launch_core;
diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index ce5e7aae16cd..904a9b512d23 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -139,7 +139,7 @@ void __dummy__(void)
 #endif
 
 #ifdef CONFIG_AMD_SVM
-    OFFSET(VMCB_int_stat, struct vmcb_struct, int_stat);
+    OFFSET(VMCB_int_stat, struct vmcb, int_stat);
     BLANK();
 #endif
 
-- 
2.39.5


