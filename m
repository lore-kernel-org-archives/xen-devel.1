Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB6A606A33D
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 15:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=C3llkoZ/
Received: from list by lists.xenproject.org with outflank-mailman.1470120.1678908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOGSG-0007E7-4Y; Tue, 03 Nov 2026 15:29:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470120.1678908; Tue, 03 Nov 2026 15:29:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOGSF-0007Dy-W7; Tue, 03 Nov 2026 15:29:44 +0000
Received: by outflank-mailman (input) for mailman id 1470120;
 Tue, 03 Nov 2026 15:29:41 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOGSD-0006nn-Qr
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 15:29:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOGSD-00Ba9X-6p
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 16:29:41 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae9fddb-8faa-0a2a0a5109dd-0a2a450aa786-36
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 16:29:41 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae9fde5-f2d2-0a2a450a0019-d1558029e0cd-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 16:29:41 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a3517554f7so32674355e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 07:29:41 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b959c1sm25430467f8f.45.2026.11.03.07.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 07:29:39 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1793719780; x=1794324580; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OjGu8aNJSa9hiinv/RFb747MCnsH5+RZhfhHhZ40tAg=;
        b=C3llkoZ/OjuUMcB5+1TOb9A4rQfR/yLzTUR8zT4SuWpHi8JxSIrQ4z8SPO0PJAxMHz
         XuWleRUifPeuk0CSvdhsw2ipKFxynyZ1lfOwMpAysgagKNBwwK7TzUdRQA2Ht8sLCMWH
         eswd54S06l+3FRXtKLJwfjusXSldkCeDP6JAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719780; x=1794324580;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OjGu8aNJSa9hiinv/RFb747MCnsH5+RZhfhHhZ40tAg=;
        b=gs8dR2lOMAj0SLX8m+X1duHF4uE4HQuJEPzt4She0zBHmGeXfUHOfeHy7rR5MPy6UI
         /MxViJ0soAB0TKHPEJBM8rpZT09b7ipfjM4XG80634Qdld+lNaooK239rZ6mU5lI1HYO
         yGmmlvj+cyE2cA+jYdvo81IEO7g5y6yg8uWTgMXFylZFJWOsv9mNYuq1WlwL7OQWKyxF
         ojMq0SI1xnIYG9TpETGK83l69Ps70YtHOey4SJA8XoVJQI/TSyKFU7kZpkdMe9g+Xovg
         jJhKpQaMNcCWcFCuO+8IEEl2uE7HibyNwyzzxTMefYg7XpjfLehzhPaGOerxCGyUzVpw
         mstQ==
X-Gm-Message-State: APuU4Z+jVU+mzQwZXfzIcQf7FzVr6jkqiO48MYswEGKNstcAuEVIbUhi
	lXa6nTKk8G3A2CM2zj6rkus4nAzqgvkSMB7bjv23uQ03+a7+yY6lX2malqYHTfEj9h8NAJQDVkC
	icBp3RB8=
X-Gm-Gg: AYBFou0UCfx1Jb9MsX5fVZmNnv838gT4Ma0601Mtfyd3wRVzQ9l2KIQVth8xz6wwvaa
	HCLUd+6lBl6cGBdv9f9Qv6PNWAtv7O4Y5nS63Y8MrWNevuJmcep5/5/u3UuiVuWock3cUyY1nno
	8tMBCw+HoHWFJksuBKl6QNFovKaDjqS3JNJjsPU7XefSjqPT4MluGwvdocyE22wJsz78xIwBjJi
	l0Vdg1StJ2V3jFsZK7HiOQ+AeCZVDJHo7su3ITORSQk7OCXNPA4qdH5NOMPgpPZGKloQYbfxHsQ
	qRVLMczNAbKjdBWKWyapcUeQUagJLoD6p0IoAf3hGdnZ1UJ8AitA1+g+bG9SmciZibN7HO5SKRA
	1EU39PtisR9nNtTI5MhfqsOjvPSUV4u22HZdkmbH9/h8OY7vceaLZn9fBeqSW7aU3LfOQyDxpk9
	ksyAwTcGBU9Q3aCSQ34ZzoSER6rxNfh9G6txgZmzsQCCUpT26+4AyJzApZs0NJWSc26zcWdn/ia
	PTYFkLN/pAYfe+77m75tXbeRYjV+z8TPQ+vGrXBXo+HcKbFJoPTD/kZvuFJMxuXFH5WNkdWvSJk
	HNTwouWus99DtPjgK4dljKakZc0OsejRT44iaszS1DWJboJs5sQfqJf8wxD4hHf0bcxCjGhyaFd
	3ILzuxrIxG2mgq+gUV/ZgMzvP
X-Received: by 2002:a05:600c:4e50:b0:4a9:2a92:231f with SMTP id 5b1f17b1804b1-4ac16bc461emr311760895e9.7.1793719780169;
        Tue, 03 Nov 2026 07:29:40 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>
Subject: [PATCH 6/6] treewide: Make {invalidate/clean}_dcahce_va_range() void
Date: Tue,  3 Nov 2026 15:29:28 +0000
Message-Id: <20261103152928.2142176-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261103152928.2142176-1-andrew.cooper3@citrix.com>
References: <20261103152928.2142176-1-andrew.cooper3@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1793719781-514C7CFC-829990DE/10/78276251493
X-purgate-type: spam
X-purgate-size: 6429
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Precisely two functions - RISC-V's flush_page_to_ram() and ARM's
_cache_flush() - check the return value of these functions, yet all
implementations return success, and ARM documents this as a requirement.

