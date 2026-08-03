Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E9DC55184
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 12:18:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381420.1625000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqrc5-0007AZ-L2; Mon, 03 Aug 2026 12:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381420.1625000; Mon, 03 Aug 2026 12:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqrc5-00079X-GY; Mon, 03 Aug 2026 12:17:49 +0000
Received: by outflank-mailman (input) for mailman id 1381420;
 Mon, 03 Aug 2026 12:17:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wqrc4-00077T-4Z
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 12:17:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqrc3-007wIE-3l
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 14:17:47 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a7086e5-e002-0a2a0a5209dd-0a2a45059236-20
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 14:17:47 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a7086ea-4cb1-0a2a45050019-d155802ca8e8-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 14:17:47 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4980fe6b3beso9420535e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 05:17:47 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4980878dbaesm385075295e9.12.2026.08.03.05.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2026 05:17:45 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1785759466; x=1786364266; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=set/tVnmTwyRXbbS2/hm5WA+Lv6/Z4na9/ek1L2Zqls=;
        b=cH/Iy6UsSU6DHVKYmaFEcS/x2i5uL7oEnjKgilZ36XcHrzdGQNn6JXdrGAYSL8Zfra
         2X/xzUiwLWy3dacdLCoBfhZZuZvfgU2xz5XRaLINNqB82QkTmOw4ZDwI3AHjNwNT51ns
         +8GuAXCKwoF1EeQ2Ed3SVdz/QWrirsaY8RMTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785759466; x=1786364266;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=set/tVnmTwyRXbbS2/hm5WA+Lv6/Z4na9/ek1L2Zqls=;
        b=CkIKgvgU69wmdzcqfOU0ITV//v6z4rdurkyW4+jzrFRz+2TGv3HTpeB1jsRaz32KAF
         lDthXnEL0cJ3jdc+MntOjMOp0oYVYBUGZjcU6MyZeJRlOrhmykUuI7TBe1j3/QhtepYR
         80MTZCwzhUER58cIb0LoftfZ88Vl2shkbWzJr6F471X6k7dfNqwLqKflhG87qf1bWd7w
         /ImoeVkX0jCsQH3wjZnAwpIDRyaKfYK7FrA/xKWRa/aPBX/oelDDx20+XQKM0GjuJldi
         4Y/y0CfTb5EcjMf60MYSNl2PyNOH7FNKeW5ZBWoWrVjxSJZIGvC8IC4Ys8y2jyndbTGi
         COqw==
X-Gm-Message-State: AOJu0Yyy40q3dtH51z8lOshCm+xBfLz/D2q/KRcE6+Lu8Yq8r/b1mGQT
	uiqoZNgwXgCBW8R87bcVTmRKh7C+bGQ4G/tMlsXV8mt9KqUdTh4PoQawSBgseqRUOD01cJu6Fc1
	P3VWL
X-Gm-Gg: AR+sD11Ienn+VMFqdTwDkUhqKpSgwJoZ1vMBIi7T1LRYF9GkYTPOGjd+ylsR5kEzpJz
	66s+5S2/DANnkAirjaq+/WDp8WyyMw9PmL9Wpw1PKlhBYIt7080nMm9eqHiao8vIINjsYcRtsT0
	2gALCWlw8rJVbVpkAxLFs3xeTxNpdNLvZOZKQv6rKQVuR85/EgW1LAX1Kl/h5Ko0zrghyrHRmQp
	JgsjKQsVTHyYSgGEM+4dntQ4wtUvqqLQcgPieAelEG+78p2iqe7mM225a+dpVY9uAmh6lo5EDDJ
	BOllFZ45TGChLD33UkivzMn4pgfESowxYfO/n7+E4HqdoXH0YTwWRF5rZv8cGRqY3d1fXs5xfHA
	iQuDgpebdbX3yMocFajI1zJ7iHahTFfVBkKUH4+NERMdnUziXsuTdkZSUO8l1jjVNQOiyK70hQA
	GVMaytQXxp52Z1vczQ4jYpayCG0Lh+dqkGNQ1PxbgrvAybpMrgjUBwk2jOyHiRnoZ2qvvc/tBOs
	XinsxHN6atfFho2W6DPMkZVjOZURyuVYa49pik=
