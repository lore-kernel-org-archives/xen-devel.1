Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668F5C55177
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 13:10:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380615.1624304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVws-0002M2-S3; Sun, 02 Aug 2026 13:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380615.1624304; Sun, 02 Aug 2026 13:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVws-0002Lu-O5; Sun, 02 Aug 2026 13:09:50 +0000
Received: by outflank-mailman (input) for mailman id 1380615;
 Sun, 02 Aug 2026 13:09:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wqVwq-0002Lk-AX
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 13:09:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqVwp-001xPK-IM
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 15:09:47 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f4195-5cb7-0a2a0a5109dd-0a2a4506dd12-8
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:09:46 +0200
Received: from [178.33.46.10] (helo=4.mo561.mail-out.ovh.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f419a-195a-0a2a45060019-b2212e0aa901-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:09:46 +0200
Received: from director7.ghost.mail-out.ovh.net (unknown [10.110.54.182])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4hCgBf2cWyz5wxV
 for <xen-devel@lists.xenproject.org>; Sun,  2 Aug 2026 13:09:46 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-tcfrn (unknown [10.111.174.62])
 by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 84B5BC00F3;
 Sun,  2 Aug 2026 13:09:45 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.112])
 by ghost-submission-7d8d68f679-tcfrn with ESMTPSA
 id 9Lx+DJlBb2rrfyEAU3TobQ
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 02 Aug 2026 13:09:45 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ovhmo3617313-selector1 header.d=3mdeb.com header.i="@3mdeb.com" header.h=From
Authentication-Results:garm.ovh; auth=pass (GARM-112S0067dc25300-a989-4a04-944e-3b51f6587265,
                    A7BD45287BC66A7121136900083CD01C39616B1D) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.215
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v4 01/23] x86/mtrr: get rid of a static variable on pause/restore
Date: Sun,  2 Aug 2026 16:09:17 +0300
Message-ID: <b36573fda71fdceb3d6049493faf3daff9f64de8.1785668458.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 4727090759001843132
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEtK5p0SNYtBef44Zaajhk33i63wmjVwNNhJ4YROChk7mhZcpyT3bd5ACP3F2TkAykP416Z/qj7tU2KxG1rTRS8MypF1KRhaA/AvmFdmp6hM2n75hgvTPUkRMkZtHtCy5BQJTDAa5dye2uRhTva5lFRUMRQoQfXqDmPkoEsCcMiOXhj8LDb8bxT7fPbPw+L6oM3Ib4+Crk5z3znR8b12WvIauAwvZwi4TwyXrVt8t5cjjf6p6tk/jAP3JPPWAt8lJLbOqKqZPj2dLVv8AcggN/kQjhcbgaHkG9r5s4innAGR9o3gaGzW+PeUVjPnviytxFmoTk+gQnhQiwpJq7s595nq0/dNHg0K5j2/u4togUta8cK/sYD5KBkNvqDKDkP2Mqf4xYNTNh5h0uvCo6u6RAiqKqjL4e/nWsAkN1HVqW7sIR+iMygbzv7AJlPA8cxp2kX69Aw+9xSEw4ne+98yONw9skyGEdzNUs5erSqMJWK+0O3epc5lpnqvRdzUJgb8EZdM7Cj9hXLgC8cB1ndL6HKAHXj/w4ela7PY6shb+FWKaaYztmGPyQyPRNz595AZhT890rNV64MLH8m5m7wkb7aRz5vB7zsXcll1SY3nMQH850SCLiHYo879ix6XTKada1yIneAP3BkZliSYtaUIhs1I/4u3jxLPAyGYlJOtawbAg
DKIM-Signature: a=rsa-sha256; bh=45a6v7qxNqaXiQeBDtCOedZ5o8Tq5ypxyrPqCVlyc0I=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1785676186; v=1;
 b=J+JpuW0eGrX+12iBiIP2laX8HNfi1XKqWNFnPsu8IXbjqRPbqG9YMw2BQBBiFVZjeVwyUGBM
 b4/A5yC7Qby8LzofkxEQL1YWPJLqVqZgxrCtxnmuq26Cb1d0twC/1TsMnu8q6KKc1J+H8x3TQDE
 4GRy3tXPK+YN41rISv5V1FmA6VaON3Gvszfj+Lh7rSIe0xzOMLhhP3aPKu0NbTrRNmG2VuE99e/
 FW4VNGWEn/zGpucfksvt80mBuipCcQadptfdlXWLBUcgeDJPcufB+TIMjVexocUiRaecM3J/E70
 LxTzG8efeyM6LTzTAE6AvRjqUW8tEcReZlH2ZlfXzRsdg==