Make them void and simply the callers which care.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 xen/arch/arm/include/asm/page.h   | 20 +++++++-------------
 xen/arch/riscv/include/asm/page.h | 10 +++-------
 xen/arch/riscv/mm.c               |  4 +---
 xen/common/grant_table.c          | 11 +++++------
 4 files changed, 16 insertions(+), 29 deletions(-)

diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/page.h
index 6da4745736a2..b719c2ed4c12 100644
--- a/xen/arch/arm/include/asm/page.h
+++ b/xen/arch/arm/include/asm/page.h
@@ -165,13 +165,13 @@ static inline size_t read_dcache_line_bytes(void)
  * if 'range' is large enough we might want to use model-specific
  * full-cache flushes. */
 
-static inline int invalidate_dcache_va_range(const void *p, unsigned long size)
+static inline void invalidate_dcache_va_range(const void *p, unsigned long size)
 {
     size_t cacheline_mask = dcache_line_bytes - 1;
     unsigned long partial_head;
 
     if ( !size )
-        return 0;
+        return;
 
     /* Passing a region that wraps around is illegal */
     ASSERT(((uintptr_t)p + size - 1) >= (uintptr_t)p);
@@ -208,17 +208,15 @@ static inline int invalidate_dcache_va_range(const void *p, unsigned long size)
 
  done:
     dsb(sy);           /* So we know the flushes happen before continuing */
-
-    return 0;
 }
 
-static inline int clean_dcache_va_range(const void *p, unsigned long size)
+static inline void clean_dcache_va_range(const void *p, unsigned long size)
 {
     size_t cacheline_mask = dcache_line_bytes - 1;
     unsigned long idx = 0;
 
     if ( !size )
-        return 0;
+        return;
 
     /* Passing a region that wraps around is illegal */
     ASSERT(((uintptr_t)p + size - 1) >= (uintptr_t)p);
@@ -231,18 +229,16 @@ static inline int clean_dcache_va_range(const void *p, unsigned long size)
             idx += dcache_line_bytes, size -= dcache_line_bytes )
         asm_inline volatile ( __clean_dcache_one(0) : : "r" (p + idx) );
     dsb(sy);           /* So we know the flushes happen before continuing */
-    /* ARM callers assume that dcache_* functions cannot fail. */
-    return 0;
 }
 
-static inline int clean_and_invalidate_dcache_va_range
-    (const void *p, unsigned long size)
+static inline void
+clean_and_invalidate_dcache_va_range(const void *p, unsigned long size)
 {
     size_t cacheline_mask = dcache_line_bytes - 1;
     unsigned long idx = 0;
 
     if ( !size )
-        return 0;
+        return;
 
     /* Passing a region that wraps around is illegal */
     ASSERT(((uintptr_t)p + size - 1) >= (uintptr_t)p);
@@ -255,8 +251,6 @@ static inline int clean_and_invalidate_dcache_va_range
             idx += dcache_line_bytes, size -= dcache_line_bytes )
         asm volatile (__clean_and_invalidate_dcache_one(0) : : "r" (p + idx));
     dsb(sy);         /* So we know the flushes happen before continuing */
-    /* ARM callers assume that dcache_* functions cannot fail. */
-    return 0;
 }
 
 /* Macros for flushing a single small item.  The predicate is always
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index f9e59e61de30..770410085fd9 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -196,23 +196,19 @@ static inline bool pte_is_superpage(pte_t p, unsigned int level)
     return (level > 0) && pte_is_mapping(p);
 }
 
-static inline int clean_and_invalidate_dcache_va_range(const void *p,
-                                                       unsigned long size)
+static inline void
+clean_and_invalidate_dcache_va_range(const void *p, unsigned long size)
 {
 #ifndef CONFIG_QEMU_PLATFORM
 # error "should clean_and_invalidate_dcache_va_range() be updated?"
 #endif
-
-    return 0;
 }
 
-static inline int clean_dcache_va_range(const void *p, unsigned long size)
+static inline void clean_dcache_va_range(const void *p, unsigned long size)
 {
 #ifndef CONFIG_QEMU_PLATFORM
 # error "should clean_dcache_va_range() be updated?"
 #endif
-
-    return 0;
 }
 
 static inline void invalidate_icache(void)
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 6f7dcd10b2c6..78f23392cc35 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -618,9 +618,7 @@ void flush_page_to_ram(unsigned long mfn, bool sync_icache)
 {
     const void *v = map_domain_page(_mfn(mfn));
 
-    if ( clean_and_invalidate_dcache_va_range(v, PAGE_SIZE) )
-        BUG();
-
+    clean_and_invalidate_dcache_va_range(v, PAGE_SIZE);
     unmap_domain_page(v);
 
     if ( sync_icache )
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index d453c38556fc..eebf8850d062 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3673,14 +3673,13 @@ static int _cache_flush(gnttab_cache_flush_t *cflush, grant_ref_t *cur_ref)
     v = map_domain_page(mfn);
     v += cflush->offset;
 
+    ret = 0;
     if ( (cflush->op & GNTTAB_CACHE_INVAL) && (cflush->op & GNTTAB_CACHE_CLEAN) )
-        ret = clean_and_invalidate_dcache_va_range(v, cflush->length);
+        clean_and_invalidate_dcache_va_range(v, cflush->length);
     else if ( cflush->op & GNTTAB_CACHE_INVAL )
-        ret = invalidate_dcache_va_range(v, cflush->length);
-    else if ( cflush->op & GNTTAB_CACHE_CLEAN )
-        ret = clean_dcache_va_range(v, cflush->length);
-    else
-        ret = 0;
+        invalidate_dcache_va_range(v, cflush->length);
+    else /* cflush->op & GNTTAB_CACHE_CLEAN */
+        clean_dcache_va_range(v, cflush->length);
 
     unmap_domain_page(v);
 
-- 
2.39.5


