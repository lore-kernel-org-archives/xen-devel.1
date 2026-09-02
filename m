Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E51C624D0
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 09:49:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405532.1639062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1haj-00088O-Vq; Wed, 02 Sep 2026 09:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405532.1639062; Wed, 02 Sep 2026 09:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1haj-00088C-S1; Wed, 02 Sep 2026 09:49:13 +0000
Received: by outflank-mailman (input) for mailman id 1405532;
 Wed, 02 Sep 2026 09:49:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 1x1hai-00085T-NF
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:49:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1hai-003afr-3j
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:49:12 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97f10a-bab6-0a2a0a5309dd-0a2a45029afe-34
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:49:12 +0200
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.fritz.box)
 by tlsNG-720697.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97efe6-6ca4-0a2a45020019-d99ba50ce8c0-7
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:44:07 +0200
Received: by Georges-MacBook-Pro-2.fritz.box (Postfix, from userid 501)
 id 2D56736928FE; Wed,  2 Sep 2026 10:44:07 +0100 (BST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: George Dunlap <dunlapg@umich.edu>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <gwd@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Alejandro Vallejo <agarciav@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 13/14] x86/pv: clear the XPTI root_pgt per-domain slot on context-switch out
Date: Wed,  2 Sep 2026 10:43:57 +0100
Message-ID: <20260901-asi-part2-13-ecc269f268b7@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1788342247-313CC2AC-CB9C2D3F/0/0
X-purgate-type: clean
X-purgate-size: 3045

From: George Dunlap <gwd@xenproject.org>

XPTI maintains a per-pCPU root page table (root_pgt): a restricted L4,
with Xen largely unmapped, that an XPTI domain's guest context actually
runs on.  Its guest mappings are copied in on the way back to guest
context; its per-domain slot is written by paravirt_ctxt_switch_to(),
so that it follows whichever domain is scheduled onto the pCPU.

Nothing ever clears the slot, however.  When the pCPU switches from an
XPTI PV vCPU to one that does not refresh the slot -- an HVM vCPU, or
the idle vCPU after a lazy state flush -- the last PV domain's
per-domain L3 remains referenced from root_pgt.  The reference isn't
cleared on domain destruction, so could even point to an already freed
page.

In theory, that slot should never be walked in this state; but it's
just generally safer not to leave dangling references around.
Consider that cleanup_cpu_root_pgt() frees pagetables by walking
root_pgt on CPU offline. Currently it correctly leaves slot 260 alone;
but one could easily imagine a mistake in which slot 260 is walked
erroneously.

Clear the slot in paravirt_ctxt_switch_from(), making the maintenance
a pair: cleared on the way out, installed on the way in.  The slot is
now populated only while the vCPU using it runs, and an erroneous walk
in any other state faults cleanly.  This change also makes robust
behavior simpler when we add per-vCPU areas in a subsequent patch.

Assisted-by: Claude Code:claude-fable-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v2:
- New patch.
---
 xen/arch/x86/domain.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 1f75d44fe0..79555e6964 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2006,8 +2006,18 @@ static void save_segments(struct vcpu *v)
 
 void cf_check paravirt_ctxt_switch_from(struct vcpu *v)
 {
+    root_pgentry_t *root_pgt = this_cpu(root_pgt);
+
     save_segments(v);
 
+    /*
+     * Clear the XPTI per-domain slot: it is installed on the way in by
+     * paravirt_ctxt_switch_to(), and must not linger while another vCPU
+     * runs.
+     */
+    if ( root_pgt )
+        root_pgt[root_table_offset(PERDOMAIN_VIRT_START)] = l4e_empty();
+
     /*
      * Disable debug breakpoints. We do this aggressively because if we switch
      * to an HVM guest we may load DR0-DR3 with values that can cause #DE
@@ -2022,6 +2032,12 @@ void cf_check paravirt_ctxt_switch_to(struct vcpu *v)
 {
     root_pgentry_t *root_pgt = this_cpu(root_pgt);
 
+    /*
+     * If XPTI is active, install the incoming domain's per-domain area
+     * in the per-domain slot of the L4 we run on while in guest mode.
+     * The slot was cleared on the way out (see
+     * paravirt_ctxt_switch_from()).
+     */
     if ( root_pgt )
         root_pgt[root_table_offset(PERDOMAIN_VIRT_START)] =
             l4e_from_page(v->domain->arch.perdomain_l3_pg,
-- 
2.55.0


