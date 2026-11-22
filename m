Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04468606A320
	for <xen-devel@archiver.kernel.org>; Sun, 22 Nov 2026 09:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AX6LX7PR
Received: from list by lists.xenproject.org with outflank-mailman.1499546.1696350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xV4Hc-0006TU-EG; Sun, 22 Nov 2026 09:54:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1499546.1696350; Sun, 22 Nov 2026 09:54:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xV4Hc-0006TG-AP; Sun, 22 Nov 2026 09:54:52 +0000
Received: by outflank-mailman (input) for mailman id 1499546;
 Sun, 22 Nov 2026 09:54:50 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <haseebashraf091@gmail.com>) id 1xV4Ha-0006Pm-Nu
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2026 09:54:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xV4Ha-00G0sz-4S
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2026 10:54:50 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <haseebashraf091@gmail.com>)
 id 6b02bb9e-e002-0a2a0a5209dd-0a2a450293f2-30
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 10:54:50 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <haseebashraf091@gmail.com>)
 id 6b02bbe9-4900-0a2a45020019-d1558030cce6-3
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 10:54:50 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a1fbd52ab6so15736085e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 01:54:50 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.59.78])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8849e598sm218409605e9.8.2026.11.22.01.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2026 01:54:49 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795341289; x=1795946089; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GjkumpSVhpOXhxhIrkLoN9WgteeDVe8/g1zeEGiUhXo=;
        b=AX6LX7PRnqgyx++sySJhXo9ZLD/sjiDVVmRSqfNN8+LZl7rLngkMaWdOdasmQAdFeU
         gElzJkRXZrYFKkuHFaq5DrVCuS84LOehY7xbw9hCMiplxVtcUFVeZtiqOceXUoyJkxQ+
         lIBjM5gvFB8Acel5+Y1GjLtvcXfhgtQiK8d0nNnWfa6Q2fY4VZEdCtAbHyj2K5VRMm4a
         jYvp+6SGfD68zKHh/woxslawfgbzUElRXIDyiOdfBLHlJAd9AWf7wa3nxuMzIjxjptP9
         scqBq886L/Aqs7Gbe44JMrogOOXj9cbWicQviKEPhPQCdq1qF0TI3bduMNNE+HyktZ25
         HmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341289; x=1795946089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GjkumpSVhpOXhxhIrkLoN9WgteeDVe8/g1zeEGiUhXo=;
        b=NqTcYnT7EmrOsccE5tgmf9zMUs/jL4EIntw5B7X8lu8Hf2IssNt7WbN/QbmyIA4O6S
         O3nt3bmoRPxM2q1EejD01mgpQ3F/I6pz5AmHvjCxNlvtsdaQNX3pwq/AYRs7U1mbCKtg
         j0AV9WUN7/JLtIKvhSR9Vh+pKCMYe+WgGFe8sw9bI/4I0RKcwlBYF/ux1NCfMzZQ+YRd
         WkrnJ6Yxv3d3Rko+Ym9OE371KLoPaSvmxnRpIA4Rc1IMPbCFJO8kx0DNet+wugR7+hHC
         RPbr0vP0DuJPFULL5hglgTTaCdLcI2mfF0YCKnIhGWCm1uoZeqDhpgwK7WE7V6eoQ6BK
         X7MA==
X-Gm-Message-State: APuU4Z8f7FE8qeuK/0WPktT204rXUH3+Kl4/wa5gD+Ce19b3qF7e6vl5
	7NCDZ81jD8HDrcCw5HROz5gTtdtKeSVqNXW90SvVZ/9f1ndMqW5rqu+CUrJB8coLNRc=
