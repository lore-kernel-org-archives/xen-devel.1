Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC0D606A319
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 20:03:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1456190.1669694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJG3s-00016F-H0; Tue, 20 Oct 2026 20:03:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456190.1669694; Tue, 20 Oct 2026 20:03:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJG3s-000168-EF; Tue, 20 Oct 2026 20:03:52 +0000
Received: by outflank-mailman (input) for mailman id 1456190;
 Tue, 20 Oct 2026 20:03:50 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcus.granado@citrix.com>) id 1xJG3q-00015e-KG
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 20:03:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJG3q-005YoM-1M
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 22:03:50 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6ad7c908-2eae-0a2a0a5409dd-0a2a4505d2b6-46
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 22:03:49 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6ad7c924-4cb1-0a2a45050019-a0658309afe2-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 22:03:49 +0200
Received: from mewpvdipd1023.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id 8F6268424217;
 Tue, 20 Oct 2026 16:03:05 -0400 (EDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Marcus Granado <marcus.granado@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Marcus Granado <marcus.granado@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Frediano Ziglio <freddy77@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 1/9] tools/libs/guest: reject non-zero reserved fields in PAGE_DATA
Date: Tue, 20 Oct 2026 21:02:29 +0100
Message-ID: <20261020200238.1815766-2-marcus.granado@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020200238.1815766-1-marcus.granado@citrix.com>
References: <20261020200238.1815766-1-marcus.granado@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1792526629-F5CA82A1-6C62C9D1/0/0
X-purgate-type: clean
X-purgate-size: 4782
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A PAGE_DATA record has two reserved fields: the 32-bit field after
count, and bits 59-52 of each pfn entry.  libxenguest ignores both on
restore, as the specification's general rule for reserved fields
requires, while the Python stream validator
(tools/python/xen/migration/libxc.py) rejects both.

A receiver which ignores either field can silently misread a record
which uses it to change how the record's contents are organised.

Reject a PAGE_DATA record with either field non-zero.  Qualify the
specification's general rule so that a record can override it, require
rejection of both reserved fields, and bump the specification's
revision.

This deliberately tightens restore.  Every libxenguest since Xen 4.6,
and convert-legacy-stream, writes both fields as zero, so no stream
they produce is rejected.

Backport: 4.17+
Reported-by: Teddy Astie <teddy.astie@vates.tech>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Marcus Granado <marcus.granado@citrix.com>
---

Notes:
    Changes in v2:
    - New patch, after Teddy Astie pointed out on v1 that ignoring reserved
      fields does not help a future field which changes how the record's
      contents are organised.

 docs/specs/libxc-migration-stream.pandoc | 11 ++++++++---
 tools/libs/guest/xg_sr_restore.c         | 15 +++++++++++++++
 tools/libs/guest/xg_sr_stream_format.h   |  5 +++--
 3 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/docs/specs/libxc-migration-stream.pandoc b/docs/specs/libxc-migration-stream.pandoc
index 1319ce1f1e..b1c81b5d68 100644
--- a/docs/specs/libxc-migration-stream.pandoc
+++ b/docs/specs/libxc-migration-stream.pandoc
@@ -3,7 +3,7 @@
   Andrew Cooper <<andrew.cooper3@citrix.com>>
   Wen Congyang <<wency@cn.fujitsu.com>>
   Yang Hongyang <<hongyang.yang@easystack.cn>>
-% Revision 3
+% Revision 4
 
 Introduction
 ============
@@ -76,7 +76,8 @@ All the fields within the headers and records have a fixed width.
 Fields are always aligned to their size.
 
 Padding and reserved fields are set to zero on save and must be
-ignored during restore.
+ignored during restore, unless the record containing them says
+otherwise.
 
 Integer (numeric) fields in the image header are always in big-endian
 byte order.
@@ -298,12 +299,16 @@ Field       Description
 ----------- --------------------------------------------------------
 count       Number of pages described in this record.
 
+(reserved)  Set to zero on save.  A restoring side must reject a
+            record with this field non-zero.
+
 pfn         An array of count PFNs and their types.
 
             Bit 63-60: XEN_DOMCTL_PFINFO_* type (from
             `public/domctl.h` but shifted by 32 bits)
 
-            Bit 59-52: Reserved.
+            Bit 59-52: Reserved.  Set to zero on save.  A restoring
+            side must reject a record with any of these bits set.
 
             Bit 51-0: PFN.
 
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 458eaa5992..eae5a8e828 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -400,6 +400,14 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         goto err;
     }
 
+    /* Reject rather than ignore: a future use may change the layout. */
+    if ( pages->_res1 != 0 )
+    {
+        ERROR("Reserved field set in PAGE_DATA record: %#x",
+              (unsigned int)pages->_res1);
+        goto err;
+    }
+
     if ( pages->count < 1 )
     {
         ERROR("Expected at least 1 pfn in PAGE_DATA record");
@@ -424,6 +432,13 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
 
     for ( i = 0; i < pages->count; ++i )
     {
+        if ( pages->pfn[i] & PAGE_DATA_PFN_RESZ_MASK )
+        {
+            ERROR("Reserved bits set in pfn[%u]: %#"PRIx64, i,
+                  pages->pfn[i]);
+            goto err;
+        }
+
         pfn = pages->pfn[i] & PAGE_DATA_PFN_MASK;
         if ( !ctx->restore.ops.pfn_is_valid(ctx, pfn) )
         {
diff --git a/tools/libs/guest/xg_sr_stream_format.h b/tools/libs/guest/xg_sr_stream_format.h
index 99dca5d490..1e6e50a710 100644
--- a/tools/libs/guest/xg_sr_stream_format.h
+++ b/tools/libs/guest/xg_sr_stream_format.h
@@ -87,8 +87,9 @@ struct xc_sr_rec_page_data_header
     uint64_t pfn[0];
 };
 
-#define PAGE_DATA_PFN_MASK  0x000fffffffffffffULL
-#define PAGE_DATA_TYPE_MASK 0xf000000000000000ULL
+#define PAGE_DATA_PFN_MASK      0x000fffffffffffffULL
+#define PAGE_DATA_PFN_RESZ_MASK 0x0ff0000000000000ULL
+#define PAGE_DATA_TYPE_MASK     0xf000000000000000ULL
 
 /* X86_PV_INFO */
 struct xc_sr_rec_x86_pv_info
-- 
2.43.0


