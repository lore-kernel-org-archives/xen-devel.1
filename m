Return-Path: <SRS0=Kz/T=JU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F88C433B4
	for <xen-devel@archiver.kernel.org>; Fri, 23 Apr 2021 05:41:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C7F86115B
	for <xen-devel@archiver.kernel.org>; Fri, 23 Apr 2021 05:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C7F86115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.115886.221148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZoYW-0002TF-TY; Fri, 23 Apr 2021 05:40:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115886.221148; Fri, 23 Apr 2021 05:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZoYW-0002T7-PD; Fri, 23 Apr 2021 05:40:44 +0000
Received: by outflank-mailman (input) for mailman id 115886;
 Fri, 23 Apr 2021 05:40:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hwNy=JU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lZoYV-0002T2-JT
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 05:40:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b943e409-507d-422d-9926-a6dc5f74275f;
 Fri, 23 Apr 2021 05:40:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 900A8AEFF;
 Fri, 23 Apr 2021 05:40:40 +0000 (UTC)
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
X-Inumbo-ID: b943e409-507d-422d-9926-a6dc5f74275f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619156440; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NZgPMke49PfmASyT+K1h7cCq8emc+deK1BAEsqWaEPw=;
	b=nTAr2IN5DBYPkCFqqq+eLwiXMbbGmun0odKrA+jJl9NkITBehpkoRHRYzfVNtvBzmoeuIx
	uYmVjrOyOHPTYfbyo4bnoAYOUgajPgFeLwqQQW5KmbeogJnwctPoA7R3s8xLQFI1UgkAWo
	bsa7Mo+q2jzxdBaftOmifhikTfSdt7I=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	stable@vger.kernel.org,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] xen/gntdev: fix gntdev_mmap() error exit path
Date: Fri, 23 Apr 2021 07:40:38 +0200
Message-Id: <20210423054038.26696-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit d3eeb1d77c5d0af ("xen/gntdev: use mmu_interval_notifier_insert")
introduced an error in gntdev_mmap(): in case the call of
mmu_interval_notifier_insert_locked() fails the exit path should not
call mmu_interval_notifier_remove(), as this might result in NULL
dereferences.

One reason for failure is e.g. a signal pending for the running
process.

Fixes: d3eeb1d77c5d0af ("xen/gntdev: use mmu_interval_notifier_insert")
Cc: stable@vger.kernel.org
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/gntdev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index f01d58c7a042..a3e7be96527d 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -1017,8 +1017,10 @@ static int gntdev_mmap(struct file *flip, struct vm_area_struct *vma)
 		err = mmu_interval_notifier_insert_locked(
 			&map->notifier, vma->vm_mm, vma->vm_start,
 			vma->vm_end - vma->vm_start, &gntdev_mmu_ops);
-		if (err)
+		if (err) {
+			map->vma = NULL;
 			goto out_unlock_put;
+		}
 	}
 	mutex_unlock(&priv->lock);
 
-- 
2.26.2


