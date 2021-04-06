Return-Path: <SRS0=uqgo=JD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39BEEC433B4
	for <xen-devel@archiver.kernel.org>; Tue,  6 Apr 2021 19:16:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B41316138B
	for <xen-devel@archiver.kernel.org>; Tue,  6 Apr 2021 19:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B41316138B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.106262.203249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTrB9-0003KI-Cx; Tue, 06 Apr 2021 19:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106262.203249; Tue, 06 Apr 2021 19:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTrB9-0003KB-7t; Tue, 06 Apr 2021 19:15:59 +0000
Received: by outflank-mailman (input) for mailman id 106262;
 Tue, 06 Apr 2021 19:15:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTrB7-0003K1-Bl
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 19:15:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTrB7-0005WU-3h; Tue, 06 Apr 2021 19:15:57 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTrB6-0000Jq-Qx; Tue, 06 Apr 2021 19:15:57 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=sDGEHF39zFGZyELm+jyFow2YFF3B1K268E33vzxWd5Y=; b=OZAnBc6X721bAtOGBshJa0Gn35
	ucTToMYW/epkY2aYkW3tbv/iQK8CIjKQvS0H+19czmVzFNI8NcerV3ulXs+Kaf47SL5Gd23uNOi2F
	nKyOa34+cl1DWIf9vDR6NPsB1B/dpog5duo6ENwcBGe5H+0vPfulV6Bs/UOgy/Lt3IOA=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2] xen/arm: kernel: Propagate the error if we fail to decompress the kernel
Date: Tue,  6 Apr 2021 20:15:54 +0100
Message-Id: <20210406191554.12012-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Currently, we are ignoring any error from perform_gunzip() and replacing
the compressed kernel with the "uncompressed" kernel.

If there is a gzip failure, then it means that the output buffer may
contain garbagge. So it can result to various sort of behavior that may
be difficult to root cause.

In case of failure, free the output buffer and propagate the error.
We also need to adjust the return check for kernel_compress() as
perform_gunzip() may return a positive value.

Take the opportunity to adjust the code style for the check.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - Fix build
---
 xen/arch/arm/kernel.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index ab78689ed2a6..8f43caa1866d 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -292,6 +292,12 @@ static __init int kernel_decompress(struct bootmodule *mod)
     iounmap(input);
     vunmap(output);
 
+    if ( rc )
+    {
+        free_domheap_pages(pages, kernel_order_out);
+        return rc;
+    }
+
     mod->start = page_to_maddr(pages);
     mod->size = output_size;
 
@@ -503,7 +509,7 @@ int __init kernel_probe(struct kernel_info *info,
 
     /* if it is a gzip'ed image, 32bit or 64bit, uncompress it */
     rc = kernel_decompress(mod);
-    if (rc < 0 && rc != -EINVAL)
+    if ( rc && rc != -EINVAL )
         return rc;
 
 #ifdef CONFIG_ARM_64
-- 
2.17.1


