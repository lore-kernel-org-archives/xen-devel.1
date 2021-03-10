Return-Path: <SRS0=92qd=II=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF99C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 10 Mar 2021 10:13:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CFB564FDF
	for <xen-devel@archiver.kernel.org>; Wed, 10 Mar 2021 10:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CFB564FDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.95948.181188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJvpy-00005J-A3; Wed, 10 Mar 2021 10:13:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95948.181188; Wed, 10 Mar 2021 10:13:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJvpy-00005B-6F; Wed, 10 Mar 2021 10:13:06 +0000
Received: by outflank-mailman (input) for mailman id 95948;
 Wed, 10 Mar 2021 10:13:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W5NQ=II=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJvpw-0008WR-Ie
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 10:13:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0cec7fd-a36d-44d1-a694-87b6a78d97f2;
 Wed, 10 Mar 2021 10:13:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E4930AE55;
 Wed, 10 Mar 2021 10:13:02 +0000 (UTC)
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
X-Inumbo-ID: e0cec7fd-a36d-44d1-a694-87b6a78d97f2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615371183; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xSz8z++nz7zo0taD7a44rCc2zm2DDN7sLhZYwx3QeEc=;
	b=HYcMtDq7ts2An7e3foPmAye24NID+F3VGATq4wkH+wpHBQqE0oyEmQI/Vn76SrD41sl34N
	2ejFbJUJI2PNHtui4pz3zZtiiNzHyhRSQE4ePqcmv6vV8EPOQ1ddR4mtaq+7q9pTJsI48n
	JKAnU55YXkgHemMN67HJsXXUj0t72TI=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH][4.15] gnttab: work around "may be used uninitialized" warning
Message-ID: <a6b73c54-3010-6716-cac3-8f3b462a4dc7@suse.com>
Date: Wed, 10 Mar 2021 11:13:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sadly I was wrong to suggest dropping vaddrs' initializer during review
of v2 of the patch introducing this code. gcc 4.3 can't cope.

Fixes: 52531c734ea1 ("xen/gnttab: Rework resource acquisition")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -4026,7 +4026,7 @@ int gnttab_acquire_resource(
     struct grant_table *gt = d->grant_table;
     unsigned int i, final_frame;
     mfn_t tmp;
-    void **vaddrs;
+    void **vaddrs = NULL;
     int rc = -EINVAL;
 
     if ( !nr_frames )

