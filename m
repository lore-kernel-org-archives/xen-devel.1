Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717D2CC6B2D
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 00:53:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449655.1665319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH9id-0003Gp-PU; Thu, 15 Oct 2026 00:53:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449655.1665319; Thu, 15 Oct 2026 00:53:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH9id-0003Gi-MD; Thu, 15 Oct 2026 00:53:15 +0000
Received: by outflank-mailman (input) for mailman id 1449655;
 Thu, 15 Oct 2026 00:53:14 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ehem@m5p.com>) id 1xH9ic-0003F3-BC
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 00:53:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH9ib-0072MM-OS
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 02:53:13 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad0234b-e002-0a2a0a5209dd-0a2a4507b636-42
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:53:13 +0200
Received: from [74.104.188.4] (helo=mailhost.m5p.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad023f8-b4ea-0a2a45070019-4a68bc04534c-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:53:13 +0200
Received: from m5p.com (mailhost.m5p.com [IPv6:fdc4:6ee8:648f:6bf6:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 69F0r6x2092129
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 14 Oct 2026 20:53:11 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 69F0r65D092128;
 Wed, 14 Oct 2026 17:53:06 -0700 (PDT) (envelope-from ehem)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Message-ID: <b8fc21f05f820731d3ff2729bd93e3a5e8e92666.1792017144.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1792017144.git.ehem+xen@m5p.com>
References: <cover.1792017144.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Date: Tue, 13 Oct 2026 20:15:00 -0700
Subject: [PATCH 1/3] tools/xl: use Make variable to retrieve xl object
 filename list
X-purgate-ID: tlsNG-ef75cf/1792025593-A48C9AE4-4BEB20D2/0/0
X-purgate-type: clean
X-purgate-size: 841

Irrelevant now, but $^ potentially makes the Makefile more maintainable.
Hopefully some future author finds this valuable.
---
 tools/xl/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xl/Makefile b/tools/xl/Makefile
index e4eed8be13..8fbd4ae778 100644
--- a/tools/xl/Makefile
+++ b/tools/xl/Makefile
@@ -34,7 +34,7 @@ $(XL_OBJS): CFLAGS += -include $(XEN_ROOT)/tools/config.h # libxl_json.h needs i
 all: xl
 
 xl: $(XL_OBJS)
-	$(CC) $(LDFLAGS) -o $@ $(XL_OBJS) $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(XEN_JSON_LIBS) $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(XEN_JSON_LIBS) $(APPEND_LDFLAGS)
 
 .PHONY: install
 install: all
-- 
2.47.3