X-purgate-ID: tlsNG-16d1c6/1785676186-F420077B-D5098E62/0/0
X-purgate-type: clean
X-purgate-size: 5288

In addition to keeping the state in one place instead of on stack and in
a static variable, this enables exposing this functionality to other
units in the future.

Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---

Notes:
    v4: was called "x86/mtrr: expose functions for pausing caching"
    v4: no longer makes anything public, just updates implementation
    v4: the state structure is now an output parameter instead of a return value
    v4: switches from rdmsrl() to rdmsr() on one line that's updated anyway

 xen/arch/x86/cpu/mtrr/generic.c | 55 +++++++++++++++++----------------
 1 file changed, 28 insertions(+), 27 deletions(-)

diff --git a/xen/arch/x86/cpu/mtrr/generic.c b/xen/arch/x86/cpu/mtrr/generic.c
index 23c279eb9a..86eb0f405b 100644
--- a/xen/arch/x86/cpu/mtrr/generic.c
+++ b/xen/arch/x86/cpu/mtrr/generic.c
@@ -14,6 +14,11 @@
 #include <asm/cpufeature.h>
 #include "mtrr.h"
 
+struct mtrr_pausing_state {
+	bool pge;
+	uint64_t def_type;
+};
+
 static const struct fixed_range_block {
 	uint32_t base_msr;   /* start address of an MTRR block */
 	unsigned int ranges; /* number of MTRRs in this block  */
@@ -395,9 +400,7 @@ static bool set_mtrr_var_ranges(unsigned int index, struct mtrr_var_range *vr)
 	return changed;
 }
 
