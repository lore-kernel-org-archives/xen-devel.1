Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA25AC5AE5D
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 10:30:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387331.1628645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtNHN-0005di-Vt; Mon, 10 Aug 2026 10:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387331.1628645; Mon, 10 Aug 2026 10:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtNHN-0005dR-Si; Mon, 10 Aug 2026 10:30:49 +0000
Received: by outflank-mailman (input) for mailman id 1387331;
 Mon, 10 Aug 2026 10:30:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wtNHM-0005NJ-LC
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 10:30:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtNHM-00AlYD-1S
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 12:30:48 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a79a84f-e002-0a2a0a5209dd-0a2a450394e8-34
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 12:30:48 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a79a857-fae8-0a2a45030019-d1558033b954-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 12:30:47 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4954a2e73a9so10218785e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 03:30:47 -0700 (PDT)
Received: from localhost.localdomain ([31.111.172.30])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995bb8b668sm218478455e9.0.2026.08.10.03.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2026 03:30:46 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786357847; x=1786962647; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qkv0EX1DlL9MRRhP+Wk/CTJgzWiZHG9SS1IgseXcsTo=;
        b=dssgC8bYdRsy1rv6mnHpmk95qopnTHYfBG03RycozOpT7Xmo8dQHhxB4Sl82MMD8Ky
         SL7nAtNBYvO64eJ8Wt1qRqhU5ylZ/0T9PIM5ZVbIe0qPqRVbfHUqhKxncYSJRrNaihlo
         9v3m550Ved+iR0qBsQwToFNObsJ2CDpgnY/2X2a9hRmv05Omh6rTU4ymTtMGwU1nGMwz
         ylLreFa3surfadgv7cEnSYpIXW5p14mpny2mXs1DodIOw71itLZgmVidYsN+fM2s37K/
         L/ACBDLCjUKnZFA4MKbauic9HfS9fKKO0j3uGCRlAXRRdgtQCJwHTEQi7Sa276EHiyqk
         dQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786357847; x=1786962647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qkv0EX1DlL9MRRhP+Wk/CTJgzWiZHG9SS1IgseXcsTo=;
        b=dUjd7OW6kr4BH7uGzI12euWAKiRyleMJxRQlElE1/X9oFlnevP7pkjKzn/b6UohWY+
         kREO8Tk39mH2zuwsn23LahkgcEE3XxUn2pJ3abjM2rmJxhaoBK49wkJXNNj8/UOeEMtT
         BvRUA16pxopJePk5Tf0udlLubNxl/EPay75/QeY2rTuKusdsTV61KG6Dq70/MNh1k7r3
         2qCt7VHkjQqbSbjv67MqFTW9UrnC/XehxXlIgmqy8n/3tK+t9EFyjl0hJhucU/+9dZJ8
         XTuSE928tNz+VfvXaIyJUGUB3AJ8l72iLFik6bTmjjM2fSIoII6N8U1Hqwiqxr4739Ua
         zTwg==
X-Gm-Message-State: AOJu0Yxbfd396HTgZ9Dei6HV0dGyxCccFE0393rBFMqGnlzB+FsOiDCG
	yMyYJSfZIetHeNkT2NSyIeUmTy9dcAHmikh437yZXjlN4lU2qaDvLiVeQeqQ2T46Mig=
X-Gm-Gg: AR+sD10RbCtaaPoqbfSabvQh9WZMXwhuYE0KepEB/FZ+LWAIO8Sxl8ZJrcRBiVM1upM
	WhUN2jP0Y9jsAxbV7KbFpTZVSr9JUwsVUm5ag6wwTmF8DGWO9xuYPQOfJMVzLKbPEcFKin72s1j
	sT2uKMD78B0rc0mCAzHDtyi3/Et+K4pe/w41DJduCq13EayJ3CKXwDwJijPLhEsqdOKWtJNl1dZ
	aZxtTjox4zWeJOQAx5+G+GRYtzLEtYMswz8p1l2T3foSdy2tTtznrFTGjyDlyQISsiUCaln1TEo
	4vdxEFFYNd+g4ORzafx/5SRPkvieQtmxMA2cX49I4yIAbY+FwGUChZ7Xiez/ysRv0b3EaDzyW9o
	W8lRZ6vNnEWAWqHXGkphlYcBb3piQzhzo4dUVvKRSBurOM+Iks6UpcbTKXBDH2yXSeYEkjjLxWS
	WtOlZo5YvIynE4h6JrCKx2g1J0BtfsZpTojVcuDjc9dDQkGj+bzTvb7VkRPHl7XggVuuARmrabz
	dia0edVq2QMvMcHedzLF+t6VT4iFMUMGwkeH/P5
