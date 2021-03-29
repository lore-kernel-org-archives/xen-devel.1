Return-Path: <SRS0=2Bwx=I3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE8CC433E0
	for <xen-devel@archiver.kernel.org>; Mon, 29 Mar 2021 16:15:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0417161582
	for <xen-devel@archiver.kernel.org>; Mon, 29 Mar 2021 16:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0417161582
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.103133.196803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQuY5-0006yN-TM; Mon, 29 Mar 2021 16:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103133.196803; Mon, 29 Mar 2021 16:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQuY5-0006yE-PQ; Mon, 29 Mar 2021 16:15:29 +0000
Received: by outflank-mailman (input) for mailman id 103133;
 Mon, 29 Mar 2021 16:15:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HZ2U=I3=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lQuY4-0006xD-2G
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 16:15:28 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id beda1008-b54a-4e52-ab33-62ecc65ad82e;
 Mon, 29 Mar 2021 16:15:22 +0000 (UTC)
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
X-Inumbo-ID: beda1008-b54a-4e52-ab33-62ecc65ad82e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617034522;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rsbB80Z+MtoLXJPWt4c9ZDuGpXTAkeQclsLqPn5oUbg=;
  b=hSjL2kpdM6Y6rkv2K6TDFLxYhukF8sieWUumeLzpiyEdKCbjlMEFZNUn
   s4Gl4gAemfSQg1taBUziyvQkFX5roLQUeTFai9jmeYSj5+K7cu0UF1ZdZ
   NcOsKD6SciPrP3RIoiraOZ7LT2sZaRF4bw/WDU/C44/sNmNVg6EXohanF
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: pRdPk4hgWNsjmiYdNVRciXVpDAMtJmv3q+U9SXhPdkw4YHQy0GdsZjHWVH8OGJS86I/IF0cSXn
 axivYIixGh10afwfeR0QqTPJLfMU5hdNbcoqDWEatWXfjAFz63tvNkhnWTAdBunRky27xev0uR
 Q3B81K7rm16W1nNzPwIcIZzgr4r9XoXY0ACTxUBRxIqYk2Ly4ETk3tqSrim1GZF5HPplMu+9MD
 8qRmbDk5axIZeDYTRdeBLPL/VXaFkmYoCtV/2hCx8XxhjsI/WZTa3qJldRfitZF06ua3GvmIzK
 sv8=
X-SBRS: 5.1
X-MesageID: 40346953
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:bPJn4qmJaMXKazBxZ6v47cZ6cfTpDfKp3DAbvn1ZSRFFG/Gwve
 rGppom/DXzjyscX2xlpMuJP7OOTWiZ2Zl+54QQOrnKZniehEKDKoZ+4Yz+hwDxAiGWzJ866Y
 5Me7VzYeeRMXFUlsD/iTPVL/8Bx529/LmslaPiyR5WPGRXQoVByys8NQqBCE1xQ2B9dP0EPb
 6R/NBOqTblWVl/VLXZOlA/U+LOp8LGmfvdCHZsbXMawTKDgj+y5LnxHwLw5GZ7bxp1zao/6m
 +AqgTl58yYwomG4yXB3Gze5Yk+orrc4+ZEbfbituElbhHligOlf+1aKt+/gAw=
X-IronPort-AV: E=Sophos;i="5.81,288,1610427600"; 
   d="scan'208";a="40346953"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Ian Jackson
	<ian.jackson@citrix.com>, Manuel Bouyer <bouyer@netbsd.org>
Subject: [PATCH v2 for-4.15 4/7] CHANGELOG.md: NetBSD lib/gnttab support
Date: Mon, 29 Mar 2021 17:14:54 +0100
Message-ID: <20210329161457.345360-4-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210329161457.345360-1-george.dunlap@citrix.com>
References: <20210329161457.345360-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Release-acked-by: Ian Jackson <ian.jackson@citrix.com>
---
CC: Manuel Bouyer <bouyer@netbsd.org>
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 538eae611c..fdad864a1f 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -13,6 +13,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - Intel Processor Trace support (Tech Preview)
  - Named PCI devices for xl/libxl
  - Support for zstd-compressed dom0 and domU kernels
+ - Library improvements from NetBSD ports upstreamed
 
 ## Removed / support downgraded
 
-- 
2.30.2


