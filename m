Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05683606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 04:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mCckb7on
Received: from list by lists.xenproject.org with outflank-mailman.1485098.1688404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRMnb-0005o3-LV; Thu, 12 Nov 2026 04:52:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485098.1688404; Thu, 12 Nov 2026 04:52:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRMnb-0005nw-IM; Thu, 12 Nov 2026 04:52:35 +0000
Received: by outflank-mailman (input) for mailman id 1485098;
 Thu, 12 Nov 2026 04:52:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ma.mandourr@gmail.com>) id 1xRMna-0005nq-HK
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 04:52:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRMnZ-005KYo-Fm
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 05:52:33 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ma.mandourr@gmail.com>)
 id 6af545fa-8faa-0a2a0a5109dd-0a2a45058cd4-14
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 05:52:33 +0100
Received: from [209.85.216.46] (helo=mail-pj1-f46.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ma.mandourr@gmail.com>)
 id 6af5460f-4cb1-0a2a45050019-d155d82eb12f-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 05:52:33 +0100
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-3b15e46698aso1925625a91.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:52:32 -0800 (PST)
Received: from cs-arch-srv04.cmpt.sfu.ca (cs-arch-srv04.cmpt.sfu.ca.
 [142.58.10.48]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b197c6c9c5sm2490661a91.1.2026.11.11.20.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 20:52:30 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794459151; x=1795063951; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QuxgXMedaSlq9j81wCA34TaV3I3Ea839vO9apCgYBLc=;
        b=mCckb7onRxj6xBF4hCr+N8ZoR6CbBEP6ZFsvlczK2YxPGckbftqlsAfzVGva3K+cXX
         3Sc6V39dpWXTuWj3IV3BLOyxabqk3HAGMeGQjeNYgkrgBiKvewrKRY6UUhXkHLDoyhQN
         iOwQVS85c8l57+XFQM6aP7HVRojqEGFqVz74vYYH8U5pOvMWsKU8A07smBCC2kJND0GL
         +FIB5cAuKUBEBlP83qIDxSmOZQxF37ApqW13N6wsNIoShVrdktAX5Y9gru9sBYZgkekQ
         w4ztgvUM9CQVolNxHO2MyrhOIPMdB9gLstUm3P0fvcANDWUMZNzZqUQNZSEJED2ZmzXA
         YpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794459151; x=1795063951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QuxgXMedaSlq9j81wCA34TaV3I3Ea839vO9apCgYBLc=;
        b=TQLcGtf9A6686cI92a2uFAWxF8/X2KvFA04PYtUlmYuOvoU935TIbLy4WGpwmvwcdy
         Doshv1me3aVpf2YQQemy+AE1f+P64vZLag29QJBVBadwZ677yMLNiJzL0m5kxJAeRCVg
         sZU6jGEjagG+gHv/AOd3qlfK3TWyDNFarLa3XDA0U1um5tNziwHrBkTVq4CR+iRmJnUU
         eVBgnF+SfTKngaRhW5/yptiNxYD5XX74HKmLdXNc/BEsfxLW4wOydW0T/mYbJ/hCEVs2
         +GzocizJh32T3ewjkDMVn6n64ASGnKWqIarKcOZegws6jAB4WxBemuthBgAUYliN1xfs
         5qHA==
X-Gm-Message-State: APuU4Z8WBnsI7v5CceJpO10X4NwTKrIDTc14vrEY1sHXWtG6esHee9vJ
	0CkpOmD/hoC6b99xYMvs39kOf3ztHMoGhe0YmvOnSbuUCYaJUPgCxEH8fJ62Lg==
X-Gm-Gg: AYBFou0XmCHUMzVcFfG5xPg0R1R7JWijHljwqh0ELfBVltUNhaRxAs7aaNSelvXfbSf
	r/i3SqBEkYwvheRQIrROITBic/YOmQowX2Zehb+oXTwVhLwI/KWXvsinPhe/sMPYKqGsd3bM29C
	i6jr/Pcx/GEC05VEykpUD7dYFyTvMkBKgCWC7oIJ949DjLulqhxKSpxfFNtEltNpt14VCO6CvBn
	Z1WK/F/NHBVFN8C4595tytKpho8KOKl3Ae2w6HE9wt2BrUtsyxbKuGAEIXY9v4WQmeQcqSfyhvp
	oynhEOJHK6CyKQw8xxTThZMSuNJRu12Qt1OuTLSnREcdesNIhTNuS0EHfjS7/4/5iG93vXJ1dDH
	NAXDLT8+6Yx2XJ1axpeXooQjVZKl/eUIlaMsx6wCVSjrWr4JrZlEjcXSvezcDVs+atsTZlSi621
	pHvKXrFf7o8oD61ldN7yNQbvxlCGQDfdOKQmQ8PQ/yBfnwc29SEx6WN0EWj/4F5YlGUJIvss3Op
	Bz+df9yecfNRh/lqjhyz081SvRuZL7RpJunrKkGO2Wo4lNONLVeBOmLZ5eu6ye/Cjwl0wyjAaPR
	2XtUADZAGNi19c940j3emwhzOv2GVT9QKaaM3FoknhlUsb/MUdyScw+1qXeYbkkSTMhj0JqNI+Q
	FxbT6XQR6h1V3nH2qisj5gQm8KxVvPu9tWAIiVJiZjIq3G09nIDYVbHDk+jbnpTHNFbiLgZ651j
	vYo9idctRExWXwAyO7M4nJClv1tk+D4v8g
X-Received: by 2002:a17:90b:1d0c:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3b182e6a2ecmr3850271a91.18.1794459151157;
        Wed, 11 Nov 2026 20:52:31 -0800 (PST)
From: Mahmoud Abumandour <ma.mandourr@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Mahmoud Abumandour <ma.mandourr@gmail.com>
Subject: [PATCH v3] x86/nestedhvm: process the MSR-load and MSR-store areas of L1's VMCS
Date: Wed, 11 Nov 2026 20:52:30 -0800
Message-Id: <20261112045230.1043334-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1794459153-24F1F2A1-FB4EA109/0/0
X-purgate-type: clean
X-purgate-size: 10764
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Nothing in vvmx.c reads the VM-entry MSR-load, VM-exit MSR-store or VM-exit
MSR-load area of L1's VMCS, so L2 runs with the listed MSRs as the previous
L2 or L1 left them, and L1 gets neither L2's values stored nor its own
loaded back. Process each area where the SDM does, with the SDM's checks,
an entry as a WRMSR or RDMSR at CPL 0 that L1 does not intercept. A bad
VM-entry entry fails the VM entry with exit reason 34 and leaves the VMCS
unlaunched, a bad VM-exit entry is a VMX abort, which crashes the domain,
and IA32_VMX_MISC now recommends the 512 entries an area may hold.

Fixes: 9390642b7fa5 ("Nested VMX: Switch shadow/virtual VMCS between n1/n2 guests.")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Mahmoud Abumandour <ma.mandourr@gmail.com>
---
Changes in v3:
- add signed-off-by line
Changes in v2:
- use paddr_t and unsigned int in msr_area_valid() (Jan)
- reword process_msr_area()'s comment (Jan)

Found by a fuzzer for VMX isolation.

A VMX abort crashes the domain as vvmx.c does elsewhere when nested VMX
cannot continue.

Alternatives: hvm_triple_fault(), which applies the domain's triple-fault
action (reboot by default), as KVM does, or hvm_vcpu_down() on the aborting
vCPU alone with the VMX-abort indicator written, which is closest to the
SDM but needs more code. Happy to switch to either.

 xen/arch/x86/hvm/vmx/vvmx.c             | 136 ++++++++++++++++++++----
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |   1 +
 2 files changed, 118 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 3309432873..dc5f4b7bfe 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -23,6 +23,8 @@
 static DEFINE_PER_CPU(u64 *, vvmcs_buf);
 
 static void nvmx_purge_vvmcs(struct vcpu *v);
+static int set_vvmcs_launched(struct list_head *launched_list,
+                              unsigned long vvmcs_mfn);
 
 static bool nvmx_vcpu_in_vmx(const struct vcpu *v)
 {
@@ -1212,11 +1214,68 @@ static void nvmx_clear_vmcs_pointer(struct vcpu *v, struct vmcs_struct *vvmcs)
     __vmwrite(VMWRITE_BITMAP, 0);
 }
 
-static void virtual_vmentry(struct cpu_user_regs *regs)
+/* The longest MSR list that IA32_VMX_MISC recommends to L1. */
+#define NVMX_MAX_MSRS 512
+
+/* A nonempty MSR area must be 16-byte aligned and within MAXPHYADDR. */
+static bool msr_area_valid(const struct vcpu *v, unsigned int addr_field,
+                           unsigned int count_field)
+{
+    paddr_t addr = get_vvmcs(v, addr_field);
+    unsigned int count = get_vvmcs(v, count_field);
+    unsigned int width = v->domain->arch.cpuid->extd.maxphysaddr;
+
+    return !count ||
+           (!(addr & 0xf) && !(addr >> width) &&
+            !((addr + count * sizeof(struct vmx_msr_entry) - 1) >> width));
+}
+
+/*
+ * Process an MSR load or store area of L1's VMCS, each entry as an
+ * unintercepted WRMSR or RDMSR.  Returns 0, or the 1-based index of the
+ * failing entry.
+ */
+static unsigned int process_msr_area(struct vcpu *v, unsigned int addr_field,
+                                     unsigned int count_field)
+{
+    paddr_t addr = get_vvmcs(v, addr_field);
+    unsigned int i, count = get_vvmcs(v, count_field);
+    struct vmx_msr_entry ent;
+
+    for ( i = 0; i < count; i++, addr += sizeof(ent) )
+    {
+        if ( i == NVMX_MAX_MSRS ||
+             hvm_copy_from_guest_phys(&ent, addr,
+                                      sizeof(ent)) != HVMTRANS_okay ||
+             ent.mbz ||
+             (ent.index >= MSR_X2APIC_FIRST && ent.index <= MSR_X2APIC_LAST) )
+            return i + 1;
+
+        if ( addr_field == VM_EXIT_MSR_STORE_ADDR )
+        {
+            if ( hvm_msr_read_intercept(ent.index, &ent.data) != X86EMUL_OKAY ||
+                 hvm_copy_to_guest_phys(addr + offsetof(struct vmx_msr_entry,
+                                                        data),
+                                        &ent.data, sizeof(ent.data),
+                                        v) != HVMTRANS_okay )
+                return i + 1;
+        }
+        else if ( ent.index == MSR_FS_BASE || ent.index == MSR_GS_BASE ||
+                  hvm_msr_write_intercept(ent.index, ent.data,
+                                          false) != X86EMUL_OKAY )
+            return i + 1;
+    }
+
+    return 0;
+}
+
+/* Returns 0, or the 1-based index of the failing MSR-load entry. */
+static unsigned int virtual_vmentry(struct cpu_user_regs *regs)
 {
     struct vcpu *v = current;
     struct nestedvcpu *nvcpu = &vcpu_nestedhvm(v);
     unsigned long lm_l1, lm_l2;
+    unsigned int msr_fail;
 
     vmx_vmcs_switch(v->arch.hvm.vmx.vmcs_pa, nvcpu->nv_n2vmcx_pa);
 
@@ -1277,6 +1336,15 @@ static void virtual_vmentry(struct cpu_user_regs *regs)
         }
     }
 
