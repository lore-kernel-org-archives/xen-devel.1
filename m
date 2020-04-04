Return-Path: <SRS0=C12S=5U=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96EB4C2BA16
	for <xen-devel@archiver.kernel.org>; Sat,  4 Apr 2020 13:11:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6905C20659
	for <xen-devel@archiver.kernel.org>; Sat,  4 Apr 2020 13:11:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="f/JfCmsr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6905C20659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKiZN-0005oY-VK; Sat, 04 Apr 2020 13:10:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7qE9=5U=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jKiZM-0005nk-9I
 for xen-devel@lists.xenproject.org; Sat, 04 Apr 2020 13:10:40 +0000
X-Inumbo-ID: a8b10442-7675-11ea-be20-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8b10442-7675-11ea-be20-12813bfff9fa;
 Sat, 04 Apr 2020 13:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OCcHpjmQmhgOeKrDB+npwO03tYkJM3G16mLTFLIt6vs=; b=f/JfCmsrAcCypyBAiMdT1pYYlh
 yWlrNssjI//3TehSSFHdVMD5v6CeVPaM3FsHVQ2kxFLYrxdiBEQ12S4Pv4EcYt2ml/pxVScbHPioP
 UAS5CcC/aGD3YNPcYpbVk2RUKqJgdgruCYbtUiNG6SvMZutW5Cwq07onWvRiJD/01qBA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKiZB-0008Fa-R9; Sat, 04 Apr 2020 13:10:29 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKiZB-0007rM-IJ; Sat, 04 Apr 2020 13:10:29 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 2/7] xen/arm: kernel: Re-order the includes
Date: Sat,  4 Apr 2020 14:10:12 +0100
Message-Id: <20200404131017.27330-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404131017.27330-1-julien@xen.org>
References: <20200404131017.27330-1-julien@xen.org>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 julien@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

We usually have xen/ includes first and then asm/. They are also ordered
alphabetically among themselves.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/kernel.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 8eff074836..f95fa392af 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -3,20 +3,20 @@
  *
  * Copyright (C) 2011 Citrix Systems, Inc.
  */
+#include <xen/domain_page.h>
 #include <xen/errno.h>
+#include <xen/gunzip.h>
 #include <xen/init.h>
 #include <xen/lib.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/mm.h>
-#include <xen/domain_page.h>
 #include <xen/sched.h>
-#include <asm/byteorder.h>
-#include <asm/setup.h>
-#include <xen/libfdt/libfdt.h>
-#include <xen/gunzip.h>
 #include <xen/vmap.h>
 
+#include <asm/byteorder.h>
 #include <asm/guest_access.h>
 #include <asm/kernel.h>
+#include <asm/setup.h>
 
 #define UIMAGE_MAGIC          0x27051956
 #define UIMAGE_NMLEN          32
-- 
2.17.1


