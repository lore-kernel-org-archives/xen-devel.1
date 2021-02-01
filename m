Return-Path: <SRS0=1OSo=HD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C6CC433E0
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 23:35:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8CA464D90
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 23:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8CA464D90
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.80214.146608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ijM-00014o-VV; Mon, 01 Feb 2021 23:35:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80214.146608; Mon, 01 Feb 2021 23:35:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ijM-00014h-RY; Mon, 01 Feb 2021 23:35:40 +0000
Received: by outflank-mailman (input) for mailman id 80214;
 Mon, 01 Feb 2021 23:35:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWGu=HD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l6ijM-00014Z-74
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 23:35:40 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d46be8c9-ecc5-4d3c-b1a3-2e52b88c4e01;
 Mon, 01 Feb 2021 23:35:39 +0000 (UTC)
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
X-Inumbo-ID: d46be8c9-ecc5-4d3c-b1a3-2e52b88c4e01
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612222539;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lSsGlZ3RV0J0u057SkJDf9q9z6vf4wraLwwgAQ/Unkc=;
  b=VXNdHOiPUaADkLgl0Guqv8XQHiQPNpiKUcvCVmHsLWuZ8n3OxLA+Ldb8
   Nh1v6TK+WHcfzycHpSWEYe9ER+rt7YYHTRRY6/958Pa2+se3XniYn3kHA
   AHlJEtP5Apcx+wFadrhDOR6g6kzUY680CulwjVsjhtwwgVATyhcgmDrg6
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: uIVeiblegCeEtOCvCc2XeXfZzbg2CvcG5MIecgpfclTJ2uBXIAj3Nx4jNd2E0bV/Uk7VSbScxX
 Cfp2JAIVzjJVvCOb6AaKUN4k8/P4qgA5T1+0efq+mT9tK72NdH+ZwUEnKwW0g+Of7qwM+8MtcT
 wXyb7CSDsBwOk9Lf2H7/2cG8wn77x8+a6eKdKQpuueyj9t0qHRkC6twRNKNDbRL2QaiCZ5gD09
 eNAvzqipyTQElAp+1Ey/is06Vb9qy3vNW2iU2OCF/6SKLuD4J5QJQl87Kf5qnyldoVpRnJ2rjQ
 kIk=
X-SBRS: 5.1
X-MesageID: 36523363
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,393,1602561600"; 
   d="scan'208";a="36523363"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH] xenstore: Fix all builds
Date: Mon, 1 Feb 2021 23:35:13 +0000
Message-ID: <20210201233513.30923-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This diff is easier viewed through `cat -A`

  diff --git a/tools/xenstore/include/xenstore_state.h b/tools/xenstore/include/xenstore_state.h$
  index 1bd443f61a..f7e4da2b2c 100644$
  --- a/tools/xenstore/include/xenstore_state.h$
  +++ b/tools/xenstore/include/xenstore_state.h$
  @@ -21,7 +21,7 @@$
   #ifndef XENSTORE_STATE_H$
   #define XENSTORE_STATE_H$
   $
  -#if defined(__FreeBSD__) ||M-BM- defined(__NetBSD__)$
  +#if defined(__FreeBSD__) || defined(__NetBSD__)$
   #include <sys/endian.h>$
   #else$
   #include <endian.h>$

A non-breaking space isn't a valid C preprocessor token.

Fixes: ffbb8aa282de ("xenstore: fix build on {Net/Free}BSD")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
---
 tools/xenstore/include/xenstore_state.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xenstore/include/xenstore_state.h b/tools/xenstore/include/xenstore_state.h
index 1bd443f61a..f7e4da2b2c 100644
--- a/tools/xenstore/include/xenstore_state.h
+++ b/tools/xenstore/include/xenstore_state.h
@@ -21,7 +21,7 @@
 #ifndef XENSTORE_STATE_H
 #define XENSTORE_STATE_H
 
-#if defined(__FreeBSD__) || defined(__NetBSD__)
+#if defined(__FreeBSD__) || defined(__NetBSD__)
 #include <sys/endian.h>
 #else
 #include <endian.h>
-- 
2.11.0


