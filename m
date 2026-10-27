Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B74606A31B
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 04:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=boeing.com header.i=@boeing.com header.a=rsa-sha256 header.s=boeing-s1912 header.b=b0dBLwu4
Received: from list by lists.xenproject.org with outflank-mailman.1461813.1672814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLYlO-0008JY-KL; Tue, 27 Oct 2026 04:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461813.1672814; Tue, 27 Oct 2026 04:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLYlO-0008JR-H8; Tue, 27 Oct 2026 04:26:18 +0000
Received: by outflank-mailman (input) for mailman id 1461813;
 Tue, 27 Oct 2026 04:26:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.kang@boeing.com>) id 1xLYlM-0008JL-GL
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 04:26:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLYlL-0015So-M6
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 05:26:15 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.kang@boeing.com>)
 id 6ae02777-8faa-0a2a0a5109dd-0a2a450c8c28-32
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 05:26:14 +0100
Received: from [130.76.184.179] (helo=phx-mbsout-02.mbs.boeing.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.kang@boeing.com>)
 id 6ae027e3-f479-0a2a450c0019-824cb8b373ea-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 05:26:13 +0100
Received: from localhost (localhost [127.0.0.1])
 by phx-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 69R4Q8wd048548; Mon, 26 Oct 2026 21:26:10 -0700
Received: from phx-av-01.mbs.boeing.net (phx-av-01.mbs.boeing.net
 [137.136.102.153])
 by phx-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 69R4Q4BT048524
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 26 Oct 2026 21:26:04 -0700
Received: from localhost (localhost [127.0.0.1])
 by phx-av-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_RELAY) with SMTP id
 69R4Q4qC027441; Mon, 26 Oct 2026 21:26:04 -0700
Received: from A6432926.boeing.com (a6432926.nos.boeing.com [10.191.242.9])
 by phx-av-01.mbs.boeing.net (8.15.2/8.15.2/UPSTREAM_RELAY) with ESMTP id
 69R4PwCq027213; Mon, 26 Oct 2026 21:25:59 -0700
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=boeing-s1912 header.d=boeing.com header.i="@boeing.com" header.h="From:To:Cc:Subject:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1793075170;
	bh=yNF0nH1bHsqEI3gUKUcz6VAeO/dpQ8c3fM8UfEcgqJc=;
	h=From:To:Cc:Subject:Date:From;
	b=b0dBLwu4lOSWweOj7kASYqnFDxkLGITGZcqg3n9/KolQWI3cUhNI/+tt600+6GEiQ
	 0ssCcGSbMBygCgQxjd54DvMBcc3qaiYNSFsFx4aoE3KG2aZqRWbqbKVxJyp1kR2QxH
	 BuX5YoX1/Sz06tr5BfD/GfczIUHfdaAF/2HxM+jLIecjGH5iBlgKW/6ibimTudTVrC
	 Ea/zWPkA32h8MIbAbjF9ebzRNdTcFB9U4Zo/RYTCtYJ3m91ZzjU2Z9fUrRs+Hz/DwR
	 YZAuL9GgHaguZDsaqneGfulVDHG8gK/dPy0mTIGmsRbrTlM/DYzcCiG0aZeVgG1ubN
	 LBYyO4ZwoU9vw==
From: peter kang <peter.kang@boeing.com>
To: xen-devel@lists.xenproject.org
Cc: anderson.choi@boeing.com, matthew.l.weber3@boeing.com,
        joshua.c.whitehead@boeing.com, Peter Kang <peter.kang@boeing.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
        Julien Grall <julien@xen.org>,
        =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
        Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2] xen/page_alloc: scrub each page in unprepare_staticmem_pages
Date: Tue, 27 Oct 2026 13:25:07 +0900
Message-ID: <d58a2eb5897a14d7312629b59fdb6b4bd2e48a64.1793074467.git.peter.kang@boeing.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-purgate-ID: tlsNG-d25034/1793075174-766DEA5B-643A3388/0/0
X-purgate-type: clean
X-purgate-size: 1470
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Peter Kang <peter.kang@boeing.com>

unprepare_staticmem_pages() can unprepare multiple pages in a static
memory range. When need_scrub is true, each page must be scrubbed
before it is marked static.

The loop currently passes the base pointer pg to scrub_one_page() on
every iteration. For a multi-page range, this repeatedly scrubs page 0
and leaves the remaining pages unscrubbed, so a guest can later read
stale data from pages 1..nr_mfns-1 of a static or static-shared bank.

Pass &pg[i] to scrub_one_page() so each iteration scrubs the page it
is processing. This ensures every page in the range is scrubbed before
it is marked static.

Fixes: 4a9e73e6e53e ("xen/arm: static memory initialization")
Signed-off-by: Peter Kang <peter.kang@boeing.com>

---
Changes:
v1 -> v2
 - Use Peter Kang's Signed-off-by.
 - no code change
---
 xen/common/page_alloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 2682fff9cc..426bd11c2e 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2941,7 +2941,7 @@ void unprepare_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
         if ( need_scrub )
         {
             /* TODO: asynchronous scrubbing for pages of static memory. */
-            scrub_one_page(pg);
+            scrub_one_page(&pg[i]);
         }
 
         pg[i].count_info |= PGC_static;
-- 
2.43.0


