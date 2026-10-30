Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6672606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 16:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=edera.dev header.i=@edera.dev header.a=rsa-sha256 header.s=google header.b=AABsy2Wl
Received: from list by lists.xenproject.org with outflank-mailman.1465933.1676362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMpoe-0005Sq-BW; Fri, 30 Oct 2026 16:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465933.1676362; Fri, 30 Oct 2026 16:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMpoe-0005Sg-7d; Fri, 30 Oct 2026 16:50:56 +0000
Received: by outflank-mailman (input) for mailman id 1465933;
 Fri, 30 Oct 2026 16:50:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca@edera.dev>) id 1xMpoc-0005ST-JW
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 16:50:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMpoc-00HTpX-07
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 17:50:54 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca@edera.dev>)
 id 6ae4cacd-8faa-0a2a0a5109dd-0a2a4505924e-40
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 17:50:53 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luca@edera.dev>)
 id 6ae4caed-4cb1-0a2a45050019-d1558030e462-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 17:50:53 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a35a60499eso9415745e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 09:50:53 -0700 (PDT)
Received: from framework13.home ([2a01:e11:3:1ff0:831:b00b:e409:f875])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf396dfdbsm74305045e9.1.2026.10.30.09.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 09:50:52 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=edera.dev header.i="@edera.dev" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edera.dev; s=google; t=1793379053; x=1793983853; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jFqLfRtINfauajq5gyzLuN7HZyWOdsBoG482oigvb6w=;
        b=AABsy2WlqBOPm5PJsPZvdmKTfBZrSx1vxPyOFfepB8StvoPImjMRLYL2EDibPTdYuA
         OgRW3wersaf2LC8D4n2H/U2ZbsO9EY+8r5q+xnvFCVFEd5POuipETXYABNSHE0PeHk4y
         ke4TlgKvbRiYb2OZAHGoXYBD3blss178Yb3s65jlOiYZXNRNXRydUkbYyRCfYF+DUQ8a
         UTBK/bm3vh2IxU7HxoZdmv4h+yU8rPVcs6kJqtJocnCqZYw/UEOKxe41d8ArAvDKZTK6
         KXfWpz+tAQxzKYGO6cuJ/5vjyY35reDE/f/0muMarN5p2E4xvl89jOhgXImfUxw2i9wT
         51sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379053; x=1793983853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jFqLfRtINfauajq5gyzLuN7HZyWOdsBoG482oigvb6w=;
        b=svtIaYUsrCgq974Iv82AG4Ph11EhWZG7tlAKw1aHMgY79VKDQNr6mgwau6COHLr3MI
         c6kTrNvgdbakdlHTKh0z8jMfsax5LwCY9eiTji1l3w4bGywpyX8ZrXDgSsbDIj9x6YLv
         NAGmFklCOnqn8POvonr2X5XEGnjWPzEINRd6vHfktKUjUsx0EEiFg+DxLYFpJ6L7ofRp
         3lkgKiazy5jUL20dVawg85gKskRQfWpb78csBOwJ/qUtFlYx/W4HGpYiBnW4nCgFkalG
         3UbaAZn52rWz8YZ6ZDi+vjtBgWj6sUpP9VXdXdqP7xo+7wJpOL9MdGCzGOsNEjA0aJQ4
         uDPQ==
X-Gm-Message-State: AFq9FYIeClnslBDeb+rp+gqsMK+zFZmXk5+P0lpQ1kGzyxQXocKzpdr5
	TBufoF1HytYRxg6NhlqfEM/U4NHrhE0e95yyWUGpPTMqocYTdvyW3DCQUpEagdLqu78aqrn6SFe
	VAq7dXmcVVQ==
X-Gm-Gg: AYBFou3qrxJP5s8BeexxjiEqXNEBpUYCivcnQq5zgaDMxBv0xiLlsJAyDLjHqQRcH7a
	/MbgSOjlmkC5JFCNvpqeHtSn6//FYelaNTiRF+DH6g+yVfYKx3qj7mYTsJN+t1nSgC1u7wnpL6C
	qKSW2BsSLUiLt6/bdRX6Sbc0O6AE7yBvSyiy6dt0p6JjNa7o54tnCzEZvMAZQc5TH9euoIaA3Jr
	SzYev4QyGPs40ovo+0bXNG/qVzo7CgXT0kZBKF3DZ5QQsYNYDggsWmpoY0sLzyfrnM8k/A3tXth
	LmGZzy+q7+KTiGBtz5FmWXuH1ElCHeWeu3RblckYmnJsm/WKdfor/vSpR5NnFbB8WwbbtGCtdhv
	dTbmJurkoRNEcvbNWM7jAPC20h5Nkk3PWdZMXbWvG8x7n5rI17pSKrHhF8O6M2bua7+IHq+tuuf
	N5aiFtfvPGfhhkvFs6hv4K38joTMTyz8tRbm9eJ6SMnvby7QeFi78mjeonNy8Q1nvmWEbZB9Pk5
	lGL8Mj+qRi8SszC4WkKDttwFvu7BoK8fwBa03fPHPeJ99TEaenPhys5Oqcso2c0FffcdK44JOem
	zkWETv51mZvdM5h27/0sXHzQepDhyYLw+op/vLROHojkmQo=
