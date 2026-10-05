Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E40CA5FFC
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 14:44:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440915.1658444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDjvd-0002y7-1q; Mon, 05 Oct 2026 14:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440915.1658444; Mon, 05 Oct 2026 14:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDjvc-0002y0-VB; Mon, 05 Oct 2026 14:44:32 +0000
Received: by outflank-mailman (input) for mailman id 1440915;
 Mon, 05 Oct 2026 14:44:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xDjvb-0002xs-LW
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 14:44:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xDjva-00G52c-1O;
 Mon, 05 Oct 2026 14:44:30 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xDjvZ-002FTa-0r;
 Mon, 05 Oct 2026 14:44:29 +0000
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
	bh=ncLUmgvO1QczMpEGUZAL50RUgZSjTQmdpcjCnPP3SAw=; b=unqtJ3LtKlyaM85jnJcWO7e1Dh
	6WKlXhTXajrY036gHoHavBXdxquDZh2tMaefjfdqSUIuEV686fJgVFJvP7aVsrWVxZ113h9zozSSs
	eazjFD9VpJJYM/GcP8zqWmA6sF/n3EopyrpEmTGG9eWjU15IRS5ywvDv5oVPhwGLDQDU=;
From: Roger Pau Monne <roger@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3] xen/x86: restrict XENFEAT_pae_pgdir_above_4gb setting to PV guests
Date: Mon,  5 Oct 2026 16:43:17 +0200
Message-ID: <20261005144317.2887-1-roger@xenproject.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

XENFEAT_pae_pgdir_above_4gb is only used by 32bit PV guests, hence limit
its setting in XENVER_get_features to the is_pv_domain() guarded section,
with the rest of the PV specific features.  Add an additional build time
guard to short-circuit the setting of XENFEAT_pae_pgdir_above_4gb if the
hypervisor has no PV 32bit support.

Signed-off-by: Roger Pau Monné <roger@xenproject.org>
---
Changes since v2:
 - Add IS_ENABLED(CONFIG_PV32).
---
 xen/common/kernel.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index f4bbd8818fa8..499023fae6fd 100644
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
@@ -690,9 +688,13 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 #endif
 #ifdef CONFIG_X86
             if ( is_pv_domain(d) )
+            {
                 fi.submap |= (1U << XENFEAT_mmu_pt_update_preserve_ad) |
                              (1U << XENFEAT_highmem_assist) |
                              (1U << XENFEAT_gnttab_map_avail_bits);
+                if ( IS_ENABLED(CONFIG_PV32) && VM_ASSIST(d, pae_extended_cr3) )
+                    fi.submap |= (1U << XENFEAT_pae_pgdir_above_4gb);
+            }
             else
                 fi.submap |= (1U << XENFEAT_hvm_safe_pvclock) |
                              (1U << XENFEAT_hvm_callback_vector) |
-- 
2.55.0


