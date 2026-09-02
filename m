Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0965C61DFD
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 09:44:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405457.1638971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hVq-0002oR-6A; Wed, 02 Sep 2026 09:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405457.1638971; Wed, 02 Sep 2026 09:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hVq-0002mL-0K; Wed, 02 Sep 2026 09:44:10 +0000
Received: by outflank-mailman (input) for mailman id 1405457;
 Wed, 02 Sep 2026 09:44:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 1x1hVn-0002GC-Nm
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:44:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1hVm-00G2eL-JM
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:44:06 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97efd9-2eae-0a2a0a5409dd-0a2a45069e4a-38
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:44:06 +0200
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.fritz.box)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97efe6-195a-0a2a45060019-d99ba50cefa3-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:44:06 +0200
Received: by Georges-MacBook-Pro-2.fritz.box (Postfix, from userid 501)
 id 5715E36928EB; Wed,  2 Sep 2026 10:44:06 +0100 (BST)
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
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Alejandro Vallejo <agarciav@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v2 08/14] x86/mm: purge unneeded destroy_perdomain_mapping()
Date: Wed,  2 Sep 2026 10:43:52 +0100
Message-ID: <20260901-asi-part2-8-ecc269f268b7@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1788342246-FD60A77B-C10AA290/0/0
X-purgate-type: clean
X-purgate-size: 2524

From: Roger Pau Monné <roger.pau@citrix.com>

We want to change per-domain mappings to be per-vCPU mappings.  In
preparation for that, we want to arrange that
destroy_perdomain_mapping() work either with a single perdomain area,
or with a per-vCPU perdomain area.

There are two calls made from domain-scoped contexts; both calls turn
out to be unnecessary:

- destroy_perdomain_mapping() is not logically the undo of
  create_perdomain_mapping(), as the name and its use in
  hvm_domain_initialise() suggest.  create_ allocates a per-domain L3,
  but destroy_ tears down mappings without freeing it; and since the
  call here passes nr == 0, it tears down nothing at all.  The
  per-domain L3 page is actually freed by free_perdomain_mappings(),
  which hvm_domain_initialise()'s caller, arch_domain_create(),
  already invokes on its failure path.

- The call in pv_domain_destroy() is redundant: arch_domain_destroy()
  unconditionally calls free_perdomain_mappings(), which tears down
  the same entries and additionally frees the page-table structures.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Assisted-by: Claude Code:claude-fable-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v2:
- Added to the series

Changes since the previously posted version:
- Reworked the commit message to make it more clear how it fits in
  with the larger series.  No functional change.
---
 xen/arch/x86/hvm/hvm.c   | 1 -
 xen/arch/x86/pv/domain.c | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index a6e0818468..cd425c3342 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -730,7 +730,6 @@ int hvm_domain_initialise(struct domain *d,
     XFREE(d->arch.hvm.irq);
  fail0:
     hvm_destroy_cacheattr_region_list(d);
-    destroy_perdomain_mapping(d, PERDOMAIN_VIRT_START, 0);
  fail:
     hvm_domain_relinquish_resources(d);
     XFREE(d->arch.hvm.io_handler);
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 15a8238aff..b936ca9b26 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -383,9 +383,6 @@ void pv_domain_destroy(struct domain *d)
 {
     pv_l1tf_domain_destroy(d);
 
-    destroy_perdomain_mapping(d, GDT_LDT_VIRT_START,
-                              GDT_LDT_MBYTES << (20 - PAGE_SHIFT));
-
     XFREE(d->arch.pv.cpuidmasks);
 }
 
-- 
2.55.0


