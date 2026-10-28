Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C23606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 12:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=EP86vzXm
Received: from list by lists.xenproject.org with outflank-mailman.1463203.1674139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM2xp-0000qp-Gr; Wed, 28 Oct 2026 12:41:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463203.1674139; Wed, 28 Oct 2026 12:41:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM2xp-0000qi-C1; Wed, 28 Oct 2026 12:41:09 +0000
Received: by outflank-mailman (input) for mailman id 1463203;
 Wed, 28 Oct 2026 12:41:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xM2xn-0000qc-TR
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 12:41:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM2xn-00DlEN-96
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 13:41:07 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae1ed62-2eae-0a2a0a5409dd-0a2a4508c628-4
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 13:41:07 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae1ed63-f659-0a2a45080019-d1558035ddf1-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 13:41:07 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a2084d62cdso7773725e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 05:41:07 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a97bf5d5besm52740965e9.5.2026.10.28.05.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 05:41:05 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1793191267; x=1793796067; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yPiSZXNK+gUHTd8e6Vwjw643CczPPJQV9RIe3O5yMeM=;
        b=EP86vzXmtqM5oDDyjYhj/o9AP31WtY5kJWJSFvEg2HNn0kvg0cnb04ccxlVLLyBTwy
         SCTfsf8D1Ix7vX2srf2sF7sNI07dMxQzJvj2110wjGkxljqwwbngKNpkcCXKOcszj5Pd
         a1vvbLOqOq45G6YbHL7J5vACTfPPif9CVTw5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191267; x=1793796067;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yPiSZXNK+gUHTd8e6Vwjw643CczPPJQV9RIe3O5yMeM=;
        b=SDCjQsYFlVeyd1rGakABxGgm1a677BiB567nQ8YdG53qUgQPNnvWcOFOB/PEGskuuJ
         cVPxI7VLKKXSQ7POqT9/22ydcR4rXd2RRKnkhIEBs6sYP2YWEW3lALD+Qs1QojByxVUt
         M1zk7eiJuIq3nqSbgC2JTfZ6gu8GkWOIsF1jOMJGTc/5lf1pSbAYBbIy4j2+8TOy+jIy
         N9hnb5WUA/VzsOXtx6MhAtSslfb30+Fm/SWHVcnhMPz1W2wqzm+BPCQHlAPId6DvcWL8
         act9OT+7NdH5iJ7RYLq6LMFJ6i55oCV6i/8XkDz9qfPj5bNX2irB48KJQaoYSphMpyYS
         tTIQ==
X-Gm-Message-State: AFq9FYLK7igKLyeMWIfDUFZtX9RjPD65JLAtbYn0C9tVNkObWTfHeiJe
	Ev7Bd4UoTcgSb6W8GhIMPQl7qO2LGvhshe8KZ8yhNJil1W10Mq0TQFN8JogX98g8CfyhTBVpaDK
	gdIc4lvM=
X-Gm-Gg: AYBFou1ApPEBAyMTk3ts0qcXtcTQn1bkL62ystvYQptjuj32f4684cMZGaI1fZvTTVF
	6K468xsm8qAAzUWUII79TBv82VkQqC+xZkppAegYvgLmysbMR69UXR3VJzSNZF2pT+Nyx5Opqbd
	g60JTTAdYdn3fHVKR/0manIGZex5GuZ9w0N2EN5oS2TxSX2cbggE0VtEO09z8fFEpClr1/rK2pM
	/jwZ7Z4ZFiY1LAlsuM7PQk+E/G5k9KJp/E+AdvglqSFxqbsHGdQayVP/JVLAXlvmm08SaAgiyDR
	zDchkmeEI/qlD1hTs5/kK56gcCaZiq7lEhjV5RXo05uPw1ykQXABdTI+kCBfa01IYdDXFx8oyxD
	pwYYY0y0iW9J6BxOVDRCfaknlJYKjAdJwiiZHsUBRv+8CNFu+blO6lBe0L4On9JYh1KYrIJ/t64
	HQ5ytwBAV4QqtHUQqHB+ZbzR+f0EjPGMTSuIIUASkAWLcGVV4Nt5CXF3+0woaJuWCq0tORVK+Rb
	M6gD7TVRc0wAFMUpUFMXnJpwfLv/lmQbqe945ba2s/oAoE9wPjXDyrSdOAZQk23H1ZvbnIfEY6i
	tycuEud0NO2Top+ay7x8TnFD65gbFhFc0YpK+s/VvLloztbyz3yTKkHzXibNULFHJRoMCLLSKKJ
	7i1c=
X-Received: by 2002:a05:600c:3541:b0:4a1:f68a:9736 with SMTP id 5b1f17b1804b1-4a9672014d4mr49702965e9.26.1793191266440;
        Wed, 28 Oct 2026 05:41:06 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/mm: Remove loops in get_order_from_{pages,bytes}()
Date: Wed, 28 Oct 2026 12:41:04 +0000
Message-Id: <20261028124104.1564435-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1793191267-CC57487B-96DC296C/10/78276251493
X-purgate-type: spam
X-purgate-size: 6489
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These two functions are just fls() expressions in disguise.  Furthermore,
GCC-12 at least won't const-propagate get_order_from_pages() with an input of
3 or above, which covers most of the cases it gets used for.

Rewrite them, and provide some self testing.