X-Gm-Gg: AZFdTZeoEv19ut34dUQWAsRtaHtZlT0/i0KL9Sf8EFk+z1h9dxGMEyqh8cENz9CsB1Q
	VnrV9kgqWrFxnZiRbRkxhCKZ41s2pNN/Fb32mrYz5HweRUaH8wImGJBx65SA7oa/Q98UT02AqFk
	qZu+0oLfV7rNCC2b7XDmvtGDgLNjmHMk7hYfVBvYCl6p4ngeKyzGhIm1bsIJYLpa3jrxENJ2dfU
	3tXPu4GxYt0dSnKNgKrXZYE41ToNTGbSKlDWWkZeHWXCfLibMhJLe16yOHhkma+G4Z1T0mhXVmH
	wu1h2plj33GwitQmsWQk0mRKowSsBwSFsbfAseX4gYzVTXtnCIyRZpMRdMuKzetOscpDVC80+va
	GTe5hFsvGCo/x3aYOL2yz3YmTgAho4rSwMk8/wY34Rjks7U06MAN4BNoZHw7oGiIh/46/z1zV/q
	Z4lhlosiP4V8m8t3fjzjmKyw2xr4UGY/97pg6Ioqp0jnE7Y1gfm+5bPA9xdNraD94dMJ7ucxSTn
	uuNPacPIvoI/d5Lm17y4P4S1DkCf5f1fpYAOwO0U+O3IAtI8sj37XcZAvOTxBIosBiZY2PKCMdn
	40JpqvlDbBWlE25vM9MMCW1E3e4P2Esamz6rQEeI9TiawjvL0+Cw6X+V8qJXmbPXYDr5g+59u+G
	HQVaRaGxNrfnRbLYVpPGxCvGc
X-Received: by 2002:a05:600c:4e87:b0:4a7:6bc7:f778 with SMTP id 5b1f17b1804b1-4bb88938d38mr186443365e9.30.1795341289432;
        Sun, 22 Nov 2026 01:54:49 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Haseeb Ashraf <haseeb.ashraf@siemens.com>,
	oleksii.kurochko@gmail.com,
	community.manager@xenproject.org,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	michal.orzel@amd.com,
	jbeulich@suse.com,
	julien@xen.org,
	roger@xenproject.org,
	sstabellini@kernel.org,
	dpsmith@apertussolutions.com
Subject: [XEN][PATCH v5 7/8] xen/memory: add XENMEM_remove_from_physmap_batch
Date: Sun, 22 Nov 2026 14:54:21 +0500
Message-ID: <2edf2a0cf5b1b8c29648f47331ea7bac9aee0600.1795336377.git.haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795336377.git.haseebashraf091@gmail.com>
References: <cover.1795336377.git.haseebashraf091@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1795341290-32D906C6-F177A82D/0/0
X-purgate-type: clean
X-purgate-size: 9738
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Haseeb Ashraf <haseeb.ashraf@siemens.com>

Add a batched hypercall to remove pages from a domain's physical address
space, like XENMEM_add_to_physmap_batch does for adding. Each entry gets
the result of XENMEM_remove_from_physmap. The p2m helper invalidates
contiguous runs once per chunk of 256 entries, using the TLBI method
supported by the CPU and range size.

Stage guest handles into per-hypercall buffers because they cannot be
accessed while holding the p2m lock and the target may be the caller.
Take a reference on each page before removal so it remains allocated
until TLB invalidation completes. Copy each chunk's results back, and
allow the hypercall to be preempted between chunks.

The staging buffers are allocated and not placed on the stack: 256
entries need 28 bytes each (7 KiB), a large part of the 32 KiB Arm
stack. Each buffer stays within PAGE_SIZE, so xvmalloc_array() uses the
xmalloc pool. A vmalloc area would be unmapped when it is freed, which
flushes Xen's own TLB. The chunk also bounds the p2m lock hold time and
the invalidation work between preemption points. This is a resource
bound, not a measured throughput threshold.

Only architectures that select HAS_PHYSMAP_REMOVE_BATCH implement this
hypercall; other architectures return -ENOSYS and callers can fall back
to XENMEM_remove_from_physmap. The XSM check is the same as for the
single-page operation. No in-tree caller is added; the hypercall is
meant for a Dom0 kernel or toolstack that unmaps many guest pages.

Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>
---
New in v5.

 CHANGELOG.md                |   5 ++
 xen/common/memory.c         | 152 ++++++++++++++++++++++++++++++++++++
 xen/include/public/memory.h |  35 +++++++++
 3 files changed, 192 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 225397f128..39b3d16928 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -16,6 +16,11 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
      afterwards.
 
 ### Added
