Return-Path: <SRS0=4CEK=PU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F11C433F5
	for <xen-devel@archiver.kernel.org>; Mon,  1 Nov 2021 15:20:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 483BA60F3A
	for <xen-devel@archiver.kernel.org>; Mon,  1 Nov 2021 15:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 483BA60F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.219247.380024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhZ75-0002eV-8R; Mon, 01 Nov 2021 15:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219247.380024; Mon, 01 Nov 2021 15:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhZ75-0002dT-2O; Mon, 01 Nov 2021 15:20:43 +0000
Received: by outflank-mailman (input) for mailman id 219247;
 Mon, 01 Nov 2021 15:20:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rWtG=PU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mhZ73-0008DA-Lp
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 15:20:41 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22cb0646-6ed1-444d-b4ee-696eeed338ea;
 Mon, 01 Nov 2021 15:20:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1AAD821952;
 Mon,  1 Nov 2021 15:20:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D1FC213A4A;
 Mon,  1 Nov 2021 15:20:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iHz7MbYFgGFzNwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 01 Nov 2021 15:20:22 +0000
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
X-Inumbo-ID: 22cb0646-6ed1-444d-b4ee-696eeed338ea
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635780023; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=deHLBylG4X2v49da24jAIDVEMEgr0x2usatipBvqMas=;
	b=Bzvb+9agc3JDa9ftu+zK7oLID3F4Zo4yHhXEUg7gnUuWVpMeYQWXv6jFAb5cNFVLS0B4aQ
	LXHEQKhCfvK355CZqYg0WKc1g+LA28Hv1lpLwFohzRv+NTTG6FkcvtbygxJ+LlgPaxDB6y
	JGHsLiee1/cZXntPHPBk/jcEj7+9b4g=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 14/15] xen: drop calls_to_multicall performance counter
Date: Mon,  1 Nov 2021 16:20:14 +0100
Message-Id: <20211101152015.28488-15-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211101152015.28488-1-jgross@suse.com>
References: <20211101152015.28488-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The calls_to_multicall performance counter is basically redundant to
the multicall hypercall counter. The only difference is the counting
of continuation calls, which isn't really that interesting.

Drop the calls_to_multicall performance counter.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 xen/common/multicall.c       | 1 -
 xen/include/xen/perfc_defn.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/xen/common/multicall.c b/xen/common/multicall.c
index 7b20717c88..2e66f9f0c1 100644
--- a/xen/common/multicall.c
+++ b/xen/common/multicall.c
@@ -114,7 +114,6 @@ do_multicall(
     if ( unlikely(disp == mc_preempt) && i < nr_calls )
         goto preempted;
 
-    perfc_incr(calls_to_multicall);
     perfc_add(calls_from_multicall, i);
     mcs->flags = 0;
     return rc;
diff --git a/xen/include/xen/perfc_defn.h b/xen/include/xen/perfc_defn.h
index 08b182ccd9..eb6152859e 100644
--- a/xen/include/xen/perfc_defn.h
+++ b/xen/include/xen/perfc_defn.h
@@ -6,7 +6,6 @@
 
 PERFCOUNTER_ARRAY(hypercalls,           "hypercalls", NR_hypercalls)
 
-PERFCOUNTER(calls_to_multicall,         "calls to multicall")
 PERFCOUNTER(calls_from_multicall,       "calls from multicall")
 
 PERFCOUNTER(irqs,                   "#interrupts")
-- 
2.26.2


