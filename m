Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D72C2FC14
	for <xen-devel@archiver.kernel.org>; Thu, 17 Aug 2023 12:40:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.585376.916475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWcIA-0000Z2-34; Thu, 17 Aug 2023 12:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585376.916475; Thu, 17 Aug 2023 12:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWcI9-0000Xg-Sj; Thu, 17 Aug 2023 12:39:57 +0000
Received: by outflank-mailman (input) for mailman id 585376;
 Thu, 17 Aug 2023 12:39:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0n1I=EC=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qWcI8-0000KH-OJ
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 12:39:56 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2af64e13-3cfb-11ee-9b0c-b553b5be7939;
 Thu, 17 Aug 2023 14:39:55 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 384034EE073D;
 Thu, 17 Aug 2023 14:39:54 +0200 (CEST)
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
X-Inumbo-ID: 2af64e13-3cfb-11ee-9b0c-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 2/3] vpci/msix: make 'get_slot' static
Date: Thu, 17 Aug 2023 14:39:27 +0200
Message-Id: <c6e270c813ef1a4da7045a5fcf7bd9e1b8f21947.1692275359.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692275359.git.nicola.vetrini@bugseng.com>
References: <cover.1692275359.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function can become static since it's used only within this file.
This also resolves a violation of MISRA C:2012 Rule 8.4 due to the absence
of a declaration before the function definition.

Fixes: b177892d2d0e ("vpci/msix: handle accesses adjacent to the MSI-X table")
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v2:
- Corrected wrong prefix in the commit subject.

CC-ing maintainers from "THE REST" as well, perhaps this trivial change can go
in straight away.
---
 xen/drivers/vpci/msix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 25bde77586a4..f9df506f29bf 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -223,7 +223,7 @@ static void __iomem *get_table(const struct vpci *vpci, unsigned int slot)
     return msix->table[slot];
 }

-unsigned int get_slot(const struct vpci *vpci, unsigned long addr)
+static unsigned int get_slot(const struct vpci *vpci, unsigned long addr)
 {
     unsigned long pfn = PFN_DOWN(addr);

--
2.34.1

