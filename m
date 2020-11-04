Return-Path: <SRS0=nsPS=EK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CD8C388F7
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2020 08:22:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D35B420782
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2020 08:22:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="WyQS0+B/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D35B420782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.18865.43913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaE3T-0001nA-Mp; Wed, 04 Nov 2020 08:22:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18865.43913; Wed, 04 Nov 2020 08:22:07 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaE3T-0001n3-Jf; Wed, 04 Nov 2020 08:22:07 +0000
Received: by outflank-mailman (input) for mailman id 18865;
 Wed, 04 Nov 2020 08:22:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Coh=EK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kaE3R-0001my-Ql
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 08:22:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 1ecf9401-884d-4793-9b69-64f9d9510726;
 Wed, 04 Nov 2020 08:22:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 890B6AC23;
 Wed,  4 Nov 2020 08:22:04 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2Coh=EK=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kaE3R-0001my-Ql
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 08:22:05 +0000
X-Inumbo-ID: 1ecf9401-884d-4793-9b69-64f9d9510726
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 1ecf9401-884d-4793-9b69-64f9d9510726;
	Wed, 04 Nov 2020 08:22:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604478124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FIHJjp2r63bKNxd9wt4Ny3dqHWucTNU7/7M3PY7mgtA=;
	b=WyQS0+B/nzXQjcPRwai7VmmFlkHHZrWS4FRW+UR8f/5q5khkZUEXTGUzZ7vs6dBV3Jc6JY
	Zkrr9T6ewk24n/pNdsrgALYF+xiBNEeEKXeQzztpEwHp/uA7JCKMJmc98dp018t5GWquXF
	8BgEmQfEwkIw2LahypAz0UOgmWGIVXs=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 890B6AC23;
	Wed,  4 Nov 2020 08:22:04 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/drivers: remove unused pcidevs_trylock()
Date: Wed,  4 Nov 2020 09:22:02 +0100
Message-Id: <20201104082202.12194-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcidevs_trylock() is used nowhere, so remove it.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/drivers/passthrough/pci.c | 5 -----
 xen/include/xen/pci.h         | 1 -
 2 files changed, 6 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 2a3bce1462..51e584127e 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -69,11 +69,6 @@ bool_t pcidevs_locked(void)
     return !!spin_is_locked(&_pcidevs_lock);
 }
 
-bool_t pcidevs_trylock(void)
-{
-    return !!spin_trylock_recursive(&_pcidevs_lock);
-}
-
 static struct radix_tree_root pci_segments;
 
 static inline struct pci_seg *get_pseg(u16 seg)
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index c4d3879761..20a54a5bb4 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -148,7 +148,6 @@ struct pci_dev {
 void pcidevs_lock(void);
 void pcidevs_unlock(void);
 bool_t __must_check pcidevs_locked(void);
-bool_t __must_check pcidevs_trylock(void);
 
 bool_t pci_known_segment(u16 seg);
 bool_t pci_device_detect(u16 seg, u8 bus, u8 dev, u8 func);
-- 
2.26.2


