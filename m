Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A19C4452D
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:00:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366949.1616753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqPl-0004UK-Hi; Mon, 20 Jul 2026 16:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366949.1616753; Mon, 20 Jul 2026 16:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqPl-0004U1-Bw; Mon, 20 Jul 2026 16:00:21 +0000
Received: by outflank-mailman (input) for mailman id 1366949;
 Mon, 20 Jul 2026 16:00:20 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqPk-0004Oc-QL
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:00:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqPk-00CGfz-75
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:00:20 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e460a-bab6-0a2a0a5309dd-0a2a4509cfca-20
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:20 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4614-be1a-0a2a45090019-d155dd2bd5d7-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:20 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-47c6e9a694bso5724921f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:00:20 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edd7d3sm30084673f8f.25.2026.07.20.09.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:00:18 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784563220; x=1785168020; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jpi1OQhQ+cckOTheI6EzqlufPMg8rElGByM+dRD5uB4=;
        b=Aj9TeBKiwfyGD4b3qH0HXQMp5qM20UcckCbPaXxLAauS7aLWg7lgkXQYQXVZIQHTpT
         OcSX4kGerfdWNolKihRjMoMZIoKtHWhy0abVZWVWSM8MRoGlLvT8n+IA65V9EQb6pMtS
         5EBFVt9/pSZVhle0tYI6v592RKLsfRDLzJsmvuwthtgrCOil4248qYSF0c0WCbPhe5lM
         EeJKuKio/P7Rreb9l8tbQi5ImZxB0FZSsHKqxuRfm3SgeQhvltQ6AADCBvsRhjtcY+m1
         dr6FzipyNxvJykf3uxUQNZ3n1IDw0lwykBGtcEbpex9CsagC9pYIovnhvx/DkH29o2hG
         S1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563220; x=1785168020;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jpi1OQhQ+cckOTheI6EzqlufPMg8rElGByM+dRD5uB4=;
        b=qDhJf2JcDUtJaZjDDjNv73KLfXVrF6xfOeEpLSBi57W1NHPhZO+heDJrImwzXTMbf5
         zX0VkxKP5Gqt7YUj1bvQl3D5KFb8LDY2nXV5bYXrgDTvR2KFeP4DGypp92Gfn9ipE43B
         gpCSvCSn1RDKtKsh+RYlv11tIhkct4tWXu/hX4lUz1AANYpwdSJSwvYByVerVzFV/EaN
         NFXEHkTF76qBRdjD/DEelJkYFJ4Uz3siu7xm1V4hAlM/xJGRE409eZkBhIKa5itm0+xF
         8L0TYWLDr9om7bRoBJdq8Pph0kYdt1MJr91EUJmOru9pU/jPeLhZUeDe8XZREQVLrVDi
         TfqQ==
X-Gm-Message-State: AOJu0YyWKj1zAzC6W1k6C8am1uhKSOK0WBMkCHoLaf8WH3aMnPZ/hqlA
	DJ7SwI1hHk6W62ajh/Da9w7wm+NY5mlSzg7if+KnvPtm7Q8FTR6BH/LYfzSm9w==
X-Gm-Gg: AR+sD12iz72M5BzufQFtAEdVqgLOUxV7Oj5q08TdDskcRMyic+PFk4gF/WfYWiv5kAd
	X+wKqs9myzEKjMJn2PPYyK7NDAT6DHA9lkz1SzIPUaMSyIw0IJYPhrFl8qVO7+PY7EU3MWxd1Hs
	UiKEGBFZ02t92Bzx3CCMc5cMAOfVOy5Gib/U6Dj4r4KijNCPLdRYA81P1uYTXMJ2z3r2JMBZFHQ
	/A61D0qR408t7pDrGQFM0q/mkORyCoqV7ih7OMfd7EtCJAh1pZpaqvXZ4DWRoCpNi58Sjew/UlS
	P7EbJM1sKDG80GnixJPyp+xftl5cfPRWdrFwZsFRTie8QdAEXH0xEL6bSF30cJE7FemsYKcqxEB
	+M1Inc17XloNBK/E9s8GOCrPj6V3k0rgt6fwxl7NAAQuMeNergkCiRaxk7Z7aRNtLzivD9KC9yb
	Dnd6YkTkirgH++pHCzfvDJ4ZMJXhZaDdFn
