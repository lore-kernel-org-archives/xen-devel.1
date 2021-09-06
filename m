Return-Path: <SRS0=XIDt=N4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BBCC433F5
	for <xen-devel@archiver.kernel.org>; Mon,  6 Sep 2021 11:01:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB72360EBA
	for <xen-devel@archiver.kernel.org>; Mon,  6 Sep 2021 11:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB72360EBA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.179627.325993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNCN8-00082G-4O; Mon, 06 Sep 2021 11:01:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179627.325993; Mon, 06 Sep 2021 11:01:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNCN8-000829-1F; Mon, 06 Sep 2021 11:01:06 +0000
Received: by outflank-mailman (input) for mailman id 179627;
 Mon, 06 Sep 2021 11:01:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t7g0=N4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mNCN7-000823-0l
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 11:01:05 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b655369a-290f-481c-ae76-3e0f87498c2b;
 Mon, 06 Sep 2021 11:01:04 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6D415220EA;
 Mon,  6 Sep 2021 11:01:03 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 3298213942;
 Mon,  6 Sep 2021 11:01:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id gFtICu/0NWFbGQAAGKfGzw
 (envelope-from <jgross@suse.com>); Mon, 06 Sep 2021 11:01:03 +0000
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
X-Inumbo-ID: b655369a-290f-481c-ae76-3e0f87498c2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1630926063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BrS40Tf/KPD9CQCWVNVJ4t3+lx1YVOcmmtx8WpJDnlY=;
	b=bejh5fc5k+w1U6ChtsJEM6gYGML9shAdNIMcvQWDi+PEXtdSQJBOTjexaAnNTUqHjpiSNi
	VTRoOLFZWRlX8K7yRTmMpcpyPzKYfkpiFOQt4dNDzOGWujkiLaoTiIs//4sRYDI9LHd45i
	gzOgfWigAns23QVOD9Zgar5PfP5VXfk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH] xen/sched: fix sched_move_domain() for domain without vcpus
Date: Mon,  6 Sep 2021 13:00:57 +0200
Message-Id: <20210906110057.15384-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case a domain is created with a cpupool other than Pool-0 specified
it will be moved to that cpupool before any vcpus are allocated.

This will lead to a NULL pointer dereference in sched_move_domain().

Fix that by tolerating vcpus not being allocated yet.

Fixes: 70fadc41635b9b6 ("xen/cpupool: support moving domain between cpupools with different granularity")
Reported-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 8d178baf3d..79c9100680 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -671,6 +671,10 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
 
     for ( unit_idx = 0; unit_idx < n_units; unit_idx++ )
     {
+        /* Special case for move at domain creation time. */
+        if ( !d->vcpu[unit_idx * gran] )
+            break;
+
         unit = sched_alloc_unit_mem();
         if ( unit )
         {
-- 
2.26.2


