Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFE6606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 23:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=08tEDeZZ
Received: from list by lists.xenproject.org with outflank-mailman.1463817.1674850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD7J-0008TZ-Ps; Wed, 28 Oct 2026 23:31:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463817.1674850; Wed, 28 Oct 2026 23:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD7I-0008Nh-Do; Wed, 28 Oct 2026 23:31:36 +0000
Received: by outflank-mailman (input) for mailman id 1463817;
 Wed, 28 Oct 2026 23:30:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xMD6P-00058X-UV
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 23:30:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMD6K-00000000pOr-3k4q;
 Wed, 28 Oct 2026 23:30:36 +0000
Received: from [217.155.165.12] (helo=Mac.fritz.box.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMCja-00000001KpM-08NZ;
 Wed, 28 Oct 2026 23:07:06 +0000
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
	bh=xyRRTvzAZ1uxBpB7gEOaI29dfhB9uSJD02k1XOtgRUc=; b=08tEDeZZW4jtuHB4xtir14VyHK
	0eFQya78XTo9pKuaUFhRQkScUouJ/GSmcIae+vHBwODJZDIcvWpj2KeiwVCgAR/xEgq19kUsSD5CA
	FvyPcaBbz3/Gt0Cctx2rcfbjmpD1gnqTsakD8iCFDhWMt7gwre67j4HAT5Z7W8RdDNNs=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v5 28/45] x86/svm: restore guest debug registers in svm_do_resume()
Date: Wed, 28 Oct 2026 23:05:42 +0000
Message-ID: <20261028-asi-hvm-v5-28-13b908e0df0b@xenproject.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028-asi-hvm-v5-0-13b908e0df0b@xenproject.org>
References: <20261028-asi-hvm-v5-0-13b908e0df0b@xenproject.org>
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
CC: Ross Lagerwall <ross.lagerwall@citrix.com>

Changes in v4:
- New in this version.
---
 xen/arch/x86/hvm/svm/svm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index b539406f0c..df56245311 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -953,8 +953,6 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
      */
     disable_each_ist(per_cpu(idt, cpu));
 
-    svm_restore_dr(v);
-
     svm_tsc_ratio_load(v);
 
     if ( cpu_has_msr_tsc_aux )
@@ -978,6 +976,8 @@ static void noreturn cf_check svm_do_resume(void)
     bool vcpu_guestmode = false;
     struct vlapic *vlapic = vcpu_vlapic(v);
 
+    svm_restore_dr(v);
+
     if ( nestedhvm_enabled(v->domain) && nestedhvm_vcpu_in_guestmode(v) )
         vcpu_guestmode = 1;
 
-- 
2.56.0


