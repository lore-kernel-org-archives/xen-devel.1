Return-Path: <SRS0=9gwS=BD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB3CFC433F2
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2020 12:43:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E9F120767
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2020 12:43:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Czt7CIUx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E9F120767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyx2S-000151-AJ; Fri, 24 Jul 2020 12:43:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hWcK=BD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jyx2R-000148-Hz
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 12:42:59 +0000
X-Inumbo-ID: 337a5524-cdab-11ea-a3c5-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 337a5524-cdab-11ea-a3c5-12813bfff9fa;
 Fri, 24 Jul 2020 12:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595594578;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9vtgZWvCFbf23f9EcBa2/BD85tIDxfXjWQT+ZKvEIkQ=;
 b=Czt7CIUx0nuOtcFFImq/Lq+aTFgHTtUp6IoZl/XgDTav3ihP76Tw4QkQ
 Fta6Q9dZZpy43XhWnibp0U0lFGILLn00+TiO1QW6xkX0DiL3ISp4nbKGZ
 IFOOox7mwYuX9uzH+BpxwIVx6pEkBERteak3IlFwXgFLRmkfKjigL5QnI M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Dc8nqelwNvG0/+NMY4+cPWhthOaCyoSnUTP+8s1m6cGyixWFyqmz0D0lOYHL0AUzwySXw/Dsum
 o63shKP7+8p2KQKTGtvB48PgrA6dEpk+FjgHPkyzfK2BdO9RZy5LFaeWiHSJ7I+WDhXsT2jHOT
 wwolMT+yZOPpLqEFoJMnTdrZTr/gAGSMeUDtDsDdVOpmphY1HzwjTNCmNpwC1cqbLeglQMR3MV
 SEkdE4rvDQv+7kDNXpiuvhHJxFMiP7UZpwCwBW/hxpICmMVwcLWyQ/67BEdhKdnVHEXcmpAL5L
 8z8=
X-SBRS: 2.7
X-MesageID: 23454363
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,390,1589256000"; d="scan'208";a="23454363"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/4] Revert "xen/balloon: Fix crash when ballooning on x86
 32 bit PAE"
Date: Fri, 24 Jul 2020 14:42:40 +0200
Message-ID: <20200724124241.48208-4-roger.pau@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This reverts commit dfd74a1edfaba5864276a2859190a8d242d18952.

This has been fixed by commit dca4436d1cf9e0d237c which added the out
of bounds check to __add_memory, so that trying to add blocks past
MAX_PHYSMEM_BITS will fail.

Note the check in the Xen balloon driver was bogus anyway, as it
checked the start address of the resource, but it should instead test
the end address to assert the whole resource falls below
MAX_PHYSMEM_BITS.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
 drivers/xen/balloon.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 292413b27575..b1d8b028bf80 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -266,20 +266,6 @@ static struct resource *additional_memory_resource(phys_addr_t size)
 		return NULL;
 	}
 
-#ifdef CONFIG_SPARSEMEM
-	{
-		unsigned long limit = 1UL << (MAX_PHYSMEM_BITS - PAGE_SHIFT);
-		unsigned long pfn = res->start >> PAGE_SHIFT;
-
-		if (pfn > limit) {
-			pr_err("New System RAM resource outside addressable RAM (%lu > %lu)\n",
-			       pfn, limit);
-			release_memory_resource(res);
-			return NULL;
-		}
-	}
-#endif
-
 	return res;
 }
 
-- 
2.27.0