+    /* MSRs load last, and only a successful entry launches the VMCS. */
+    msr_fail = process_msr_area(v, VM_ENTRY_MSR_LOAD_ADDR,
+                                VM_ENTRY_MSR_LOAD_COUNT);
+    if ( !msr_fail &&
+         set_vvmcs_launched(&vcpu_2_nvmx(v).launched_list,
+                            PFN_DOWN(v->arch.hvm.vmx.vmcs_shadow_maddr)) < 0 )
+        domain_crash(v->domain);
+
+    return msr_fail;
 }
 
 static void sync_vvmcs_guest_state(struct vcpu *v, struct cpu_user_regs *regs)
@@ -1454,19 +1522,37 @@ static void nvmx_update_apicv(struct vcpu *v)
     }
 }
 
-static void virtual_vmexit(struct cpu_user_regs *regs)
+/*
+ * A VM exit, or with msr_fail a VM entry that failed loading MSRs, which
+ * records only the exit reason and qualification and saves nothing.
+ */
+static void virtual_vmexit(struct cpu_user_regs *regs, unsigned int msr_fail)
 {
     struct vcpu *v = current;
     struct nestedvcpu *nvcpu = &vcpu_nestedhvm(v);
-    unsigned long lm_l1, lm_l2;
+    unsigned long lm_l1, lm_l2, intr_info = 0;
 
-    sync_vvmcs_ro(v);
-    sync_vvmcs_guest_state(v, regs);
-    sync_exception_state(v);
+    if ( msr_fail )
+    {
+        intr_info = get_vvmcs(v, VM_ENTRY_INTR_INFO);
+        set_vvmcs(v, VM_EXIT_REASON,
+                  VMX_EXIT_REASONS_FAILED_VMENTRY | EXIT_REASON_MSR_LOADING);
+        set_vvmcs(v, EXIT_QUALIFICATION, msr_fail);
+    }
+    else
+    {
+        sync_vvmcs_ro(v);
+        sync_vvmcs_guest_state(v, regs);
+        sync_exception_state(v);
 
-    if ( nvmx_ept_enabled(v) && hvm_pae_enabled(v) &&
-         !hvm_long_mode_active(v) )
-        shadow_to_vvmcs_bulk(v, ARRAY_SIZE(gpdpte_fields), gpdpte_fields);
+        if ( nvmx_ept_enabled(v) && hvm_pae_enabled(v) &&
+             !hvm_long_mode_active(v) )
+            shadow_to_vvmcs_bulk(v, ARRAY_SIZE(gpdpte_fields), gpdpte_fields);
+
+        if ( process_msr_area(v, VM_EXIT_MSR_STORE_ADDR,
+                              VM_EXIT_MSR_STORE_COUNT) )
+            domain_crash(v->domain, "%pv VMX abort: storing MSRs failed\n", v);
+    }
 
     /* This will clear current pCPU bit in p2m->dirty_cpumask */
     np2m_schedule(NP2M_SCHEDLE_OUT);
@@ -1490,6 +1576,9 @@ static void virtual_vmexit(struct cpu_user_regs *regs)
     vmx_update_exception_bitmap(v);
 
     load_vvmcs_host_state(v);
+    /* A failed VM entry keeps its interruption information. */
+    if ( msr_fail )
+        set_vvmcs(v, VM_ENTRY_INTR_INFO, intr_info);
 
     if ( lm_l1 != lm_l2 )
         paging_update_paging_modes(v);
@@ -1499,6 +1588,9 @@ static void virtual_vmexit(struct cpu_user_regs *regs)
     /* VM exit clears all bits except bit 1 */
     regs->rflags = X86_EFLAGS_MBS;
 
+    if ( process_msr_area(v, VM_EXIT_MSR_LOAD_ADDR, VM_EXIT_MSR_LOAD_COUNT) )
+        domain_crash(v->domain, "%pv VMX abort: loading MSRs failed\n", v);
+
     if ( cpu_has_vmx_virtual_intr_delivery )
         nvmx_update_apicv(v);
 
@@ -1553,9 +1645,14 @@ void asmlinkage nvmx_switch_guest(void)
         return;
 
     if ( nestedhvm_vcpu_in_guestmode(v) && nvcpu->nv_vmexit_pending )
-        virtual_vmexit(regs);
+        virtual_vmexit(regs, 0);
     else if ( !nestedhvm_vcpu_in_guestmode(v) && nvcpu->nv_vmentry_pending )
-        virtual_vmentry(regs);
+    {
+        unsigned int msr_fail = virtual_vmentry(regs);
+
+        if ( msr_fail )
+            virtual_vmexit(regs, msr_fail);
+    }
 }
 
 /*
@@ -1704,6 +1801,11 @@ static enum vmx_insn_errno nvmx_vmresume(struct vcpu *v)
             goto invalid_control_state;
     }
 
+    if ( !msr_area_valid(v, VM_EXIT_MSR_STORE_ADDR, VM_EXIT_MSR_STORE_COUNT) ||
+         !msr_area_valid(v, VM_EXIT_MSR_LOAD_ADDR, VM_EXIT_MSR_LOAD_COUNT) ||
+         !msr_area_valid(v, VM_ENTRY_MSR_LOAD_ADDR, VM_ENTRY_MSR_LOAD_COUNT) )
+        goto invalid_control_state;
+
     nvcpu->nv_vmentry_pending = 1;
 
     return VMX_INSN_SUCCEED;
@@ -1777,15 +1879,10 @@ static int nvmx_handle_vmlaunch(struct cpu_user_regs *regs)
         return X86EMUL_OKAY;
     }
     else {
+        /* virtual_vmentry() launches the VMCS. */
         rc = nvmx_vmresume(v);
         if ( rc )
             vmfail_valid(regs, rc);