+ - On Arm:
+   - XENMEM_remove_from_physmap_batch, which removes several pages from the
+     physical address space of a domain with one hypercall and a TLB
+     invalidation per run of pages, instead of one hypercall and one
+     invalidation per page. Other architectures return -ENOSYS for it.
 
 ### Removed
  - On Arm:
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 4afa2271b7..b5256bf6ec 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1147,6 +1147,117 @@ static int xenmem_add_to_physmap_batch(struct domain *d,
     return 0;
 }
 
+#ifdef CONFIG_HAS_PHYSMAP_REMOVE_BATCH
+/*
+ * Number of entries removed under one p2m write lock and TLB invalidation.
+ * Entries are staged in per hypercall buffers because the guest handles
+ * cannot be accessed with the p2m lock held: the target may be the caller.
+ * The buffers stay below PAGE_SIZE so that they come from the xmalloc pool,
+ * a vmalloc area is unmapped, and flushed from the TLBs, when it is freed.
+ */
+#define XENMEM_RFPB_CHUNK 256U
+
+static int xenmem_remove_from_physmap_batch(
+    struct domain *d, struct xen_remove_from_physmap_batch *xrfpb,
+    unsigned int extent)
+{
+    struct page_info **pages = NULL;
+    xen_pfn_t *gpfns = NULL;
+    mfn_t *mfns = NULL;
+    int *errs = NULL;
+    unsigned int chunk, i;
+    int rc = 0;
+
+    BUILD_BUG_ON(XENMEM_RFPB_CHUNK * sizeof(*pages) > PAGE_SIZE);
+    BUILD_BUG_ON(XENMEM_RFPB_CHUNK * sizeof(*gpfns) > PAGE_SIZE);
+    BUILD_BUG_ON(XENMEM_RFPB_CHUNK * sizeof(*mfns) > PAGE_SIZE);
+
+    if ( unlikely(xrfpb->size < extent) )
+        return -EILSEQ;
+
+    if ( unlikely(xrfpb->size == extent) )
+        return extent ? -EILSEQ : 0;
+
+    if ( !guest_handle_subrange_okay(xrfpb->gpfns, extent, xrfpb->size - 1) ||
+         !guest_handle_subrange_okay(xrfpb->errs, extent, xrfpb->size - 1) )
+        return -EFAULT;
+
+    chunk = min_t(unsigned int, xrfpb->size - extent, XENMEM_RFPB_CHUNK);
+
+    pages = xvmalloc_array(struct page_info *, chunk);
+    gpfns = xvmalloc_array(xen_pfn_t, chunk);
+    mfns = xvmalloc_array(mfn_t, chunk);
+    errs = xvmalloc_array(int, chunk);
+    if ( !pages || !gpfns || !mfns || !errs )
+    {
+        rc = -ENOMEM;
+        goto out;
+    }
+
+    while ( xrfpb->size > extent )
+    {
+        unsigned int n = min_t(unsigned int, xrfpb->size - extent, chunk);
+
+        if ( __copy_from_guest_offset(gpfns, xrfpb->gpfns, extent, n) )
+        {
+            rc = -EFAULT;
+            goto out;
+        }
+
+        /*
+         * Take a reference on each page first: this needs the p2m read
+         * lock, which the removal below holds for writing. The references
+         * also keep the pages from being freed before the TLBs are flushed.
+         * A frame without a page is reported as XENMEM_remove_from_physmap
+         * does.
+         */
+        for ( i = 0; i < n; i++ )
+        {
+            pages[i] = get_page_from_gfn(d, gpfns[i], NULL, P2M_ALLOC);
+            if ( pages[i] != NULL )
+            {
+                mfns[i] = page_to_mfn(pages[i]);
+                errs[i] = 0;
+            }
+            else
+            {
+                mfns[i] = INVALID_MFN;
+                errs[i] = -ENOENT;
+            }
+        }
+
+        guest_physmap_remove_page_batch(d, gpfns, mfns, errs, n);
+
+        for ( i = 0; i < n; i++ )
+            if ( pages[i] != NULL )
+                put_page(pages[i]);
+
+        if ( __copy_to_guest_offset(xrfpb->errs, extent, errs, n) )
+        {
+            rc = -EFAULT;
+            goto out;
+        }
+
+        extent += n;
+
+        /* Ask for a continuation if there is more work to do. */
+        if ( xrfpb->size > extent && hypercall_preempt_check() )
+        {
+            rc = extent;
+            goto out;
+        }
+    }
+
+ out:
+    XVFREE(errs);
+    XVFREE(mfns);
+    XVFREE(gpfns);
+    XVFREE(pages);
+
+    return rc;
+}
+#endif /* CONFIG_HAS_PHYSMAP_REMOVE_BATCH */
+
 static int construct_memop_from_reservation(
                const struct xen_memory_reservation *r,
                struct memop_args *a)
