Return-Path: <SRS0=J8L2=HY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6393EC433DB
	for <xen-devel@archiver.kernel.org>; Mon, 22 Feb 2021 10:57:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F221264E32
	for <xen-devel@archiver.kernel.org>; Mon, 22 Feb 2021 10:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F221264E32
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.87930.165185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE8u3-0004HM-Ai; Mon, 22 Feb 2021 10:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87930.165185; Mon, 22 Feb 2021 10:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE8u3-0004HF-7p; Mon, 22 Feb 2021 10:57:23 +0000
Received: by outflank-mailman (input) for mailman id 87930;
 Mon, 22 Feb 2021 10:57:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bXc=HY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lE8u1-0004GV-Uy
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 10:57:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a651254-2653-4f72-b939-40e592837b4c;
 Mon, 22 Feb 2021 10:57:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AEEADAF21;
 Mon, 22 Feb 2021 10:57:19 +0000 (UTC)
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
X-Inumbo-ID: 8a651254-2653-4f72-b939-40e592837b4c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613991439; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qwwk9cXc8T/+fcdIQ8thR6iikFAxZizICApHFhBhDOw=;
	b=Aa8Rn3JV3/A++QN/tQ0BfOq7HlP0wKM43rw/+19LnVLknS9984ew0c13s+XKbMpmkPU+Gc
	lRIxWegqDVd8xxURcpwSCAY5vyrHMqAq2QbhC54iSPnyi4OKWlNLnHMxVbMzLlhLeQyDSH
	F6DRACguw8IiYKB7peSMPkuvicZUF1w=
Subject: [PATCH v3 2/2] VMX: use a single, global APIC access page
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, George Dunlap <george.dunlap@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
Message-ID: <774a0bf2-d2a4-7dba-bf15-fec8b0ec8c5f@suse.com>
Date: Mon, 22 Feb 2021 11:57:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The address of this page is used by the CPU only to recognize when to
access the virtual APIC page instead. No accesses would ever go to this
page. It only needs to be present in the (CPU) page tables so that
address translation will produce its address as result for respective
accesses.

By making this page global, we also eliminate the need to refcount it,
or to assign it to any domain in the first place.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Split p2m insertion change to a separate patch.
v2: Avoid insertion when !has_vlapic(). Split off change to
    p2m_get_iommu_flags().
---
I did further consider not allocating any real page at all, but just
using the address of some unpopulated space (which would require
announcing this page as reserved to Dom0, so it wouldn't put any PCI
MMIO BARs there). But I thought this would be too controversial, because
of the possible risks associated with this.

--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -66,8 +66,7 @@ boolean_param("force-ept", opt_force_ept
 static void vmx_ctxt_switch_from(struct vcpu *v);
 static void vmx_ctxt_switch_to(struct vcpu *v);
 
-static int  vmx_alloc_vlapic_mapping(struct domain *d);
-static void vmx_free_vlapic_mapping(struct domain *d);
+static int alloc_vlapic_mapping(void);
 static void vmx_install_vlapic_mapping(struct vcpu *v);
 static void vmx_update_guest_cr(struct vcpu *v, unsigned int cr,
                                 unsigned int flags);
@@ -78,6 +77,8 @@ static int vmx_msr_read_intercept(unsign
 static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content);
 static void vmx_invlpg(struct vcpu *v, unsigned long linear);
 
+static mfn_t __read_mostly apic_access_mfn;
+
 /* Values for domain's ->arch.hvm_domain.pi_ops.flags. */
 #define PI_CSW_FROM (1u << 0)
 #define PI_CSW_TO   (1u << 1)
@@ -401,7 +402,6 @@ static int vmx_domain_initialise(struct
         .to   = vmx_ctxt_switch_to,
         .tail = vmx_do_resume,
     };
-    int rc;
 
     d->arch.ctxt_switch = &csw;
 
@@ -411,28 +411,14 @@ static int vmx_domain_initialise(struct
      */
     d->arch.hvm.vmx.exec_sp = is_hardware_domain(d) || opt_ept_exec_sp;
 
-    if ( !has_vlapic(d) )
-        return 0;
-
-    if ( (rc = vmx_alloc_vlapic_mapping(d)) != 0 )
-        return rc;
-
     return 0;
 }
 
-static void vmx_domain_relinquish_resources(struct domain *d)
-{
-    if ( !has_vlapic(d) )
-        return;
-
-    vmx_free_vlapic_mapping(d);
-}
-
 static void domain_creation_finished(struct domain *d)
 {
-    if ( has_vlapic(d) && !mfn_eq(d->arch.hvm.vmx.apic_access_mfn, _mfn(0)) &&
+    if ( has_vlapic(d) && !mfn_eq(apic_access_mfn, _mfn(0)) &&
          set_mmio_p2m_entry(d, gaddr_to_gfn(APIC_DEFAULT_PHYS_BASE),
-                            d->arch.hvm.vmx.apic_access_mfn, PAGE_ORDER_4K) )
+                            apic_access_mfn, PAGE_ORDER_4K) )
         domain_crash(d);
 }
 
