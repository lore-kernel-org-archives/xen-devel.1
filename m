Return-Path: <SRS0=9gwS=BD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB91BC433DF
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2020 12:43:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89E082078D
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2020 12:43:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="deiS7u4X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89E082078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyx2Q-000139-2f; Fri, 24 Jul 2020 12:42:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hWcK=BD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jyx2P-00012u-3k
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 12:42:57 +0000
X-Inumbo-ID: 308bff3e-cdab-11ea-880c-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 308bff3e-cdab-11ea-880c-bc764e2007e4;
 Fri, 24 Jul 2020 12:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595594572;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aDtTphrzz9VOwTJvjWtl31/5xlDEnj/EJHimWB6gA4o=;
 b=deiS7u4XhPpWcyrTBguRa/HFybY2oT+527j9v9hDZYTj5QajGP0eDFIf
 e1sQ+lNHIXbFlx2ROI87387Q4aePbqj0QV1UOdE2rXSEJC29D3E+/qB+1
 GGH+UiStNhEGpK7mKKCNQCvRSRrUc6kDbgbeYrtTshSp8kPd6IczNqZH0 U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: KJCsrxedNsP6PXR2GRxBdY4JBtMMaZKb/2iWqx70jsyhvQVs2mJ4a6ODJl6e5Ze0n71njR8l7V
 9U+neT0HVYP3POae1Ostbc3PyXtJbBN2r4zxUF0cQs6LBnJFr0VNVu/tNCJc9T1E4naoIb331o
 PnI7RkHi0XdVA2g0geZOyiF6+NKoWClGj8G1fo1E2jxpTrVvVikRzuiGwbtXCIN56qO7yeEIjv
 kh6FrSOIHklNuDPUeb45cpzlQ/2JrbYLIt+iJwQswgcnxS7Z13OFRECZhFNlp6l07ZlfxwhxDd
 Xyk=
X-SBRS: 2.7
X-MesageID: 23987140
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,390,1589256000"; d="scan'208";a="23987140"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/4] xen/balloon: fix accounting in
 alloc_xenballooned_pages error path
Date: Fri, 24 Jul 2020 14:42:38 +0200
Message-ID: <20200724124241.48208-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200724124241.48208-1-roger.pau@citrix.com>
References: <20200724124241.48208-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org,
 xen-devel@lists.xenproject.org, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

target_unpopulated is incremented with nr_pages at the start of the
function, but the call to free_xenballooned_pages will only subtract
pgno number of pages, and thus the rest need to be subtracted before
returning or else accounting will be skewed.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Cc: stable@vger.kernel.org
---
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
 drivers/xen/balloon.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 77c57568e5d7..3cb10ed32557 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -630,6 +630,12 @@ int alloc_xenballooned_pages(int nr_pages, struct page **pages)
  out_undo:
 	mutex_unlock(&balloon_mutex);
 	free_xenballooned_pages(pgno, pages);
+	/*
+	 * NB: free_xenballooned_pages will only subtract pgno pages, but since
+	 * target_unpopulated is incremented with nr_pages at the start we need
+	 * to remove the remaining ones also, or accounting will be screwed.
+	 */
+	balloon_stats.target_unpopulated -= nr_pages - pgno;
 	return ret;
 }
 EXPORT_SYMBOL(alloc_xenballooned_pages);
-- 
2.27.0


