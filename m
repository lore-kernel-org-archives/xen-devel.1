Return-Path: <SRS0=WbUH=HN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F210EC433DB
	for <xen-devel@archiver.kernel.org>; Thu, 11 Feb 2021 07:10:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACD8B64E6F
	for <xen-devel@archiver.kernel.org>; Thu, 11 Feb 2021 07:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACD8B64E6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.83770.156703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA66y-0000Jj-Pm; Thu, 11 Feb 2021 07:10:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83770.156703; Thu, 11 Feb 2021 07:10:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA66y-0000Jc-Mf; Thu, 11 Feb 2021 07:10:00 +0000
Received: by outflank-mailman (input) for mailman id 83770;
 Thu, 11 Feb 2021 07:09:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/E5q=HN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lA66x-0000JX-IH
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 07:09:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4cddac22-2547-4427-b772-2ec0dd7f2112;
 Thu, 11 Feb 2021 07:09:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 57B08B113;
 Thu, 11 Feb 2021 07:09:57 +0000 (UTC)
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
X-Inumbo-ID: 4cddac22-2547-4427-b772-2ec0dd7f2112
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613027397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=C91ebXZNzoKbv/EE2K4v30/3rR8vNp/LicttouaukRw=;
	b=qNuAiZPpHtlua9QmiOIWYUpNAOS+9eEax533G/t7wi2RZdO+bmAHddRioIDtTF74jYoWxz
	eAeo/pTY9sH9o+4cM8Y8nkQbem/rEMC3ilUp1chL2lcl2e0EH6WFbPXg2OGCPs6a85woot
	WIlz07/w3uYyxb17mC2QN149iItiMC4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] irq: simplify condition in irq_matrix_reserve()
Date: Thu, 11 Feb 2021 08:09:53 +0100
Message-Id: <20210211070953.5914-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The if condition in irq_matrix_reserve() can be much simpler.

While at it fix a typo in the comment.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 kernel/irq/matrix.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/kernel/irq/matrix.c b/kernel/irq/matrix.c
index 651a4ad6d711..1f02a5c801a3 100644
--- a/kernel/irq/matrix.c
+++ b/kernel/irq/matrix.c
@@ -337,15 +337,14 @@ void irq_matrix_assign(struct irq_matrix *m, unsigned int bit)
  * irq_matrix_reserve - Reserve interrupts
  * @m:		Matrix pointer
  *
- * This is merily a book keeping call. It increments the number of globally
+ * This is merely a book keeping call. It increments the number of globally
  * reserved interrupt bits w/o actually allocating them. This allows to
  * setup interrupt descriptors w/o assigning low level resources to it.
  * The actual allocation happens when the interrupt gets activated.
  */
 void irq_matrix_reserve(struct irq_matrix *m)
 {
-	if (m->global_reserved <= m->global_available &&
-	    m->global_reserved + 1 > m->global_available)
+	if (m->global_reserved == m->global_available)
 		pr_warn("Interrupt reservation exceeds available resources\n");
 
 	m->global_reserved++;
-- 
2.26.2