-        else
-        {
-            if ( set_vvmcs_launched(&nvmx->launched_list,
-                                    PFN_DOWN(v->arch.hvm.vmx.vmcs_shadow_maddr)) < 0 )
-                return X86EMUL_UNHANDLEABLE;
-        }
         rc = X86EMUL_OKAY;
     }
     return rc;
@@ -2354,8 +2451,9 @@ int nvmx_msr_read_intercept(unsigned int msr, u64 *msr_content)
         data = hvm_cr4_guest_valid_bits(d);
         break;
     case MSR_IA32_VMX_MISC:
-        /* Do not support CR3-targets or activity states. */
-        data = host_data & ~(VMX_MISC_CR3_TARGET | VMX_MISC_ACTIVITY_MASK);
+        /* No CR3-targets or activity states; MSR lists of NVMX_MAX_MSRS. */
+        data = host_data & ~(VMX_MISC_CR3_TARGET | VMX_MISC_ACTIVITY_MASK |
+                             VMX_MISC_MAX_MSRS);
         break;
     case MSR_IA32_VMX_EPT_VPID_CAP:
         data = nept_get_ept_vpid_cap();
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index d0716e97d2..24b502382f 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -304,6 +304,7 @@ void vmx_vmcs_reload(struct vcpu *v);
 #define VMX_MISC_ACTIVITY_MASK                  0x000001c0
 #define VMX_MISC_PROC_TRACE                     0x00004000
 #define VMX_MISC_CR3_TARGET                     0x01ff0000
+#define VMX_MISC_MAX_MSRS                       0x0e000000
 #define VMX_MISC_VMWRITE_ALL                    0x20000000
 
 #define VMX_TSC_MULTIPLIER_MAX                  0xffffffffffffffffULL
-- 
2.25.1


