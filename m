Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4205C88E4C
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 08:43:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415990.1645169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4wqI-00087v-NX; Fri, 11 Sep 2026 08:42:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415990.1645169; Fri, 11 Sep 2026 08:42:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4wqI-00087k-J7; Fri, 11 Sep 2026 08:42:42 +0000
Received: by outflank-mailman (input) for mailman id 1415990;
 Fri, 11 Sep 2026 08:42:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x4wqH-0007uc-1d
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 08:42:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4wqG-008YGa-Ed
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 10:42:40 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6aa3bef9-8faa-0a2a0a5109dd-0a2a4504d09c-32
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 10:42:40 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6aa3bf00-b57f-0a2a45040019-c387df82d1e8-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 10:42:40 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 95C7421B8B;
 Fri, 11 Sep 2026 08:42:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E9BF5132D3;
 Fri, 11 Sep 2026 08:42:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sSe+N/a+o2rmFAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 11 Sep 2026 08:42:30 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789116155; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I9RPtXPkTH2l0Ce0h0ao/G3WKgQIi0rqtLxtBRCg9co=;
	b=rdSjRkCzOk4/4RzKflhPuzujpGtPl6d1z9BKM0n4C0aHaOt87Zlt0Ugdo34JCc16R1qzWK
	6amzm7zZPLsnQDCNJUW3hShbWLmOruSWh/JeOlNlBVz+n9Z8xgsJa6Ujc2DdAFOjrQsn6+
	sjq/iiMO24gqMmhUEzvMtfF4Ank529g=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789116151; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I9RPtXPkTH2l0Ce0h0ao/G3WKgQIi0rqtLxtBRCg9co=;
	b=KY/8X1EzbOsW7wb7+YFo5Q0K65gPFDoNRB04IkuLEe190SKIzPrNbNIQ78T3CntjxOf1ml
	6V+BnJ5VLsCDVXgNDFEk2ExYUrsZd17BB9YZ4y3xbfbyDv+tN6QHZzbKXDB72ua7mHhNop
	QZPO2JRX3/uHmGE5ngZ7gbc18zGk/sw=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v5 03/17] x86/msr: Minimize usage of native_*() msr access functions
Date: Fri, 11 Sep 2026 10:41:57 +0200
Message-ID: <20260911084211.3149957-4-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911084211.3149957-1-jgross@suse.com>
References: <20260911084211.3149957-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLfdszjqhz8kzzb9uwpzdm8png)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-purgate-ID: tlsNG-ebf023/1789116160-C0CDFB50-310ACB67/0/0
X-purgate-type: clean
X-purgate-size: 5326

In order to prepare for some MSR access function reorg work, switch
most users of native_{read|write}_msr[_safe]() to the more generic
rdmsr*()/wrmsr*() variants.

For now this will have some intermediate performance impact with
paravirtualization configured when running on bare metal, but this
is a prereq change for the planned direct inlining of the rdmsr/wrmsr
instructions with this configuration.

The main reason for this switch is the planned move of the MSR trace
function invocation from the native_*() functions to the generic
rdmsr*()/wrmsr*() variants. Without this switch the users of the
native_*() functions would lose the related tracing entries.

Note that the Xen related MSR access functions will not be switched,
as these will be handled after the move of the trace hooks.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Sean Christopherson <seanjc@google.com>
Acked-by: Wei Liu <wei.liu@kernel.org>
Reviewed-by: H. Peter Anvin (Intel) <hpa@zytor.com>
---
 arch/x86/hyperv/ivm.c          |  2 +-
 arch/x86/kernel/cpu/mshyperv.c |  4 ++--
 arch/x86/kernel/kvmclock.c     |  2 +-
 arch/x86/kvm/svm/svm.c         | 16 ++++++++--------
 arch/x86/xen/pmu.c             |  4 ++--
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/x86/hyperv/ivm.c b/arch/x86/hyperv/ivm.c
index 2ce4dfe53472..a74f121f2a02 100644
--- a/arch/x86/hyperv/ivm.c
+++ b/arch/x86/hyperv/ivm.c
@@ -328,7 +328,7 @@ int hv_snp_boot_ap(u32 apic_id, unsigned long start_ip, unsigned int cpu)
 	savesegment(ds, vmsa->ds.selector);
 	hv_populate_vmcb_seg(vmsa->ds, vmsa->gdtr.base);
 
-	vmsa->efer = native_read_msr(MSR_EFER);
+	vmsa->efer = rdmsrq(MSR_EFER);
 
 	vmsa->cr4 = native_read_cr4();
 	vmsa->cr3 = __native_read_cr3();
diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index e1388ed27384..53ac4ef53929 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -114,7 +114,7 @@ u64 hv_para_get_synic_register(unsigned int reg)
 {
 	if (WARN_ON(!ms_hyperv.paravisor_present || !hv_is_synic_msr(reg)))
 		return ~0ULL;
-	return native_read_msr(reg);
+	return rdmsrq(reg);
 }
 
 /*
@@ -124,7 +124,7 @@ void hv_para_set_synic_register(unsigned int reg, u64 val)
 {
 	if (WARN_ON(!ms_hyperv.paravisor_present || !hv_is_synic_msr(reg)))
 		return;
-	native_write_msr(reg, val);
+	wrmsrq(reg, val);
 }
 
 u64 hv_get_msr(unsigned int reg)
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index cb3d0ca1fa22..6ddef8b5426a 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -219,7 +219,7 @@ static void kvm_setup_secondary_clock(void)
 void kvmclock_disable(void)
 {
 	if (msr_kvm_system_time)
-		native_write_msr(msr_kvm_system_time, 0);
+		wrmsrq(msr_kvm_system_time, 0);
 }
 
 static void __init kvmclock_init_mem(void)
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 91f5a5344529..5e5bbecb8020 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -412,12 +412,12 @@ static void svm_init_erratum_383(void)
 		return;
 
 	/* Use _safe variants to not break nested virtualization */
-	if (native_read_msr_safe(MSR_AMD64_DC_CFG, &val))
+	if (rdmsrq_safe(MSR_AMD64_DC_CFG, &val))
 		return;
 
 	val |= (1ULL << 47);
 
-	native_write_msr_safe(MSR_AMD64_DC_CFG, val);
+	wrmsrq_safe(MSR_AMD64_DC_CFG, val);
 
 	erratum_383_found = true;
 }
@@ -470,8 +470,8 @@ static void svm_init_os_visible_workarounds(void)
 		return;
 
 	if (!this_cpu_has(X86_FEATURE_OSVW) ||
-	    native_read_msr_safe(MSR_AMD64_OSVW_ID_LENGTH, &len) ||
-	    native_read_msr_safe(MSR_AMD64_OSVW_STATUS, &status))
+	    rdmsrq_safe(MSR_AMD64_OSVW_ID_LENGTH, &len) ||
+	    rdmsrq_safe(MSR_AMD64_OSVW_STATUS, &status))
 		len = status = 0;
 
 	if (status == READ_ONCE(osvw_status) && len >= READ_ONCE(osvw_len))
@@ -2112,7 +2112,7 @@ static bool is_erratum_383(void)
 	if (!erratum_383_found)
 		return false;
 
-	if (native_read_msr_safe(MSR_IA32_MC0_STATUS, &value))
+	if (rdmsrq_safe(MSR_IA32_MC0_STATUS, &value))
 		return false;
 
 	/* Bit 62 may or may not be set for this mce */
@@ -2123,11 +2123,11 @@ static bool is_erratum_383(void)
 
 	/* Clear MCi_STATUS registers */
 	for (i = 0; i < 6; ++i)
-		native_write_msr_safe(MSR_IA32_MCx_STATUS(i), 0);
+		wrmsrq_safe(MSR_IA32_MCx_STATUS(i), 0);
 
-	if (!native_read_msr_safe(MSR_IA32_MCG_STATUS, &value)) {
+	if (!rdmsrq_safe(MSR_IA32_MCG_STATUS, &value)) {
 		value &= ~(1ULL << 2);
-		native_write_msr_safe(MSR_IA32_MCG_STATUS, value);
+		wrmsrq_safe(MSR_IA32_MCG_STATUS, value);
 	}
 
 	/* Flush tlb to evict multi-match entries */
diff --git a/arch/x86/xen/pmu.c b/arch/x86/xen/pmu.c
index 5f50a3ee08f5..37512df8b8f2 100644
--- a/arch/x86/xen/pmu.c
+++ b/arch/x86/xen/pmu.c
@@ -324,7 +324,7 @@ static u64 xen_amd_read_pmc(int counter)
 		u64 val;
 
 		msr = amd_counters_base + (counter * amd_msr_step);
-		native_read_msr_safe(msr, &val);
+		rdmsrq_safe(msr, &val);
 		return val;
 	}
 
@@ -350,7 +350,7 @@ static u64 xen_intel_read_pmc(int counter)
 		else
 			msr = MSR_IA32_PERFCTR0 + counter;
 
-		native_read_msr_safe(msr, &val);
+		rdmsrq_safe(msr, &val);
 		return val;
 	}
 
-- 
2.55.0