@@ -2415,7 +2401,6 @@ static struct hvm_function_table __initd
     .cpu_up_prepare       = vmx_cpu_up_prepare,
     .cpu_dead             = vmx_cpu_dead,
     .domain_initialise    = vmx_domain_initialise,
-    .domain_relinquish_resources = vmx_domain_relinquish_resources,
     .domain_creation_finished = domain_creation_finished,
     .vcpu_initialise      = vmx_vcpu_initialise,
     .vcpu_destroy         = vmx_vcpu_destroy,
@@ -2662,7 +2647,7 @@ const struct hvm_function_table * __init
 {
     set_in_cr4(X86_CR4_VMXE);
 
-    if ( vmx_vmcs_init() )
+    if ( vmx_vmcs_init() || alloc_vlapic_mapping() )
     {
         printk("VMX: failed to initialise.\n");
         return NULL;
@@ -3217,7 +3202,7 @@ gp_fault:
     return X86EMUL_EXCEPTION;
 }
 
-static int vmx_alloc_vlapic_mapping(struct domain *d)
+static int __init alloc_vlapic_mapping(void)
 {
     struct page_info *pg;
     mfn_t mfn;
@@ -3225,52 +3210,28 @@ static int vmx_alloc_vlapic_mapping(stru
     if ( !cpu_has_vmx_virtualize_apic_accesses )
         return 0;
 
-    pg = alloc_domheap_page(d, MEMF_no_refcount);
+    pg = alloc_domheap_page(NULL, 0);
     if ( !pg )
         return -ENOMEM;
 
-    if ( !get_page_and_type(pg, d, PGT_writable_page) )
-    {
-        /*
-         * The domain can't possibly know about this page yet, so failure
-         * here is a clear indication of something fishy going on.
-         */
-        domain_crash(d);
-        return -ENODATA;
-    }
-
     mfn = page_to_mfn(pg);
     clear_domain_page(mfn);
-    d->arch.hvm.vmx.apic_access_mfn = mfn;
+    apic_access_mfn = mfn;
 
     return 0;
 }
 
-static void vmx_free_vlapic_mapping(struct domain *d)
-{
-    mfn_t mfn = d->arch.hvm.vmx.apic_access_mfn;
-
-    d->arch.hvm.vmx.apic_access_mfn = _mfn(0);
-    if ( !mfn_eq(mfn, _mfn(0)) )
-    {
-        struct page_info *pg = mfn_to_page(mfn);
-
-        put_page_alloc_ref(pg);
-        put_page_and_type(pg);
-    }
-}
-
 static void vmx_install_vlapic_mapping(struct vcpu *v)
 {
     paddr_t virt_page_ma, apic_page_ma;
 
-    if ( mfn_eq(v->domain->arch.hvm.vmx.apic_access_mfn, _mfn(0)) )
+    if ( !has_vlapic(v->domain) || mfn_eq(apic_access_mfn, _mfn(0)) )
         return;
 
     ASSERT(cpu_has_vmx_virtualize_apic_accesses);
 
     virt_page_ma = page_to_maddr(vcpu_vlapic(v)->regs_page);
-    apic_page_ma = mfn_to_maddr(v->domain->arch.hvm.vmx.apic_access_mfn);
+    apic_page_ma = mfn_to_maddr(apic_access_mfn);
 
     vmx_vmcs_enter(v);
     __vmwrite(VIRTUAL_APIC_PAGE_ADDR, virt_page_ma);
--- a/xen/include/asm-x86/hvm/vmx/vmcs.h
+++ b/xen/include/asm-x86/hvm/vmx/vmcs.h
@@ -58,7 +58,6 @@ struct ept_data {
 #define _VMX_DOMAIN_PML_ENABLED    0
 #define VMX_DOMAIN_PML_ENABLED     (1ul << _VMX_DOMAIN_PML_ENABLED)
 struct vmx_domain {
-    mfn_t apic_access_mfn;
     /* VMX_DOMAIN_* */
     unsigned int status;
 


