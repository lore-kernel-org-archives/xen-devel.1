Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F1A606A31F
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 19:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=xPX+XWlY
Received: from list by lists.xenproject.org with outflank-mailman.1454837.1668392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItS2-0004C2-EE; Mon, 19 Oct 2026 19:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454837.1668392; Mon, 19 Oct 2026 19:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItS2-0004B0-8q; Mon, 19 Oct 2026 19:55:18 +0000
Received: by outflank-mailman (input) for mailman id 1454837;
 Mon, 19 Oct 2026 19:55:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xItRz-0003h6-Gj
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:55:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItRz-000000022yM-1Ug1;
 Mon, 19 Oct 2026 19:55:15 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItGq-00000001FjN-0Vjv;
 Mon, 19 Oct 2026 19:43:44 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=0xjjqZgBgY8JRdyUnikpudSp7wTX9GMpnA2R61WibAk=; b=xPX+XWlYED+O8f0wmVmXbJ+ABA
	bqnIl+GYHkHaw8Dd22+y2MvFJtgs/ZRlwdNNkp59SedwJB/if5e+lcATu+XfNtbFFXjEYtCQcpQ5h
	Fya36z2ymJvg60Nws0PluJUGixANVpNBLBDUk8hpfSOLdmdFASHEDzvQ91Z7iBy3Ii7E=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v4 27/30] x86/svm: restore guest debug registers in svm_do_resume()
Date: Mon, 19 Oct 2026 20:42:58 +0100
Message-ID: <20261019-asi-hvm-v4-27-b68b66652266@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
References: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

svm_ctxt_switch_to() restores the guest's debug registers when its DR7
enables any of them, which also updates the VMCB.  Do it in
svm_do_resume() instead, which follows it whenever the vCPU is
scheduled in.

svm_do_resume() also runs when a vCPU keeps running on its pCPU
(continue_running()), without svm_ctxt_switch_to().  Where the guest's
debug registers are already loaded, the restore does nothing:
flag_dr_dirty records that they are, and only svm_save_dr() clears it,
from svm_ctxt_switch_from().

This prepares for moving VMCBs off always-mapped memory:
svm_ctxt_switch_to() runs before write_ptbase(), where the incoming
vCPU's VMCB will not be mapped.

Not yet run with a guest using debug registers.

Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v4:
- New in this version.
---
 xen/arch/x86/hvm/svm/svm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 4e19df9865..3de8da7ea3 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -955,8 +955,6 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
      */
     disable_each_ist(per_cpu(idt, cpu));
 
-    svm_restore_dr(v);
-
     svm_tsc_ratio_load(v);
 
     if ( cpu_has_msr_tsc_aux )
@@ -980,6 +978,8 @@ static void noreturn cf_check svm_do_resume(void)
     bool vcpu_guestmode = false;
     struct vlapic *vlapic = vcpu_vlapic(v);
 
+    svm_restore_dr(v);
+
     if ( nestedhvm_enabled(v->domain) && nestedhvm_vcpu_in_guestmode(v) )
         vcpu_guestmode = 1;
 
-- 
2.55.0