X-Received: by 2002:a05:600c:1553:b0:495:5045:39e6 with SMTP id 5b1f17b1804b1-4994e7d3080mr453921205e9.17.1786357847166;
        Mon, 10 Aug 2026 03:30:47 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v10 7/10] xen: implement new foreign copy hypercall
Date: Mon, 10 Aug 2026 11:30:10 +0100
Message-ID: <20260810103018.54564-8-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810103018.54564-1-frediano.ziglio@citrix.com>
References: <20260810103018.54564-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1786357847-74C884E9-DCD50404/0/0
X-purgate-type: clean
X-purgate-size: 10676

Add a sub hypercall to __HYPERVISOR_memory_op to allow to read/write
memory from/to a foreign domain.

Extending MMUEXT_COPY_PAGE seems better on first sight but considering
that MMUEXT is meant for PV only and trying to change that sub-op this
solution is better.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
Changes since v4:
- Fix typo in comment.

Changes since v5:
- update xen_foreigncopy structure comments;
- move check for no frames after checking the domain;
- use mnemonic instead of 1U;
- fix page type checks;
- do not overwrite error copying back structure;
- latch MFN value;
- improved commit message.

Changes since v6:
- check permissions before nr_frames;
- different flag for read or write;
- print error as negative for coherence;
- update some comments;
- different page types for different architectures.

