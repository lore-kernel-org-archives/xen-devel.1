Return-Path: <SRS0=j8AU=O2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E96C433FE
	for <xen-devel@archiver.kernel.org>; Wed,  6 Oct 2021 17:41:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAB676052B
	for <xen-devel@archiver.kernel.org>; Wed,  6 Oct 2021 17:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EAB676052B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.202986.358019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYAvD-0004aa-Gd; Wed, 06 Oct 2021 17:41:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202986.358019; Wed, 06 Oct 2021 17:41:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYAvD-0004aT-DE; Wed, 06 Oct 2021 17:41:39 +0000
Received: by outflank-mailman (input) for mailman id 202986;
 Wed, 06 Oct 2021 17:41:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=13oh=O2=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mYAvC-0004aL-8C
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 17:41:38 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 99faeec8-4c4f-4431-98da-99c8bc6ba3f5;
 Wed, 06 Oct 2021 17:41:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E57026D;
 Wed,  6 Oct 2021 10:41:36 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9FE63F70D;
 Wed,  6 Oct 2021 10:41:35 -0700 (PDT)
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
X-Inumbo-ID: 99faeec8-4c4f-4431-98da-99c8bc6ba3f5
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andre.Przywara@arm.com,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not supported on ARM.
Date: Wed,  6 Oct 2021 18:40:27 +0100
Message-Id: <d292392268df2c74c4103a82ef917072643407a8.1633540842.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633540842.git.rahul.singh@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ARM architecture does not implement I/O ports. Ignore this call on ARM
to avoid the overhead of making a hypercall just for Xen to return
-ENOSYS.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Change in v5: none
Change in v4:
- Added Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Change in v3: Added Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Change in v2:
- Instead of returning success in XEN, ignored the call in xl.
---
---
 tools/libs/ctrl/xc_domain.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 23322b70b5..25c95f6596 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -1348,6 +1348,14 @@ int xc_domain_ioport_permission(xc_interface *xch,
                                 uint32_t nr_ports,
                                 uint32_t allow_access)
 {
+#if defined(__arm__) || defined(__aarch64__)
+    /*
+     * The ARM architecture does not implement I/O ports.
+     * Avoid the overhead of making a hypercall just for Xen to return -ENOSYS.
+     * It is safe to ignore this call on ARM so we just return 0.
+     */
+    return 0;
+#else
     DECLARE_DOMCTL;
 
     domctl.cmd = XEN_DOMCTL_ioport_permission;
@@ -1357,6 +1365,7 @@ int xc_domain_ioport_permission(xc_interface *xch,
     domctl.u.ioport_permission.allow_access = allow_access;
 
     return do_domctl(xch, &domctl);
+#endif
 }
 
 int xc_availheap(xc_interface *xch,
-- 
2.25.1