X-Received: by 2002:a05:6000:607:b0:47f:5367:73a3 with SMTP id ffacd0b85a97d-47f62305a1cmr17834461f8f.13.1784563219337;
        Mon, 20 Jul 2026 09:00:19 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v6 03/23] xen: arm: update p2m_set_allocation() prototype
Date: Mon, 20 Jul 2026 17:59:44 +0200
Message-ID: <2ebda180488310a6f862242cb173ffc9b106756e.1784559209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784559209.git.oleksii.kurochko@gmail.com>
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1784563220-BF6D2034-1ABBD91C/10/73395122804
X-purgate-type: spam
X-purgate-size: 8946

p2m_set_allocation() uses a bool *preempted out-argument that overloads two
meanings. When non-NULL, the value written back (true) duplicates information
already carried by the -ERESTART return code — pure redundancy, which the
caller-side ASSERT(preempted == (rc == -ERESTART)) only documents. Separately,
a NULL pointer is an implicit calling convention meaning "preemption is not
permitted in this context".

Replace the pointer with a plain bool can_preempt that explicitly controls
whether the preemption check runs, making the NULL-to-suppress convention
type-safe and self-documenting, and rely on the -ERESTART return code alone to
report that preemption occurred.

Since p2m_set_allocation() is called by the common dom0less build code,
move its declaration from the ARM-specific asm/p2m.h to xen/p2m-common.h.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v6:
 - Nothing changed. Only rebase.
---
Changes in v5:
 - Add Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v4:
 - Reword commit message: a NULL pointer was a calling convention meaning
   "preemption not permitted", not pure redundancy.
 - Annotate the explicit can_preempt arguments at the call sites with
   /* can_preempt */ comments for readability.
 - Move the function's doc comment to the prototype in xen/p2m-common.h
   (dropping the duplicate above the Arm and RISC-V definitions) and clarify
   that -ERESTART is only returned when can_preempt is true.
 - Add __must_check to the prototype, since the return code is now the only
   preemption-status indicator.
---
Changes in v3:
 - Nothing changed. Only rebase.
---
Changes in v2:
 - new patch
---
---
 xen/arch/arm/include/asm/p2m.h          |  1 -
 xen/arch/arm/mmu/p2m.c                  | 24 ++++++------------------
 xen/arch/riscv/include/asm/paging.h     |  2 +-
 xen/arch/riscv/p2m.c                    |  9 ++-------
 xen/arch/riscv/paging.c                 |  7 ++-----
 xen/common/device-tree/dom0less-build.c |  2 +-
 xen/include/xen/p2m-common.h            |  8 ++++++++
 7 files changed, 20 insertions(+), 33 deletions(-)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 4a4913716bdd..737da60dcf58 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -238,7 +238,6 @@ void p2m_restore_state(struct vcpu *n);
 /* Print debugging/statistial info about a domain's p2m */
 void p2m_dump_info(struct domain *d);
 
-int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted);
 int p2m_teardown_allocation(struct domain *d);
 
 static inline void p2m_write_lock(struct p2m_domain *p2m)
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 51abf3504fcf..2cf35d8a3709 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -65,12 +65,7 @@ int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
     return 0;
 }
 
-/*
- * Set the pool of pages to the required number of pages.
- * Returns 0 for success, non-zero for failure.
- * Call with d->arch.paging.lock held.
- */
-int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
+int p2m_set_allocation(struct domain *d, unsigned long pages, bool can_preempt)
 {
     struct page_info *pg;
 
@@ -112,11 +107,8 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
             break;
 
         /* Check to see if we need to yield and try again */
-        if ( preempted && general_preempt_check() )
-        {
-            *preempted = true;
+        if ( can_preempt && general_preempt_check() )
             return -ERESTART;
-        }
     }
 
     return 0;
