Return-Path: <SRS0=rAmU=GC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 906AAC433E0
	for <xen-devel@archiver.kernel.org>; Wed, 30 Dec 2020 06:49:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DCCA21919
	for <xen-devel@archiver.kernel.org>; Wed, 30 Dec 2020 06:49:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DCCA21919
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.60081.105372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuVIP-0003pn-3g; Wed, 30 Dec 2020 06:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60081.105372; Wed, 30 Dec 2020 06:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuVIP-0003pg-0Q; Wed, 30 Dec 2020 06:49:21 +0000
Received: by outflank-mailman (input) for mailman id 60081;
 Wed, 30 Dec 2020 06:38:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cN0i=GC=linux.alibaba.com=abaci-bugfix@srs-us1.protection.inumbo.net>)
 id 1kuV7n-0002pP-P1
 for xen-devel@lists.xenproject.org; Wed, 30 Dec 2020 06:38:23 +0000
Received: from out30-130.freemail.mail.aliyun.com (unknown [115.124.30.130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cce28589-9e69-4d2f-af03-5260576862af;
 Wed, 30 Dec 2020 06:38:21 +0000 (UTC)
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:abaci-bugfix@linux.alibaba.com
 fp:SMTPD_---0UKCfVeh_1609310288) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 30 Dec 2020 14:38:15 +0800
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
X-Inumbo-ID: cce28589-9e69-4d2f-af03-5260576862af
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R971e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=abaci-bugfix@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0UKCfVeh_1609310288;
From: YANG LI <abaci-bugfix@linux.alibaba.com>
To: boris.ostrovsky@oracle.com
Cc: jgross@suse.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	YANG LI <abaci-bugfix@linux.alibaba.com>
Subject: [PATCH] xen: fix: use WARN_ON instead of if condition followed by BUG.
Date: Wed, 30 Dec 2020 14:38:06 +0800
Message-Id: <1609310286-77985-1-git-send-email-abaci-bugfix@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1

Use WARN_ON instead of if condition followed by BUG in
gnttab_batch_map() and gnttab_batch_copy().

This issue was detected with the help of coccicheck.

Signed-off-by: YANG LI <abaci-bugfix@linux.alibaba.com>
Reported-by: Abaci <abaci@linux.alibaba.com>
---
 drivers/xen/grant-table.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index 3729bea..db1770c 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -1080,8 +1080,8 @@ void gnttab_batch_map(struct gnttab_map_grant_ref *batch, unsigned count)
 {
 	struct gnttab_map_grant_ref *op;
 
-	if (HYPERVISOR_grant_table_op(GNTTABOP_map_grant_ref, batch, count))
-		BUG();
+	WARN_ON(HYPERVISOR_grant_table_op(GNTTABOP_map_grant_ref, batch, count));
+
 	for (op = batch; op < batch + count; op++)
 		if (op->status == GNTST_eagain)
 			gnttab_retry_eagain_gop(GNTTABOP_map_grant_ref, op,
@@ -1093,8 +1093,8 @@ void gnttab_batch_copy(struct gnttab_copy *batch, unsigned count)
 {
 	struct gnttab_copy *op;
 
-	if (HYPERVISOR_grant_table_op(GNTTABOP_copy, batch, count))
-		BUG();
+	WARN_ON(HYPERVISOR_grant_table_op(GNTTABOP_copy, batch, count));
+
 	for (op = batch; op < batch + count; op++)
 		if (op->status == GNTST_eagain)
 			gnttab_retry_eagain_gop(GNTTABOP_copy, op,
-- 
1.8.3.1


