Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E36C2D0CE
	for <xen-devel@archiver.kernel.org>; Thu, 20 Jun 2024 13:52:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.744514.1151623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKICp-0001V6-MM; Thu, 20 Jun 2024 13:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744514.1151623; Thu, 20 Jun 2024 13:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKICp-0001TU-9t; Thu, 20 Jun 2024 13:52:03 +0000
Received: by outflank-mailman (input) for mailman id 744514;
 Thu, 20 Jun 2024 13:52:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPla=NW=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sKICn-0008AF-Hp
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 13:52:01 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44a2e37d-2f0c-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 15:52:01 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [78.208.165.219])
 by support.bugseng.com (Postfix) with ESMTPSA id 7671F4EE0754;
 Thu, 20 Jun 2024 15:52:00 +0200 (CEST)
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
X-Inumbo-ID: 44a2e37d-2f0c-11ef-90a3-e314d9c70b13
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>
Subject: [XEN PATCH 12/13] x86/vPIC: address a violation of MISRA C Rule 16.3
Date: Thu, 20 Jun 2024 15:51:46 +0200
Message-Id: <22c3d314f769b683241f8bdabf006225714aa07a.1718890095.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <10af9145252a2f5c31ea0f13cbb67cbe76a8ba3a.1718890095.git.federico.serafini@bugseng.com>
References: <10af9145252a2f5c31ea0f13cbb67cbe76a8ba3a.1718890095.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pseudokeyword fallthrough to meet the requirements to deviate
a violation of MISRA C Rul 16.3: "An unconditional `break' statement
shall terminate every switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/hvm/vpic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index 7c3b5c7254..6427b08086 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -309,6 +309,7 @@ static void vpic_ioport_write(
             if ( !(vpic->init_state & 8) )
                 break; /* CASCADE mode: wait for write to ICW3. */
             /* SNGL mode: fall through (no ICW3). */
+            fallthrough;
         case 2:
             /* ICW3 */
             vpic->init_state++;
-- 
2.34.1


