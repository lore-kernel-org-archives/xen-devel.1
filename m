Return-Path: <SRS0=weQ1=FI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84046C433FE
	for <xen-devel@archiver.kernel.org>; Fri,  4 Dec 2020 10:43:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 199F12251E
	for <xen-devel@archiver.kernel.org>; Fri,  4 Dec 2020 10:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 199F12251E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.44362.79484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl8Yj-0003iA-RD; Fri, 04 Dec 2020 10:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44362.79484; Fri, 04 Dec 2020 10:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl8Yj-0003i3-OK; Fri, 04 Dec 2020 10:43:29 +0000
Received: by outflank-mailman (input) for mailman id 44362;
 Fri, 04 Dec 2020 10:43:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c9tS=FI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kl8Yi-0003hJ-DN
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 10:43:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be81bdac-6978-4641-b6f8-899d2e316793;
 Fri, 04 Dec 2020 10:43:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C5CE9ACA8;
 Fri,  4 Dec 2020 10:43:26 +0000 (UTC)
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
X-Inumbo-ID: be81bdac-6978-4641-b6f8-899d2e316793
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607078606; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tdGwiXGrtPfpIpBSzV9nRg16FV7D/t1MJpPdOSzwDQg=;
	b=YMHvT5MH8Q4Gi4JZmmrcK3/x4tveblxtHaO2Ruh47dnZ1E+gxwaiS57bEyo4efU+j8jh1F
	3gpw7jAT+SEKtt9F59dC257IZtAbl+mjzd1/5TyIpjfjKgn7x37tcTjJQDj9zo776+XGKA
	WjG+yX/nPvaCvLli8oT73srnJBN9i5E=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] memory: avoid pointless continuation in
 xenmem_add_to_physmap()
Message-ID: <e41fb847-684e-2502-5261-56108ebaeab0@suse.com>
Date: Fri, 4 Dec 2020 11:43:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Adjust so we uniformly avoid needlessly arranging for a continuation on
the last iteration.

Fixes: 5777a3742d88 ("IOMMU: hold page ref until after deferred TLB flush")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -854,8 +854,9 @@ int xenmem_add_to_physmap(struct domain
             ++extra.ppage;
 
         /* Check for continuation if it's not the last iteration. */
-        if ( (++done >= ARRAY_SIZE(pages) && extra.ppage) ||
-             (xatp->size > done && hypercall_preempt_check()) )
+        if ( xatp->size > ++done &&
+             ((done >= ARRAY_SIZE(pages) && extra.ppage) ||
+              hypercall_preempt_check()) )
         {
             rc = start + done;
             break;