@@ -125,7 +117,6 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
 int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
 {
     unsigned long pages = size >> PAGE_SHIFT;
-    bool preempted = false;
     int rc;
 
     if ( (size & ~PAGE_MASK) ||          /* Non page-sized request? */
@@ -133,27 +124,24 @@ int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
         return -EINVAL;
 
     spin_lock(&d->arch.paging.lock);
-    rc = p2m_set_allocation(d, pages, &preempted);
+    rc = p2m_set_allocation(d, pages, /* can_preempt */ true);
     spin_unlock(&d->arch.paging.lock);
 
-    ASSERT(preempted == (rc == -ERESTART));
-
     return rc;
 }
 
 int p2m_teardown_allocation(struct domain *d)
 {
     int ret = 0;
-    bool preempted = false;
 
     spin_lock(&d->arch.paging.lock);
     if ( d->arch.paging.p2m_total_pages != 0 )
     {
-        ret = p2m_set_allocation(d, 0, &preempted);
-        if ( preempted )
+        ret = p2m_set_allocation(d, 0, /* can_preempt */ true);
+        if ( ret == -ERESTART )
         {
             spin_unlock(&d->arch.paging.lock);
-            return -ERESTART;
+            return ret;
         }
         ASSERT(d->arch.paging.p2m_total_pages == 0);
     }
diff --git a/xen/arch/riscv/include/asm/paging.h b/xen/arch/riscv/include/asm/paging.h
index e487c89a4ccd..103384723dc5 100644
--- a/xen/arch/riscv/include/asm/paging.h
+++ b/xen/arch/riscv/include/asm/paging.h
@@ -9,7 +9,7 @@ struct page_info;
 int paging_domain_init(struct domain *d);
 
 int paging_freelist_adjust(struct domain *d, unsigned long pages,
-                           bool *preempted);
+                           bool can_preempt);
 
 int paging_ret_to_domheap(struct domain *d, unsigned int nr_pages);
 int paging_refill_from_domheap(struct domain *d, unsigned int nr_pages);
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 703b9f4d2540..566266e3e78f 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -428,17 +428,12 @@ int p2m_init(struct domain *d, const struct xen_domctl_createdomain *config)
     return 0;
 }
 
-/*
- * Set the pool of pages to the required number of pages.
- * Returns 0 for success, non-zero for failure.
- * Call with d->arch.paging.lock held.
- */
-int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
+int p2m_set_allocation(struct domain *d, unsigned long pages, bool can_preempt)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     int rc;
 
-    if ( (rc = paging_freelist_adjust(d, pages, preempted)) )
+    if ( (rc = paging_freelist_adjust(d, pages, can_preempt)) )
         return rc;
 
     /*
diff --git a/xen/arch/riscv/paging.c b/xen/arch/riscv/paging.c
index 76a203edbb0c..35f572689a7c 100644
--- a/xen/arch/riscv/paging.c
+++ b/xen/arch/riscv/paging.c
@@ -47,7 +47,7 @@ static int _paging_add_to_freelist(struct domain *d)
 }
 
 int paging_freelist_adjust(struct domain *d, unsigned long pages,
-                           bool *preempted)
+                           bool can_preempt)
 {
     ASSERT(spin_is_locked(&d->arch.paging.lock));
 
@@ -66,11 +66,8 @@ int paging_freelist_adjust(struct domain *d, unsigned long pages,
             return rc;
 
         /* Check to see if we need to yield and try again */
-        if ( preempted && general_preempt_check() )
-        {
-            *preempted = true;
+        if ( can_preempt && general_preempt_check() )
             return -ERESTART;
-        }
     }
 
     return 0;
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 9513c1c83766..fcbeb8adbd73 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -760,7 +760,7 @@ static int __init domain_p2m_set_allocation(struct domain *d, uint64_t mem,
                 domain_p2m_pages(mem, d->max_vcpus);
 
     spin_lock(&d->arch.paging.lock);
-    rc = p2m_set_allocation(d, p2m_pages, NULL);
+    rc = p2m_set_allocation(d, p2m_pages, /* can_preempt */ false);
     spin_unlock(&d->arch.paging.lock);
 
     return rc;
diff --git a/xen/include/xen/p2m-common.h b/xen/include/xen/p2m-common.h
index f0bd9a6b9896..0eb061991283 100644
--- a/xen/include/xen/p2m-common.h
+++ b/xen/include/xen/p2m-common.h
@@ -43,5 +43,13 @@ int __must_check check_get_page_from_gfn(struct domain *d, gfn_t gfn,
                                          bool readonly, p2m_type_t *p2mt_p,
                                          struct page_info **page_p);
 
+/*
+ * Set the pool of pages to the required number of pages.
+ * Returns 0 for success, -ERESTART if preempted (only when can_preempt is
+ * true), or a negative error code on failure.
+ * Call with d->arch.paging.lock held.
+ */
+int __must_check p2m_set_allocation(struct domain *d, unsigned long pages,
+                                    bool can_preempt);
 
 #endif /* _XEN_P2M_COMMON_H */
-- 
2.54.0