-static uint64_t deftype;
-
-static unsigned long set_mtrr_state(void)
+static unsigned long set_mtrr_state(uint64_t *deftype)
 /*  [SUMMARY] Set the MTRR state for this CPU.
     <state> The MTRR state information to read.
     <ctxt> Some relevant CPU context.
@@ -415,14 +418,12 @@ static unsigned long set_mtrr_state(void)
 	if (mtrr_state.have_fixed && set_fixed_ranges(mtrr_state.fixed_ranges))
 		change_mask |= MTRR_CHANGE_MASK_FIXED;
 
-	/*  Set_mtrr_restore restores the old value of MTRRdefType,
-	   so to set it we fiddle with the saved value  */
-	if ((deftype & 0xff) != mtrr_state.def_type
-	    || MASK_EXTR(deftype, MTRRdefType_E) != mtrr_state.enabled
-	    || MASK_EXTR(deftype, MTRRdefType_FE) != mtrr_state.fixed_enabled) {
-		deftype = (deftype & ~0xcff) | mtrr_state.def_type |
-		          MASK_INSR(mtrr_state.enabled, MTRRdefType_E) |
-		          MASK_INSR(mtrr_state.fixed_enabled, MTRRdefType_FE);
+	if ((*deftype & 0xff) != mtrr_state.def_type
+	    || MASK_EXTR(*deftype, MTRRdefType_E) != mtrr_state.enabled
+	    || MASK_EXTR(*deftype, MTRRdefType_FE) != mtrr_state.fixed_enabled) {
+		*deftype = (*deftype & ~0xcff) | mtrr_state.def_type |
+		           MASK_INSR(mtrr_state.enabled, MTRRdefType_E) |
+		           MASK_INSR(mtrr_state.fixed_enabled, MTRRdefType_FE);
 		change_mask |= MTRR_CHANGE_MASK_DEFTYPE;
 	}
 
@@ -439,7 +440,7 @@ static DEFINE_SPINLOCK(set_atomicity_lock);
  * has been called.
  */
 
-static bool prepare_set(void)
+static void mtrr_pause_caching(struct mtrr_pausing_state *state)
 {
 	unsigned long cr4;
 
@@ -461,7 +462,9 @@ static bool prepare_set(void)
 	alternative("wbinvd", "", X86_FEATURE_XEN_SELFSNOOP);
 
 	cr4 = read_cr4();
-	if (cr4 & X86_CR4_PGE)
+	state->pge = cr4 & X86_CR4_PGE;
+
+	if (state->pge)
 		write_cr4(cr4 & ~X86_CR4_PGE);
 	else if (use_invpcid)
 		invpcid_flush_all();
@@ -469,27 +472,25 @@ static bool prepare_set(void)
 		write_cr3(read_cr3());
 
 	/*  Save MTRR state */
-	rdmsrl(MSR_MTRRdefType, deftype);
+	state->def_type = rdmsr(MSR_MTRRdefType);
 
 	/*  Disable MTRRs, and set the default type to uncached  */
-	mtrr_wrmsr(MSR_MTRRdefType, deftype & ~0xcff);
+	mtrr_wrmsr(MSR_MTRRdefType, state->def_type & ~0xcff);
 
 	/* Again, only flush caches if we have to. */
 	alternative("wbinvd", "", X86_FEATURE_XEN_SELFSNOOP);
-
-	return cr4 & X86_CR4_PGE;
 }
 
-static void post_set(bool pge)
+static void mtrr_resume_caching(struct mtrr_pausing_state state)
 {
 	/* Intel (P6) standard MTRRs */
-	mtrr_wrmsr(MSR_MTRRdefType, deftype);
+	mtrr_wrmsr(MSR_MTRRdefType, state.def_type);
 
 	/*  Enable caches  */
 	write_cr0(read_cr0() & ~X86_CR0_CD);
 
 	/*  Reenable CR4.PGE (also flushes the TLB) */
-	if (pge)
+	if (state.pge)
 		write_cr4(read_cr4() | X86_CR4_PGE);
 	else if (use_invpcid)
 		invpcid_flush_all();
@@ -503,15 +504,15 @@ void mtrr_set_all(void)
 {
 	unsigned long mask, count;
 	unsigned long flags;
-	bool pge;
+	struct mtrr_pausing_state pausing_state;
 
 	local_irq_save(flags);
-	pge = prepare_set();
+	mtrr_pause_caching(&pausing_state);
 
 	/* Actually set the state */
-	mask = set_mtrr_state();
+	mask = set_mtrr_state(&pausing_state.def_type);
 
-	post_set(pge);
+	mtrr_resume_caching(pausing_state);
 	local_irq_restore(flags);
 
 	/*  Use the atomic bitops to update the global mask  */
@@ -536,12 +537,12 @@ void mtrr_set(
 {
 	unsigned long flags;
 	struct mtrr_var_range *vr;
-	bool pge;
+	struct mtrr_pausing_state pausing_state;
 
 	vr = &mtrr_state.var_ranges[reg];
 
 	local_irq_save(flags);
-	pge = prepare_set();
+	mtrr_pause_caching(&pausing_state);
 
 	if (size == 0) {
 		/* The invalid bit is kept in the mask, so we simply clear the
@@ -562,7 +563,7 @@ void mtrr_set(
 		mtrr_wrmsr(MSR_IA32_MTRR_PHYSMASK(reg), vr->mask);
 	}
 
-	post_set(pge);
+	mtrr_resume_caching(pausing_state);
 	local_irq_restore(flags);
 }
 
-- 
2.55.0


