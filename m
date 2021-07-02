Return-Path: <SRS0=Zy1u=L2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC16C07E97
	for <xen-devel@archiver.kernel.org>; Fri,  2 Jul 2021 19:04:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D36161416
	for <xen-devel@archiver.kernel.org>; Fri,  2 Jul 2021 19:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D36161416
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.149302.276046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzOS4-0004bM-Vq; Fri, 02 Jul 2021 19:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149302.276046; Fri, 02 Jul 2021 19:03:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzOS4-0004bF-Sm; Fri, 02 Jul 2021 19:03:48 +0000
Received: by outflank-mailman (input) for mailman id 149302;
 Fri, 02 Jul 2021 19:03:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wENR=L2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lzOS4-0004b9-9L
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 19:03:48 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6e9edb3-9766-4be2-bc1d-fa69b044b748;
 Fri, 02 Jul 2021 19:03:47 +0000 (UTC)
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
X-Inumbo-ID: c6e9edb3-9766-4be2-bc1d-fa69b044b748
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625252627;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9SOX91f3hRKaTPe6o7t7fdvabRZeV3+jzwC4q2f8vfM=;
  b=bn69MBVXlWBsAm+FCU7jyg8GCjykMDEfQihg/+C26zyHbZcSmVB8tIq3
   lAAHfeXfiAkMveYiW2ZDU54qQM0ubs82BsFf9xXFLZsHZHSor6/ZjeuTO
   /NkaO05AZyIebkEiDONwdno/GE1kLJqAPkcC8lZsrqSagbLztFEcOjwjn
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: kZ7R2aNXK7xosx3lmuMrbGttPgNSIrQL4vk030p8lm94pJ0XiFcPJ5cnbqHXIgiYpJ1fRRzs1d
 Jn8CVj4R/RVg1LutiETFu30iA8dulbNCkvsRwxEMRBT0FG0/rUENVek2trmRLlyuPhaX+RPfKV
 sxau0udUq26yzxUNkVtKZhkrNLMuO4zDz+t4T2b13vRztdqxK6Oa3UUja4c1j6uU8cbBYT68rN
 IjX2CMRY5ovRksE//znyjRH3qVcfsLYatG7TLaKJREabVFFUFxwZSRd+HxRQzkfO3k8f8q5w2x
 7A4=
X-SBRS: 5.1
X-MesageID: 47863081
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:vmWBBK2BjUq/ipG/pBjcaQqjBLwkLtp133Aq2lEZdPRUGvb4qy
 nIpoV86faUskd3ZJhOo6HiBEDtexzhHP1OkO0s1NWZLWvbUQKTRekIh+aP/9SJIVyGygc378
 ddmsZFZuEYdWIK6PrH3A==
X-IronPort-AV: E=Sophos;i="5.83,319,1616472000"; 
   d="scan'208";a="47863081"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, Olaf Hering <olaf@aepfle.de>
Subject: [PATCH] tools/libxenguest: Fix max_extd_leaf calculation for legacy restore
Date: Fri, 2 Jul 2021 20:03:34 +0100
Message-ID: <20210702190334.31271-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

0x1c is lower than any value which will actually be observed in
p->extd.max_leaf, but higher than the logical 9 leaves worth of extended data
on Intel systems, causing x86_cpuid_copy_to_buffer() to fail with -ENOBUFS.

Correct the calculation.

The problem was first noticed in c/s 34990446ca9 "libxl: don't ignore the
return value from xc_cpuid_apply_policy" but introduced earlier.

Fixes: 34990446ca91 ("libxl: don't ignore the return value from xc_cpuid_apply_policy")
Reported-by: Olaf Hering <olaf@aepfle.de>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Ian Jackson <iwj@xenproject.org>
CC: Olaf Hering <olaf@aepfle.de>

Olaf - as I've changed the fix, I haven't included your T-by tag, but I'm
confident that this will suitably address the issue.
---
 tools/libs/guest/xg_cpuid_x86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index e01d657e0394..0c9c4fefc1ef 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -513,7 +513,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         /* Clamp maximum leaves to the ones supported on 4.12. */
         p->basic.max_leaf = min(p->basic.max_leaf, 0xdu);
         p->feat.max_subleaf = 0;
-        p->extd.max_leaf = min(p->extd.max_leaf, 0x1cu);
+        p->extd.max_leaf = min(p->extd.max_leaf, 0x8000001c);
     }
 
     if ( featureset )
-- 
2.11.0


