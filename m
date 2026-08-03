Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D6AC55182
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 12:18:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381421.1625007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqrc5-0007HC-UF; Mon, 03 Aug 2026 12:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381421.1625007; Mon, 03 Aug 2026 12:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqrc5-0007Gb-QY; Mon, 03 Aug 2026 12:17:49 +0000
Received: by outflank-mailman (input) for mailman id 1381421;
 Mon, 03 Aug 2026 12:17:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wqrc4-00077Z-88
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 12:17:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqrc3-007wIE-KV
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 14:17:47 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a7086e0-e002-0a2a0a5209dd-0a2a450ce7d8-8
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 14:17:47 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a7086eb-f479-0a2a450c0019-d155802da8b9-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 14:17:47 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4980fe6b3beso9420635e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 05:17:47 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4980878dbaesm385075295e9.12.2026.08.03.05.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2026 05:17:46 -0700 (PDT)
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
        d=citrix.com; s=google; t=1785759467; x=1786364267; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6JCAOMMwTyxZkSFy3FwTezM7XZSAFX+kgUtlaig++k8=;
        b=mOkAGSdoBYNCkt5FcZovfp+J1gfWzFXJU/bFm5A3NDlOJ0Bglg0BItrHzw6M8GCBfJ
         WjW+sgALauKbsozsD1zwZXf9QY4b6EIiyXC/ONgpiduR3E+B/bk8xYfgQ0ROFX/GnfKH
         5j2O75qojRgZGKjUAv401lGyBXhyzbkEcpinw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785759467; x=1786364267;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6JCAOMMwTyxZkSFy3FwTezM7XZSAFX+kgUtlaig++k8=;
        b=W2WTESaWD3x3bIU1KHb4yvjT8X7SXhEo2TNHCTt7bpXOfyo3imDiqiKUSFnQOcFTiN
         N9yq0a/Pp/F2nbIvRAXu7Z8bt0AXN3gkK5Vwg9O5McDBjR+3vSfwlWV6PnOIaC197zww
         QdOLFt7QLQC2BWPaKrfJjKDBUqQd5DaliTnkuJiwGa81VtZM29FGWlKTTw3wzS0zmkA8
         /34gb7+DpYfNTR5jQ3D4tjbN17s09N3mm8U5mgTiJHqEdEGxARDbpLxghKLW5tdD5dEj
         gWQaUvle9G7NGSniDq8nEwMDTpq+9HFzWafR72r6IJj9iSzDmBH89x9qkPG4rhc0psme
         XhDw==
X-Gm-Message-State: AOJu0YwcwqvvcIfe7Wb6DSNbvohOx8ce+zf9q87uJ74BkyNAoQv6XDtG
	weDEW5fuyMHRazZlOFkMW15mvNZy+fKnfsVAmKL7hIbYdSD36wVwhoA9vqZc21oclMxW4VCxgOA
	CvM8BJKQ=
X-Gm-Gg: AR+sD12NxoAIjhFCiIfuH7QEEjjAssJVsFK+DCiPaoXyUsjcSm7FFoFU8Y5nWwaJcUo
	1471nLt8l+TdD9Ohh70CPVYf6kngBu+oQ0kVXN5bybY5v7TwMHuAYfDHeBNIfLhibBzKT7yJguW
	TKnN/bzPrmsEf/P/2jjvyWdXOaEhosMKLPfWZwfwMdKCKgvd4+V6vxqXkM81a0o/iB4OB39PLWp
	BDC50JPvEMtFa9HQ/uI/zg6nWluOYj9gJjahq/A9lJ6S3+Pj9IzSjKVnHLZF1BoeE0rFBbvo2f/
	L82hJOjSXjoLG7uPMOeGT7U9EZvvrxTfM3660eZ/BqgfVmcRhCojejpxVhVVq6nqKbGcypQLcHl
	YD0Fqp/z8+fZPpsQepco29RZH/kHSc4r18W5XJBTUwSElp68etNHkNzKYJpvq9MANXz6OaALyrF
	B8u5y4MxFS68vymQwGos27+WJIaFCUCXZ83KFUzslE/ZHrabCQv8gBwS1KaUnzUltlIppoNRJzq
	xiz6/YWqa7vWNuQPuSIQwtHhzdfd249DIpOPxrc+ic0Yyx5cg==