Interesting, unless they are always_inline, GCC has a habit of out-of-lining
them even when inlining would have been a win.  I expect this is to do with
the fls() functions being superficially more complex.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2999078934

I think paddr_t is the wrong type to be using in get_order_from_bytes(), and
so really is fls64().  I could add fls_g() which would be slightly nicer on
builds where paddr_t != uint64_t.

Bloat-o-meter reports:

  x86:
    add/remove: 1/0 grow/shrink: 1/20 up/down: 39/-624 (-585)
    Function                                     old     new   delta
    deallocate_buffer                              -      37     +37
    iommu_flush_iotlb                            518     520      +2
    amd_iommu_init                               648     647      -1
    do_memory_op                               11052   11050      -2
    dom0_construct_pvh                          4025    4021      -4
    allocate_ring_buffer.constprop                79      73      -6
    conring_flush.constprop                      267     259      -8
    allocate_buffer                              131     123      -8
    _free_percpu_area                            104      96      -8
    vcpu_create                                  865     849     -16
    kexec_init                                   295     279     -16
    enable_qinval                                447     427     -20
    cpu_percpu_callback                          238     216     -22
    heap_init_late                              1683    1659     -24
    amd_iommu_alloc_intremap_table               363     331     -32
    dom0_construct                              8314    8274     -40
    alloc_pgtable_maddr                          263     217     -46
    free_ivrs_mapping_callback                   132      82     -50
    amd_iommu_setup_device_table                 746     680     -66
    _xmalloc.part                                585     517     -68
    enable_iommu                                1668    1583     -85
    amd_iommu_init_cleanup                       551     449    -102

  arm64:
    add/remove: 2/0 grow/shrink: 3/9 up/down: 248/-400 (-152)
    Function                                     old     new   delta
    guest_map_pages                                -     176    +176
    get_allocation_size                            -      28     +28
    allocate_domheap_memory                      268     288     +20
    do_memory_op                                8584    8600     +16
    heap_init_late                              1048    1052      +4
    find_unallocated_memory                      452     456      +4
    kernel_decompress                            772     768      -4
    end_boot_allocator                           836     832      -4
    cpu_percpu_callback                          328     324      -4
    arch_livepatch_quiesce                       212     208      -4
    apply_alternatives_all                       360     356      -4
    conring_flush.constprop                      336     328      -8
    _xmalloc.part                                584     572     -12
    construct_hwdom                             1088    1024     -64
    allocate_bank_memory                         444     148    -296

The three introduced functions are all examples of the inlining decisions
going wrong.  Still, at least all of these examples are now basic blocks
rather than loops.
---
 xen/common/bitops.c  | 27 +++++++++++++++++++++++++++
 xen/include/xen/mm.h | 18 ++++--------------
 2 files changed, 31 insertions(+), 14 deletions(-)

diff --git a/xen/common/bitops.c b/xen/common/bitops.c
index 859a4ca5c131..1291cbbf0967 100644
--- a/xen/common/bitops.c
+++ b/xen/common/bitops.c
@@ -259,3 +259,30 @@ static void __init __constructor test_muldiv64(void)
     if ( res != 0xffffffffffffffffULL )
         panic("muldiv64(), expecting -1ULL, got %#"PRIx64"\n", res);
 }
+
+#include <xen/mm.h>
+
+/* Not really bitops, but here in lieu of any better location */
+static void __init test_order_from_pages(void)
+{
+    CHECK(get_order_from_pages, 1, 0);
+    CHECK(get_order_from_pages, 2, 1);
+    CHECK(get_order_from_pages, 3, 2);
+    CHECK(get_order_from_pages, 4, 2);
+    CHECK(get_order_from_pages, 5, 3);
+    CHECK(get_order_from_pages, 8, 3);
+    CHECK(get_order_from_pages, 9, 4);
+}
+
+static void __init test_order_from_bytes(void)
+{
+    CHECK(get_order_from_bytes, PAGE_SIZE - 1, 0);
+    CHECK(get_order_from_bytes, PAGE_SIZE,     0);
+    CHECK(get_order_from_bytes, PAGE_SIZE + 1, 1);
+}
+
+static void __init __constructor test_orders(void)
+{
+    test_order_from_pages();
+    test_order_from_bytes();
+}
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 153c57f5ddc2..8f4bba94919b 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -530,26 +530,16 @@ page_list_splice(struct page_list_head *list, struct page_list_head *head)
     list_for_each_entry_safe_reverse(pos, tmp, head, list)
 #endif
 
-static inline unsigned int get_order_from_bytes(paddr_t size)
+static always_inline unsigned int get_order_from_bytes(paddr_t size)
 {
-    unsigned int order;
-
     size = (size - 1) >> PAGE_SHIFT;
-    for ( order = 0; size; order++ )
-        size >>= 1;
 
-    return order;
+    return fls64(size);
 }
 
-static inline unsigned int get_order_from_pages(unsigned long nr_pages)
+static always_inline unsigned int get_order_from_pages(unsigned long nr_pages)
 {
-    unsigned int order;
-
-    nr_pages--;
-    for ( order = 0; nr_pages; order++ )
-        nr_pages >>= 1;
-
-    return order;
+    return flsl(nr_pages - 1);
 }
 
 #ifndef arch_free_heap_page
-- 
2.39.5


