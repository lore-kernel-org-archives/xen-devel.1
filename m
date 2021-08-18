Return-Path: <SRS0=jJV9=NJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4CEAC4338F
	for <xen-devel@archiver.kernel.org>; Wed, 18 Aug 2021 10:22:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E36360F35
	for <xen-devel@archiver.kernel.org>; Wed, 18 Aug 2021 10:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E36360F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.168167.307020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGIi1-0003lt-2i; Wed, 18 Aug 2021 10:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168167.307020; Wed, 18 Aug 2021 10:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGIi0-0003lm-VW; Wed, 18 Aug 2021 10:22:08 +0000
Received: by outflank-mailman (input) for mailman id 168167;
 Wed, 18 Aug 2021 10:22:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jUNG=NJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mGIhy-0003kv-St
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 10:22:06 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e79ae6b2-c2eb-41aa-a790-add22f77bac3;
 Wed, 18 Aug 2021 10:21:45 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 179A221FC9;
 Wed, 18 Aug 2021 10:21:45 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id DBE351371C;
 Wed, 18 Aug 2021 10:21:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 56UyNDjfHGHPKAAAGKfGzw
 (envelope-from <jgross@suse.com>); Wed, 18 Aug 2021 10:21:44 +0000
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
X-Inumbo-ID: e79ae6b2-c2eb-41aa-a790-add22f77bac3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1629282105; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j6goPlF6m/fnnA5czBTWQ1HEjkS7BVzvBVwxwvndH7A=;
	b=qwc/k597Z+4iwQkdL3jbBGhl3jMRqXJtrw16jPJ61zF/2Dk/4FVjZ2/313NoqcpHyk3VkO
	AFGGXvHfMLapIiu2DYnQDiiyNqMoxb7hoWz+Y2fD3TJTDVRgikY9pD/I1m/IJFF//tIn/o
	JibjYw6z2C2WSQd4xoDKtLAK1r9UwD4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] xen/sched: fix get_cpu_idle_time() for smt=0 suspend/resume
Date: Wed, 18 Aug 2021 12:21:36 +0200
Message-Id: <20210818102136.23797-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With smt=0 during a suspend/resume cycle of the machine the threads
which have been parked before will briefly come up again. This can
result in problems e.g. with cpufreq driver being active as this will
call into get_cpu_idle_time() for a cpu without initialized scheduler
data.

Fix that by letting get_cpu_idle_time() deal with this case.

Fixes: 132cbe8f35632fb2 ("sched: fix get_cpu_idle_time() with core scheduling")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
An alternative way to fix the issue would be to keep the sched_resource
of offline cpus allocated like we already do with idle vcpus and units.
This fix would be more intrusive, but it would avoid similar other bugs
like this one.
---
 xen/common/sched/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 6d34764d38..9ac1b01ca8 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -337,7 +337,7 @@ uint64_t get_cpu_idle_time(unsigned int cpu)
     struct vcpu_runstate_info state = { 0 };
     const struct vcpu *v = idle_vcpu[cpu];
 
-    if ( cpu_online(cpu) && v )
+    if ( cpu_online(cpu) && v && get_sched_res(cpu) )
         vcpu_runstate_get(v, &state);
 
     return state.time[RUNSTATE_running];
-- 
2.26.2