Changes since v9:
- page permission checks like MMU_UPDATE;
- new XSM settings;
- do not restrict domain;
- different explanation why HVM guests are not supported.
---
 xen/common/memory.c         | 149 ++++++++++++++++++++++++++++++++++++
 xen/include/public/memory.h |  45 ++++++++++-
 xen/include/xsm/dummy.h     |  14 ++++
 xen/include/xsm/hooks.h     |   2 +
 xen/xsm/flask/hooks.c       |  10 +++
 5 files changed, 219 insertions(+), 1 deletion(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index 9443e35a7f..29a70d99b1 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1548,6 +1548,141 @@ static int acquire_resource(
     return rc;
 }
 
+/*
+ * The "noinline" qualifier avoids the compiler to create a large function
+ * consuming quite a lot of stack.
+ */
+static int noinline mem_foreigncopy(
+    XEN_GUEST_HANDLE_PARAM(xen_foreigncopy_t) arg)
+{
+    struct domain *d, *const currd = current->domain;
+    xen_foreigncopy_t copy;
+    int rc, direction;
+
+    if ( copy_from_guest(&copy, arg, 1) )
+        return -EFAULT;
+
+    if ( copy.flags & ~XENMEM_foreigncopy_direction )
+        return -EINVAL;
+
+    direction = copy.flags & XENMEM_foreigncopy_direction;
+
+    d = rcu_lock_domain_by_any_id(copy.domid);
+    if ( !d )
+        return -ESRCH;
+
+    /*
+     * Check we are allowed to map and access these foreign pages.
+     */
+    if ( direction == XENMEM_foreigncopy_from )
+        rc = xsm_foreigncopy_from(XSM_TARGET, currd, d);
+    else
+        rc = xsm_foreigncopy_to(XSM_TARGET, currd, d);
+    if ( rc )
+        goto out;
+
+    while ( copy.nr_frames )
+    {
+        /*
+         * Arbitrary size.  Not too much stack space, and a reasonable stride
+         * for continuation checks.
+         */
+        xen_pfn_t gfn_list[32];
+        unsigned int todo = MIN(ARRAY_SIZE(gfn_list), copy.nr_frames);
+
+        rc = -EFAULT;
+        if ( copy_from_guest(gfn_list, copy.frame_list, todo) )
+            goto out;
+
+        for ( unsigned int i = 0; i < todo; i++ )
+        {
+            struct page_info *foreign_page;
+            mfn_t foreign_mfn;
+            void *foreign;
+            p2m_type_t p2mt;
+            p2m_query_t q = (direction == XENMEM_foreigncopy_to) ?
+                            P2M_ALLOC | P2M_UNSHARE : P2M_ALLOC;
+
+            foreign_page = get_page_from_gfn(d, gfn_list[i], &p2mt, q);
+
+            if ( unlikely(p2m_is_paged(p2mt)) )
+            {
+                if ( foreign_page )
+                    put_page(foreign_page);
+                p2m_mem_paging_populate(d, _gfn(gfn_list[i]));
+                p2mt = p2m_ram_paging_in;
+                foreign_page = NULL;
+            }
+
+            if ( unlikely(!foreign_page) )
+            {
+                rc = -ENOENT;
+                if ( p2mt != p2m_ram_paging_in )
+                {
+                    gdprintk(XENLOG_WARNING,
+                             "Error accessing foreign gfn %" PRI_gfn "\n",
+                             gfn_list[i]);
+                    rc = -EINVAL;
+                }
+                copy.nr_frames -= i;
+                guest_handle_add_offset(copy.frame_list, i);
+                goto out;
+            }
+
+            foreign_mfn = page_to_mfn(foreign_page);
+
+            /* A page is dirtied when it's being copied to. */
+            if ( direction == XENMEM_foreigncopy_to )
+                paging_mark_dirty(d, foreign_mfn);
+
+            foreign = map_domain_page(foreign_mfn);
+            if ( direction == XENMEM_foreigncopy_from )
+                rc = copy_to_guest(copy.buffer, foreign, PAGE_SIZE);
+            else
+                rc = copy_from_guest(foreign, copy.buffer, PAGE_SIZE);
+            unmap_domain_page(foreign);
+            put_page(foreign_page);
+
+            if ( unlikely(rc) )
+            {
+                gdprintk(XENLOG_WARNING,
+                         "Error %d copying gfn %" PRI_gfn "\n",
+                         rc, gfn_list[i]);
+                copy.nr_frames -= i;
+                guest_handle_add_offset(copy.frame_list, i);
+                goto out;
+            }
+
+            guest_handle_add_offset(copy.buffer, PAGE_SIZE);
+        }
+
+        copy.nr_frames -= todo;
+        guest_handle_add_offset(copy.frame_list, todo);
+
+        if ( copy.nr_frames && hypercall_preempt_check() )
+        {
+            rc = hypercall_create_continuation(
+                __HYPERVISOR_memory_op, "lh", XENMEM_foreigncopy, arg);
+            goto out;
+        }
+    }
+
+    rc = 0;
+
+ out:
+    rcu_unlock_domain(d);
+
+    /*
+     * Update in all cases, it allows the caller to know how many
+     * frames were successfully copied and the continuation to
+     * continue correctly.
+     */
+    if ( __copy_to_guest(arg, &copy, 1) && rc >= 0 )
+        rc = -EFAULT;
+
+    return rc;
+}
+
 long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     struct domain *d, *curr_d = current->domain;
@@ -2027,6 +2162,20 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
             start_extent);
         break;
 
