Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7292F606A320
	for <xen-devel@archiver.kernel.org>; Sun, 22 Nov 2026 09:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vom/WIce
Received: from list by lists.xenproject.org with outflank-mailman.1499548.1696359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xV4He-0006ne-Oj; Sun, 22 Nov 2026 09:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1499548.1696359; Sun, 22 Nov 2026 09:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xV4He-0006nS-Jm; Sun, 22 Nov 2026 09:54:54 +0000
Received: by outflank-mailman (input) for mailman id 1499548;
 Sun, 22 Nov 2026 09:54:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <haseebashraf091@gmail.com>) id 1xV4Hd-0006fy-Hs
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2026 09:54:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xV4Hc-00ExLX-UG
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2026 10:54:52 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <haseebashraf091@gmail.com>)
 id 6b02bbc6-bab6-0a2a0a5309dd-0a2a4505c3ae-30
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 10:54:52 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <haseebashraf091@gmail.com>)
 id 6b02bbec-4cb1-0a2a45050019-d155802fcd15-3
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 10:54:52 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4bb64ef5a14so24335425e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 01:54:52 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.59.78])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8849e598sm218409605e9.8.2026.11.22.01.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2026 01:54:51 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795341292; x=1795946092; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e6trpaEtWAD6+j1RHGJjI0LLsXCCawx/gvwKZrYkknU=;
        b=Vom/WIceQXbV/LJtzdAvTSt0fH4NsHMcyrv8oq1FWHnc0iGt9N82xSNaTOSB5SoYVU
         JT9lja5Jn2esyWskj6bH6WwZxlLn6sgioAeXrohAZdeqWZ4q6kW7c1G0ed7tagrBUcnH
         Bb6D38DjoWSFcn82BCIpGB7gLPSrHSKqb/AywX0gSjaGnGzY5bQWOe3J5RQsmn2NDuhK
         Y7dPbdWPHVqJzkqYiC2rQKlM2o2Zck5uaYW0CQC/dyYhPuKCO/CwrlOvMGl1Pq2vjAkS
         VjoSMQVvM+DvNtAgcPzpLpOuRV9v77tDmaiwnNZy8Iso/BhT/AVqwd/00yxZ1ES19Lii
         WKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341292; x=1795946092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e6trpaEtWAD6+j1RHGJjI0LLsXCCawx/gvwKZrYkknU=;
        b=l7TB1SLOq2fG+q3a8GosGzMuC35H26IY12jGfdPn03KTlpKJPsbqkK23JItW9VYVq7
         PoY92ZVgpa+4xh+zq0mYqO/U+jlfUeXutXHp+e4OyNOkQ4Y6k5rnEnPafVDr5Zycdq3H
         XPlFG0UwJZS6fe3oPp9QPvR8fFfC/XT/NCzp4kePwkOper7YddrgUvctD2CuWm4WkACI
         8X9FcggA4XrSSGfghxFvwaIzHTKZ+GO7T1dBl4nGkxL9ADsVFqg2ZqxyVGZyoMaQ2vqU
         kDLjo286L6McU/knpXf54x4O0I82kyGBJFZ77uv75cWqZ7VijON95fa1Qn0XhPMY7t7O
         mJPA==
X-Gm-Message-State: APuU4Z95R8oXJeS0jVrkJp8L9lN4I02rm/VefYlTzTv4qz9hiNNAGA6l
	9HdGHzpXOMxOI/pGVyDiSZ7uSSPxKhS/bLaCGteuHl61Y3dd0xP+yy6atbwSp5yB3eg=
X-Gm-Gg: AZFdTZdRjbFroq1tXPKJwraU6YcK8gUvOulFGHZmzZkWvl5VH5gde0oEfecN6NcZN8s
	/b+qNQK5r2SYOtKJRzV4TjY6UZgIkjHbyctN1T+0qGbVTsWrk5Zv+ut9VWuzcLt21twSHO/9RCb
	Jv5Lzt2o6U1dycwtVvvY8MuOIX2Nhr1/qYBfYYys3I27ftJwh1WnI3s7k6/997mAgZ1EPkitiSG
	u3xu2rQThz6TrqQm3ilf6m1EdVhrN6CGTo3HebjnyFyra91BLSsU1NGi7oVYwG+hSTOVbZThat0
	foJ7X1Xx1vfLtIkwlZPQgbWwhpdlsu9DNJ5f5d5LsldUqQUrCvI7V0pHqRQDMnaCDFPN4+f+ccs
	N9gG6X5RHuA+w2KvpXG1zYYs7aXMBnE3sjx8FfQZ+anvw3QNrTzOJLqWHtIByFsvTgUWTeocIVr
	xh8FoP/lDjdHWyeUuioVUaipvj65uJyGGVJBLENDw9X3DA9o1O8U1KwiWiqwF6kQGW3PZF7/eSk
	nSn0mVHClj4qxXpx4n0eqy9yk6GNQj4pHrYfbo7fMc3UxSrX+Y89Vxsx4VFaS0HHliqKxB87ng9
	Q8RtwaPQTk2I32fGDFjLbpRIS+l7UAzRZ+V2+MDDW+/XU7ohYvawWEQA4OQURuTlig55W7wcC0J
	wuVT1N2pOgjA/X3FTcpnLMU6/
