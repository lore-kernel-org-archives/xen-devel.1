Return-Path: <SRS0=bI9w=AI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B88C433E0
	for <xen-devel@archiver.kernel.org>; Sat, 27 Jun 2020 09:55:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5C122088E
	for <xen-devel@archiver.kernel.org>; Sat, 27 Jun 2020 09:55:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="F8a+xmak"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5C122088E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jp7Yi-00071y-OO; Sat, 27 Jun 2020 09:55:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M84L=AI=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jp7Yh-00071t-Uf
 for xen-devel@lists.xenproject.org; Sat, 27 Jun 2020 09:55:39 +0000
X-Inumbo-ID: 5a612ae6-b85c-11ea-8353-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a612ae6-b85c-11ea-8353-12813bfff9fa;
 Sat, 27 Jun 2020 09:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xjeUBoQCrN/DHWvdaE0IKA8sH/SoZ4DdwjG9sdN1ffY=; b=F8a+xmakUaJqm0pG+6tDocgp3j
 h4DDInQ9XU5v+VKtqBc6Lr0O9g/h5HLTpbUlXhyxXSfogJ51+vTfN1nK3eoXq0ubrXGK8+pQXIvzA
 SZIIWUJVgCKlhzYqqm25Iqsw/IdzuY8i+I8voW/jxZgzQatwZITHrktmXdjLIaAV9Kpw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jp7Yf-0005pP-MZ; Sat, 27 Jun 2020 09:55:37 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jp7Yf-00017R-Dg; Sat, 27 Jun 2020 09:55:37 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v4 for-4.14 1/2] pvcalls: Clearly spell out that the header is
 just a reference
Date: Sat, 27 Jun 2020 10:55:32 +0100
Message-Id: <20200627095533.14145-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200627095533.14145-1-julien@xen.org>
References: <20200627095533.14145-1-julien@xen.org>
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
Cc: Juergen Gross <jgross@suse.com>, Julien Grall <jgrall@amazon.com>,
 paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

A recent thread on xen-devel [1] pointed out that the header was
provided as a reference for the specification.

Unfortunately, this was never written down in xen.git so for an external
user (or a reviewer) it is not clear whether the spec or the header
shoudl be followed when there is a conflict.

To avoid more confusion, a paragraph is added at the top of the header
to clearly spell out it is only provided for reference.

[1] https://lore.kernel.org/xen-devel/alpine.DEB.2.21.2006151343430.9074@sstabellini-ThinkPad-T480s/

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v4:
        - New patch
---
 xen/include/public/io/pvcalls.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/include/public/io/pvcalls.h b/xen/include/public/io/pvcalls.h
index cb8171275c13..905880735dda 100644
--- a/xen/include/public/io/pvcalls.h
+++ b/xen/include/public/io/pvcalls.h
@@ -3,6 +3,9 @@
  *
  * Refer to docs/misc/pvcalls.markdown for the specification
  *
+ * The header is provided as a C reference for the specification. In
+ * case of conflict, the specification is authoritative.
+ *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to
  * deal in the Software without restriction, including without limitation the
-- 
2.17.1


