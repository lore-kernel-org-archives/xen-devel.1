Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AE2606A31E
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 06:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=boeing.com header.i=@boeing.com header.a=rsa-sha256 header.s=boeing-s1912 header.b=GAoio6nF
Received: from list by lists.xenproject.org with outflank-mailman.1460757.1671612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLDlM-0002fH-CG; Mon, 26 Oct 2026 06:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460757.1671612; Mon, 26 Oct 2026 06:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLDlM-0002f9-8K; Mon, 26 Oct 2026 06:00:52 +0000
Received: by outflank-mailman (input) for mailman id 1460757;
 Mon, 26 Oct 2026 06:00:51 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.kang@boeing.com>) id 1xLDlK-0002f3-Rv
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 06:00:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLDlJ-00H1BM-Ox
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 07:00:49 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.kang@boeing.com>)
 id 6adeec83-8faa-0a2a0a5109dd-0a2a450595ce-20
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 07:00:45 +0100
Received: from [130.76.144.163] (helo=clt-mbsout-02.mbs.boeing.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.kang@boeing.com>)
 id 6adeec85-4cb1-0a2a45050019-824c90a3b50e-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 07:00:38 +0100
Received: from localhost (localhost [127.0.0.1])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 69Q60Za2005321; Mon, 26 Oct 2026 02:00:36 -0400
Received: from clt-av-01.mbs.boeing.net (clt-av-01.mbs.boeing.net
 [144.115.64.247])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 69Q60Q7x005249
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Oct 2026 02:00:27 -0400
Received: from localhost (localhost [127.0.0.1])
 by clt-av-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_RELAY) with SMTP id
 69Q60P3I010594; Mon, 26 Oct 2026 02:00:25 -0400
Received: from A6432926.boeing.com (a6432926.nos.boeing.com [10.191.242.9])
 by clt-av-01.mbs.boeing.net (8.15.2/8.15.2/UPSTREAM_RELAY) with ESMTP id
 69Q60IiK010298; Mon, 26 Oct 2026 02:00:19 -0400
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
	s=boeing-s1912; t=1792994437;
	bh=eVTKD9hb+427DYCjbfL0vWk9SDVwZ2YRtZbvyety0/Q=;
	h=From:To:Cc:Subject:Date:From;
	b=GAoio6nFdTRF8+tOdUV8R5COnLm1lL/v1o/JeCYSx7e1zmbQUu1R/urhw39hGug5U
	 ftBp+UH9E/3i9qDWS/+TJdD2upz4XHOKBSW6+SBRFBeT0r4fSra/c1PfS6etue9gNF
	 8oKP23fTRdfPME9k9Atiq+IZzhPey2gVVhZyj+CMMf/oJJmPx4EHwS+87jiYsjM9DE
	 BGgfBhRERfC9SFsX8/yqbAdFCl0tN20jDN1iqlBgVFNL75wZCyD24y05bJqmm+/U/b
	 6/Ff/Pc9wvlCMj/1UAUxLoyPyclO6D0ijAKPSrjrWUwiVEFISJTvFVD+sA+xAamWBY
	 zX0W6ksz0GQjg==
From: peter kang <peter.kang@boeing.com>
To: xen-devel@lists.xenproject.org
Cc: anderson.choi@boeing.com, matthew.l.weber3@boeing.com,
        joshua.c.whitehead@boeing.com, Peter Kang <peter.kang@boeing.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
        Julien Grall <julien@xen.org>,
        =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] xen/page_alloc: scrub each page in unprepare_staticmem_pages
Date: Mon, 26 Oct 2026 15:00:08 +0900
Message-ID: <0caeae8b795439ba7f9d466571f0d125b924feaa.1792992356.git.peter.kang@boeing.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-purgate-ID: tlsNG-c201ff/1792994439-738BE2A1-610167B3/0/0
X-purgate-type: clean
X-purgate-size: 1394
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
Signed-off-by: Anderson Choi <anderson.choi@boeing.com>
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


