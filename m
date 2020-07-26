Return-Path: <SRS0=MTdN=BF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4AA5C433DF
	for <xen-devel@archiver.kernel.org>; Sun, 26 Jul 2020 00:18:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91A29206D8
	for <xen-devel@archiver.kernel.org>; Sun, 26 Jul 2020 00:18:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ye5o+OVz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91A29206D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jzUMV-0006nA-Sg; Sun, 26 Jul 2020 00:17:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v6JZ=BF=infradead.org=rdunlap@srs-us1.protection.inumbo.net>)
 id 1jzUMS-0006n5-Lh
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2020 00:17:53 +0000
X-Inumbo-ID: 6f3acfe7-ced5-11ea-89d6-bc764e2007e4
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f3acfe7-ced5-11ea-89d6-bc764e2007e4;
 Sun, 26 Jul 2020 00:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=bIzdukHQ+ATBfHLpRDrfYN1nk7nF43j1x33WTc27/H4=; b=Ye5o+OVzQqZPY09OgVKgkiYRox
 UzF1lfxQ5ygjF+dzA0Q5eufEWU4AfBfMUITe3VkQSKMNvm51ye+yR1luQU/vKkfsIzXAKS+r+TUHk
 TwN9NSglqWFESQrkIMfPPTLbobEmupZKolAUOWTZ2BKGY4HyLuyHFmUNvmx9MhjwUl1YuFeDjWOCC
 GfCYViJ2PQCEHqMBiNlTwtUv79GAPuJWLIL9iGyS1MEBVGKQXdFArIN9tFFA+zjhwkMcvVt0ejnTm
 fXpBlVTdLclXblKYHSpnHEKBSywW5TjBs2+91hHiPs3znL9C4uMTxgLy/CZcwYoMWGx8e4S86u/nh
 hsAUmfyw==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzUMB-0002Mn-Kk; Sun, 26 Jul 2020 00:17:36 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] xen: hypercall.h: fix duplicated word
Date: Sat, 25 Jul 2020 17:17:31 -0700
Message-Id: <20200726001731.19540-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Randy Dunlap <rdunlap@infradead.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Change the repeated word "as" to "as a".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
---
 arch/x86/include/asm/xen/hypercall.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200720.orig/arch/x86/include/asm/xen/hypercall.h
+++ linux-next-20200720/arch/x86/include/asm/xen/hypercall.h
@@ -82,7 +82,7 @@ struct xen_dm_op_buf;
  *     - clobber the rest
  *
  * The result certainly isn't pretty, and it really shows up cpp's
- * weakness as as macro language.  Sorry.  (But let's just give thanks
+ * weakness as a macro language.  Sorry.  (But let's just give thanks
  * there aren't more than 5 arguments...)
  */
 

