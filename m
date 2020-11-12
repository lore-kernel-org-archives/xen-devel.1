Return-Path: <SRS0=Jwwc=ES=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D40C56202
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2020 13:14:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F99822201
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2020 13:14:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="JDE5qnZR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F99822201
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.25844.53870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdCQo-0005zt-Ub; Thu, 12 Nov 2020 13:14:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25844.53870; Thu, 12 Nov 2020 13:14:30 +0000
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
	id 1kdCQo-0005zm-Pt; Thu, 12 Nov 2020 13:14:30 +0000
Received: by outflank-mailman (input) for mailman id 25844;
 Thu, 12 Nov 2020 13:14:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bXVH=ES=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kdCQm-0005zd-Rb
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 13:14:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a20110c-d835-4432-bc95-9ad6e4a819ca;
 Thu, 12 Nov 2020 13:14:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0639EAD31;
 Thu, 12 Nov 2020 13:14:27 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bXVH=ES=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kdCQm-0005zd-Rb
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 13:14:28 +0000
X-Inumbo-ID: 4a20110c-d835-4432-bc95-9ad6e4a819ca
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4a20110c-d835-4432-bc95-9ad6e4a819ca;
	Thu, 12 Nov 2020 13:14:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605186867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fMXlwXyF+4tXesHMIFZzu/eTSNLM+Yoxq+N7JqzPdL0=;
	b=JDE5qnZR4u+Zq1WJB6ZqJyBKZJFybw6R6w8kazehxa0oN32V0eBsZPGb/WEeyFqkeVMZuM
	Bm63Y9xjhWJpJ/YsMXTckP/rKNzlySF4lrbHvUE1jGM/FBvcgJZOHdMhlaoueHAJA7GQ11
	kjb3KXmNwwdUxAb92B06K8zAeJjrIT4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0639EAD31;
	Thu, 12 Nov 2020 13:14:27 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 2/3] xen/oprofile: use NMI continuation for sending virq to guest
Date: Thu, 12 Nov 2020 14:14:23 +0100
Message-Id: <20201112131424.9930-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201112131424.9930-1-jgross@suse.com>
References: <20201112131424.9930-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of calling send_guest_vcpu_virq() from NMI context use the
NMI continuation framework for that purpose. This avoids taking locks
in NMI mode.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V5:
- use Linux coding style (Jan Beulich)
- assume races could happen (Jan Beulich)

V4:
- rework to less generic approach

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/x86/oprofile/nmi_int.c | 19 +++++++++++++++++--
 xen/arch/x86/traps.c            |  4 ++++
 xen/include/asm-x86/xenoprof.h  |  7 +++++++
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/oprofile/nmi_int.c b/xen/arch/x86/oprofile/nmi_int.c
index 0f103d80a6..a13bd82915 100644
--- a/xen/arch/x86/oprofile/nmi_int.c
+++ b/xen/arch/x86/oprofile/nmi_int.c
@@ -38,6 +38,8 @@ static unsigned long saved_lvtpc[NR_CPUS];
 
 static char *cpu_type;
 
+static DEFINE_PER_CPU(struct vcpu *, nmi_cont_vcpu);
+
 static int passive_domain_msr_op_checks(unsigned int msr, int *typep, int *indexp)
 {
 	struct vpmu_struct *vpmu = vcpu_vpmu(current);
@@ -83,14 +85,27 @@ void passive_domain_destroy(struct vcpu *v)
 		model->free_msr(v);
 }
 
+bool nmi_oprofile_send_virq(void)
+{
+	struct vcpu *v = xchg(&this_cpu(nmi_cont_vcpu), NULL);
+
+	if (v)
+		send_guest_vcpu_virq(v, VIRQ_XENOPROF);
+
+	return v;
+}
+
 static int nmi_callback(const struct cpu_user_regs *regs, int cpu)
 {
 	int xen_mode, ovf;
 
 	ovf = model->check_ctrs(cpu, &cpu_msrs[cpu], regs);
 	xen_mode = ring_0(regs);
-	if ( ovf && is_active(current->domain) && !xen_mode )
-		send_guest_vcpu_virq(current, VIRQ_XENOPROF);
+	if (ovf && is_active(current->domain) && !xen_mode &&
+	    !this_cpu(nmi_cont_vcpu)) {
+		this_cpu(nmi_cont_vcpu) = current;
+		trigger_nmi_continuation();
+	}
 
 	if ( ovf == 2 )
 		current->arch.nmi_pending = true;
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 5cbaa49031..240fd1b089 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -65,6 +65,7 @@
 #include <asm/debugger.h>
 #include <asm/msr.h>
 #include <asm/nmi.h>
+#include <asm/xenoprof.h>
 #include <asm/shared.h>
 #include <asm/x86_emulate.h>
 #include <asm/traps.h>
@@ -1805,6 +1806,9 @@ bool nmi_check_continuation(void)
 {
     bool ret = false;
 
+    if ( nmi_oprofile_send_virq() )
+        ret = true;
+
     return ret;
 }
 
diff --git a/xen/include/asm-x86/xenoprof.h b/xen/include/asm-x86/xenoprof.h
index 1026ba2e1f..cf6af8c5df 100644
--- a/xen/include/asm-x86/xenoprof.h
+++ b/xen/include/asm-x86/xenoprof.h
@@ -69,6 +69,8 @@ int passive_domain_do_rdmsr(unsigned int msr, uint64_t *msr_content);
 int passive_domain_do_wrmsr(unsigned int msr, uint64_t msr_content);
 void passive_domain_destroy(struct vcpu *v);
 
+bool nmi_oprofile_send_virq(void);
+
 #else
 
 static inline int passive_domain_do_rdmsr(unsigned int msr,
@@ -85,6 +87,11 @@ static inline int passive_domain_do_wrmsr(unsigned int msr,
 
 static inline void passive_domain_destroy(struct vcpu *v) {}
 
+static inline bool nmi_oprofile_send_virq(void)
+{
+    return false;
+}
+
 #endif /* CONFIG_XENOPROF */
 
 #endif /* __ASM_X86_XENOPROF_H__ */
-- 
2.26.2


