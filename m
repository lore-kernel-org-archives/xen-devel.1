Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0ADDE784AC
	for <xen-devel@archiver.kernel.org>; Mon,  2 Oct 2023 13:46:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.611578.951072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnJEv-0007eB-DJ; Mon, 02 Oct 2023 13:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611578.951072; Mon, 02 Oct 2023 13:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnJEv-0007e4-AL; Mon, 02 Oct 2023 13:45:37 +0000
Received: by outflank-mailman (input) for mailman id 611578;
 Mon, 02 Oct 2023 13:45:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PUzD=FQ=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qnJEt-0007dw-L0
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 13:45:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f544c2f1-6129-11ee-9b0d-b553b5be7939;
 Mon, 02 Oct 2023 15:45:33 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.163.141.27])
 by support.bugseng.com (Postfix) with ESMTPSA id 18D474EE0739;
 Mon,  2 Oct 2023 15:45:32 +0200 (CEST)
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
X-Inumbo-ID: f544c2f1-6129-11ee-9b0d-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Henry Wang <henry.wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] x86/paging: address a violation of MISRA C:2012 Rule 8.3
Date: Mon,  2 Oct 2023 15:45:24 +0200
Message-Id: <5a304ffd4fbdd0d5809dc68b857410bbc02f32a0.1696252375.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make function declaration and definition consistent.
No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/paging.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/paging.h b/xen/arch/x86/include/asm/paging.h
index f291f2f9a2..62605d7697 100644
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -245,7 +245,7 @@ paging_fault(unsigned long va, struct cpu_user_regs *regs)
 }
 
 /* Handle invlpg requests on vcpus. */
-void paging_invlpg(struct vcpu *v, unsigned long va);
+void paging_invlpg(struct vcpu *v, unsigned long linear);
 
 /*
  * Translate a guest virtual address to the frame number that the
-- 
2.34.1