X-Received: by 2002:a05:600c:1f93:b0:4a3:2f35:38b6 with SMTP id 5b1f17b1804b1-4ac180f1e69mr65939805e9.24.1793379053265;
        Fri, 30 Oct 2026 09:50:53 -0700 (PDT)
From: Luca Di Maio <luca@edera.dev>
To: xen-devel@lists.xenproject.org
Cc: Luca Di Maio <luca@edera.dev>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 1/3] IOMMU: record the flushes skipped under iommu_dont_flush_iotlb
Date: Fri, 30 Oct 2026 17:50:08 +0100
Message-ID: <20261030165031.2560020-2-luca@edera.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030165031.2560020-1-luca@edera.dev>
References: <20261030165031.2560020-1-luca@edera.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1793379053-F46A52A1-C0473241/0/0
X-purgate-type: clean
X-purgate-size: 3234
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

While iommu_dont_flush_iotlb is set, iommu_legacy_unmap() and the
shared-EPT path of ept_set_entry() skip their IOTLB flush and drop the
flags it would have used. Accumulate them in the per-CPU
iommu_skipped_flush_flags, so that a caller deferring the flush can
issue it with the same flags. The next patch does so for grant unmaps.

Use a uint8_t, as a fixed width is meant: a byte holds every flag and
fits in the padding after iommu_dont_flush_iotlb, so the per-CPU data
that follows doesn't move.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: Luca Di Maio <luca@edera.dev>

---
 xen/arch/x86/mm/p2m-ept.c       |  4 ++++
 xen/drivers/passthrough/iommu.c | 12 +++++++++++-
 xen/include/xen/iommu.h         |  1 +
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 204bdb054a..1a87b25d94 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -981,6 +981,10 @@ out:
                                    (iommu_flags ? IOMMU_FLUSHF_added : 0) |
                                    (vtd_pte_present ? IOMMU_FLUSHF_modified
                                                     : 0));
+        else if ( iommu_use_hap_pt(d) )
+            this_cpu(iommu_skipped_flush_flags) |=
+                (iommu_flags ? IOMMU_FLUSHF_added : 0) |
+                (vtd_pte_present ? IOMMU_FLUSHF_modified : 0);
         else if ( need_iommu_pt_sync(d) )
             rc = iommu_flags ?
                 iommu_legacy_map(d, _dfn(gfn), mfn, 1ul << order, iommu_flags) :
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 4b22ecfe65..70ee45afb9 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -64,6 +64,11 @@ bool __read_mostly iommu_hap_pt_share = true;
 bool __read_mostly iommu_debug;
 
 DEFINE_PER_CPU(bool, iommu_dont_flush_iotlb);
+/*
+ * A byte holds every IOMMU_FLUSHF_*, and fits in the alignment padding the
+ * bool above leaves, instead of shifting the per-CPU data that follows.
+ */
+DEFINE_PER_CPU(uint8_t, iommu_skipped_flush_flags);
 
 static int __init cf_check parse_iommu_param(const char *s)
 {
@@ -458,7 +463,12 @@ int iommu_legacy_unmap(struct domain *d, dfn_t dfn, unsigned long page_count)
     unsigned int flush_flags = 0;
     int rc = iommu_unmap(d, dfn, page_count, 0, &flush_flags);
 
-    if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
+    if ( this_cpu(iommu_dont_flush_iotlb) )
+    {
+        BUILD_BUG_ON(IOMMU_FLUSHF_all > UINT8_MAX);
+        this_cpu(iommu_skipped_flush_flags) |= flush_flags;
+    }
+    else if ( !rc )
         rc = iommu_iotlb_flush(d, dfn, page_count, flush_flags);
 
     return rc;
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 37c4a1dc82..028f41bc15 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -501,6 +501,7 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev);
  * the caller.
  */
 DECLARE_PER_CPU(bool, iommu_dont_flush_iotlb);
+DECLARE_PER_CPU(uint8_t, iommu_skipped_flush_flags);
 
 bool arch_iommu_use_permitted(const struct domain *d);
 
-- 
2.54.0