X-Received: by 2002:a05:600c:638f:b0:4bb:7581:2bb9 with SMTP id 5b1f17b1804b1-4bb8892692dmr154376135e9.22.1795341292298;
        Sun, 22 Nov 2026 01:54:52 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Haseeb Ashraf <haseeb.ashraf@siemens.com>,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	michal.orzel@amd.com,
	jbeulich@suse.com,
	julien@xen.org,
	roger@xenproject.org,
	sstabellini@kernel.org
Subject: [XEN][PATCH v5 8/8] xen/memory: copy add_to_physmap batch entries in bulk
Date: Sun, 22 Nov 2026 14:54:22 +0500
Message-ID: <e0e98f5026453b9e95501c2e5c8da98e91fe22e9.1795336377.git.haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795336377.git.haseebashraf091@gmail.com>
References: <cover.1795336377.git.haseebashraf091@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1795341292-728B62A1-D1B3583F/0/0
X-purgate-type: clean
X-purgate-size: 4576
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Haseeb Ashraf <haseeb.ashraf@siemens.com>

xenmem_add_to_physmap_batch() copies two inputs and one result for
every entry. On Arm every access to guest memory translates the
guest address with an AT instruction, which traps to the outer
hypervisor when Xen runs under nested virtualization.

Stage up to 128 input entries and copy the results in bulk. Entries
are still handled in order, an INVALID_GFN stops the loop after the
entries before it, and the hypercall can still be preempted between
two entries and continues with the first one that was not handled.
At 128 entries the three buffers use 2.5 KiB of stack (8 + 8 + 4 = 20
bytes per entry), about 8% of the 32 KiB Arm stack. This bounds stack
use while amortizing the two input copies and the result copy over each
chunk; it is not a measured throughput threshold.

Input copies precede the processing of each chunk and result copies
follow it. EFAULT is not transactional: mappings may already have
changed, and the order of partial copies and overlapping buffers is
not the same as with the element at a time implementation.

Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>
---
 xen/common/memory.c | 63 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 48 insertions(+), 15 deletions(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index b5256bf6ec..c493766abd 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1077,6 +1077,14 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
     return rc;
 }
 
+/*
+ * Number of entries copied from and to the guest at a time. Every access to
+ * guest memory needs a guest virtual to machine address translation, which
+ * is very slow when Xen itself runs on top of another hypervisor, so it is
+ * not done once per entry.
+ */
+#define XENMEM_ATPB_CHUNK 128U
+
 static int xenmem_add_to_physmap_batch(struct domain *d,
                                        struct xen_add_to_physmap_batch *xatpb,
                                        unsigned int extent)
@@ -1120,27 +1128,52 @@ static int xenmem_add_to_physmap_batch(struct domain *d,
 
     while ( xatpb->size > extent )
     {
-        xen_ulong_t idx;
-        xen_pfn_t gpfn;
-        int rc;
-
-        if ( unlikely(__copy_from_guest_offset(&idx, xatpb->idxs,
-                                               extent, 1)) ||
-             unlikely(__copy_from_guest_offset(&gpfn, xatpb->gpfns,
-                                               extent, 1)) )
+        xen_ulong_t idxs[XENMEM_ATPB_CHUNK];
+        xen_pfn_t gpfns[XENMEM_ATPB_CHUNK];
+        int errs[XENMEM_ATPB_CHUNK];
+        unsigned int n = min_t(unsigned int, xatpb->size - extent,
+                               XENMEM_ATPB_CHUNK);
+        unsigned int i;
+        bool preempt = false;
+        int rc = 0;
+
+        if ( unlikely(__copy_from_guest_offset(idxs, xatpb->idxs,
+                                               extent, n)) ||
+             unlikely(__copy_from_guest_offset(gpfns, xatpb->gpfns,
+                                               extent, n)) )
             return -EFAULT;
 
-        if ( gfn_eq(_gfn(gpfn), INVALID_GFN) )
-            return -EINVAL;
+        for ( i = 0; i < n; i++ )
+        {
+            if ( gfn_eq(_gfn(gpfns[i]), INVALID_GFN) )
+            {
+                rc = -EINVAL;
+                break;
+            }
 
-        rc = xenmem_add_to_physmap_one(d, xatpb->space, extra,
-                                       idx, _gfn(gpfn));
+            errs[i] = xenmem_add_to_physmap_one(d, xatpb->space, extra,
+                                                idxs[i], _gfn(gpfns[i]));
 
-        if ( unlikely(__copy_to_guest_offset(xatpb->errs, extent, &rc, 1)) )
+            /* Check for continuation if it's not the last iteration. */
+            if ( xatpb->size > extent + i + 1 && hypercall_preempt_check() )
+            {
+                preempt = true;
+                i++;
+                break;
+            }
+        }
+
+        /* i entries have a result. */
+        if ( (i != 0U) &&
+             unlikely(__copy_to_guest_offset(xatpb->errs, extent, errs, i)) )
             return -EFAULT;
 
-        /* Check for continuation if it's not the last iteration. */
-        if ( xatpb->size > ++extent && hypercall_preempt_check() )
+        extent += i;
+
+        if ( rc != 0 )
+            return rc;
+
+        if ( preempt )
             return extent;
     }
 

