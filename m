Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724D2606A337
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 04:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pNr960ls
Received: from list by lists.xenproject.org with outflank-mailman.1485090.1688395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRMih-0004Co-5B; Thu, 12 Nov 2026 04:47:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485090.1688395; Thu, 12 Nov 2026 04:47:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRMih-0004Cf-10; Thu, 12 Nov 2026 04:47:31 +0000
Received: by outflank-mailman (input) for mailman id 1485090;
 Thu, 12 Nov 2026 04:47:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ma.mandourr@gmail.com>) id 1xRMif-0004CZ-UG
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 04:47:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRMie-00Cb1g-Sz
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 05:47:28 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ma.mandourr@gmail.com>)
 id 6af544d8-e002-0a2a0a5209dd-0a2a4507e70a-12
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 05:47:28 +0100
Received: from [209.85.215.179] (helo=mail-pg1-f179.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ma.mandourr@gmail.com>)
 id 6af544de-b4ea-0a2a45070019-d155d7b3d822-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 05:47:28 +0100
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-cd62c570b5dso2355673a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:47:27 -0800 (PST)
Received: from cs-arch-srv04.cmpt.sfu.ca (cs-arch-srv04.cmpt.sfu.ca.
 [142.58.10.48]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cdd8d79d406sm2187387a12.17.2026.11.11.20.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 20:47:25 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794458846; x=1795063646; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2+dJk09S+6bQtbHtJHd1AoWeYtEP5tfHh8DUksgsO7k=;
        b=pNr960ls40CoYzvJw8ro9bbRfEYhGz9yeIwWMAnRnYMMEE9shLic2WVKh8Wl38aZ+z
         AC2UXnYs3UmTNd2fr8jvOVAMpI7A79/3Opxth/qJ8ujE59AS4E813qhAM5/UFBN5pwBJ
         F3UaftDc6n2hOv3pqhODpJ07YSp9uaPZIJwcLVGq8mGSHYuw+f4HZItL2ORYztdikkCr
         2cH25VrVyfkmJJPedmvYTqMV8Xto+0cbCIIQVr2RxyPIyKiDa5+tBEH9W/Dkld+L9IQd
         1aupQhzbWxUnlPX956hhwsAax1jcqq+trcERZ84R2F9L8Z9GnBb/Bs81PCC9O589gSZR
         yVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458846; x=1795063646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2+dJk09S+6bQtbHtJHd1AoWeYtEP5tfHh8DUksgsO7k=;
        b=EmVOcoV8ZmaQhiMDbxkYsS38bfOUcPWJkV76Cwjcg9s0n5lwT3M4WaU+gyyQfMmXmI
         RoIsd0aSRQZY39n/+eJrzVteVr/c8EcmnVWDWgpeT0VwbjA83r3KGzbmAZRM46rB3/eE
         8f44J7wp9XW3Cq0AAYyi0Evcb9lZzo0Xi7KqV+XooRRC6LamIl7qcPsb22mZJw+wbBHI
         GtIMRhOe4mHwrnunerzZEWAkficiymhFTbi5Q3YFvbKo4r55LWt9hd2ICfvPz66QsT/P
         YYZ08UrY/93Rdo4JQLqYak9c+YYzJP06/whFzNUIzRONcGd35BCqHjfzL4p/VARsLJuu
         NBGQ==
X-Gm-Message-State: APuU4Z8qF91zisVPGZAFl9NbJhHKwKguwKoYUfQOSczI7rCil6az5/FZ
	+0BoXkqcBcY70ppw1DCjABAoWO7Dh/s6qFFsg4n5YcTu7doXys7e+hJpUrpAeQ==
X-Gm-Gg: AYBFou0xZrj44ZvoxxEyNikSrVKKE6z+B6SiskqzYJdAW4TWlJP/vqDp5WEK6DeQRx1
	EYG/8Ftm/ZVTk05d4hjvRgWphBVmU8fakkNMFX+DZPAf6X7+fL1RuTkg3bDwgdZe85VZjgq4tTN
	qFKfv63MKAR22jdMwRVyyMHeikS+tZS1/6JhB1bdEZa4ErV8ohg3eikat24NPpAGy54i9aKfG+f
	EdY8JEIEsuEFCOWKH0xvMlV8ho95UBziuCTsvfZ/XnSXR/bTgt09URrj9xKl65dk2y+NuvD6jrz
	j4HsUfBuS66ZqlWkjirhYI9vLEItcBWGQf122gbDLJRBxs++DW2Uu741Y/Oe41vCiSfAqF2TxJj
	1xvHVyCX9UMrf2dOS6afFex7ENFcvsbWTETo0xrK3kyvdh5Lk0jB5Yvs/2QE/NU3H2HCuBxi/hG
	kq2SqQflXmxEs4Q8qMRgyGDOy4ALQrs8rZUSCSpxwvKJcoJtF9eTe0KOQuAmpF/La9CEZ6locf2
	PCkQDkHgXrexg1wsCRgPrKlM7aM8OMz078BqX/oCtON9jEnHi3pQ1MR0dXajhnuioXg2gHh1Pjw
	KjBYzTrmtRH9M07u1ZYc9xULZXYlkUywCDUNluGDfclAcl862+8mFWN7aQn9M8WIi7a8xCNaJ64
	3vqXsG2fpb4odXC3SfXXMyxcNkxAcS0mfCJz3BAibWMkz/ZtV070XLt8OPlw2k26oEyQXNVH0Hb
	7Cowez7ntWCAjq0cUXvcGE00veH42sFEYR
X-Received: by 2002:a05:6372:a709:b0:3f1:fdd4:572b with SMTP id adf61e73a8af0-3f2fda991f5mr4616390637.36.1794458846002;
        Wed, 11 Nov 2026 20:47:26 -0800 (PST)
From: Mahmoud Abumandour <ma.mandourr@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Mahmoud Abumandour <ma.mandourr@gmail.com>
Subject: [PATCH v2] x86/nestedhvm: process the MSR-load and MSR-store areas of L1's VMCS
Date: Wed, 11 Nov 2026 20:47:24 -0800
Message-Id: <20261112044724.1039961-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1794458848-36CDFAE4-8452A79A/0/0
X-purgate-type: clean
X-purgate-size: 10663
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
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
---
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


