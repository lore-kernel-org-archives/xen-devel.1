Return-Path: <SRS0=UuSr=GI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F56C433DB
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 15:14:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAA1022B45
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 15:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAA1022B45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.62037.109562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwo2H-00062S-Sc; Tue, 05 Jan 2021 15:14:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62037.109562; Tue, 05 Jan 2021 15:14:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwo2H-00062L-PR; Tue, 05 Jan 2021 15:14:13 +0000
Received: by outflank-mailman (input) for mailman id 62037;
 Tue, 05 Jan 2021 15:14:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YjHi=GI=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kwo2G-00062G-RN
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 15:14:13 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.53])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b3b94c4-ec22-4b71-a449-34dc4cc94a45;
 Tue, 05 Jan 2021 15:14:11 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
 with ESMTPSA id h0968ex05FE21Za
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 5 Jan 2021 16:14:02 +0100 (CET)
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
X-Inumbo-ID: 8b3b94c4-ec22-4b71-a449-34dc4cc94a45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1609859650;
	s=strato-dkim-0002; d=aepfle.de;
	h=Message-Id:Date:Subject:Cc:To:From:From:Subject:Sender;
	bh=hOTjgLLhuUQv54PkyCJTbztlEf/7iu93iqjOzgrr0S8=;
	b=dDG+wgUKecKbDraGXcxcdTUivcCnTKPMCkUwesOdWfvZaDh/l1NJ+6+Urogt1pT7rL
	CKp+DpZGX6SG4qpYO/2JbwJkgDEhlsQzqhLld/P2LSnmP0xG+GUtr0qHiVALqlSkQVpB
	Y1sbhrJO+kcs3UqsW726D6Vo3XWU/Wskt9YxLNkp/2JhzN4R2H9hz7rB1dtcr2uPSzM+
	OPRn6Wuu4T1kS4D/b5SbW+MBCMXYucMZzTvO7sgGZF7h/uJAUgVUCjLpE6jHqQckRZZ2
	eWw1IabmGoAtoWCTR8YWOHgOWIRw3p4yMbmIOT6DaaXMS2RvjrXZncxVclJwxh6wjeR5
	Ld3A==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS321Mjw=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1] tools: move M2P macros to xg_private.h
Date: Tue,  5 Jan 2021 16:13:56 +0100
Message-Id: <20210105151356.30660-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just code movement as a preparatory change before xg_sr_* will be moved.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_private.h      | 10 ++++++++++
 tools/libs/guest/xg_save_restore.h | 10 ----------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/libs/guest/xg_private.h b/tools/libs/guest/xg_private.h
index fee3191cd4..1e3060ae1b 100644
--- a/tools/libs/guest/xg_private.h
+++ b/tools/libs/guest/xg_private.h
@@ -135,4 +135,14 @@ static inline xen_pfn_t xc_pfn_to_mfn(xen_pfn_t pfn, xen_pfn_t *p2m,
 int pin_table(xc_interface *xch, unsigned int type, unsigned long mfn,
               uint32_t dom);
 
+/*
+** The M2P is made up of some number of 'chunks' of at least 2MB in size.
+** The below definitions and utility function(s) deal with mapping the M2P
+** regarldess of the underlying machine memory size or architecture.
+*/
+#define M2P_SHIFT       L2_PAGETABLE_SHIFT_PAE
+#define M2P_CHUNK_SIZE  (1 << M2P_SHIFT)
+#define M2P_SIZE(_m)    ROUNDUP(((_m) * sizeof(xen_pfn_t)), M2P_SHIFT)
+#define M2P_CHUNKS(_m)  (M2P_SIZE((_m)) >> M2P_SHIFT)
+
 #endif /* XG_PRIVATE_H */
diff --git a/tools/libs/guest/xg_save_restore.h b/tools/libs/guest/xg_save_restore.h
index a9c1a2dbe3..3dbbc8dcd2 100644
--- a/tools/libs/guest/xg_save_restore.h
+++ b/tools/libs/guest/xg_save_restore.h
@@ -39,16 +39,6 @@
 #define PFN_TO_KB(_pfn) ((_pfn) << (PAGE_SHIFT - 10))
 
 
-/*
-** The M2P is made up of some number of 'chunks' of at least 2MB in size.
-** The below definitions and utility function(s) deal with mapping the M2P
-** regarldess of the underlying machine memory size or architecture.
-*/
-#define M2P_SHIFT       L2_PAGETABLE_SHIFT_PAE
-#define M2P_CHUNK_SIZE  (1 << M2P_SHIFT)
-#define M2P_SIZE(_m)    ROUNDUP(((_m) * sizeof(xen_pfn_t)), M2P_SHIFT)
-#define M2P_CHUNKS(_m)  (M2P_SIZE((_m)) >> M2P_SHIFT)
-
 #define MEMCPY_FIELD(_d, _s, _f, _w) do {                          \
     if ((_w) == 8)                                                 \
         memcpy(&(_d)->x64._f, &(_s)->x64._f,sizeof((_d)->x64._f)); \

