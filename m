Return-Path: <SRS0=Yd2Y=E2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E38C5519F
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 11:47:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F18D2222A
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 11:47:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="ol/HAPpN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F18D2222A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.31994.62893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg4sN-0004SS-Pr; Fri, 20 Nov 2020 11:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31994.62893; Fri, 20 Nov 2020 11:46:51 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg4sN-0004SH-Jd; Fri, 20 Nov 2020 11:46:51 +0000
Received: by outflank-mailman (input) for mailman id 31994;
 Fri, 20 Nov 2020 11:46:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wRTa=E2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kg4sM-00048T-5p
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 11:46:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09a2fe4f-3661-4538-83c4-66e0625e790d;
 Fri, 20 Nov 2020 11:46:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 49798ADA2;
 Fri, 20 Nov 2020 11:46:36 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=wRTa=E2=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kg4sM-00048T-5p
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 11:46:50 +0000
X-Inumbo-ID: 09a2fe4f-3661-4538-83c4-66e0625e790d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 09a2fe4f-3661-4538-83c4-66e0625e790d;
	Fri, 20 Nov 2020 11:46:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605872796; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pHPg6q6EuLm17Am105F0Q74YhZolcr+6t2Iv0ftBmuw=;
	b=ol/HAPpN2w1ftXNp3JzIliV1uKPPjEG5o5Tget6fb0qMwf9eSSvGE1l81h55rnC8ofF+pQ
	i/J3VRYu5fIxCAuNEelPwuOiv0rlmNfYdXbBDhB3BKhRJRLX1D1Nggw8FFys7f4MOE77Fj
	ka0e6jpAG7XmZPURJQ25hVohFPsiwqA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 49798ADA2;
	Fri, 20 Nov 2020 11:46:36 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: peterz@infradead.org,
	luto@kernel.org,
	Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 07/12] x86: add new features for paravirt patching
Date: Fri, 20 Nov 2020 12:46:25 +0100
Message-Id: <20201120114630.13552-8-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120114630.13552-1-jgross@suse.com>
References: <20201120114630.13552-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For being able to switch paravirt patching from special cased custom
code sequences to ALTERNATIVE handling some X86_FEATURE_* are needed
as new features. This enables to have the standard indirect pv call
as the default code and to patch that with the non-Xen custom code
sequence via ALTERNATIVE patching later.

Make sure paravirt patching is performed before alternative patching.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/cpufeatures.h |  3 +++
 arch/x86/kernel/alternative.c      | 28 ++++++++++++++++++++++++++--
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index dad350d42ecf..ffa23c655412 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -237,6 +237,9 @@
 #define X86_FEATURE_VMCALL		( 8*32+18) /* "" Hypervisor supports the VMCALL instruction */
 #define X86_FEATURE_VMW_VMMCALL		( 8*32+19) /* "" VMware prefers VMMCALL hypercall instruction */
 #define X86_FEATURE_SEV_ES		( 8*32+20) /* AMD Secure Encrypted Virtualization - Encrypted State */
+#define X86_FEATURE_NOT_XENPV		( 8*32+21) /* "" Inverse of X86_FEATURE_XENPV */
+#define X86_FEATURE_NO_PVUNLOCK		( 8*32+22) /* "" No PV unlock function */
+#define X86_FEATURE_NO_VCPUPREEMPT	( 8*32+23) /* "" No PV vcpu_is_preempted function */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:0 (EBX), word 9 */
 #define X86_FEATURE_FSGSBASE		( 9*32+ 0) /* RDFSBASE, WRFSBASE, RDGSBASE, WRGSBASE instructions*/
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 2400ad62f330..f8f9700719cf 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -593,6 +593,18 @@ int alternatives_text_reserved(void *start, void *end)
 #endif /* CONFIG_SMP */
 
 #ifdef CONFIG_PARAVIRT
+static void __init paravirt_set_cap(void)
+{
+	if (!boot_cpu_has(X86_FEATURE_XENPV))
+		setup_force_cpu_cap(X86_FEATURE_NOT_XENPV);
+
+	if (pv_is_native_spin_unlock())
+		setup_force_cpu_cap(X86_FEATURE_NO_PVUNLOCK);
+
+	if (pv_is_native_vcpu_is_preempted())
+		setup_force_cpu_cap(X86_FEATURE_NO_VCPUPREEMPT);
+}
+
 void __init_or_module apply_paravirt(struct paravirt_patch_site *start,
 				     struct paravirt_patch_site *end)
 {
@@ -616,6 +628,8 @@ void __init_or_module apply_paravirt(struct paravirt_patch_site *start,
 }
 extern struct paravirt_patch_site __start_parainstructions[],
 	__stop_parainstructions[];
+#else
+static void __init paravirt_set_cap(void) { }
 #endif	/* CONFIG_PARAVIRT */
 
 /*
@@ -723,6 +737,18 @@ void __init alternative_instructions(void)
 	 * patching.
 	 */
 
+	paravirt_set_cap();
+
+	/*
+	 * First patch paravirt functions, such that we overwrite the indirect
+	 * call with the direct call.
+	 */
+	apply_paravirt(__parainstructions, __parainstructions_end);
+
+	/*
+	 * Then patch alternatives, such that those paravirt calls that are in
+	 * alternatives can be overwritten by their immediate fragments.
+	 */
 	apply_alternatives(__alt_instructions, __alt_instructions_end);
 
 #ifdef CONFIG_SMP
@@ -741,8 +767,6 @@ void __init alternative_instructions(void)
 	}
 #endif
 
-	apply_paravirt(__parainstructions, __parainstructions_end);
-
 	restart_nmi();
 	alternatives_patched = 1;
 }
-- 
2.26.2