@@ -1787,6 +1898,47 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         break;
     }
 
+#ifdef CONFIG_HAS_PHYSMAP_REMOVE_BATCH
+    case XENMEM_remove_from_physmap_batch:
+    {
+        struct xen_remove_from_physmap_batch xrfpb;
+
+        BUILD_BUG_ON((typeof(xrfpb.size))-1 >
+                     (UINT_MAX >> MEMOP_EXTENT_SHIFT));
+
+        /* Check for malicious or buggy input. */
+        if ( start_extent != (typeof(xrfpb.size))start_extent )
+            return -EDOM;
+
+        if ( copy_from_guest(&xrfpb, arg, 1) )
+            return -EFAULT;
+
+        d = rcu_lock_domain_by_any_id(xrfpb.domid);
+        if ( d == NULL )
+            return -ESRCH;
+
+        rc = paging_mode_translate(d)
+             ? xsm_remove_from_physmap(XSM_TARGET, curr_d, d)
+             : -EACCES;
+        if ( rc != 0 )
+        {
+            rcu_unlock_domain(d);
+            return rc;
+        }
+
+        rc = xenmem_remove_from_physmap_batch(d, &xrfpb, start_extent);
+
+        rcu_unlock_domain(d);
+
+        if ( rc > 0 )
+            rc = hypercall_create_continuation(
+                    __HYPERVISOR_memory_op, "lh",
+                    op | (rc << MEMOP_EXTENT_SHIFT), arg);
+
+        return rc;
+    }
+#endif /* CONFIG_HAS_PHYSMAP_REMOVE_BATCH */
+
     case XENMEM_access_op:
         rc = mem_access_memop(cmd, guest_handle_cast(arg, xen_mem_access_op_t));
         break;
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index bd9fc37b52..4de16cd59c 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -302,6 +302,41 @@ struct xen_remove_from_physmap {
 typedef struct xen_remove_from_physmap xen_remove_from_physmap_t;
 DEFINE_XEN_GUEST_HANDLE(xen_remove_from_physmap_t);
 
+/*
+ * A batched version of XENMEM_remove_from_physmap: remove several pages from
+ * the guest physical address space of a domain with a single hypercall.
+ * Each entry gets the result XENMEM_remove_from_physmap would have returned.
+ * The TLBs are invalidated once per run of consecutive pages in a chunk of
+ * entries the hypervisor processes at a time, so this is much cheaper than
+ * one XENMEM_remove_from_physmap per page, especially for a contiguous range.
+ *
+ * The return value is 0 if the list was processed, and then errs[] holds the
+ * per entry results, or a negative error. The hypercall returns -ENOSYS where
+ * it is not implemented, callers must fall back to XENMEM_remove_from_physmap.
+ * Processing is not transactional: a negative return may follow completed
+ * removals, including a chunk whose result copy failed.
+ *
+ * arg == addr of xen_remove_from_physmap_batch_t.
+ */
+#define XENMEM_remove_from_physmap_batch 29
+struct xen_remove_from_physmap_batch {
+    /* IN */
+    /* Which domain to change the mapping for. */
+    domid_t domid;
+
+    /* Number of pages to unmap. */
+    uint16_t size;
+
+    /* GPFNs of the current mappings of the pages. */
+    XEN_GUEST_HANDLE(xen_pfn_t) gpfns;
+
+    /* OUT */
+    /* Per entry error code, 0 on success. */
+    XEN_GUEST_HANDLE(int) errs;
+};
+typedef struct xen_remove_from_physmap_batch xen_remove_from_physmap_batch_t;
+DEFINE_XEN_GUEST_HANDLE(xen_remove_from_physmap_batch_t);
+
 /*** REMOVED ***/
 /*#define XENMEM_translate_gpfn_list  8*/
 

