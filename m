Return-Path: <SRS0=FDQh=L6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8451C11F68
	for <xen-devel@archiver.kernel.org>; Tue,  6 Jul 2021 11:24:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 707A861E0C
	for <xen-devel@archiver.kernel.org>; Tue,  6 Jul 2021 11:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 707A861E0C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.151120.279336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0jB6-0005aE-S3; Tue, 06 Jul 2021 11:23:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151120.279336; Tue, 06 Jul 2021 11:23:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0jB6-0005a7-Ob; Tue, 06 Jul 2021 11:23:48 +0000
Received: by outflank-mailman (input) for mailman id 151120;
 Tue, 06 Jul 2021 11:23:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rBn=L6=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m0jB5-00050M-95
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 11:23:47 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6698324-0e09-41de-abe0-cad6e4d3afe9;
 Tue, 06 Jul 2021 11:23:42 +0000 (UTC)
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
X-Inumbo-ID: a6698324-0e09-41de-abe0-cad6e4d3afe9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625570622;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=VXrAugVYE4b5MTycMGEmas33a/+GWPcEalVzYy+9Ju0=;
  b=IS0bAE4agv/t1sERC6R0tCqV+mNjnNTYSIOhc2Ni42+lp0CRIbmP8T+S
   OJQxKXJcNsc0P9ACmf8KHyVabUrcEQUJd7kk9YrgfEBor8MG7jEEnW9yO
   sm6QHAWfbZcOYVzNasm1QEubXMp7DVgjx91KpiyW9lJRTGRlqNNUuXMus
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ufRwhmBCrEF+p4kvtglXYkUtTbqLaCCRIjtqEQ3NLKubM2ugge1q00RVxagjDaRrp5KpYoTIMn
 5wnNXejwuYMEdJYkpLpNm3uiZpMh6JszJA6blA4tBxip+3N6/+vHsqmtN9dZyOdagKJhWCANaK
 ygEOxuvrlJhac/bxL0vxmdR+c/DKmJ7/H2Kf1lnyOCP2S/9jT/60qk0X+/96BzHRHsdcPmAOY1
 /LHr+iu4Yqitp1vE0znugHbpguuOoaT1buLiDIRKEUETzZhX/VEZLXHaLsX4Yihko9kO3ptx6u
 QLo=
X-SBRS: 5.1
X-MesageID: 47339751
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:B63c1a2vu+EnVe8PZUbf4wqjBLAkLtp133Aq2lEZdPRUGvb3qy
 nOpoVj6faaslYssR0b9exofZPwJE80lqQFh7X5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtsp
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.83,328,1616472000"; 
   d="scan'208";a="47339751"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Jan Beulich <JBeulich@suse.com>, Olaf Hering <olaf@aepfle.de>
Subject: [PATCH 2/2] tools/migration: Fix potential overflow in send_checkpoint_dirty_pfn_list()
Date: Tue, 6 Jul 2021 12:23:32 +0100
Message-ID: <20210706112332.31753-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210706112332.31753-1-andrew.cooper3@citrix.com>
References: <20210706112332.31753-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

'count * sizeof(*pfns)' can in principle overflow, but is implausible in
practice as the time between checkpoints is typically sub-second.
Nevertheless, simplify the code and remove the risk.

There is no need to loop over the bitmap to calculate count.  The number of
set bits is returned in xc_shadow_op_stats_t which is already collected (and
ignored).

Bounds check the count against what will fit in REC_LENGTH_MAX.  At the time
of writing, this allows up to 0xffffff pfns.  Rearrange the pfns loop to check
for errors both ways, not simply that there were more pfns than expected.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_restore.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 07c9e291610b..bda04ee42e3f 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -425,7 +425,7 @@ static int send_checkpoint_dirty_pfn_list(struct xc_sr_context *ctx)
     int rc = -1;
     unsigned int count, written;
     uint64_t i, *pfns = NULL;
-    xc_shadow_op_stats_t stats = { 0, ctx->restore.p2m_size };
+    xc_shadow_op_stats_t stats;
     struct xc_sr_record rec = {
         .type = REC_TYPE_CHECKPOINT_DIRTY_PFN_LIST,
     };
@@ -444,14 +444,17 @@ static int send_checkpoint_dirty_pfn_list(struct xc_sr_context *ctx)
         goto err;
     }
 
-    for ( i = 0, count = 0; i < ctx->restore.p2m_size; i++ )
+    count = stats.dirty_count;
+
+    if ( ((REC_LENGTH_MAX - sizeof(rec)) / sizeof(*pfns)) < count )
     {
-        if ( test_bit(i, dirty_bitmap) )
-            count++;
+        ERROR("Too many PFNs (%u) to fit in record (limit %zu)", count,
+              ((REC_LENGTH_MAX - sizeof(rec)) / sizeof(*pfns)));
+        goto err;
     }
 
-
-    pfns = malloc(count * sizeof(*pfns));
+    iov[1].iov_len  = rec.length = count * sizeof(*pfns);
+    iov[1].iov_base = pfns       = malloc(rec.length);
     if ( !pfns )
     {
         ERROR("Unable to allocate %zu bytes of memory for dirty pfn list",
@@ -459,24 +462,20 @@ static int send_checkpoint_dirty_pfn_list(struct xc_sr_context *ctx)
         goto err;
     }
 
-    for ( i = 0, written = 0; i < ctx->restore.p2m_size; ++i )
+    for ( i = 0, written = 0; count && i < ctx->restore.p2m_size; ++i, --count )
     {
         if ( !test_bit(i, dirty_bitmap) )
             continue;
 
-        if ( written > count )
-        {
-            ERROR("Dirty pfn list exceed");
-            goto err;
-        }
-
         pfns[written++] = i;
     }
 
-    rec.length = count * sizeof(*pfns);
-
-    iov[1].iov_base = pfns;
-    iov[1].iov_len = rec.length;
+    if ( written != stats.dirty_count )
+    {
+        ERROR("Mismatch between dirty bitmap bits (%u), and dirty_count (%u)",
+              written, stats.dirty_count);
+        goto err;
+    }
 
     if ( writev_exact(ctx->restore.send_back_fd, iov, ARRAY_SIZE(iov)) )
     {
-- 
2.11.0


