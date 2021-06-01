Return-Path: <SRS0=atsh=K3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FBBC47099
	for <xen-devel@archiver.kernel.org>; Tue,  1 Jun 2021 16:12:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 404B060FD8
	for <xen-devel@archiver.kernel.org>; Tue,  1 Jun 2021 16:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 404B060FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.134991.251097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zn-0001EJ-O0; Tue, 01 Jun 2021 16:11:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134991.251097; Tue, 01 Jun 2021 16:11:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zn-0001D1-FS; Tue, 01 Jun 2021 16:11:59 +0000
Received: by outflank-mailman (input) for mailman id 134991;
 Tue, 01 Jun 2021 16:11:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo6zm-0005Ec-25
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:11:58 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.171])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc1433c2-08b3-4c9d-af2f-27f9947fd7e2;
 Tue, 01 Jun 2021 16:11:34 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBU1BG
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:30 +0200 (CEST)
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
X-Inumbo-ID: bc1433c2-08b3-4c9d-af2f-27f9947fd7e2
ARC-Seal: i=1; a=rsa-sha256; t=1622563890; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=gfvBK3rm3/R3R8slMSuvIEW5iMFWWgvTDeBPPf/JfLLEDErVU4b0BBhZvlpAl/U1fU
    1BEqNyQGG8fNotSFJF+UsE0GVrO0Bd7UTjDks25GmoEhLX1hKqQ7z5ASzb1p3eeODGXO
    QSOl4D3MKHXHuxCirEVNO9ePwLYTVX4XpDw9JSLwxj6VnnJrE7ULAKtTmplelYsryByD
    suz7yKUGMFRP/ZYSQ01kuNeSco5XpW01wu1XQv4aEGgvhtifd6kQgSVn/pVVzY9tbNjE
    +rPo+jQTRNUWxeW+tZbrF1rJ98A6PQVlfjYszv8+h9fbhWn0I+p5Jv7+AK9ZHHyclWAP
    3miA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563890;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=vfw3BzaI+AtROP8LqwGXxo+9GSxWRwpN3QZDZ8A0bxw=;
    b=kn8QxZANHcRrRWn34z0LNNH9t4PefGaDihf6CSyVrGAQGfua+RAJmsDoUjQCiDLTCL
    SyDdmXXKbZazK7InbtE+Q7kcJzIZABdN7uGqRyq/299EDng8qCsd5dWwshI2k26VxSoO
    cRJwCzO8e53RwSFx7EsKCeY+qnmBf+mvx4J0qc5o+6A3BEYQKpElDbGo3S/8/7jhzQSF
    tOrlRiHYpRlSueNf2x4SNC1gWP9hNkU6DruJaB8NYfIPq/xMb0+g3LJITxGHRrTM3Ob0
    fxthk/0YHII7n7aPt1dxuZltmy8456ph4Sz5QNdFHuY5pgqXOhneCg37iumSaPTRIu8t
    51Yg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563890;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=vfw3BzaI+AtROP8LqwGXxo+9GSxWRwpN3QZDZ8A0bxw=;
    b=RqAcStaHO1dwd0/znVRGXp/aK8OS5Dj9pZ9TV4CgY6qAnMADhOjX2QgDcD4JKb3PaC
    fF6oW+ib1BIiloMTwD1N4jdcYn2OTboVBEP91xy7BHGapPA/0kVmgwfJck/bSuJg7XMa
    PJfJUXF9OHDPnQ2JIZgNKm9KkULXlFIEdeljT+KZI6nCL4y4JfDyHXJEL1CdtsB7BcN/
    HZ3hUJ9ebfNx+hB/O2va2d2ptilEqDTZdy2NRlXFpAIDdhgBt52u/IWdR0t3p9OX6dTY
    HWmFksYWgr81/B5Z1lebvh7Q9LsyGC5yLjN4W84fmXueSElm3udOyAmSF7pQtNH2axV5
    +4XQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 11/38] tools/guest: save: move mfns array
Date: Tue,  1 Jun 2021 18:10:51 +0200
Message-Id: <20210601161118.18986-12-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move mfns array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/saverestore/common.h | 2 ++
 tools/libs/saverestore/save.c   | 7 ++-----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 0d94a4c01e..2335e6d27b 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -225,6 +225,8 @@ static inline int update_blob(struct xc_sr_blob *blob,
 
 struct xc_sr_save_arrays {
     xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
+    /* write_batch: Mfns of the batch pfns. */
+    xen_pfn_t mfns[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_restore_arrays {
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index b11ce70a11..1719ff08ba 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
@@ -88,7 +88,7 @@ static int write_checkpoint_record(struct xc_sr_context *ctx)
 static int write_batch(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
-    xen_pfn_t *mfns = NULL, *types = NULL;
+    xen_pfn_t *mfns = ctx->save.m->mfns, *types = NULL;
     void *guest_mapping = NULL;
     void **guest_data = NULL;
     void **local_pages = NULL;
@@ -105,8 +105,6 @@ static int write_batch(struct xc_sr_context *ctx)
 
     assert(nr_pfns != 0);
 
-    /* Mfns of the batch pfns. */
-    mfns = malloc(nr_pfns * sizeof(*mfns));
     /* Types of the batch pfns. */
     types = malloc(nr_pfns * sizeof(*types));
     /* Errors from attempting to map the gfns. */
@@ -118,7 +116,7 @@ static int write_batch(struct xc_sr_context *ctx)
     /* iovec[] for writev(). */
     iov = malloc((nr_pfns + 4) * sizeof(*iov));
 
-    if ( !mfns || !types || !errors || !guest_data || !local_pages || !iov )
+    if ( !types || !errors || !guest_data || !local_pages || !iov )
     {
         ERROR("Unable to allocate arrays for a batch of %u pages",
               nr_pfns);
@@ -277,7 +275,6 @@ static int write_batch(struct xc_sr_context *ctx)
     free(guest_data);
     free(errors);
     free(types);
-    free(mfns);
 
     return rc;
 }

