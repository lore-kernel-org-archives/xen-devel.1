Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7680F606A887
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 13:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mHHNNtor
Received: from list by lists.xenproject.org with outflank-mailman.1492480.1693007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTIyP-0004nd-Tk; Tue, 17 Nov 2026 13:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492480.1693007; Tue, 17 Nov 2026 13:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTIyP-0004nW-Pt; Tue, 17 Nov 2026 13:11:45 +0000
Received: by outflank-mailman (input) for mailman id 1492480;
 Tue, 17 Nov 2026 13:11:43 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <haoxiang_li2024@163.com>) id 1xTIyM-0004nK-4x
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 13:11:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTIyK-004fKD-VO
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 14:11:41 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <haoxiang_li2024@163.com>)
 id 6afc5283-bab6-0a2a0a5309dd-0a2a450ce20a-24
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 14:11:38 +0100
Received: from [220.197.31.2] (helo=m16.mail.163.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <haoxiang_li2024@163.com>)
 id 6afc5287-f479-0a2a450c0019-dcc51f027fd8-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 14:11:37 +0100
Received: from localhost.localdomain (unknown [])
 by gzsmtp4 (Coremail) with SMTP id PygvCgD3F51yUvxqV94CGg--.35035S2;
 Tue, 17 Nov 2026 21:11:16 +0800 (CST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=s110527 header.d=163.com header.i="@163.com" header.h="From:To:Subject:Date:Message-Id:MIME-Version"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=uY
	jgRnG7F/qHd9d76sHl73jFLXyEHd1QSP4s60O6uMc=; b=mHHNNtorD+IfNmIrbo
	pFlisDLlF5Er8yc0d140iV1fGOa0MDvWRPiObuy4uqFrC9Cm2ovMEzzDYUBpGI+y
	APDip7qsAJaWuNz7V5BTPdjDsUo4AwpsZFBFcndaJcaUF0X45Qp+eszR/fKNT26U
	s1qszpxxoywy4G7k9EW2Z2P5k=
From: Haoxiang Li <haoxiang_li2024@163.com>
To: roger@xenproject.org,
	axboe@kernel.dk,
	jeremy.fitzhardinge@citrix.com,
	konrad.wilk@oracle.com
Cc: xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] xen/blkback: Fix memory leak in xen_blkif_init()
Date: Tue, 17 Nov 2026 21:11:14 +0800
Message-Id: <20261117131114.1393829-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgD3F51yUvxqV94CGg--.35035S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw1Duw4rGFyUAry5Ww15Jwb_yoWfAFb_Wr
	48Ars7Xrs3uw1DCa4DCFn7Ary293y8Zr4Ik3WSq3s3tayxWr12q3yqgrn5Crs3ua17C345
	JFyUXr1ayr10kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRubyCUUUUUU==
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7hSL+Wr8UnQNXwAA3q
X-purgate-ID: tlsNG-d25034/1794921098-036D6A5B-0F996873/0/0
X-purgate-type: clean
X-purgate-size: 872
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If xen_blkif_xenbus_init() fails, xen_blkif_init() returns without
destroying the slab cache created by xen_blkif_interface_init().

Call xen_blkif_interface_fini() on this error path.

Fixes: 8770b2683f9f ("Fix compile warnings: ignoring return value of 'xenbus_register_backend' ..")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/block/xen-blkback/blkback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index 88526e349ce1..6c25da65e46e 100644
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -1553,7 +1553,7 @@ static int __init xen_blkif_init(void)
 
 	rc = xen_blkif_xenbus_init();
 	if (rc)
-		goto failed_init;
+		xen_blkif_interface_fini();
 
  failed_init:
 	return rc;
-- 
2.25.1


