Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F75ACA5FC5
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 19:12:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437855.1656795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBziR-0008OE-Kx; Wed, 30 Sep 2026 19:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437855.1656795; Wed, 30 Sep 2026 19:11:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBziR-0008O7-IB; Wed, 30 Sep 2026 19:11:43 +0000
Received: by outflank-mailman (input) for mailman id 1437855;
 Wed, 30 Sep 2026 19:11:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xBziQ-0008O1-BA
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 19:11:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xBziO-006qAx-2A;
 Wed, 30 Sep 2026 19:11:41 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xBziO-00FOy8-1p;
 Wed, 30 Sep 2026 19:11:41 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From;
	bh=FoBMcgqurQPq5AoiYSwr81nfolkixua96Q7MlNeqIeE=; b=f4ArjGlRnDwq8y8l+itfN2usfF
	D70fUAYN4eXPK0EzPhGNyaNPa0uRVWYGWHpB6+Enm6A4yznGfLazkOk9bCwUZweBkz07StrXnrmS6
	IpNLPh9Bd1OiAkziIXlY6NhkWSi7OvXaYhIMURt8c0xOGTFrjKfj8v+rsC+N+k6whh2Y=;
From: Roger Pau Monne <roger@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/x86: restrict XENFEAT_pae_pgdir_above_4gb setting to PV guests
Date: Wed, 30 Sep 2026 21:11:04 +0200
Message-ID: <20260930191104.78141-1-roger@xenproject.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

XENFEAT_pae_pgdir_above_4gb is only used by 32bit PV guests, hence limit
its setting in XENVER_get_features to the is_pv_domain() guarded section,
with the rest of the PV specific features.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger@xenproject.org>
---
 xen/common/kernel.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index f4bbd8818fa8..95cf56827317 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -677,8 +677,6 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
                         (1U << XENFEAT_vcpu_time_phys_area) |
 #endif
                         (1U << XENFEAT_runstate_phys_area);
-            if ( VM_ASSIST(d, pae_extended_cr3) )
-                fi.submap |= (1U << XENFEAT_pae_pgdir_above_4gb);
             if ( paging_mode_translate(d) )
                 fi.submap |=
                     (1U << XENFEAT_writable_page_tables) |
@@ -692,7 +690,9 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
             if ( is_pv_domain(d) )
                 fi.submap |= (1U << XENFEAT_mmu_pt_update_preserve_ad) |
                              (1U << XENFEAT_highmem_assist) |
-                             (1U << XENFEAT_gnttab_map_avail_bits);
+                             (1U << XENFEAT_gnttab_map_avail_bits) |
+                             (VM_ASSIST(d, pae_extended_cr3) ?
+                              (1U << XENFEAT_pae_pgdir_above_4gb) : 0);
             else
                 fi.submap |= (1U << XENFEAT_hvm_safe_pvclock) |
                              (1U << XENFEAT_hvm_callback_vector) |
-- 
2.55.0


