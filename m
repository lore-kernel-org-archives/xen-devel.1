Return-Path: <SRS0=12TN=G5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FDB3C433E0
	for <xen-devel@archiver.kernel.org>; Tue, 26 Jan 2021 22:49:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3A822065C
	for <xen-devel@archiver.kernel.org>; Tue, 26 Jan 2021 22:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3A822065C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=netbsd.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.75609.136181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4X91-0001vm-7C; Tue, 26 Jan 2021 22:49:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75609.136181; Tue, 26 Jan 2021 22:49:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4X91-0001vb-2D; Tue, 26 Jan 2021 22:49:07 +0000
Received: by outflank-mailman (input) for mailman id 75609;
 Tue, 26 Jan 2021 22:49:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3HxG=G5=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1l4X8z-0001QY-O4
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 22:49:05 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f844a06f-e37e-4128-b3f6-bb1b23deb774;
 Tue, 26 Jan 2021 22:48:36 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10QMmXsn001742;
 Tue, 26 Jan 2021 23:48:33 +0100 (CET)
Received: from borneo.soc.lip6.fr (borneo [132.227.103.47])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10QMmXo1016672;
 Tue, 26 Jan 2021 23:48:33 +0100 (MET)
Received: by borneo.soc.lip6.fr (Postfix, from userid 373)
 id 953E2AA8C1; Tue, 26 Jan 2021 23:48:33 +0100 (MET)
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
X-Inumbo-ID: f844a06f-e37e-4128-b3f6-bb1b23deb774
From: Manuel Bouyer <bouyer@netbsd.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>,
        =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
        Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2] libs/light: fix uuid on NetBSD
Date: Tue, 26 Jan 2021 23:47:56 +0100
Message-Id: <20210126224800.1246-10-bouyer@netbsd.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210126224800.1246-1-bouyer@netbsd.org>
References: <20210126224800.1246-1-bouyer@netbsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 26 Jan 2021 23:48:33 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

NetBSD uses the same uuid library as FreeBSD. As this is in a
__FreeBSD__ || __NetBSD__ block, just drop the #ifdef __FreeBSD__
and dead code.

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/libs/light/libxl_uuid.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/tools/libs/light/libxl_uuid.c b/tools/libs/light/libxl_uuid.c
index dadb79bad8..7b68270a33 100644
--- a/tools/libs/light/libxl_uuid.c
+++ b/tools/libs/light/libxl_uuid.c
@@ -82,7 +82,6 @@ void libxl_uuid_generate(libxl_uuid *uuid)
     uuid_enc_be(uuid->uuid, &nat_uuid);
 }
 
-#ifdef __FreeBSD__
 int libxl_uuid_from_string(libxl_uuid *uuid, const char *in)
 {
     uint32_t status;
@@ -95,19 +94,6 @@ int libxl_uuid_from_string(libxl_uuid *uuid, const char *in)
 
     return 0;
 }
-#else
-#define LIBXL__UUID_PTRS(uuid) &uuid[0], &uuid[1], &uuid[2], &uuid[3], \
-                               &uuid[4], &uuid[5], &uuid[6], &uuid[7], \
-                               &uuid[8], &uuid[9], &uuid[10],&uuid[11], \
-                               &uuid[12],&uuid[13],&uuid[14],&uuid[15]
-int libxl_uuid_from_string(libxl_uuid *uuid, const char *in)
-{
-    if ( sscanf(in, LIBXL_UUID_FMT, LIBXL__UUID_PTRS(uuid->uuid)) != sizeof(uuid->uuid) )
-        return -1;
-    return 0;
-}
-#undef LIBXL__UUID_PTRS
-#endif
 
 void libxl_uuid_copy(libxl_ctx *ctx_opt, libxl_uuid *dst,
                      const libxl_uuid *src)
@@ -120,7 +106,6 @@ void libxl_uuid_clear(libxl_uuid *uuid)
     memset(&uuid->uuid, 0, sizeof(uuid->uuid));
 }
 
-#ifdef __FreeBSD__
 int libxl_uuid_compare(const libxl_uuid *uuid1, const libxl_uuid *uuid2)
 {
     uuid_t nat_uuid1, nat_uuid2;
@@ -130,12 +115,6 @@ int libxl_uuid_compare(const libxl_uuid *uuid1, const libxl_uuid *uuid2)
 
     return uuid_compare(&nat_uuid1, &nat_uuid2, NULL);
 }
-#else
-int libxl_uuid_compare(const libxl_uuid *uuid1, const libxl_uuid *uuid2)
-{
-     return memcmp(uuid1->uuid, uuid2->uuid, sizeof(uuid1->uuid));
-}
-#endif
 
 const uint8_t *libxl_uuid_bytearray_const(const libxl_uuid *uuid)
 {
-- 
2.29.2


