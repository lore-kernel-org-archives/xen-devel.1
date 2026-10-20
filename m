Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A00D606A31B
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 20:04:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1456219.1669731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJG4N-0002Z5-I6; Tue, 20 Oct 2026 20:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456219.1669731; Tue, 20 Oct 2026 20:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJG4N-0002Yr-DD; Tue, 20 Oct 2026 20:04:23 +0000
Received: by outflank-mailman (input) for mailman id 1456219;
 Tue, 20 Oct 2026 20:04:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcus.granado@citrix.com>) id 1xJG4M-0002Xh-G1
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 20:04:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJG4L-001DOX-TL
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 22:04:21 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6ad7c922-bab6-0a2a0a5309dd-0a2a450cdaaa-28
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 22:04:21 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6ad7c944-f479-0a2a450c0019-a0658309c05c-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 22:04:21 +0200
Received: from mewpvdipd1023.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id 1A0E3842421D;
 Tue, 20 Oct 2026 16:03:37 -0400 (EDT)
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
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2 6/9] tools/libs/guest: add XCFLAGS_COMPRESS_LZ4 to request LZ4 compression
Date: Tue, 20 Oct 2026 21:02:34 +0100
Message-ID: <20261020200238.1815766-7-marcus.granado@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020200238.1815766-1-marcus.granado@citrix.com>
References: <20261020200238.1815766-1-marcus.granado@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1792526661-036D6A5B-49D0D88D/0/0
X-purgate-type: clean
X-purgate-size: 2362
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Nothing sets ctx->save.compression to XC_SR_COMPRESS_LZ4, so the LZ4
path in write_batch() is unreachable and a caller of xc_domain_save()
has no way to ask for compressed PAGE_DATA records.

Add XCFLAGS_COMPRESS_LZ4 and select LZ4 when it is set.  A caller which
does not set it sees no change; one which does needs a receiver able to
decompress LZ4.

A libxenguest built without a supported liblz4 cannot honour the flag,
so fail up front with EOPNOTSUPP rather than silently send uncompressed
records.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Marcus Granado <marcus.granado@citrix.com>
---

Notes:
    Changes in v2:
    - Was v1 5/6.
    - Set ctx->save.compression; the field moved into the save context.
    
    Bit 2 was XCFLAGS_HVM until commit 2004db3ced18 ("tools/save: Drop
    unused parameters from xc_domain_save()") removed it in 4.14.

 tools/include/xenguest.h      |  5 +++--
 tools/libs/guest/xg_sr_save.c | 11 +++++++++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 2a277cb7cd..70301c2f48 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -24,8 +24,9 @@
 
 #define XC_NUMA_NO_NODE   (~0U)
 
-#define XCFLAGS_LIVE      (1 << 0)
-#define XCFLAGS_DEBUG     (1 << 1)
+#define XCFLAGS_LIVE         (1 << 0)
+#define XCFLAGS_DEBUG        (1 << 1)
+#define XCFLAGS_COMPRESS_LZ4 (1 << 2) /* LZ4 on save; restorer needs LZ4 */
 
 #define X86_64_B_SIZE   64 
 #define X86_32_B_SIZE   32
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 4fa1d22859..fe3d78bdd6 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -1166,6 +1166,17 @@ int xc_domain_save(xc_interface *xch, int io_fd, uint32_t dom,
     ctx.save.debug = !!(flags & XCFLAGS_DEBUG);
     ctx.save.recv_fd = recv_fd;
 
+    if ( flags & XCFLAGS_COMPRESS_LZ4 )
+    {
+#if defined(XG_SR_LZ4)
+        ctx.save.compression = XC_SR_COMPRESS_LZ4;
+#else
+        ERROR("XCFLAGS_COMPRESS_LZ4 requested but libxenguest was built without a supported liblz4");
+        errno = EOPNOTSUPP;
+        return -1;
+#endif
+    }
+
     if ( xc_domain_getinfo_single(xch, dom, &ctx.dominfo) < 0 )
     {
         PERROR("Failed to get domain info");
-- 
2.43.0