X-Received: by 2002:a05:600c:5249:b0:495:3a52:71b1 with SMTP id 5b1f17b1804b1-4980eb9b2eemr144134715e9.5.1785759465972;
        Mon, 03 Aug 2026 05:17:45 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bernhard Kaindl <bernhard.kaindl@citrix.com>
Subject: [PATCH 1/2] xen/mm: Alter get_outstanding_claims() to return information by value
Date: Mon,  3 Aug 2026 13:17:38 +0100
Message-Id: <20260803121739.370951-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260803121739.370951-1-andrew.cooper3@citrix.com>
References: <20260803121739.370951-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1785759467-F429B2A1-838194D7/0/0
X-purgate-type: clean
X-purgate-size: 3474

A void function with two output parameters is a weird choice.  Instead, return
a two-element structure.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Bernhard Kaindl <bernhard.kaindl@citrix.com>

Slightly RFC.  claim_info_t name subject to improvement, but see next patch.

This is to help unwedge the XenServer patchqueue following commit
44adbac3c7a6 ("xen/mm: Introduce per-node free page counter").
---
 xen/common/page_alloc.c | 10 +++++++---
 xen/common/sysctl.c     |  8 ++++++--
 xen/include/xen/mm.h    |  6 +++++-
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 598222e2c2e1..900fcf5755c1 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -582,12 +582,16 @@ int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
 }
 
 #ifdef CONFIG_SYSCTL
-void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages)
+claim_info_t get_outstanding_claims(void)
 {
+    claim_info_t info;
+
     spin_lock(&heap_lock);
-    *outstanding_pages = outstanding_claims;
-    *free_pages = avail_heap_pages(MEMZONE_XEN + 1, NR_ZONES - 1, -1);
+    info.avail   = avail_heap_pages(MEMZONE_XEN + 1, NR_ZONES - 1, -1);
+    info.claimed = outstanding_claims;
     spin_unlock(&heap_lock);
+
+    return info;
 }
 #endif /* CONFIG_SYSCTL */
 
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 8fb5ff0af317..35c132564ef1 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -248,6 +248,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
     case XEN_SYSCTL_physinfo:
     {
         struct xen_sysctl_physinfo *pi = &op->u.physinfo;
+        claim_info_t claim_info;
 
         memset(pi, 0, sizeof(*pi));
         pi->threads_per_core =
@@ -259,8 +260,11 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         pi->max_node_id = MAX_NUMNODES-1;
         pi->max_cpu_id = nr_cpu_ids - 1;
         pi->total_pages = total_pages;
-        /* Protected by lock */
-        get_outstanding_claims(&pi->free_pages, &pi->outstanding_pages);
+
+        claim_info = get_outstanding_claims();
+        pi->free_pages = claim_info.avail;
+        pi->outstanding_pages = claim_info.claimed;
+
         pi->scrub_pages = 0;
         pi->cpu_khz = cpu_khz;
         pi->max_mfn = get_upper_mfn_bound();
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index b80bec00c124..74d28d2a1b7a 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -132,7 +132,11 @@ int populate_pt_range(unsigned long virt, unsigned long nr_mfns);
 unsigned long __must_check domain_adjust_tot_pages(struct domain *d,
     long pages);
 int domain_set_outstanding_pages(struct domain *d, unsigned long pages);
-void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages);
+
+typedef struct {
+    unsigned long avail, claimed;
+} claim_info_t;
+claim_info_t get_outstanding_claims(void);
 
 /* Domain suballocator. These functions are *not* interrupt-safe.*/
 void init_domheap_pages(paddr_t ps, paddr_t pe);
-- 
2.39.5