+    case XENMEM_foreigncopy:
+        /*
+         * Instead of using "start_extent" for the continuation, we update
+         * the xen_foreigncopy structure back, so we are not constrained by
+         * MEMOP_EXTENT_SHIFT.
+         * We copy it back also to tell the caller where the copy stopped
+         * (either for error or because all frames were copied).
+         */
+        if ( unlikely(start_extent) )
+            return -EINVAL;
+
+        rc = mem_foreigncopy(guest_handle_cast(arg, xen_foreigncopy_t));
+        break;
+
     default:
         rc = arch_memory_op(cmd, arg);
         break;
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index bd9fc37b52..66bd2a6c42 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -740,7 +740,50 @@ struct xen_vnuma_topology_info {
 typedef struct xen_vnuma_topology_info xen_vnuma_topology_info_t;
 DEFINE_XEN_GUEST_HANDLE(xen_vnuma_topology_info_t);
 
-/* Next available subop number is 29 */
+/*
+ * Copy memory from/to a given domain.
+ * This calls is meant to replace expensive operations during migration which
+ * are only supported for PV guests.
+ */
+#define XENMEM_foreigncopy 29
+struct xen_foreigncopy {
+    /* IN - The domain whose memory is to be copied. */
+    domid_t domid;
+
+    /* IN - Flags. */
+#define XENMEM_foreigncopy_from 0
+#define XENMEM_foreigncopy_to 1
+#define XENMEM_foreigncopy_direction 1
+    uint16_t flags;
+
+    /*
+     * IN/OUT
+     *
+     * As an IN parameter number of frames of the domain to be copied.
+     * On output updated number of frames left (0 if success).
+     */
+    uint32_t nr_frames;
+
+    /*
+     * IN/OUT
+     *
+     * Frames to be copied.
+     * On output updated to point to the first frame unhandled, if any.
+     */
+    XEN_GUEST_HANDLE(xen_pfn_t) frame_list;
+
+    /*
+     * IN/OUT
+     *
+     * Guest buffer to read/write from.
+     * On output updated to point to the first page pointer unhandled.
+     */
+    XEN_GUEST_HANDLE(uint8) buffer;
+};
+typedef struct xen_foreigncopy xen_foreigncopy_t;
+DEFINE_XEN_GUEST_HANDLE(xen_foreigncopy_t);
+
+/* Next available subop number is 30 */
 
 #endif /* __XEN_PUBLIC_MEMORY_H__ */
 
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 131631cb27..dcdb7f5396 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -569,6 +569,20 @@ static XSM_INLINE int cf_check xsm_map_gmfn_foreign(
     return xsm_default_action(action, d, t);
 }
 
+static XSM_INLINE int cf_check xsm_foreigncopy_from(
+    XSM_DEFAULT_ARG struct domain *d, struct domain *t)
+{
+    XSM_ASSERT_ACTION(XSM_TARGET);
+    return xsm_default_action(action, d, t);
+}
+
+static XSM_INLINE int cf_check xsm_foreigncopy_to(
+    XSM_DEFAULT_ARG struct domain *d, struct domain *t)
+{
+    XSM_ASSERT_ACTION(XSM_TARGET);
+    return xsm_default_action(action, d, t);
+}
+
 #ifdef CONFIG_HVM
 
 static XSM_INLINE int cf_check xsm_hvm_param(
diff --git a/xen/include/xsm/hooks.h b/xen/include/xsm/hooks.h
index 5bdb23f26d..63e2831d31 100644
--- a/xen/include/xsm/hooks.h
+++ b/xen/include/xsm/hooks.h
@@ -58,6 +58,8 @@ XSM_HOOK(int, add_to_physmap, struct domain *, struct domain *)
 XSM_HOOK(int, remove_from_physmap, struct domain *, struct domain *)
 XSM_HOOK(int, map_gmfn_foreign, struct domain *, struct domain *)
 XSM_HOOK(int, claim_pages, struct domain *)
+XSM_HOOK(int, foreigncopy_from, struct domain *, struct domain *);
+XSM_HOOK(int, foreigncopy_to, struct domain *, struct domain *);
 
 XSM_HOOK(int, console_io, struct domain *, int)
 
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 3cfdf6bf08..281800e176 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1368,6 +1368,16 @@ static int cf_check flask_map_gmfn_foreign(struct domain *d, struct domain *t)
     return domain_has_perm(d, t, SECCLASS_MMU, MMU__MAP_READ | MMU__MAP_WRITE);
 }
 
+static int cf_check flask_foreigncopy_from(struct domain *d, struct domain *t)
+{
+    return domain_has_perm(d, t, SECCLASS_MMU, MMU__MAP_READ);
+}
+
+static int cf_check flask_foreigncopy_to(struct domain *d, struct domain *t)
+{
+    return domain_has_perm(d, t, SECCLASS_MMU, MMU__MAP_READ | MMU__MAP_WRITE);
+}
+
 #ifdef CONFIG_HVM
 
 static int cf_check flask_hvm_param(struct domain *d, unsigned long op)
-- 
2.43.0


