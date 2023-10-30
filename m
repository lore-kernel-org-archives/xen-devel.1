Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FA6C4167D
	for <xen-devel@archiver.kernel.org>; Mon, 30 Oct 2023 09:11:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.625007.973874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxOJL-0001a0-94; Mon, 30 Oct 2023 09:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625007.973874; Mon, 30 Oct 2023 09:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxOJL-0001Z3-2h; Mon, 30 Oct 2023 09:11:51 +0000
Received: by outflank-mailman (input) for mailman id 625007;
 Mon, 30 Oct 2023 09:11:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nz7O=GM=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qxOJJ-0008Uy-BK
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 09:11:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59c79713-7704-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 10:11:46 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 8157F4EE0747;
 Mon, 30 Oct 2023 10:11:45 +0100 (CET)
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
X-Inumbo-ID: 59c79713-7704-11ee-9b0e-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH][for-4.19 v5 6/8] xen/console: remove stub definition in consoled.h
Date: Mon, 30 Oct 2023 10:11:31 +0100
Message-Id: <9328cc486244bfd3868525fd5ee579b73dca48df.1698655374.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698655374.git.nicola.vetrini@bugseng.com>
References: <cover.1698655374.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The stub  definition of 'consoled_guest_tx' can be removed, since its
its single caller uses the implementation built with PV_SHIM enabled.

Fixes: 5ef49f185c2d ("x86/pv-shim: shadow PV console's page for L2 DomU")
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/include/xen/consoled.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/xen/include/xen/consoled.h b/xen/include/xen/consoled.h
index fd5d220a8aca..2b30516b3a0a 100644
--- a/xen/include/xen/consoled.h
+++ b/xen/include/xen/consoled.h
@@ -3,18 +3,11 @@
 
 #include <public/io/console.h>
 
-#ifdef CONFIG_PV_SHIM
-
 void consoled_set_ring_addr(struct xencons_interface *ring);
 struct xencons_interface *consoled_get_ring_addr(void);
 size_t consoled_guest_rx(void);
 size_t consoled_guest_tx(char c);
 
-#else
-
-size_t consoled_guest_tx(char c) { return 0; }
-
-#endif /* !CONFIG_PV_SHIM */
 #endif /* __XEN_CONSOLED_H__ */
 /*
  * Local variables:
-- 
2.34.1