X-Received: by 2002:a05:600c:3150:b0:495:3c6f:7c18 with SMTP id 5b1f17b1804b1-4980eb8c4c9mr154961375e9.3.1785759466769;
        Mon, 03 Aug 2026 05:17:46 -0700 (PDT)
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
Subject: [PATCH RFC 2/2] xen/mm: Return claim information from avail_node_heap_pages()
Date: Mon,  3 Aug 2026 13:17:39 +0100
Message-Id: <20260803121739.370951-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260803121739.370951-1-andrew.cooper3@citrix.com>
References: <20260803121739.370951-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1785759467-01AC4A5B-269A8F01/0/0
X-purgate-type: clean
X-purgate-size: 4060

Fully RFC.

With per-node claims, avail_node_heap_pages() becomes:

    claim_info_t avail_node_heap_pages(unsigned int nodeid)
    {
        claim_info_t info = {};

        if ( nodeid < MAX_NUMNODES && node_online(nodeid) )
        {
            spin_lock(&heap_lock);
            info.avail   = node_avail_pages[nodeid];
            info.claimed = node_outstanding_claims[nodeid];
            spin_unlock(&heap_lock);
        }

        return info;
    }

along with modifications to the callers.  I'm not intending to submit this
patch as-is, but it is present to help judge the naming.

Not-Really-Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 xen/common/numa.c       | 2 +-
 xen/common/page_alloc.c | 8 +++++---
 xen/common/sysctl.c     | 2 +-
 xen/include/xen/mm.h    | 2 +-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/common/numa.c b/xen/common/numa.c
index 92f8f1cedce1..eef8be06944e 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -713,7 +713,7 @@ static void cf_check dump_numa(unsigned char key)
 
         printk("NODE%u start->%lu size->%lu free->%lu\n",
                i, node_start_pfn(i), node_spanned_pages(i),
-               avail_node_heap_pages(i));
+               avail_node_heap_pages(i).avail);
         /* Sanity check mfn_to_nid() */
         if ( node_spanned_pages(i) > 1 && mfn_to_nid(mfn) != i )
             printk("mfn_to_nid(%"PRI_mfn") -> %d should be %u\n",
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 900fcf5755c1..0b0f2033e738 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2852,12 +2852,14 @@ unsigned long avail_domheap_pages_region(
     return avail_heap_pages(zone_lo, zone_hi, node);
 }
 
-unsigned long avail_node_heap_pages(unsigned int nodeid)
+claim_info_t avail_node_heap_pages(unsigned int nodeid)
 {
+    claim_info_t info = {};
+
     if ( nodeid < MAX_NUMNODES && node_online(nodeid) )
-        return node_avail_pages[nodeid];
+        info.avail = node_avail_pages[nodeid];
 
-    return 0;
+    return info;
 }
 
 
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 35c132564ef1..4d8dba51eb63 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -315,7 +315,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
                     if ( node_online(i) )
                     {
                         meminfo.memsize = node_spanned_pages(i) << PAGE_SHIFT;
-                        meminfo.memfree = avail_node_heap_pages(i) << PAGE_SHIFT;
+                        meminfo.memfree = avail_node_heap_pages(i).avail << PAGE_SHIFT;
                     }
                     else
                         meminfo.memsize = meminfo.memfree = XEN_INVALID_MEM_SZ;
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 74d28d2a1b7a..e8b81c0f1fc6 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -137,6 +137,7 @@ typedef struct {
     unsigned long avail, claimed;
 } claim_info_t;
 claim_info_t get_outstanding_claims(void);
+claim_info_t avail_node_heap_pages(unsigned int nodeid);
 
 /* Domain suballocator. These functions are *not* interrupt-safe.*/
 void init_domheap_pages(paddr_t ps, paddr_t pe);
@@ -145,7 +146,6 @@ struct page_info *alloc_domheap_pages(
 void free_domheap_pages(struct page_info *pg, unsigned int order);
 unsigned long avail_domheap_pages_region(
     unsigned int node, unsigned int min_width, unsigned int max_width);
-unsigned long avail_node_heap_pages(unsigned int nodeid);
 #define alloc_domheap_page(d,f) (alloc_domheap_pages(d,0,f))
 #define free_domheap_page(p)  (free_domheap_pages(p,0))
 
-- 
2.39.5


